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
! hipsolver dgelsBatched example (batched least squares, Fortran 2003)
! see: https://rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! Solves min ||A x - c|| for two different overdetermined 4x2 systems. The
! right-hand sides are built as c = A * x, so each system is consistent and its
! least-squares solution is exactly x. A and C are arrays of device pointers
! that themselves live in DEVICE memory; the solution overwrites the first N
! rows of each C. Argument errors go to hInfo, a host scalar, and the
! per-entry rank deficiency to devInfo, a device array.
!
! f2003 style: device buffers are type(c_ptr) allocated by byte count; host data
! is moved with hipMemcpy + c_loc.
!!!!!!!!!!!!!!
!
program dgelsbatched
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  implicit none
  integer :: b, i
  integer(c_int), parameter :: M = 4, N = 2, nrhs = 1, lda = 4, ldc = 4, batch = 2
  real(c_double), target :: hA(M,N,batch) = reshape((/ &
      1.0d0, 1.0d0, 1.0d0, 1.0d0, &
      1.0d0, 2.0d0, 3.0d0, 4.0d0, &
      2.0d0, 0.0d0, 1.0d0, 3.0d0, &
     -1.0d0, 1.0d0, 4.0d0, 2.0d0/), (/M,N,batch/))
  real(c_double) :: hX(N,batch) = reshape((/0.5d0, 2.0d0, -3.0d0, 1.25d0/), (/N,batch/))
  real(c_double), target :: hC(M,batch)
  integer(c_int), target :: hInfo, hDevInfo(batch)
  type(c_ptr), target :: hostA(batch), hostC(batch)
  type(c_ptr) :: dAarray, dCarray, dInfo, dWork
  type(c_ptr) :: handle
  integer(c_size_t) :: lwork, ptrbytes, matbytes, rhsbytes
  real(c_double), parameter :: tol = 1.0d-10
  write(*,"(a)",advance="no") "-- Running test 'hipsolver_dgelsbatched' (Fortran 2003 interfaces) - "

  do b = 1, batch
     hC(:,b) = matmul(hA(:,:,b), hX(:,b))
  end do

  matbytes = int(M*N,c_size_t) * 8
  rhsbytes = int(ldc*nrhs,c_size_t) * 8
  ptrbytes = int(batch,c_size_t) * c_sizeof(c_null_ptr)
  call hipsolverCheck(hipsolverCreate(handle))
  do b = 1, batch
     call hipCheck(hipMalloc(hostA(b), matbytes))
     call hipCheck(hipMalloc(hostC(b), rhsbytes))
     call hipCheck(hipMemcpy(hostA(b), c_loc(hA(1,1,b)), matbytes, hipMemcpyHostToDevice))
     call hipCheck(hipMemcpy(hostC(b), c_loc(hC(1,b)), rhsbytes, hipMemcpyHostToDevice))
  end do
  call hipCheck(hipMalloc(dAarray, ptrbytes))
  call hipCheck(hipMalloc(dCarray, ptrbytes))
  call hipCheck(hipMemcpy(dAarray, c_loc(hostA), ptrbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dCarray, c_loc(hostC), ptrbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMalloc(dInfo, int(batch,c_size_t) * 4))

  call hipsolverCheck(hipsolverDgelsBatched_bufferSize(handle, HIPSOLVER_OP_N, M, N, nrhs, &
       dAarray, lda, dCarray, ldc, lwork, batch))
  call hipCheck(hipMalloc(dWork, max(lwork, 1_c_size_t)))
  hInfo = -1
  call hipsolverCheck(hipsolverDgelsBatched(handle, HIPSOLVER_OP_N, M, N, nrhs, dAarray, lda, &
       dCarray, ldc, dWork, lwork, c_loc(hInfo), dInfo, batch))
  call hipCheck(hipDeviceSynchronize())
  if (hInfo /= 0) then
     write(*,*) "FAILED! info = ", hInfo, " (expected 0)"; call exit(1)
  end if
  call hipCheck(hipMemcpy(c_loc(hDevInfo(1)), dInfo, int(batch,c_size_t) * 4, hipMemcpyDeviceToHost))

  do b = 1, batch
     if (hDevInfo(b) /= 0) then
        write(*,*) "FAILED! devInfo(", b, ") = ", hDevInfo(b), " (expected 0)"; call exit(1)
     end if
     call hipCheck(hipMemcpy(c_loc(hC(1,b)), hostC(b), rhsbytes, hipMemcpyDeviceToHost))
     do i = 1, N
        if (abs(hC(i,b) - hX(i,b)) > tol) then
           write(*,*) "FAILED! batch ", b, " x(", i, ") = ", hC(i,b), " expected ", hX(i,b); call exit(1)
        end if
     end do
  end do

  do b = 1, batch
     call hipCheck(hipFree(hostA(b))); call hipCheck(hipFree(hostC(b)))
  end do
  call hipCheck(hipFree(dAarray)); call hipCheck(hipFree(dCarray))
  call hipCheck(hipFree(dInfo)); call hipCheck(hipFree(dWork))
  call hipsolverCheck(hipsolverDestroy(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program dgelsbatched
