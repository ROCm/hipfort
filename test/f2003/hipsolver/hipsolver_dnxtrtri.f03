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
! hipsolverDnXtrtri example (64-bit generic triangular inverse, Fortran 2003)
! see: https://rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! Inverts an upper-triangular double matrix in place through the 64-bit
! generic API, where the data type is passed as HIP_R_64F and the dimensions
! are int64_t. The buffer-size query returns separate device and host
! workspace sizes in bytes. Checks devInfo == 0 and U * inv(U) == I.
!
! f2003 style: device buffers are type(c_ptr) allocated by byte count; host data
! is moved with hipMemcpy + c_loc.
!!!!!!!!!!!!!!
!
program dnxtrtri
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_enums
  use hipfort_hipsolver
  implicit none
  integer :: i, j, l
  integer(c_int64_t), parameter :: N = 4, lda = 4
  ! Upper-triangular matrix (lower part zero), column-major
  real(c_double), target :: hU(N,N) = reshape((/ &
      2.0d0, 0.0d0, 0.0d0, 0.0d0, &
      1.0d0, 3.0d0, 0.0d0, 0.0d0, &
     -1.0d0, 2.0d0, 4.0d0, 0.0d0, &
      0.5d0, 1.0d0,-2.0d0, 5.0d0/), (/4,4/))
  real(c_double), target :: hUinv(N,N)
  integer(c_int), target :: hInfo
  integer(c_int8_t), allocatable, target :: hWork(:)
  type(c_ptr) :: dA, dWork, dInfo, hWorkPtr
  type(c_ptr) :: handle
  integer(c_size_t) :: lworkDevice, lworkHost, matbytes
  real(c_double) :: prod
  real(c_double), parameter :: tol = 1.0d-12
  write(*,"(a)",advance="no") "-- Running test 'hipsolver_dnxtrtri' (Fortran 2003 interfaces) - "

  matbytes = int(N*N,c_size_t) * 8
  call hipsolverCheck(hipsolverDnCreate(handle))
  call hipCheck(hipMalloc(dA, matbytes))
  call hipCheck(hipMalloc(dInfo, 4_c_size_t))
  call hipCheck(hipMemcpy(dA, c_loc(hU(1,1)), matbytes, hipMemcpyHostToDevice))

  call hipsolverCheck(hipsolverDnXtrtri_bufferSize(handle, HIPSOLVER_FILL_MODE_UPPER, &
       HIPSOLVER_DIAG_NON_UNIT, N, HIP_R_64F, dA, lda, lworkDevice, lworkHost))
  call hipCheck(hipMalloc(dWork, max(lworkDevice, 1_c_size_t)))
  hWorkPtr = c_null_ptr
  if (lworkHost > 0) then
     allocate(hWork(lworkHost))
     hWorkPtr = c_loc(hWork(1))
  end if

  call hipsolverCheck(hipsolverDnXtrtri(handle, HIPSOLVER_FILL_MODE_UPPER, HIPSOLVER_DIAG_NON_UNIT, &
       N, HIP_R_64F, dA, lda, dWork, lworkDevice, hWorkPtr, lworkHost, dInfo))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(c_loc(hInfo), dInfo, 4_c_size_t, hipMemcpyDeviceToHost))
  if (hInfo /= 0) then
     write(*,*) "FAILED! info = ", hInfo, " (expected 0)"; call exit(1)
  end if

  call hipCheck(hipMemcpy(c_loc(hUinv(1,1)), dA, matbytes, hipMemcpyDeviceToHost))
  ! Only the upper triangle holds the inverse; the strict lower part is untouched.
  do j = 1, N
     do i = j+1, N
        hUinv(i,j) = 0.0d0
     end do
  end do
  do j = 1, N
     do i = 1, N
        prod = 0.0d0
        do l = 1, N
           prod = prod + hU(i,l) * hUinv(l,j)
        end do
        if (abs(prod - merge(1.0d0, 0.0d0, i == j)) > tol) then
           write(*,*) "FAILED! (U*inv(U))(", i, ",", j, ") = ", prod; call exit(1)
        end if
     end do
  end do

  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dWork)); call hipCheck(hipFree(dInfo))
  call hipsolverCheck(hipsolverDnDestroy(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program dnxtrtri
