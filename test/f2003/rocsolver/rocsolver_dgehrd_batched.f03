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
! dgehd2 / dgehrd batched and strided-batched example (rocSOLVER)
! see: https://rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Reduces two different 4x4 matrices to upper Hessenberg form with the four
! batched variants: gehd2_batched, gehrd_batched (A as a device array of device
! pointers) and gehd2_strided_batched, gehrd_strided_batched (A as one buffer,
! strideA apart). In every variant the tau vectors share one buffer, strideP
! apart. Each entry is checked by rebuilding Q from the Householder vectors and
! comparing Q * H * Q^T with the original matrix.
!!!!!!!!!!!!!!
!
program dgehrd_batched
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver

  implicit none

  integer(c_int), parameter :: n = 4, lda = 4, ilo = 1, ihi = n, batch = 2
  integer(c_int64_t), parameter :: strideA = lda*n, strideP = n
  real(c_double), target :: hA(n,n,batch) = reshape([ &
      4.0d0, 1.0d0,-2.0d0, 2.0d0, &
      1.0d0, 2.0d0, 0.0d0, 1.0d0, &
     -2.0d0, 0.0d0, 3.0d0,-2.0d0, &
      2.0d0, 1.0d0,-2.0d0,-1.0d0, &
      1.0d0, 3.0d0, 0.0d0, 2.0d0, &
      5.0d0,-1.0d0, 1.0d0, 0.0d0, &
      0.0d0, 2.0d0, 4.0d0, 1.0d0, &
      1.0d0, 1.0d0,-3.0d0, 2.0d0], [n,n,batch])
  real(c_double), target :: hOut(n,n,batch), hTau(n,batch)
  type(c_ptr), target :: hostA(batch)
  type(c_ptr) :: dA, dAarray, dTau
  type(c_ptr) :: handle ! rocblas_handle
  integer(c_size_t) :: matbytes, ptrbytes
  integer :: b

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgehrd_batched' (Fortran 2003 interfaces) - "

  matbytes = int(n*n, c_size_t) * 8
  ptrbytes = int(batch, c_size_t) * c_sizeof(c_null_ptr)
  call rocblasCheck(rocblas_create_handle(handle))
  call hipCheck(hipMalloc(dA, int(strideA*batch, c_size_t) * 8))
  call hipCheck(hipMalloc(dTau, int(strideP*batch, c_size_t) * 8))
  do b = 1, batch
     call hipCheck(hipMalloc(hostA(b), matbytes))
  end do
  call hipCheck(hipMalloc(dAarray, ptrbytes))
  call hipCheck(hipMemcpy(dAarray, c_loc(hostA), ptrbytes, hipMemcpyHostToDevice))

  ! Batched: one device allocation per matrix
  call upload_batched()
  call rocsolverCheck(rocsolver_dgehd2_batched(handle, n, ilo, ihi, dAarray, lda, dTau, strideP, batch))
  call check_batched("dgehd2_batched")
  call upload_batched()
  call rocsolverCheck(rocsolver_dgehrd_batched(handle, n, ilo, ihi, dAarray, lda, dTau, strideP, batch))
  call check_batched("dgehrd_batched")

  ! Strided batched: all matrices in one allocation
  call hipCheck(hipMemcpy(dA, c_loc(hA(1,1,1)), matbytes * batch, hipMemcpyHostToDevice))
  call rocsolverCheck(rocsolver_dgehd2_strided_batched(handle, n, ilo, ihi, dA, lda, strideA, &
                                                       dTau, strideP, batch))
  call check_strided("dgehd2_strided_batched")
  call hipCheck(hipMemcpy(dA, c_loc(hA(1,1,1)), matbytes * batch, hipMemcpyHostToDevice))
  call rocsolverCheck(rocsolver_dgehrd_strided_batched(handle, n, ilo, ihi, dA, lda, strideA, &
                                                       dTau, strideP, batch))
  call check_strided("dgehrd_strided_batched")

  do b = 1, batch
     call hipCheck(hipFree(hostA(b)))
  end do
  call hipCheck(hipFree(dAarray))
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dTau))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

contains

  subroutine upload_batched()
    integer :: k
    do k = 1, batch
       call hipCheck(hipMemcpy(hostA(k), c_loc(hA(1,1,k)), matbytes, hipMemcpyHostToDevice))
    end do
  end subroutine upload_batched

  subroutine check_batched(what)
    character(len=*), intent(in) :: what
    integer :: k
    call hipCheck(hipDeviceSynchronize())
    do k = 1, batch
       call hipCheck(hipMemcpy(c_loc(hOut(1,1,k)), hostA(k), matbytes, hipMemcpyDeviceToHost))
    end do
    call check_all(what)
  end subroutine check_batched

  subroutine check_strided(what)
    character(len=*), intent(in) :: what
    call hipCheck(hipDeviceSynchronize())
    call hipCheck(hipMemcpy(c_loc(hOut(1,1,1)), dA, matbytes * batch, hipMemcpyDeviceToHost))
    call check_all(what)
  end subroutine check_strided

  subroutine check_all(what)
    character(len=*), intent(in) :: what
    integer :: k
    call hipCheck(hipMemcpy(c_loc(hTau(1,1)), dTau, int(strideP*batch, c_size_t) * 8, &
         hipMemcpyDeviceToHost))
    do k = 1, batch
       call check_entry(what, k)
    end do
  end subroutine check_all

  subroutine check_entry(what, k)
    character(len=*), intent(in) :: what
    integer, intent(in) :: k
    real(c_double) :: Q(n,n), H(n,n), v(n), QHQt(n,n)
    integer :: i, j, l
    real(c_double), parameter :: tol = 1.0d-12

    H = 0.0d0
    do j = 1, n
       H(1:min(j+1,n),j) = hOut(1:min(j+1,n),j,k)
    end do
    Q = 0.0d0
    do i = 1, n
       Q(i,i) = 1.0d0
    end do
    do l = 1, n-1
       v = 0.0d0
       v(l+1) = 1.0d0
       v(l+2:n) = hOut(l+2:n,l,k)
       Q = Q - hTau(l,k) * matmul(reshape(matmul(Q, v), [n,1]), reshape(v, [1,n]))
    end do
    QHQt = matmul(matmul(Q, H), transpose(Q))
    do j = 1, n
       do i = 1, n
          if (abs(QHQt(i,j) - hA(i,j,k)) > tol * 10.0d0) then
             write(*,*) "FAILED! ", what, " batch ", k, " (Q*H*Q^T)(", i, ",", j, ") = ", &
                  QHQt(i,j), " expected ", hA(i,j,k)
             call exit(1)
          end if
       end do
    end do
  end subroutine check_entry

end program dgehrd_batched
