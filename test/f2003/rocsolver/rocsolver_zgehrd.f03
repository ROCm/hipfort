!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
!
! SPDX-License-Identifier: MIT
!
! Permission is hereby granted, free of charge, to any person obtaining a copy
! of this software and associated documentation files (the "Software"), to deal
! in the Software without restriction, including without limitation the rights
! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
! copies of the Software, and to permit persons to whom the Software is
! furnished to do so, subject to the following conditions:
!
! The above copyright notice and this permission notice shall be included in
! all copies or substantial portions of the Software.
!
! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!
! zgehd2 / zgehrd example (rocSOLVER, complex Hessenberg reduction)
! see: https://rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Reduces a general complex 4x4 matrix to upper Hessenberg form H = Q^H A Q,
! once with the unblocked zgehd2 and once with the blocked zgehrd. Below the
! first subdiagonal, column i holds the Householder vector of
! H(i) = I - tau(i) v v^H, with v(1:i) = 0 and v(i+1) = 1 (ilo = 1, ihi = n).
! Rebuilds Q = H(1) ... H(n-1) on the host and checks Q * H * Q^H == A.
!!!!!!!!!!!!!!
!
program zgehrd
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver

  implicit none

  integer(c_int), parameter :: n = 4, lda = 4, ilo = 1, ihi = n
  complex(c_double_complex), target :: hA(n,n) = reshape([ &
      (4.0d0, 1.0d0), (1.0d0,-1.0d0), (-2.0d0, 0.5d0), (2.0d0, 0.0d0), &
      (1.0d0, 0.0d0), (2.0d0, 2.0d0), ( 0.0d0, 1.0d0), (1.0d0, 3.0d0), &
     (-2.0d0, 1.0d0), (0.0d0,-2.0d0), ( 3.0d0, 0.0d0), (-2.0d0, 1.0d0), &
      (2.0d0,-1.0d0), (1.0d0, 1.0d0), (-2.0d0, 0.0d0), (-1.0d0, 2.0d0)], [n,n])
  complex(c_double_complex), target :: hOut(n,n), hTau(n-1)
  integer(c_size_t) :: size_A = n*n
  type(c_ptr) :: dA, dTau
  type(c_ptr) :: handle ! rocblas_handle

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_zgehrd' (Fortran 2003 interfaces) - "

  call hipCheck(hipMalloc(dA,   size_A * 16))
  call hipCheck(hipMalloc(dTau, int(n-1, c_size_t) * 16))
  call rocblasCheck(rocblas_create_handle(handle))

  ! Unblocked
  call hipCheck(hipMemcpy(dA, c_loc(hA(1,1)), size_A * 16, hipMemcpyHostToDevice))
  call rocsolverCheck(rocsolver_zgehd2(handle, n, ilo, ihi, dA, lda, dTau))
  call check("zgehd2")

  ! Blocked
  call hipCheck(hipMemcpy(dA, c_loc(hA(1,1)), size_A * 16, hipMemcpyHostToDevice))
  call rocsolverCheck(rocsolver_zgehrd(handle, n, ilo, ihi, dA, lda, dTau))
  call check("zgehrd")

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dTau))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

contains

  subroutine check(what)
    character(len=*), intent(in) :: what
    complex(c_double_complex) :: Q(n,n), H(n,n), v(n), QHQh(n,n)
    integer :: i, j, k
    real(c_double), parameter :: tol = 1.0d-12

    call hipCheck(hipDeviceSynchronize())
    call hipCheck(hipMemcpy(c_loc(hOut(1,1)), dA, size_A * 16, hipMemcpyDeviceToHost))
    call hipCheck(hipMemcpy(c_loc(hTau(1)), dTau, int(n-1, c_size_t) * 16, hipMemcpyDeviceToHost))

    H = (0.0d0, 0.0d0)
    do j = 1, n
       H(1:min(j+1,n),j) = hOut(1:min(j+1,n),j)
    end do
    Q = (0.0d0, 0.0d0)
    do i = 1, n
       Q(i,i) = (1.0d0, 0.0d0)
    end do
    ! Q = Q * H(k) = Q - tau(k) (Q v) v^H
    do k = 1, n-1
       v = (0.0d0, 0.0d0)
       v(k+1) = (1.0d0, 0.0d0)
       v(k+2:n) = hOut(k+2:n,k)
       Q = Q - hTau(k) * matmul(reshape(matmul(Q, v), [n,1]), reshape(conjg(v), [1,n]))
    end do
    QHQh = matmul(matmul(Q, H), conjg(transpose(Q)))
    do j = 1, n
       do i = 1, n
          if (abs(QHQh(i,j) - hA(i,j)) > tol * 10.0d0) then
             write(*,*) "FAILED! ", what, " (Q*H*Q^H)(", i, ",", j, ") = ", QHQh(i,j), &
                  " expected ", hA(i,j)
             call exit(1)
          end if
       end do
    end do
  end subroutine check

end program zgehrd
