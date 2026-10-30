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
! hipsolver dgeqrfBatched example (batched QR factorization, Fortran 2003)
! see: https://rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! Factorizes two different 4x3 matrices. Both A and tau are arrays of device
! pointers that themselves live in DEVICE memory: one matrix and one tau vector
! per batch entry. Argument errors are reported in hInfo, a host scalar.
! Each entry is checked by rebuilding Q = H(1) H(2) H(3), with
! H(i) = I - tau(i) v v^T, from the Householder vectors stored below the
! diagonal, and comparing Q * R with the original A.
!
! f2003 style: device buffers are type(c_ptr) allocated by byte count; host data
! is moved with hipMemcpy + c_loc.
!!!!!!!!!!!!!!
!
program dgeqrfbatched
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  implicit none
  integer :: b, i, j, k
  integer(c_int), parameter :: M = 4, N = 3, lda = 4, batch = 2
  real(c_double), target :: hA(M,N,batch) = reshape((/ &
      2.0d0, 1.0d0, 0.0d0, 1.0d0, &
      1.0d0, 3.0d0, 1.0d0, 0.0d0, &
      0.0d0, 1.0d0, 4.0d0, 2.0d0, &
      1.0d0,-1.0d0, 2.0d0, 0.5d0, &
      3.0d0, 0.0d0, 1.0d0, 1.0d0, &
     -2.0d0, 1.0d0, 0.0d0, 5.0d0/), (/M,N,batch/))
  real(c_double), target :: hQR(M,N), hTau(N)
  real(c_double) :: Q(M,M), R(M,N), v(M), QR(M,N)
  integer(c_int), target :: hInfo
  type(c_ptr), target :: hostA(batch), hostTau(batch)
  type(c_ptr) :: dAarray, dTauArray, dWork
  type(c_ptr) :: handle
  integer(c_size_t) :: lwork, ptrbytes, matbytes
  real(c_double), parameter :: tol = 1.0d-12
  write(*,"(a)",advance="no") "-- Running test 'hipsolver_dgeqrfbatched' (Fortran 2003 interfaces) - "

  matbytes = int(M*N,c_size_t) * 8
  ptrbytes = int(batch,c_size_t) * c_sizeof(c_null_ptr)
  call hipsolverCheck(hipsolverCreate(handle))
  do b = 1, batch
     call hipCheck(hipMalloc(hostA(b), matbytes))
     call hipCheck(hipMalloc(hostTau(b), int(N,c_size_t) * 8))
     call hipCheck(hipMemcpy(hostA(b), c_loc(hA(1,1,b)), matbytes, hipMemcpyHostToDevice))
  end do
  call hipCheck(hipMalloc(dAarray, ptrbytes))
  call hipCheck(hipMalloc(dTauArray, ptrbytes))
  call hipCheck(hipMemcpy(dAarray, c_loc(hostA), ptrbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dTauArray, c_loc(hostTau), ptrbytes, hipMemcpyHostToDevice))

  call hipsolverCheck(hipsolverDgeqrfBatched_bufferSize(handle, M, N, dAarray, lda, lwork, batch))
  call hipCheck(hipMalloc(dWork, max(lwork, 1_c_size_t)))
  hInfo = -1
  call hipsolverCheck(hipsolverDgeqrfBatched(handle, M, N, dAarray, lda, dTauArray, dWork, lwork, &
       c_loc(hInfo), batch))
  call hipCheck(hipDeviceSynchronize())
  if (hInfo /= 0) then
     write(*,*) "FAILED! info = ", hInfo, " (expected 0)"; call exit(1)
  end if

  do b = 1, batch
     call hipCheck(hipMemcpy(c_loc(hQR(1,1)), hostA(b), matbytes, hipMemcpyDeviceToHost))
     call hipCheck(hipMemcpy(c_loc(hTau(1)), hostTau(b), int(N,c_size_t) * 8, hipMemcpyDeviceToHost))
     R = 0.0d0
     do j = 1, N
        R(1:j,j) = hQR(1:j,j)
     end do
     Q = 0.0d0
     do i = 1, M
        Q(i,i) = 1.0d0
     end do
     ! Q = Q * H(k), k = 1..N
     do k = 1, N
        v = 0.0d0
        v(k) = 1.0d0
        v(k+1:M) = hQR(k+1:M,k)
        Q = Q - hTau(k) * matmul(reshape(matmul(Q, v), (/M,1/)), reshape(v, (/1,M/)))
     end do
     QR = matmul(Q, R)
     do j = 1, N
        do i = 1, M
           if (abs(QR(i,j) - hA(i,j,b)) > tol * 10.0d0) then
              write(*,*) "FAILED! batch ", b, " (Q*R)(", i, ",", j, ") = ", QR(i,j), &
                   " expected ", hA(i,j,b); call exit(1)
           end if
        end do
     end do
  end do

  do b = 1, batch
     call hipCheck(hipFree(hostA(b))); call hipCheck(hipFree(hostTau(b)))
  end do
  call hipCheck(hipFree(dAarray)); call hipCheck(hipFree(dTauArray)); call hipCheck(hipFree(dWork))
  call hipsolverCheck(hipsolverDestroy(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program dgeqrfbatched
