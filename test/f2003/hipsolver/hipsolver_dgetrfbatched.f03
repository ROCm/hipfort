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
! hipsolver dgetrfBatched / dgetrsBatched / dgetriBatched example
! (batched LU factorization, solve and inverse, Fortran 2003)
! see: https://rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! Factorizes two different 3x3 matrices with partial pivoting, solves A x = b
! for each with the factors, then inverts each one out of place. The batched
! API takes A, B and C as arrays of device pointers that themselves live in
! DEVICE memory. The pivots of every entry are packed in one device buffer,
! strideP apart. getrf and getri report devInfo per entry in device memory;
! getrs reports a single hInfo in host memory.
! Checks x against the known solution and A * inv(A) against the identity.
!
! f2003 style: device buffers are type(c_ptr) allocated by byte count; host data
! is moved with hipMemcpy + c_loc.
!!!!!!!!!!!!!!
!
program dgetrfbatched
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  implicit none
  integer :: b, i, j, l
  integer(c_int), parameter :: N = 3, lda = 3, ldb = 3, ldc = 3, nrhs = 1
  integer(c_int), parameter :: batch = 2, strideP = N
  ! Two nonsingular matrices (column-major); both need row interchanges.
  real(c_double), target :: hA(N,N,batch) = reshape((/ &
      1.0d0, 4.0d0, 7.0d0, &
      2.0d0, 5.0d0, 8.0d0, &
      3.0d0, 6.0d0,10.0d0, &
      0.0d0, 1.0d0, 2.0d0, &
      1.0d0, 3.0d0, 0.0d0, &
      1.0d0, 2.0d0, 4.0d0/), (/N,N,batch/))
  real(c_double) :: hX(N,batch) = reshape((/1.0d0, 2.0d0, 3.0d0, -1.0d0, 0.5d0, 2.0d0/), (/N,batch/))
  real(c_double), target :: hB(N,batch), hOut(N,N)
  integer(c_int), target :: hInfo(batch), hInfoGetrs
  type(c_ptr), target :: hostA(batch), hostB(batch), hostC(batch)
  type(c_ptr) :: dAarray, dBarray, dCarray, dIpiv, dInfo, dWork
  type(c_ptr) :: handle
  integer(c_size_t) :: lwork, lwork_trs, lwork_tri, ptrbytes, matbytes
  real(c_double) :: prod
  real(c_double), parameter :: tol = 1.0d-10
  write(*,"(a)",advance="no") "-- Running test 'hipsolver_dgetrfbatched' (Fortran 2003 interfaces) - "

  ! b = A * x for every entry
  do b = 1, batch
     hB(:,b) = matmul(hA(:,:,b), hX(:,b))
  end do

  matbytes = int(N*N,c_size_t) * 8
  ptrbytes = int(batch,c_size_t) * c_sizeof(c_null_ptr)
  call hipsolverCheck(hipsolverCreate(handle))
  do b = 1, batch
     call hipCheck(hipMalloc(hostA(b), matbytes))
     call hipCheck(hipMalloc(hostB(b), int(N,c_size_t) * 8))
     call hipCheck(hipMalloc(hostC(b), matbytes))
     call hipCheck(hipMemcpy(hostA(b), c_loc(hA(1,1,b)), matbytes, hipMemcpyHostToDevice))
     call hipCheck(hipMemcpy(hostB(b), c_loc(hB(1,b)), int(N,c_size_t) * 8, hipMemcpyHostToDevice))
  end do

  ! Host arrays of device addresses, copied to device-resident pointer arrays.
  call hipCheck(hipMalloc(dAarray, ptrbytes))
  call hipCheck(hipMalloc(dBarray, ptrbytes))
  call hipCheck(hipMalloc(dCarray, ptrbytes))
  call hipCheck(hipMemcpy(dAarray, c_loc(hostA), ptrbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dBarray, c_loc(hostB), ptrbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dCarray, c_loc(hostC), ptrbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMalloc(dIpiv, int(strideP*batch,c_size_t) * 4))
  call hipCheck(hipMalloc(dInfo, int(batch,c_size_t) * 4))

  ! One workspace sized for all three routines.
  call hipsolverCheck(hipsolverDgetrfBatched_bufferSize(handle, N, N, dAarray, lda, strideP, &
       lwork, batch))
  call hipsolverCheck(hipsolverDgetrsBatched_bufferSize(handle, HIPSOLVER_OP_N, N, nrhs, &
       dAarray, lda, dIpiv, strideP, dBarray, ldb, lwork_trs, batch))
  call hipsolverCheck(hipsolverDgetriBatched_bufferSize(handle, N, dAarray, lda, dIpiv, strideP, &
       dCarray, ldc, lwork_tri, batch))
  lwork = max(lwork, lwork_trs, lwork_tri, 1_c_size_t)
  call hipCheck(hipMalloc(dWork, lwork))

  ! LU factorization
  call hipsolverCheck(hipsolverDgetrfBatched(handle, N, N, dAarray, lda, dWork, lwork, &
       dIpiv, strideP, dInfo, batch))
  call hipCheck(hipMemcpy(c_loc(hInfo(1)), dInfo, int(batch,c_size_t) * 4, hipMemcpyDeviceToHost))
  do b = 1, batch
     if (hInfo(b) /= 0) then
        write(*,*) "FAILED! getrf info(", b, ") = ", hInfo(b), " (expected 0)"; call exit(1)
     end if
  end do

  ! Solve A x = b with the factors (hInfo is a host scalar)
  hInfoGetrs = -1
  call hipsolverCheck(hipsolverDgetrsBatched(handle, HIPSOLVER_OP_N, N, nrhs, dAarray, lda, &
       dIpiv, strideP, dBarray, ldb, dWork, lwork, c_loc(hInfoGetrs), batch))
  call hipCheck(hipDeviceSynchronize())
  if (hInfoGetrs /= 0) then
     write(*,*) "FAILED! getrs info = ", hInfoGetrs, " (expected 0)"; call exit(1)
  end if
  do b = 1, batch
     call hipCheck(hipMemcpy(c_loc(hB(1,b)), hostB(b), int(N,c_size_t) * 8, hipMemcpyDeviceToHost))
     do i = 1, N
        if (abs(hB(i,b) - hX(i,b)) > tol) then
           write(*,*) "FAILED! batch ", b, " x(", i, ") = ", hB(i,b), " expected ", hX(i,b); call exit(1)
        end if
     end do
  end do

  ! Out-of-place inverse into C
  hInfo = -1
  call hipsolverCheck(hipsolverDgetriBatched(handle, N, dAarray, lda, dIpiv, strideP, &
       dCarray, ldc, dWork, lwork, dInfo, batch))
  call hipCheck(hipMemcpy(c_loc(hInfo(1)), dInfo, int(batch,c_size_t) * 4, hipMemcpyDeviceToHost))
  do b = 1, batch
     if (hInfo(b) /= 0) then
        write(*,*) "FAILED! getri info(", b, ") = ", hInfo(b), " (expected 0)"; call exit(1)
     end if
     call hipCheck(hipMemcpy(c_loc(hOut(1,1)), hostC(b), matbytes, hipMemcpyDeviceToHost))
     do j = 1, N
        do i = 1, N
           prod = 0.0d0
           do l = 1, N
              prod = prod + hA(i,l,b) * hOut(l,j)
           end do
           if (abs(prod - merge(1.0d0, 0.0d0, i == j)) > tol) then
              write(*,*) "FAILED! batch ", b, " (A*inv(A))(", i, ",", j, ") = ", prod; call exit(1)
           end if
        end do
     end do
  end do

  do b = 1, batch
     call hipCheck(hipFree(hostA(b))); call hipCheck(hipFree(hostB(b))); call hipCheck(hipFree(hostC(b)))
  end do
  call hipCheck(hipFree(dAarray)); call hipCheck(hipFree(dBarray)); call hipCheck(hipFree(dCarray))
  call hipCheck(hipFree(dIpiv)); call hipCheck(hipFree(dInfo)); call hipCheck(hipFree(dWork))
  call hipsolverCheck(hipsolverDestroy(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program dgetrfbatched
