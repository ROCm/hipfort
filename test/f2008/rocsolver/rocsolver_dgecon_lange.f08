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
! rocsolver_dlange + rocsolver_dgetrf + rocsolver_dgecon: `norm`, `anorm` and
! `rcond` as device-only scalars (Fortran 2008 interfaces)
!
! lange writes the norm of A on the GPU, gecon reads anorm there and writes
! rcond there. The array overloads take each as one real variable that lives
! on the device (a rank-0 pointer allocated with hipMalloc), so the norm lange
! writes is passed straight to gecon as anorm: with A as dA(:,:) the calls
! resolve to rocsolver_dlange_full_rank and rocsolver_dgecon_full_rank, and
! with type(c_ptr) scalars to their _devptr twins.
! A = [4 1; 2 3]: ||A||_1 = 6, ||inv(A)||_1 = 1/2, so rcond = 1/3, computed
! on the host from the closed-form 2x2 inverse.
!!!!!!!!!!!!!!
!
program dgecon_lange
  use iso_c_binding
  use hip
  use rocblas
  use rocsolver

  implicit none
  integer :: form
  integer(c_int), parameter :: N = 2, lda = 2
  real(c_double) :: hA(N,N) = reshape((/4, 2, 1, 3/), (/N, N/))
  real(c_double) :: hAinv(N,N), det, norm_ref, rcond_ref
  real(c_double) :: hNorm, hRcond
  integer(c_int) :: hInfo
  real(c_double), pointer :: dA(:,:)
  integer(c_int), pointer :: dIpiv(:)
  real(c_double), pointer :: dNorm       ! device scalars (rank 0)
  real(c_double), pointer :: dRcond
  integer(c_int), pointer :: dInfo
  type(c_ptr) :: handle
  real(c_double), parameter :: tol = 1.0d-12

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgecon_lange' (Fortran 2008 interfaces) - "

  ! Host reference: rcond = 1 / (||A||_1 ||inv(A)||_1)
  det = hA(1,1)*hA(2,2) - hA(1,2)*hA(2,1)
  hAinv = reshape((/hA(2,2), -hA(2,1), -hA(1,2), hA(1,1)/), (/N, N/)) / det
  norm_ref  = maxval(sum(abs(hA), dim=1))
  rcond_ref = 1.0d0 / (norm_ref * maxval(sum(abs(hAinv), dim=1)))

  call rocblasCheck(rocblas_create_handle(handle))
  call hipCheck(hipMalloc(dA, lda, N))
  call hipCheck(hipMalloc(dIpiv, N))
  call hipCheck(hipMalloc(dNorm))
  call hipCheck(hipMalloc(dRcond))
  call hipCheck(hipMalloc(dInfo))

  do form = 1, 2
    call hipCheck(hipMemcpy(dA, hA, hipMemcpyHostToDevice))
    hNorm = -1.0d0; hRcond = -1.0d0
    call hipCheck(hipMemcpy(dNorm, hNorm, hipMemcpyHostToDevice))
    call hipCheck(hipMemcpy(dRcond, hRcond, hipMemcpyHostToDevice))
    if (form == 1) then
      ! real device variables -> _full_rank
      call rocsolverCheck(rocsolver_dlange(handle, rocsolver_norm_type_one, N, N, dA, lda, dNorm))
      call rocsolverCheck(rocsolver_dgetrf(handle, N, N, dA, lda, dIpiv, dInfo))
      call rocsolverCheck(rocsolver_dgecon(handle, rocsolver_norm_type_one, N, dA, lda, dNorm, dRcond))
    else
      ! type(c_ptr) -> _full_rank_devptr
      call rocsolverCheck(rocsolver_dlange(handle, rocsolver_norm_type_one, N, N, dA, lda, c_loc(dNorm)))
      call rocsolverCheck(rocsolver_dgetrf(handle, N, N, dA, lda, dIpiv, c_loc(dInfo)))
      call rocsolverCheck(rocsolver_dgecon(handle, rocsolver_norm_type_one, N, dA, lda, &
           c_loc(dNorm), c_loc(dRcond)))
    end if
    call hipCheck(hipMemcpy(hNorm, dNorm, hipMemcpyDeviceToHost))
    call hipCheck(hipMemcpy(hRcond, dRcond, hipMemcpyDeviceToHost))
    call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
    if (hInfo /= 0) then
      write(*,*) "FAILED! form ", form, " getrf info = ", hInfo; call exit(1)
    end if
    if (abs(hNorm - norm_ref) > tol * norm_ref) then
      write(*,*) "FAILED! form ", form, " norm = ", hNorm, " expected ", norm_ref; call exit(1)
    end if
    if (abs(hRcond - rcond_ref) > tol * rcond_ref) then
      write(*,*) "FAILED! form ", form, " rcond = ", hRcond, " expected ", rcond_ref; call exit(1)
    end if
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dIpiv))
  call hipCheck(hipFree(dNorm))
  call hipCheck(hipFree(dRcond))
  call hipCheck(hipFree(dInfo))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dgecon_lange
