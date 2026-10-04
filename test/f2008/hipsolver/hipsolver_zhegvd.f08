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
! zhegvd example (complex generalized Hermitian-definite eigensolver, Fortran 2008)
! see: https:!rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! hegvd solves A*x = lambda*B*x (itype=1) for Hermitian A and
! Hermitian positive-definite B. jobz=vector overwrites A with the
! eigenvectors. Native-array f2008 form; workspace via bufferSize.
! Self-verifying: A0*v_k = lambda_k * B0*v_k.
!!!!!!!!!!!!!!
!
program hipsolver_zhegvd
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  use hipfort_hipsolver_enums
  implicit none
  integer :: i, k

  integer(c_int), parameter :: N = 3, lda = 3, ldb = 3

  complex(c_double_complex) :: hA(3,3) = reshape((/ &
       (2.,0.),(-1.,0.),(0.,0.), (-1.,0.),(2.,0.),(-1.,0.), (0.,0.),(-1.,0.),(2.,0.) /), (/3,3/))
  complex(c_double_complex) :: hB(3,3) = reshape((/ &
       (2.,0.),(0.,0.),(0.,0.), (0.,0.),(2.,0.),(0.,0.), (0.,0.),(0.,0.),(2.,0.) /), (/3,3/))
  complex(c_double_complex) :: hA0(3,3), hB0(3,3)
  real(c_double) :: hW(3)
  complex(c_double_complex) :: lhs(3), rhs(3)

  complex(c_double_complex), pointer :: dA(:,:), dB(:,:)
  real(c_double), pointer :: dW(:)
  integer(c_int), pointer :: dInfo
  type(c_ptr) :: dWork, handle = c_null_ptr
  integer(c_int) :: lwork

  real(c_double) :: error
  real(c_double), parameter :: error_max = 1.0d-10

  write(*,"(a)",advance="no") "-- Running test 'hipsolver_zhegvd' (Fortran 2008 interfaces) - "

  hA0 = hA
  hB0 = hB

  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dB, source=hB))
  call hipCheck(hipMalloc(dW, mold=hW))
  call hipCheck(hipMalloc(dInfo))

  call hipsolverCheck(hipsolverCreate(handle))

  call hipsolverCheck(hipsolverZhegvd_bufferSize(handle, HIPSOLVER_EIG_TYPE_1, &
       HIPSOLVER_EIG_MODE_VECTOR, HIPSOLVER_FILL_MODE_UPPER, N, dA, lda, dB, ldb, dW, lwork))
  call hipCheck(hipMalloc(dWork, max(int(lwork,c_size_t) * 16, 1_c_size_t)))

  call hipsolverCheck(hipsolverZhegvd(handle, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_VECTOR, &
       HIPSOLVER_FILL_MODE_UPPER, N, dA, lda, dB, ldb, dW, dWork, lwork, c_loc(dInfo)))

  call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hW, dW, hipMemcpyDeviceToHost))

  do k = 1,N
    lhs = matmul(hA0, hA(:,k))
    rhs = hW(k) * matmul(hB0, hA(:,k))
    do i = 1,N
        error = abs(lhs(i) - rhs(i))
        if(error .gt. error_max) then
            write(*,*) "FAILED! Error bigger than max! Error = ", error, " eigenpair ", k; call exit(1)
        end if
    end do
  end do

  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dB)); call hipCheck(hipFree(dW))
  call hipCheck(hipFree(dInfo)); call hipCheck(hipFree(dWork))
  call hipsolverCheck(hipsolverDestroy(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program hipsolver_zhegvd
