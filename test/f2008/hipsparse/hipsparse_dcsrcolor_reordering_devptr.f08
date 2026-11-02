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
! hipsparse Dcsrcolor with reordering as a device pointer (Fortran 2008 interfaces)
! see: https://rocm.docs.amd.com/projects/hipSPARSE/en/latest/
!
! Binding behaviour checked: the reordering output of hipsparseDcsrcolor is
! optional in the library (NULL skips it), so the generic also resolves to the
! _devptr forms, which take reordering as type(c_ptr),value: c_null_ptr, or a
! device buffer from hipMalloc. The matrix and coloring are device arrays,
! fractionToColor and ncolors host variables.
!
! A is the 9x9 5-point Laplacian of a 3x3 grid (symmetric). Each run checks that
! rows connected by a nonzero get different colors, that every color lies in
! [0, ncolors), and, when reordering is requested, that it is a permutation of
! 0..m-1.
!!!!!!!!!!!!!!
!
program hipsparse_dcsrcolor_reordering_devptr
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsparse
  implicit none
  integer, parameter :: n = 3
  integer(c_int), parameter :: m = n*n, nnz = 5*m - 4*n
  integer(c_int) :: hRowPtr(m+1), hColInd(nnz)
  real(c_double) :: hVal(nnz)
  integer(c_int), target :: hColoring(m), hReordering(m)
  real(c_double) :: fraction = 1.0d0
  integer(c_int) :: ncolors
  integer :: r, c, k
  type(c_ptr) :: handle = c_null_ptr, descrA = c_null_ptr, colorInfo = c_null_ptr
  type(c_ptr) :: dReordering = c_null_ptr
  real(c_double), pointer :: dVal(:)
  integer(c_int), pointer :: dRowPtr(:), dColInd(:), dColoring(:)
  write(*,"(a)",advance="no") "-- Running test 'hipsparse_dcsrcolor_reordering_devptr' (Fortran 2008 interfaces) - "

  ! Grid point (r, c) is row r*n + c (0-based); columns sorted within each row.
  k = 0
  hRowPtr(1) = 0
  do r = 0, n - 1
     do c = 0, n - 1
        if (r > 0)     call add_entry((r-1)*n + c, -1.0d0)
        if (c > 0)     call add_entry(r*n + c - 1, -1.0d0)
        call add_entry(r*n + c, 4.0d0)
        if (c < n - 1) call add_entry(r*n + c + 1, -1.0d0)
        if (r < n - 1) call add_entry((r+1)*n + c, -1.0d0)
        hRowPtr(r*n + c + 2) = k
     end do
  end do
  if (k /= nnz) then
     write(*,*) "FAILED! built ", k, " nonzeros (expected ", nnz, ")"; call exit(1)
  end if

  call hipCheck(hipMalloc(dVal,      source=hVal))
  call hipCheck(hipMalloc(dRowPtr,   source=hRowPtr))
  call hipCheck(hipMalloc(dColInd,   source=hColInd))
  call hipCheck(hipMalloc(dColoring, mold=hColoring))
  call hipCheck(hipMalloc(dReordering, int(m,c_size_t) * 4))
  call hipsparseCheck(hipsparseCreate(handle))
  call hipsparseCheck(hipsparseCreateMatDescr(descrA))

  ! reordering not requested
  call hipsparseCheck(hipsparseCreateColorInfo(colorInfo))
  ncolors = -1
  call hipsparseCheck(hipsparseDcsrcolor(handle, m, nnz, descrA, dVal, dRowPtr, dColInd, &
       fraction, ncolors, dColoring, c_null_ptr, colorInfo))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hColoring, dColoring, hipMemcpyDeviceToHost))
  call check_coloring("reordering = c_null_ptr")
  call hipsparseCheck(hipsparseDestroyColorInfo(colorInfo))

  ! reordering into a device buffer
  call hipsparseCheck(hipsparseCreateColorInfo(colorInfo))
  ncolors = -1
  hReordering = -1
  call hipCheck(hipMemcpy(dReordering, c_loc(hReordering), int(m,c_size_t) * 4, hipMemcpyHostToDevice))
  call hipsparseCheck(hipsparseDcsrcolor(handle, m, nnz, descrA, dVal, dRowPtr, dColInd, &
       fraction, ncolors, dColoring, dReordering, colorInfo))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hColoring, dColoring, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(c_loc(hReordering), dReordering, int(m,c_size_t) * 4, hipMemcpyDeviceToHost))
  call check_coloring("reordering on the device")
  do k = 0, m - 1
     if (count(hReordering == k) /= 1) then
        write(*,*) "FAILED! reordering ", hReordering, " is not a permutation of 0..", m-1
        call exit(1)
     end if
  end do
  call hipsparseCheck(hipsparseDestroyColorInfo(colorInfo))

  call hipsparseCheck(hipsparseDestroyMatDescr(descrA))
  call hipsparseCheck(hipsparseDestroy(handle))
  call hipCheck(hipFree(dVal)); call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd))
  call hipCheck(hipFree(dColoring)); call hipCheck(hipFree(dReordering))
  call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"

contains

  subroutine add_entry(col, v)
    integer, intent(in) :: col
    real(c_double), intent(in) :: v
    k = k + 1
    hColInd(k) = col
    hVal(k) = v
  end subroutine add_entry

  subroutine check_coloring(label)
    character(*), intent(in) :: label
    integer :: i, j
    if (ncolors <= 0) then
       write(*,*) "FAILED! ", label, ": ncolors = ", ncolors, " (expected > 0)"; call exit(1)
    end if
    if (minval(hColoring) < 0 .or. maxval(hColoring) + 1 > ncolors) then
       write(*,*) "FAILED! ", label, ": colors ", hColoring, " outside [0, ", ncolors, ")"
       call exit(1)
    end if
    do i = 1, m
       do j = hRowPtr(i) + 1, hRowPtr(i+1)
          if (hColInd(j) + 1 /= i .and. hColoring(hColInd(j) + 1) == hColoring(i)) then
             write(*,*) "FAILED! ", label, ": rows ", i, hColInd(j) + 1, " share color ", hColoring(i)
             call exit(1)
          end if
       end do
    end do
  end subroutine check_coloring

end program hipsparse_dcsrcolor_reordering_devptr
