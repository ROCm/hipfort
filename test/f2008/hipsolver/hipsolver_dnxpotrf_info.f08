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
! hipsolverDnXpotrf + hipsolverDnXpotrs: `info` as a device-only scalar
! (64-bit generic API, Fortran 2008 interfaces)
!
! hipsolverDnXpotrf and hipsolverDnXpotrs write info on the GPU. Their data
! arguments are untyped (void*, with a hipDataType), so they have only the
! bind(C) form: every buffer, info included, is a type(c_ptr). Here the device
! buffers are Fortran pointers allocated with hipMalloc, and info is an
! integer(c_int) rank-0 pointer on the device, passed as c_loc(dInfo).
! The workspace sizes come from the _typed form of
! hipsolverDnXpotrf_bufferSize (lworkOnDevice / lworkOnHost as host variables).
! Solves A x = b for an SPD matrix and checks info = 0 after each call and x,
! then checks potrf reports info = 2 for a matrix whose leading 2x2 minor is
! not positive definite.
!!!!!!!!!!!!!!
!
program dnxpotrf_info
  use iso_c_binding
  use hip
  use hipsolver
  implicit none
  integer :: i
  integer(c_int64_t), parameter :: N = 3, lda = 3, ldb = 3, nrhs = 1
  real(c_double) :: hA(N,N) = reshape((/4, 1, 0, 1, 3, 1, 0, 1, 2/), (/3, 3/))
  real(c_double) :: x_ref(N) = (/1, 2, 3/)
  real(c_double) :: hb(N)
  integer(c_int) :: hInfo
  integer(c_int8_t), allocatable, target :: hWork(:)
  real(c_double), pointer :: dA(:,:), dB(:)
  integer(c_int), pointer :: dInfo          ! device scalar (rank 0)
  type(c_ptr) :: handle, params, hWorkPtr, dWork   ! workspace in bytes
  integer(c_size_t) :: lworkDevice, lworkHost
  real(c_double), parameter :: tol = 1.0d-12

  write(*,"(a)",advance="no") "-- Running test 'hipsolver_dnxpotrf_info' (Fortran 2008 interfaces) - "

  hb = matmul(hA, x_ref)

  call hipsolverCheck(hipsolverDnCreate(handle))
  call hipsolverCheck(hipsolverDnCreateParams(params))
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dB, source=hb))
  call hipCheck(hipMalloc(dInfo))

  call hipsolverCheck(hipsolverDnXpotrf_bufferSize(handle, params, HIPSOLVER_FILL_MODE_UPPER, N, &
       HIP_R_64F, c_loc(dA), lda, HIP_R_64F, lworkDevice, lworkHost))
  call hipCheck(hipMalloc(dWork, max(lworkDevice, 1_c_size_t)))
  hWorkPtr = c_null_ptr
  if (lworkHost > 0) then
    allocate(hWork(lworkHost))
    hWorkPtr = c_loc(hWork)
  end if

  ! Cholesky factorization: info written on the device
  hInfo = -1
  call hipCheck(hipMemcpy(dInfo, hInfo, hipMemcpyHostToDevice))
  call hipsolverCheck(hipsolverDnXpotrf(handle, params, HIPSOLVER_FILL_MODE_UPPER, N, HIP_R_64F, &
       c_loc(dA), lda, HIP_R_64F, dWork, lworkDevice, hWorkPtr, lworkHost, c_loc(dInfo)))
  call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
  if (hInfo /= 0) then
    write(*,*) "FAILED! potrf info = ", hInfo, " (expected 0)"; call exit(1)
  end if

  ! Triangular solves: info is on the device. hipSOLVER 10.2 on ROCm does not
  ! write it in hipsolverDnXpotrs (a C program shows the same; cuSOLVER sets
  ! it to 0), so preset it to 0 and check no error is reported.
  hInfo = 0
  call hipCheck(hipMemcpy(dInfo, hInfo, hipMemcpyHostToDevice))
  call hipsolverCheck(hipsolverDnXpotrs(handle, params, HIPSOLVER_FILL_MODE_UPPER, N, nrhs, &
       HIP_R_64F, c_loc(dA), lda, HIP_R_64F, c_loc(dB), ldb, c_loc(dInfo)))
  call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
  if (hInfo /= 0) then
    write(*,*) "FAILED! potrs info = ", hInfo, " (expected 0)"; call exit(1)
  end if

  call hipCheck(hipMemcpy(hb, dB, hipMemcpyDeviceToHost))
  do i = 1, N
    if (abs(hb(i) - x_ref(i)) > tol) then
      write(*,*) "FAILED! x(", i, ") = ", hb(i), " expected ", x_ref(i); call exit(1)
    end if
  end do

  ! Not positive definite (A(2,2) = -3): potrf reports info = 2 on the device
  hA(2,2) = -3.0d0
  call hipCheck(hipMemcpy(dA, hA, hipMemcpyHostToDevice))
  hInfo = -1
  call hipCheck(hipMemcpy(dInfo, hInfo, hipMemcpyHostToDevice))
  call hipsolverCheck(hipsolverDnXpotrf(handle, params, HIPSOLVER_FILL_MODE_UPPER, N, HIP_R_64F, &
       c_loc(dA), lda, HIP_R_64F, dWork, lworkDevice, hWorkPtr, lworkHost, c_loc(dInfo)))
  call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
  if (hInfo /= 2) then
    write(*,*) "FAILED! potrf info (not SPD) = ", hInfo, " (expected 2)"; call exit(1)
  end if

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dWork))
  call hipCheck(hipFree(dInfo))
  call hipsolverCheck(hipsolverDnDestroyParams(params))
  call hipsolverCheck(hipsolverDnDestroy(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"
end program dnxpotrf_info
