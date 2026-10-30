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

!!!!!!!!!!!!!!/
! spsort example (sparse matrix sorting with the generic API, Fortran 2003 interfaces)
! see: https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/reference/generic.html
!
! Sorts two matrices with rocsparse_spsort, each through the two stages
! (analysis -> compute) with a buffer sized by rocsparse_spsort_buffer_size:
!   - a CSR matrix whose column indices are scrambled within each row, sorted
!     in place by passing the same descriptor as source and target;
!   - a COO matrix in arbitrary order, sorted out of place by column then row,
!     the direction being set on the descriptor with rocsparse_spsort_set_input.
! The algorithm has no default: every descriptor must be given one.
! Checks that the indices come out sorted and the values followed them.
!
! f2003 style: device buffers are type(c_ptr) allocated by byte count; host
! data is moved with hipMemcpy + c_loc.
!!!!!!!!!!!!!!/
!
program spsort
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse

  implicit none

  ! CSR (0-based), 4x6, column indices unsorted within each row:
  !       1 2 3 4 0 5
  !   A = 0 2 3 0 0 4
  !       5 0 6 7 8 0
  !       1 0 9 0 6 7
  integer(c_int), parameter :: m = 4, n = 6, nnz = 16
  integer(c_int), target :: h_row_ptr(m+1) = (/0, 5, 8, 12, 16/)
  integer(c_int), target :: h_col_ind(nnz) = (/5, 3, 2, 1, 0, 1, 5, 2, 4, 2, 3, 0, 0, 5, 4, 2/)
  real(c_double), target :: h_val(nnz)     = (/5, 4, 3, 2, 1, 2, 4, 3, 8, 6, 7, 5, 1, 7, 6, 9/)
  integer(c_int) :: expected_col(nnz) = (/0, 1, 2, 3, 5, 1, 2, 5, 0, 2, 3, 4, 0, 2, 4, 5/)
  real(c_double) :: expected_val(nnz) = (/1, 2, 3, 4, 5, 2, 3, 4, 5, 6, 7, 8, 1, 9, 6, 7/)

  ! COO (0-based), 3x3, entries in arbitrary order:
  !       1 0 2
  !   B = 0 3 0
  !       4 5 6
  integer(c_int), parameter :: mb = 3, nb = 3, nnzb = 6
  integer(c_int), target :: h_coo_row(nnzb) = (/2, 0, 2, 1, 2, 0/)
  integer(c_int), target :: h_coo_col(nnzb) = (/1, 2, 0, 1, 2, 0/)
  real(c_double), target :: h_coo_val(nnzb) = (/5, 2, 4, 3, 6, 1/)
  ! Sorted by column, then by row
  integer(c_int) :: expected_coo_row(nnzb) = (/0, 2, 1, 2, 0, 2/)
  integer(c_int) :: expected_coo_col(nnzb) = (/0, 0, 1, 1, 2, 2/)
  real(c_double) :: expected_coo_val(nnzb) = (/1, 4, 3, 5, 2, 6/)

  integer(c_int), target :: h_out_row(nnz), h_out_col(nnz)
  real(c_double), target :: h_out_val(nnz)
  integer(c_int), target :: alg = rocsparse_spsort_alg_default
  integer(c_int), target :: dir = rocsparse_direction_column

  type(c_ptr) :: d_row_ptr, d_col_ind, d_val
  type(c_ptr) :: d_coo_row, d_coo_col, d_coo_val, d_out_row, d_out_col, d_out_val
  type(c_ptr) :: handle, matA, matB, matBsorted, descr_csr, descr_coo
  integer :: i

  write(*,"(a)",advance="no") "-- Running test 'rocsparse_spsort' (Fortran 2003 interfaces) - "

  call rocsparseCheck(rocsparse_create_handle(handle))

  ! ---- CSR, sorted in place ----
  call hipCheck(hipMalloc(d_row_ptr, int(m+1, c_size_t) * 4))
  call hipCheck(hipMalloc(d_col_ind, int(nnz, c_size_t) * 4))
  call hipCheck(hipMalloc(d_val,     int(nnz, c_size_t) * 8))
  call hipCheck(hipMemcpy(d_row_ptr, c_loc(h_row_ptr(1)), int(m+1, c_size_t) * 4, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(d_col_ind, c_loc(h_col_ind(1)), int(nnz, c_size_t) * 4, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(d_val,     c_loc(h_val(1)),     int(nnz, c_size_t) * 8, hipMemcpyHostToDevice))

  call rocsparseCheck(rocsparse_create_csr_descr(matA, int(m,c_int64_t), int(n,c_int64_t), int(nnz,c_int64_t), &
                          d_row_ptr, d_col_ind, d_val, &
                          rocsparse_indextype_i32, rocsparse_indextype_i32, &
                          rocsparse_index_base_zero, rocsparse_datatype_f64_r))

  call rocsparseCheck(rocsparse_spsort_descr_create(handle, descr_csr))
  call rocsparseCheck(rocsparse_spsort_set_input(handle, descr_csr, rocsparse_spsort_input_alg, &
                          c_loc(alg), c_sizeof(alg)))
  call run_spsort(descr_csr, matA, matA)

  call hipCheck(hipMemcpy(c_loc(h_out_col(1)), d_col_ind, int(nnz, c_size_t) * 4, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(c_loc(h_out_val(1)), d_val,     int(nnz, c_size_t) * 8, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(c_loc(h_out_row(1)), d_row_ptr, int(m+1, c_size_t) * 4, hipMemcpyDeviceToHost))
  do i = 1, m+1
     if (h_out_row(i) /= h_row_ptr(i)) then
        write(*,*) "FAILED! CSR row_ptr(", i, ") = ", h_out_row(i), " expected ", h_row_ptr(i); call exit(1)
     end if
  end do
  do i = 1, nnz
     if (h_out_col(i) /= expected_col(i) .or. h_out_val(i) /= expected_val(i)) then
        write(*,*) "FAILED! CSR entry ", i, ": col = ", h_out_col(i), " val = ", h_out_val(i), &
             " expected ", expected_col(i), expected_val(i); call exit(1)
     end if
  end do

  ! ---- COO, sorted out of place by column ----
  call hipCheck(hipMalloc(d_coo_row, int(nnzb, c_size_t) * 4))
  call hipCheck(hipMalloc(d_coo_col, int(nnzb, c_size_t) * 4))
  call hipCheck(hipMalloc(d_coo_val, int(nnzb, c_size_t) * 8))
  call hipCheck(hipMalloc(d_out_row, int(nnzb, c_size_t) * 4))
  call hipCheck(hipMalloc(d_out_col, int(nnzb, c_size_t) * 4))
  call hipCheck(hipMalloc(d_out_val, int(nnzb, c_size_t) * 8))
  call hipCheck(hipMemcpy(d_coo_row, c_loc(h_coo_row(1)), int(nnzb, c_size_t) * 4, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(d_coo_col, c_loc(h_coo_col(1)), int(nnzb, c_size_t) * 4, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(d_coo_val, c_loc(h_coo_val(1)), int(nnzb, c_size_t) * 8, hipMemcpyHostToDevice))

  call rocsparseCheck(rocsparse_create_coo_descr(matB, int(mb,c_int64_t), int(nb,c_int64_t), int(nnzb,c_int64_t), &
                          d_coo_row, d_coo_col, d_coo_val, rocsparse_indextype_i32, &
                          rocsparse_index_base_zero, rocsparse_datatype_f64_r))
  call rocsparseCheck(rocsparse_create_coo_descr(matBsorted, int(mb,c_int64_t), int(nb,c_int64_t), &
                          int(nnzb,c_int64_t), d_out_row, d_out_col, d_out_val, rocsparse_indextype_i32, &
                          rocsparse_index_base_zero, rocsparse_datatype_f64_r))

  call rocsparseCheck(rocsparse_spsort_descr_create(handle, descr_coo))
  call rocsparseCheck(rocsparse_spsort_set_input(handle, descr_coo, rocsparse_spsort_input_alg, &
                          c_loc(alg), c_sizeof(alg)))
  call rocsparseCheck(rocsparse_spsort_set_input(handle, descr_coo, rocsparse_spsort_input_direction, &
                          c_loc(dir), c_sizeof(dir)))
  call run_spsort(descr_coo, matB, matBsorted)

  call hipCheck(hipMemcpy(c_loc(h_out_row(1)), d_out_row, int(nnzb, c_size_t) * 4, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(c_loc(h_out_col(1)), d_out_col, int(nnzb, c_size_t) * 4, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(c_loc(h_out_val(1)), d_out_val, int(nnzb, c_size_t) * 8, hipMemcpyDeviceToHost))
  do i = 1, nnzb
     if (h_out_row(i) /= expected_coo_row(i) .or. h_out_col(i) /= expected_coo_col(i) .or. &
         h_out_val(i) /= expected_coo_val(i)) then
        write(*,*) "FAILED! COO entry ", i, ": (", h_out_row(i), ",", h_out_col(i), ") = ", h_out_val(i), &
             " expected (", expected_coo_row(i), ",", expected_coo_col(i), ") = ", expected_coo_val(i)
        call exit(1)
     end if
  end do
  ! Out of place: the source is left as it was
  call hipCheck(hipMemcpy(c_loc(h_out_col(1)), d_coo_col, int(nnzb, c_size_t) * 4, hipMemcpyDeviceToHost))
  do i = 1, nnzb
     if (h_out_col(i) /= h_coo_col(i)) then
        write(*,*) "FAILED! COO source col(", i, ") changed to ", h_out_col(i); call exit(1)
     end if
  end do

  ! Clean up
  call rocsparseCheck(rocsparse_spsort_descr_destroy(handle, descr_csr))
  call rocsparseCheck(rocsparse_spsort_descr_destroy(handle, descr_coo))
  call rocsparseCheck(rocsparse_destroy_spmat_descr(matA))
  call rocsparseCheck(rocsparse_destroy_spmat_descr(matB))
  call rocsparseCheck(rocsparse_destroy_spmat_descr(matBsorted))
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(d_row_ptr))
  call hipCheck(hipFree(d_col_ind))
  call hipCheck(hipFree(d_val))
  call hipCheck(hipFree(d_coo_row))
  call hipCheck(hipFree(d_coo_col))
  call hipCheck(hipFree(d_coo_val))
  call hipCheck(hipFree(d_out_row))
  call hipCheck(hipFree(d_out_col))
  call hipCheck(hipFree(d_out_val))

  write(*,*) "PASSED!"

contains

  ! Analysis, then compute, each with its own buffer. rocsparse_spsort rejects
  ! a non-null buffer with a size of zero, so a zero-byte stage gets c_null_ptr.
  subroutine run_spsort(descr, source, target)
    type(c_ptr), intent(in) :: descr, source, target
    call run_stage(descr, source, target, rocsparse_spsort_stage_analysis)
    call run_stage(descr, source, target, rocsparse_spsort_stage_compute)
    call hipCheck(hipDeviceSynchronize())
  end subroutine run_spsort

  subroutine run_stage(descr, source, target, stage)
    type(c_ptr), intent(in) :: descr, source, target
    integer(c_int), intent(in) :: stage
    integer(c_size_t) :: buffer_size
    type(c_ptr) :: d_buffer
    d_buffer = c_null_ptr
    call rocsparseCheck(rocsparse_spsort_buffer_size(handle, descr, source, target, stage, buffer_size))
    if (buffer_size > 0) call hipCheck(hipMalloc(d_buffer, buffer_size))
    call rocsparseCheck(rocsparse_spsort(handle, descr, source, target, stage, buffer_size, d_buffer))
    if (buffer_size > 0) call hipCheck(hipFree(d_buffer))
  end subroutine run_stage

end program spsort
