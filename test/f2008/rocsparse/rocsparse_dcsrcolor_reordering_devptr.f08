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
! rocsparse dcsrcolor with reordering as a device pointer (Fortran 2008 interfaces)
! see: https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/
!
! Binding behaviour checked: reordering of rocsparse_dcsrcolor is an optional
! output (computed only when non-NULL), so next to the array overloads the
! generic has _devptr twins taking it as type(c_ptr),value. The generic
! resolves to rocsparse_dcsrcolor_rank_1_devptr (or
! rocsparse_dcsrcolor_assumed_rank_devptr with HIPFORT_ASSUMED_RANK) with
! device arrays for the matrix and coloring, host variables for
! fraction_to_color and ncolors, and reordering passed
!   1. as c_null_ptr (no reordering computed),
!   2. as a hipMalloc'd device buffer of m integers.
! Each time the coloring must give different colors to rows connected by an
! off-diagonal nonzero and stay in [0, ncolors); the reordering must be a
! permutation of 0..m-1.
!
! A is the 5-point Laplacian of a 3x3 grid (m = 9, symmetric pattern).
!!!!!!!!!!!!!!
!
program rocsparse_dcsrcolor_reordering_devptr
  use iso_c_binding
  use hip
  use rocsparse
  implicit none
  integer(c_int), parameter :: g = 3, m = g*g, nnz = 5*m - 4*g
  integer(c_int) :: hRowPtr(m+1), hColInd(nnz), hColoring(m)
  integer(c_int), target :: hReordering(m)
  real(c_double) :: hVal(nnz)
  real(c_double) :: fraction_to_color = 1.0d0
  integer(c_int) :: ncolors
  integer :: i, j, k, r
  logical :: seen(m)
  type(c_ptr) :: handle = c_null_ptr, descr = c_null_ptr, colorInfo = c_null_ptr
  type(c_ptr) :: dReordering = c_null_ptr
  real(c_double), pointer :: dVal(:)
  integer(c_int), pointer :: dRowPtr(:), dColInd(:), dColoring(:)
  write(*,"(a)",advance="no") "-- Running test 'rocsparse_dcsrcolor_reordering_devptr' (Fortran 2008 interfaces) - "

  ! Build the 3x3 grid Laplacian in CSR (0-based, sorted columns).
  k = 0
  hRowPtr(1) = 0
  do r = 0, m - 1
     i = r / g
     j = mod(r, g)
     if (i > 0)     call add(r - g, -1.0d0)
     if (j > 0)     call add(r - 1, -1.0d0)
                    call add(r,      4.0d0)
     if (j < g - 1) call add(r + 1, -1.0d0)
     if (i < g - 1) call add(r + g, -1.0d0)
     hRowPtr(r+2) = k
  end do

  call hipCheck(hipMalloc(dVal,      source=hVal))
  call hipCheck(hipMalloc(dRowPtr,   source=hRowPtr))
  call hipCheck(hipMalloc(dColInd,   source=hColInd))
  call hipCheck(hipMalloc(dColoring, mold=hColoring))
  call rocsparseCheck(rocsparse_create_handle(handle))
  call rocsparseCheck(rocsparse_create_mat_descr(descr))

  ! 1. reordering = NULL
  call rocsparseCheck(rocsparse_create_color_info(colorInfo))
  ncolors = -1
  call rocsparseCheck(rocsparse_dcsrcolor(handle, m, nnz, descr, dVal, dRowPtr, dColInd, &
       fraction_to_color, ncolors, dColoring, c_null_ptr, colorInfo))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hColoring, dColoring, hipMemcpyDeviceToHost))
  call check_coloring("reordering = c_null_ptr")
  call rocsparseCheck(rocsparse_destroy_color_info(colorInfo))

  ! 2. reordering = device buffer
  call hipCheck(hipMalloc(dReordering, int(m,c_size_t) * 4))
  call rocsparseCheck(rocsparse_create_color_info(colorInfo))
  ncolors = -1
  call rocsparseCheck(rocsparse_dcsrcolor(handle, m, nnz, descr, dVal, dRowPtr, dColInd, &
       fraction_to_color, ncolors, dColoring, dReordering, colorInfo))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hColoring, dColoring, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(c_loc(hReordering(1)), dReordering, int(m,c_size_t) * 4, hipMemcpyDeviceToHost))
  call check_coloring("reordering = device buffer")
  seen = .false.
  do i = 1, m
     if (hReordering(i) < 0 .or. hReordering(i) >= m) then
        write(*,*) "FAILED! reordering(", i, ") = ", hReordering(i), " outside [0, ", m, ")"
        call exit(1)
     end if
     if (seen(hReordering(i) + 1)) then
        write(*,*) "FAILED! reordering is not a permutation: ", hReordering; call exit(1)
     end if
     seen(hReordering(i) + 1) = .true.
  end do
  call rocsparseCheck(rocsparse_destroy_color_info(colorInfo))

  call rocsparseCheck(rocsparse_destroy_mat_descr(descr))
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(dVal)); call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd))
  call hipCheck(hipFree(dColoring)); call hipCheck(hipFree(dReordering))
  call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"

contains

  subroutine add(col, v)
    integer, intent(in) :: col
    real(c_double), intent(in) :: v
    k = k + 1
    hColInd(k) = col
    hVal(k) = v
  end subroutine add

  ! Colors in [0, ncolors), different across every off-diagonal nonzero.
  subroutine check_coloring(label)
    character(*), intent(in) :: label
    integer :: row, p, col
    if (ncolors <= 0 .or. ncolors < maxval(hColoring) + 1) then
       write(*,*) "FAILED! ", label, ": ncolors = ", ncolors, " max color = ", maxval(hColoring)
       call exit(1)
    end if
    if (minval(hColoring) < 0) then
       write(*,*) "FAILED! ", label, ": negative color in ", hColoring; call exit(1)
    end if
    do row = 1, m
       do p = hRowPtr(row) + 1, hRowPtr(row+1)
          col = hColInd(p) + 1
          if (col /= row .and. hColoring(row) == hColoring(col)) then
             write(*,*) "FAILED! ", label, ": rows ", row, col, " are adjacent and share color ", &
                        hColoring(row)
             call exit(1)
          end if
       end do
    end do
  end subroutine check_coloring

end program rocsparse_dcsrcolor_reordering_devptr
