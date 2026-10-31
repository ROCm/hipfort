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
! hipsparse Scsrcolor with a host fractionToColor (Fortran 2008 interfaces)
! see: https://rocm.docs.amd.com/projects/hipSPARSE/en/latest/
!
! Binding behaviour checked: fractionToColor of hipsparseScsrcolor is a host
! real the library reads on the host (its _devptr form is gone), and ncolors a
! host integer it writes. The generic resolves to hipsparseScsrcolor_rank_1
! with device arrays for the matrix, coloring and reordering, and plain host
! variables for fractionToColor and ncolors.
!
! A is the 5x5 symmetric tridiagonal matrix (path graph 1-2-3-4-5), so rows i
! and i+1 are adjacent and must get different colors.
!!!!!!!!!!!!!!
!
program hipsparse_scsrcolor_fraction_host
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsparse
  implicit none
  integer :: i
  integer(c_int), parameter :: m = 5, nnz = 13
  integer(c_int) :: hRowPtr(m+1) = (/0, 2, 5, 8, 11, 13/)
  integer(c_int) :: hColInd(nnz) = (/0, 1,  0, 1, 2,  1, 2, 3,  2, 3, 4,  3, 4/)
  real(c_float)  :: hVal(nnz) = (/4.0, -1.0, -1.0, 4.0, -1.0, -1.0, 4.0, -1.0, &
                                  -1.0, 4.0, -1.0, -1.0, 4.0/)
  integer(c_int) :: hColoring(m), hReordering(m)
  real(c_float)  :: fraction = 1.0
  integer(c_int) :: ncolors
  type(c_ptr) :: handle = c_null_ptr, descrA = c_null_ptr, colorInfo = c_null_ptr
  real(c_float), pointer :: dVal(:)
  integer(c_int), pointer :: dRowPtr(:), dColInd(:), dColoring(:), dReordering(:)
  write(*,"(a)",advance="no") "-- Running test 'hipsparse_scsrcolor_fraction_host' (Fortran 2008 interfaces) - "

  call hipCheck(hipMalloc(dVal,        source=hVal))
  call hipCheck(hipMalloc(dRowPtr,     source=hRowPtr))
  call hipCheck(hipMalloc(dColInd,     source=hColInd))
  call hipCheck(hipMalloc(dColoring,   mold=hColoring))
  call hipCheck(hipMalloc(dReordering, mold=hReordering))
  call hipsparseCheck(hipsparseCreate(handle))
  call hipsparseCheck(hipsparseCreateMatDescr(descrA))
  call hipsparseCheck(hipsparseCreateColorInfo(colorInfo))

  ncolors = -1
  call hipsparseCheck(hipsparseScsrcolor(handle, m, nnz, descrA, dVal, dRowPtr, dColInd, &
       fraction, ncolors, dColoring, dReordering, colorInfo))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hColoring, dColoring, hipMemcpyDeviceToHost))

  if (ncolors <= 0) then
     write(*,*) "FAILED! ncolors = ", ncolors, " (expected > 0)"; call exit(1)
  end if
  do i = 1, m
     if (hColoring(i) < 0 .or. hColoring(i) >= ncolors) then
        write(*,*) "FAILED! coloring(", i, ") = ", hColoring(i), " outside [0, ", ncolors, ")"
        call exit(1)
     end if
  end do
  do i = 1, m - 1
     if (hColoring(i) == hColoring(i+1)) then
        write(*,*) "FAILED! adjacent rows ", i, i+1, " share color ", hColoring(i); call exit(1)
     end if
  end do

  call hipsparseCheck(hipsparseDestroyColorInfo(colorInfo))
  call hipsparseCheck(hipsparseDestroyMatDescr(descrA))
  call hipsparseCheck(hipsparseDestroy(handle))
  call hipCheck(hipFree(dVal)); call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd))
  call hipCheck(hipFree(dColoring)); call hipCheck(hipFree(dReordering))
  call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program hipsparse_scsrcolor_fraction_host
