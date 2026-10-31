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
! rocsolver_dsyevj: `residual`, `n_sweeps` and `info` as device-only scalars
! (Fortran 2008 interfaces)
!
! The Jacobi eigensolver writes residual (real), n_sweeps and info (integers)
! on the GPU. The array overloads take each as one variable that lives on the
! device (a rank-0 pointer allocated with hipMalloc): with A as dA(:,:) the
! call resolves to rocsolver_dsyevj_full_rank. The same call with the three
! as type(c_ptr) resolves to rocsolver_dsyevj_full_rank_devptr.
! A is the n x n tridiagonal matrix tridiag(-1, 2, -1), whose eigenvalues are
! 2 - 2 cos(k pi / (n+1)), k = 1..n. Checks the eigenvalues (sorted
! ascending), info = 0, a small residual and 1 <= n_sweeps <= max_sweeps.
!!!!!!!!!!!!!!
!
program dsyevj_sweeps
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  use hipfort_rocsolver_enums

  implicit none
  integer :: i, k, form
  integer(c_int), parameter :: N = 5, lda = 5, max_sweeps = 100
  real(c_double), parameter :: pi = 4.0d0 * atan(1.0d0)
  real(c_double) :: hA(N,N), hW(N), wref, abstol
  real(c_double) :: hResidual
  integer(c_int) :: hSweeps, hInfo
  real(c_double), pointer :: dA(:,:), dW(:)
  real(c_double), pointer :: dResidual    ! device scalars (rank 0)
  integer(c_int), pointer :: dSweeps
  integer(c_int), pointer :: dInfo
  type(c_ptr) :: handle
  real(c_double), parameter :: tol = 1.0d-12

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dsyevj_sweeps' (Fortran 2008 interfaces) - "

  hA = 0.0d0
  do i = 1, N
    hA(i,i) = 2.0d0
    if (i < N) then
      hA(i+1,i) = -1.0d0; hA(i,i+1) = -1.0d0
    end if
  end do
  abstol = 0.0d0   ! rocSOLVER's default tolerance

  call rocblasCheck(rocblas_create_handle(handle))
  call hipCheck(hipMalloc(dA, lda, N))
  call hipCheck(hipMalloc(dW, N))
  call hipCheck(hipMalloc(dResidual))
  call hipCheck(hipMalloc(dSweeps))
  call hipCheck(hipMalloc(dInfo))

  do form = 1, 2
    call hipCheck(hipMemcpy(dA, hA, hipMemcpyHostToDevice))
    hResidual = -1.0d0; hSweeps = -1; hInfo = -1
    call hipCheck(hipMemcpy(dResidual, hResidual, hipMemcpyHostToDevice))
    call hipCheck(hipMemcpy(dSweeps, hSweeps, hipMemcpyHostToDevice))
    call hipCheck(hipMemcpy(dInfo, hInfo, hipMemcpyHostToDevice))
    if (form == 1) then
      ! device scalars as Fortran variables -> rocsolver_dsyevj_full_rank
      call rocsolverCheck(rocsolver_dsyevj(handle, rocblas_esort_ascending, rocblas_evect_none, &
           rocblas_fill_upper, N, dA, lda, abstol, dResidual, max_sweeps, dSweeps, dW, dInfo))
    else
      ! the same as type(c_ptr) -> rocsolver_dsyevj_full_rank_devptr
      call rocsolverCheck(rocsolver_dsyevj(handle, rocblas_esort_ascending, rocblas_evect_none, &
           rocblas_fill_upper, N, dA, lda, abstol, c_loc(dResidual), max_sweeps, c_loc(dSweeps), &
           dW, c_loc(dInfo)))
    end if
    call hipCheck(hipMemcpy(hResidual, dResidual, hipMemcpyDeviceToHost))
    call hipCheck(hipMemcpy(hSweeps, dSweeps, hipMemcpyDeviceToHost))
    call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
    call hipCheck(hipMemcpy(hW, dW, hipMemcpyDeviceToHost))

    if (hInfo /= 0) then
      write(*,*) "FAILED! form ", form, " info = ", hInfo, " (expected 0)"; call exit(1)
    end if
    if (hSweeps < 1 .or. hSweeps > max_sweeps) then
      write(*,*) "FAILED! form ", form, " n_sweeps = ", hSweeps; call exit(1)
    end if
    if (hResidual < 0.0d0 .or. hResidual > tol) then
      write(*,*) "FAILED! form ", form, " residual = ", hResidual; call exit(1)
    end if
    do k = 1, N
      wref = 2.0d0 - 2.0d0 * cos(k * pi / (N + 1))
      if (abs(hW(k) - wref) > tol) then
        write(*,*) "FAILED! form ", form, " W(", k, ") = ", hW(k), " expected ", wref; call exit(1)
      end if
    end do
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dW))
  call hipCheck(hipFree(dResidual))
  call hipCheck(hipFree(dSweeps))
  call hipCheck(hipFree(dInfo))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dsyevj_sweeps
