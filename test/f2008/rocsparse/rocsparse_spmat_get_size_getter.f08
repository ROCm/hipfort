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
! rocsparse sparse-matrix descriptor getters (Fortran 2008 interfaces)
! see: https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/
!
! Binding behaviour checked: the getters of a sparse-matrix descriptor write
! their int64 sizes and enum values on the host. Through the generic name,
! rocsparse_spmat_get_size and rocsparse_csr_get resolve to their _typed form,
! which takes plain host integer(c_int64_t) / enum variables (the generator's
! getter rule), while rocsparse_csr_get still hands back the three device
! arrays as type(c_ptr) outputs. Every output is primed with a sentinel so a
! getter that does not write cannot pass.
!!!!!!!!!!!!!!
!
program rocsparse_spmat_get_size_getter
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse
  implicit none
  integer(c_int64_t), parameter :: m = 3, n = 4, nnz = 5
  integer(c_int), target :: hRowPtr(m+1) = (/0, 2, 3, 5/)
  integer(c_int), target :: hColInd(nnz) = (/0, 3, 1, 0, 2/)
  real(c_double), target :: hVal(nnz) = (/1.0d0, 2.0d0, 3.0d0, 4.0d0, 5.0d0/)
  type(c_ptr) :: dRowPtr = c_null_ptr, dColInd = c_null_ptr, dVal = c_null_ptr
  type(c_ptr) :: descr = c_null_ptr
  type(c_ptr) :: pRowPtr, pColInd, pVal
  integer(c_int64_t) :: rows, cols, nnz_out
  integer(kind(rocsparse_indextype_i32)) :: row_type, col_type
  integer(kind(rocsparse_index_base_zero)) :: base
  integer(kind(rocsparse_datatype_f64_r)) :: dtype
  write(*,"(a)",advance="no") "-- Running test 'rocsparse_spmat_get_size_getter' (Fortran 2008 interfaces) - "

  call hipCheck(hipMalloc(dRowPtr, int(size(hRowPtr)*4, c_size_t)))
  call hipCheck(hipMalloc(dColInd, int(size(hColInd)*4, c_size_t)))
  call hipCheck(hipMalloc(dVal,    int(size(hVal)*8, c_size_t)))
  call hipCheck(hipMemcpy(dRowPtr, c_loc(hRowPtr), int(size(hRowPtr)*4, c_size_t), hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dColInd, c_loc(hColInd), int(size(hColInd)*4, c_size_t), hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dVal,    c_loc(hVal),    int(size(hVal)*8, c_size_t),    hipMemcpyHostToDevice))

  call rocsparseCheck(rocsparse_create_csr_descr(descr, m, n, nnz, dRowPtr, dColInd, dVal, &
       rocsparse_indextype_i32, rocsparse_indextype_i32, rocsparse_index_base_zero, &
       rocsparse_datatype_f64_r))

  ! rocsparse_spmat_get_size -> _typed: host int64 rows/cols/nnz.
  rows = -1; cols = -1; nnz_out = -1
  call rocsparseCheck(rocsparse_spmat_get_size(descr, rows, cols, nnz_out))
  if (rows /= m .or. cols /= n .or. nnz_out /= nnz) then
     write(*,*) "FAILED! spmat_get_size = ", rows, cols, nnz_out, " expected ", m, n, nnz; call exit(1)
  end if

  ! rocsparse_csr_get -> _typed: host sizes and enums, device arrays as type(c_ptr).
  rows = -1; cols = -1; nnz_out = -1
  row_type = -1; col_type = -1; base = -1; dtype = -1
  pRowPtr = c_null_ptr; pColInd = c_null_ptr; pVal = c_null_ptr
  call rocsparseCheck(rocsparse_csr_get(descr, rows, cols, nnz_out, pRowPtr, pColInd, pVal, &
       row_type, col_type, base, dtype))
  if (rows /= m .or. cols /= n .or. nnz_out /= nnz) then
     write(*,*) "FAILED! csr_get sizes = ", rows, cols, nnz_out, " expected ", m, n, nnz; call exit(1)
  end if
  if (row_type /= rocsparse_indextype_i32 .or. col_type /= rocsparse_indextype_i32 .or. &
      base /= rocsparse_index_base_zero .or. dtype /= rocsparse_datatype_f64_r) then
     write(*,*) "FAILED! csr_get enums = ", row_type, col_type, base, dtype; call exit(1)
  end if
  if (.not. (c_associated(pRowPtr, dRowPtr) .and. c_associated(pColInd, dColInd) &
             .and. c_associated(pVal, dVal))) then
     write(*,*) "FAILED! csr_get did not return the descriptor's device arrays"; call exit(1)
  end if

  call rocsparseCheck(rocsparse_destroy_spmat_descr(descr))
  call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd)); call hipCheck(hipFree(dVal))
  call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program rocsparse_spmat_get_size_getter
