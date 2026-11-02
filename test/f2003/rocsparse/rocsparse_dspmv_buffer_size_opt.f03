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
! rocsparse spmv with an absent buffer_size (Fortran 2003 interfaces)
! see: https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/reference/generic.html
!
! Binding behaviour checked: buffer_size of rocsparse_spmv is a nullable size_t*
! (the library only needs it when temp_buffer is NULL), so the typed form takes
! it as an optional integer(c_size_t) and passes NULL when it is absent. The
! buffer_size stage passes it; the preprocess and compute stages, which get a
! temp_buffer, leave it out (temp_buffer given by keyword).
!
! A (4x4) in CSR:  [ 1 0 2 0 ]     x = (1,2,3,4)
!                  [ 0 3 0 4 ]     y = 2*A*x + 1*y0, y0 = (1,1,1,1)
!                  [ 5 0 6 0 ]
!                  [ 0 7 0 8 ]
! The result is checked against a host product.
!!!!!!!!!!!!!!
!
program rocsparse_dspmv_buffer_size_opt
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse
  implicit none
  integer :: i, k
  integer(c_int), parameter :: m = 4, n = 4, nnz = 8
  integer(c_int), target :: hRowPtr(m+1) = (/0, 2, 4, 6, 8/)
  integer(c_int), target :: hColInd(nnz) = (/0, 2, 1, 3, 0, 2, 1, 3/)
  real(c_double), target :: hVal(nnz) = (/1, 2, 3, 4, 5, 6, 7, 8/)
  real(c_double), target :: hX(n) = (/1, 2, 3, 4/)
  real(c_double), target :: hY(m) = (/1, 1, 1, 1/)
  real(c_double) :: hExp(m)
  real(c_double), target :: alpha = 2.0_c_double, beta = 1.0_c_double
  type(c_ptr) :: handle = c_null_ptr, matA = c_null_ptr, vecX = c_null_ptr, vecY = c_null_ptr
  type(c_ptr) :: dRowPtr, dColInd, dVal, dX, dY, dBuf
  integer(c_size_t) :: buffer_size
  write(*,"(a)",advance="no") "-- Running test 'rocsparse_dspmv_buffer_size_opt' (Fortran 2003 interfaces) - "

  ! Host reference: y = alpha*A*x + beta*y0
  do i = 1, m
     hExp(i) = beta * hY(i)
     do k = hRowPtr(i) + 1, hRowPtr(i+1)
        hExp(i) = hExp(i) + alpha * hVal(k) * hX(hColInd(k) + 1)
     end do
  end do

  call hipCheck(hipMalloc(dRowPtr, int(m+1,c_size_t) * 4))
  call hipCheck(hipMalloc(dColInd, int(nnz,c_size_t) * 4))
  call hipCheck(hipMalloc(dVal,    int(nnz,c_size_t) * 8))
  call hipCheck(hipMalloc(dX,      int(n,c_size_t) * 8))
  call hipCheck(hipMalloc(dY,      int(m,c_size_t) * 8))
  call hipCheck(hipMemcpy(dRowPtr, c_loc(hRowPtr(1)), int(m+1,c_size_t) * 4, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dColInd, c_loc(hColInd(1)), int(nnz,c_size_t) * 4, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dVal,    c_loc(hVal(1)),    int(nnz,c_size_t) * 8, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dX,      c_loc(hX(1)),      int(n,c_size_t) * 8,   hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dY,      c_loc(hY(1)),      int(m,c_size_t) * 8,   hipMemcpyHostToDevice))

  call rocsparseCheck(rocsparse_create_handle(handle))
  call rocsparseCheck(rocsparse_create_csr_descr(matA, int(m,c_int64_t), int(n,c_int64_t), &
       int(nnz,c_int64_t), dRowPtr, dColInd, dVal, rocsparse_indextype_i32, &
       rocsparse_indextype_i32, rocsparse_index_base_zero, rocsparse_datatype_f64_r))
  call rocsparseCheck(rocsparse_create_dnvec_descr(vecX, int(n,c_int64_t), dX, rocsparse_datatype_f64_r))
  call rocsparseCheck(rocsparse_create_dnvec_descr(vecY, int(m,c_int64_t), dY, rocsparse_datatype_f64_r))

  ! Stage 1: buffer_size present, no temp_buffer.
  buffer_size = huge(buffer_size)
  call rocsparseCheck(rocsparse_spmv(handle, rocsparse_operation_none, c_loc(alpha), matA, vecX, &
       c_loc(beta), vecY, rocsparse_datatype_f64_r, rocsparse_spmv_alg_default, &
       rocsparse_spmv_stage_buffer_size, buffer_size, c_null_ptr))
  if (buffer_size == huge(buffer_size)) then
     write(*,*) "FAILED! buffer_size was not written"; call exit(1)
  end if
  call hipCheck(hipMalloc(dBuf, max(buffer_size, 1_c_size_t)))

  ! Stages 2 and 3: buffer_size absent (NULL), temp_buffer given.
  call rocsparseCheck(rocsparse_spmv(handle, rocsparse_operation_none, c_loc(alpha), matA, vecX, &
       c_loc(beta), vecY, rocsparse_datatype_f64_r, rocsparse_spmv_alg_default, &
       rocsparse_spmv_stage_preprocess, temp_buffer=dBuf))
  call rocsparseCheck(rocsparse_spmv(handle, rocsparse_operation_none, c_loc(alpha), matA, vecX, &
       c_loc(beta), vecY, rocsparse_datatype_f64_r, rocsparse_spmv_alg_default, &
       rocsparse_spmv_stage_compute, temp_buffer=dBuf))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(c_loc(hY(1)), dY, int(m,c_size_t) * 8, hipMemcpyDeviceToHost))

  do i = 1, m
     if (abs(hY(i) - hExp(i)) > 1.0d-12 * max(abs(hExp(i)), 1.0d0)) then
        write(*,*) "FAILED! y(", i, ") = ", hY(i), " expected ", hExp(i); call exit(1)
     end if
  end do

  call rocsparseCheck(rocsparse_destroy_spmat_descr(matA))
  call rocsparseCheck(rocsparse_destroy_dnvec_descr(vecX))
  call rocsparseCheck(rocsparse_destroy_dnvec_descr(vecY))
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd)); call hipCheck(hipFree(dVal))
  call hipCheck(hipFree(dX)); call hipCheck(hipFree(dY)); call hipCheck(hipFree(dBuf))
  call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program rocsparse_dspmv_buffer_size_opt
