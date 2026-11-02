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
! rocsparse dense_to_sparse with an absent buffer_size (Fortran 2003 interfaces)
! see: https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/reference/generic.html
!
! Binding behaviour checked: buffer_size of rocsparse_dense_to_sparse is a
! nullable size_t*, so the typed form takes it as an optional
! integer(c_size_t) and passes NULL when it is absent. rocSPARSE picks the
! stage from the two pointers:
!   temp_buffer NULL                   -> buffer size query (buffer_size set)
!   buffer_size NULL, temp_buffer set  -> analysis (nnz of B computed)
!   both set                           -> conversion
! so the analysis call leaves buffer_size out (temp_buffer given by keyword),
! which only the optional argument can express.
!
! A (3x4, column-major, ld = 3) = [ 1 0 0 2 ]
!                                 [ 0 0 3 0 ]
!                                 [ 4 5 0 6 ]
! is converted to CSR and the result checked against the hand-built CSR.
!!!!!!!!!!!!!!
!
program rocsparse_ddense_to_sparse_buffer_size_opt
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse
  implicit none
  integer(c_int), parameter :: m = 3, n = 4, ld = 3, expNnz = 6
  real(c_double), target :: hA(ld*n) = (/1, 0, 4,  0, 0, 5,  0, 3, 0,  2, 0, 6/)
  integer(c_int) :: expRowPtr(m+1) = (/0, 2, 3, 6/)
  integer(c_int) :: expColInd(expNnz) = (/0, 3, 2, 0, 1, 3/)
  real(c_double) :: expVal(expNnz) = (/1, 2, 3, 4, 5, 6/)
  integer(c_int), target :: hRowPtr(m+1), hColInd(expNnz)
  real(c_double), target :: hVal(expNnz)
  type(c_ptr) :: handle = c_null_ptr, matA = c_null_ptr, matB = c_null_ptr
  type(c_ptr) :: dA, dRowPtr, dColInd = c_null_ptr, dVal = c_null_ptr, dBuf
  integer(c_size_t) :: buffer_size
  integer(c_int64_t) :: rows, cols, nnz
  write(*,"(a)",advance="no") "-- Running test 'rocsparse_ddense_to_sparse_buffer_size_opt' (Fortran 2003 interfaces) - "

  call hipCheck(hipMalloc(dA,      int(ld*n,c_size_t) * 8))
  call hipCheck(hipMalloc(dRowPtr, int(m+1,c_size_t) * 4))
  call hipCheck(hipMemcpy(dA, c_loc(hA(1)), int(ld*n,c_size_t) * 8, hipMemcpyHostToDevice))

  call rocsparseCheck(rocsparse_create_handle(handle))
  call rocsparseCheck(rocsparse_create_dnmat_descr(matA, int(m,c_int64_t), int(n,c_int64_t), &
       int(ld,c_int64_t), dA, rocsparse_datatype_f64_r, rocsparse_order_column))
  ! B starts with its row pointer only; nnz is not known yet.
  call rocsparseCheck(rocsparse_create_csr_descr(matB, int(m,c_int64_t), int(n,c_int64_t), &
       0_c_int64_t, dRowPtr, c_null_ptr, c_null_ptr, rocsparse_indextype_i32, &
       rocsparse_indextype_i32, rocsparse_index_base_zero, rocsparse_datatype_f64_r))

  ! Buffer size query: buffer_size present, no temp_buffer.
  buffer_size = huge(buffer_size)
  call rocsparseCheck(rocsparse_dense_to_sparse(handle, matA, matB, &
       rocsparse_dense_to_sparse_alg_default, buffer_size, c_null_ptr))
  if (buffer_size == huge(buffer_size)) then
     write(*,*) "FAILED! buffer_size was not written"; call exit(1)
  end if
  call hipCheck(hipMalloc(dBuf, max(buffer_size, 1_c_size_t)))

  ! Analysis: buffer_size absent (NULL), temp_buffer given.
  call rocsparseCheck(rocsparse_dense_to_sparse(handle, matA, matB, &
       rocsparse_dense_to_sparse_alg_default, temp_buffer=dBuf))

  call rocsparseCheck(rocsparse_spmat_get_size(matB, rows, cols, nnz))
  if (rows /= m .or. cols /= n .or. nnz /= expNnz) then
     write(*,*) "FAILED! size of B = ", rows, cols, nnz, " expected ", m, n, expNnz; call exit(1)
  end if
  call hipCheck(hipMalloc(dColInd, int(nnz,c_size_t) * 4))
  call hipCheck(hipMalloc(dVal,    int(nnz,c_size_t) * 8))
  call rocsparseCheck(rocsparse_csr_set_pointers(matB, dRowPtr, dColInd, dVal))

  ! Conversion: both present.
  call rocsparseCheck(rocsparse_dense_to_sparse(handle, matA, matB, &
       rocsparse_dense_to_sparse_alg_default, buffer_size, dBuf))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(c_loc(hRowPtr(1)), dRowPtr, int(m+1,c_size_t) * 4, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(c_loc(hColInd(1)), dColInd, int(expNnz,c_size_t) * 4, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(c_loc(hVal(1)),    dVal,    int(expNnz,c_size_t) * 8, hipMemcpyDeviceToHost))

  if (any(hRowPtr /= expRowPtr)) then
     write(*,*) "FAILED! csr_row_ptr = ", hRowPtr, " expected ", expRowPtr; call exit(1)
  end if
  if (any(hColInd /= expColInd)) then
     write(*,*) "FAILED! csr_col_ind = ", hColInd, " expected ", expColInd; call exit(1)
  end if
  if (any(hVal /= expVal)) then
     write(*,*) "FAILED! csr_val = ", hVal, " expected ", expVal; call exit(1)
  end if

  call rocsparseCheck(rocsparse_destroy_dnmat_descr(matA))
  call rocsparseCheck(rocsparse_destroy_spmat_descr(matB))
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd))
  call hipCheck(hipFree(dVal)); call hipCheck(hipFree(dBuf))
  call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program rocsparse_ddense_to_sparse_buffer_size_opt
