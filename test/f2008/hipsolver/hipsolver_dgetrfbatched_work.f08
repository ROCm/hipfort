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
! hipsolverDgetrfBatched: `work` as a device pointer passed by value
! (Fortran 2008 interfaces)
!
! The workspace of the hipSOLVER getrf/getri/getrs/geqrf Batched routines is a
! device buffer: the bindings take it as type(c_ptr), value. Factorizes three
! 64x64 matrices twice through the generic name:
!   1. work = a device buffer of the size hipsolverDgetrfBatched_bufferSize
!      returns, devIpiv and devInfo as rank-1 device arrays (hipMalloc'd);
!   2. work = c_null_ptr and lwork = 0, which the AMD backend accepts (it falls
!      back to the workspace the handle manages), devInfo as a type(c_ptr).
! The AMD backend hands work to rocBLAS only when work and lwork are both
! nonzero; up to 32x32 the query returns 0 on ROCm 10.2, hence N = 64.
! A is an array of device pointers that itself lives in device memory. Each
! time, checks devInfo = 0, the pivots against a host LU with partial pivoting,
! and that L*U reproduces A with its rows swapped as the pivots say.
!!!!!!!!!!!!!!
!
program dgetrfbatched_work
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  implicit none
  integer :: b, run, i, j
  integer(c_int), parameter :: N = 64, lda = N, batch = 3, strideP = N
  real(c_double), target :: hA(N,N,batch), hLU(N,N)
  real(c_double) :: refLU(N,N), PA(N,N), L(N,N), U(N,N), row(N)
  integer(c_int) :: hIpiv(strideP*batch), hInfo(batch), refIpiv(N)
  type(c_ptr), target :: hostA(batch)
  type(c_ptr) :: dAarray, dWork
  integer(c_int), pointer :: dIpiv(:), dInfo(:)
  type(c_ptr) :: handle
  integer(c_size_t) :: lwork, matbytes, ptrbytes
  real(c_double), parameter :: tol = 1.0d-12

  write(*,"(a)",advance="no") "-- Running test 'hipsolver_dgetrfbatched_work' (Fortran 2008 interfaces) - "

  ! Dense matrices with no structure: the factorizations pivot
  do b = 1, batch
     do j = 1, N
        do i = 1, N
           hA(i,j,b) = sin(1.3d0 * i + 0.7d0 * j * b + b) + cos(0.11d0 * i * j)
        end do
     end do
  end do

  matbytes = int(N*N,c_size_t) * 8
  ptrbytes = int(batch,c_size_t) * c_sizeof(c_null_ptr)
  call hipsolverCheck(hipsolverCreate(handle))
  do b = 1, batch
     call hipCheck(hipMalloc(hostA(b), matbytes))
  end do
  call hipCheck(hipMalloc(dAarray, ptrbytes))
  call hipCheck(hipMemcpy(dAarray, c_loc(hostA), ptrbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMalloc(dIpiv, strideP*batch))
  call hipCheck(hipMalloc(dInfo, batch))

  call hipsolverCheck(hipsolverDgetrfBatched_bufferSize(handle, N, N, dAarray, lda, strideP, &
       lwork, batch))
  call hipCheck(hipMalloc(dWork, max(lwork, 1_c_size_t)))

  do run = 1, 2
     do b = 1, batch
        call hipCheck(hipMemcpy(hostA(b), c_loc(hA(1,1,b)), matbytes, hipMemcpyHostToDevice))
     end do
     hInfo = -1
     hIpiv = 0
     call hipCheck(hipMemcpy(dInfo, hInfo, hipMemcpyHostToDevice))
     call hipCheck(hipMemcpy(dIpiv, hIpiv, hipMemcpyHostToDevice))

     if (run == 1) then
        ! work: a device buffer sized by the query
        call hipsolverCheck(hipsolverDgetrfBatched(handle, N, N, dAarray, lda, dWork, lwork, &
             dIpiv, strideP, dInfo, batch))
     else
        ! work = NULL, lwork = 0: the handle-managed workspace
        call hipsolverCheck(hipsolverDgetrfBatched(handle, N, N, dAarray, lda, c_null_ptr, &
             0_c_size_t, dIpiv, strideP, c_loc(dInfo), batch))
     end if
     call hipCheck(hipDeviceSynchronize())
     call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
     call hipCheck(hipMemcpy(hIpiv, dIpiv, hipMemcpyDeviceToHost))

     do b = 1, batch
        if (hInfo(b) /= 0) then
           write(*,*) "FAILED! run ", run, " info(", b, ") = ", hInfo(b), " (expected 0)"; call exit(1)
        end if
        call reference_lu(hA(:,:,b), refLU, refIpiv)
        if (any(hIpiv((b-1)*strideP+1:(b-1)*strideP+N) /= refIpiv)) then
           write(*,*) "FAILED! run ", run, " batch ", b, " pivots differ from the host LU"
           call exit(1)
        end if
        call hipCheck(hipMemcpy(c_loc(hLU), hostA(b), matbytes, hipMemcpyDeviceToHost))
        ! L*U against A with the rows swapped as the pivots say
        PA = hA(:,:,b)
        do j = 1, N
           i = refIpiv(j)
           row = PA(j,:); PA(j,:) = PA(i,:); PA(i,:) = row
        end do
        L = 0.0d0
        U = 0.0d0
        do j = 1, N
           L(j,j) = 1.0d0
           L(j+1:N,j) = hLU(j+1:N,j)
           U(1:j,j) = hLU(1:j,j)
        end do
        if (maxval(abs(matmul(L, U) - PA)) > tol * N * maxval(abs(PA))) then
           write(*,*) "FAILED! run ", run, " batch ", b, " max |L*U - P*A| = ", &
                maxval(abs(matmul(L, U) - PA)); call exit(1)
        end if
     end do
  end do

  do b = 1, batch
     call hipCheck(hipFree(hostA(b)))
  end do
  call hipCheck(hipFree(dAarray))
  call hipCheck(hipFree(dIpiv))
  call hipCheck(hipFree(dInfo))
  call hipCheck(hipFree(dWork))
  call hipsolverCheck(hipsolverDestroy(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

contains

  ! LU with partial pivoting (unblocked, as LAPACK dgetf2): L\U packed in lu,
  ! 1-based ipiv
  subroutine reference_lu(a, lu, ipiv)
    real(c_double), intent(in) :: a(N,N)
    real(c_double), intent(out) :: lu(N,N)
    integer(c_int), intent(out) :: ipiv(N)
    real(c_double) :: r(N)
    integer :: k, p, m
    lu = a
    do k = 1, N
       p = k - 1 + maxloc(abs(lu(k:N,k)), 1)
       ipiv(k) = p
       if (p /= k) then
          r = lu(k,:); lu(k,:) = lu(p,:); lu(p,:) = r
       end if
       do m = k + 1, N
          lu(m,k) = lu(m,k) / lu(k,k)
          lu(m,k+1:N) = lu(m,k+1:N) - lu(m,k) * lu(k,k+1:N)
       end do
    end do
  end subroutine

end program dgetrfbatched_work
