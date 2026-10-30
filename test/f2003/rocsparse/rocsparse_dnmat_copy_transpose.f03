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
! dnmat_copy_data / dnmat_transpose example (dense-matrix descriptors, Fortran 2003 interfaces)
! see: https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/reference/auxiliary.html
!
! Starting from a 2x3 column-major dense matrix X:
!   - rocsparse_dnmat_copy_data without alpha copies X into a column-major Y;
!   - with alpha = 2 it writes 2*X into a ROW-major Y, so the layout changes too;
!   - rocsparse_dnmat_transpose writes -X^T into a 3x2 column-major Z.
! alpha is not a bare scalar but a dense-vector descriptor of size 1, whose
! value lives in device memory (the default pointer mode of a dnvec).
!
! f2003 style: device buffers are type(c_ptr) allocated by byte count; host
! data is moved with hipMemcpy + c_loc.
!!!!!!!!!!!!!!/
!
program dnmat_copy_transpose
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse

  implicit none
  integer :: i, j

  integer(c_int64_t), parameter :: m = 2, n = 3
  real(c_double), target :: h_X(2,3) = reshape((/1, 2, 3, 4, 5, 6/), (/2, 3/))
  real(c_double), target :: h_Y(6), h_Z(3,2)
  real(c_double), target :: two = 2.0_c_double, minus_one = -1.0_c_double

  type(c_ptr) :: d_X, d_Y, d_Z, d_two, d_minus_one
  type(c_ptr) :: handle, matX, matYcol, matYrow, matZ, alpha_two, alpha_minus_one

  write(*,"(a)",advance="no") "-- Running test 'rocsparse_dnmat_copy_transpose' (Fortran 2003 interfaces) - "

  call hipCheck(hipMalloc(d_X, int(m*n, c_size_t) * 8))
  call hipCheck(hipMalloc(d_Y, int(m*n, c_size_t) * 8))
  call hipCheck(hipMalloc(d_Z, int(m*n, c_size_t) * 8))
  call hipCheck(hipMemcpy(d_X, c_loc(h_X(1,1)), int(m*n, c_size_t) * 8, hipMemcpyHostToDevice))
  call hipCheck(hipMalloc(d_two, 8_c_size_t))
  call hipCheck(hipMalloc(d_minus_one, 8_c_size_t))
  call hipCheck(hipMemcpy(d_two, c_loc(two), 8_c_size_t, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(d_minus_one, c_loc(minus_one), 8_c_size_t, hipMemcpyHostToDevice))

  call rocsparseCheck(rocsparse_create_handle(handle))
  call rocsparseCheck(rocsparse_create_dnmat_descr(matX, m, n, m, d_X, &
                          rocsparse_datatype_f64_r, rocsparse_order_column))
  ! Two views of the same Y buffer: column-major (ld = m) and row-major (ld = n)
  call rocsparseCheck(rocsparse_create_dnmat_descr(matYcol, m, n, m, d_Y, &
                          rocsparse_datatype_f64_r, rocsparse_order_column))
  call rocsparseCheck(rocsparse_create_dnmat_descr(matYrow, m, n, n, d_Y, &
                          rocsparse_datatype_f64_r, rocsparse_order_row))
  call rocsparseCheck(rocsparse_create_dnmat_descr(matZ, n, m, n, d_Z, &
                          rocsparse_datatype_f64_r, rocsparse_order_column))
  call rocsparseCheck(rocsparse_create_dnvec_descr(alpha_two, 1_c_int64_t, d_two, rocsparse_datatype_f64_r))
  call rocsparseCheck(rocsparse_create_dnvec_descr(alpha_minus_one, 1_c_int64_t, d_minus_one, &
                          rocsparse_datatype_f64_r))

  ! Y = X, no alpha
  call hipCheck(hipMemset(d_Y, 0, int(m*n, c_size_t) * 8))
  call rocsparseCheck(rocsparse_dnmat_copy_data(handle, c_null_ptr, matX, matYcol))
  call hipCheck(hipMemcpy(c_loc(h_Y(1)), d_Y, int(m*n, c_size_t) * 8, hipMemcpyDeviceToHost))
  do j = 1, int(n)
     do i = 1, int(m)
        if (h_Y(i + (j-1)*m) /= h_X(i,j)) then
           write(*,*) "FAILED! copy_data Y(", i, ",", j, ") = ", h_Y(i + (j-1)*m), " expected ", h_X(i,j)
           call exit(1)
        end if
     end do
  end do

  ! Y = 2 * X, stored row-major
  call hipCheck(hipMemset(d_Y, 0, int(m*n, c_size_t) * 8))
  call rocsparseCheck(rocsparse_dnmat_copy_data(handle, alpha_two, matX, matYrow))
  call hipCheck(hipMemcpy(c_loc(h_Y(1)), d_Y, int(m*n, c_size_t) * 8, hipMemcpyDeviceToHost))
  do j = 1, int(n)
     do i = 1, int(m)
        if (h_Y(j + (i-1)*n) /= 2 * h_X(i,j)) then
           write(*,*) "FAILED! copy_data row-major Y(", i, ",", j, ") = ", h_Y(j + (i-1)*n), &
                " expected ", 2 * h_X(i,j)
           call exit(1)
        end if
     end do
  end do

  ! Z = -X^T
  call hipCheck(hipMemset(d_Z, 0, int(m*n, c_size_t) * 8))
  call rocsparseCheck(rocsparse_dnmat_transpose(handle, alpha_minus_one, matX, matZ))
  call hipCheck(hipMemcpy(c_loc(h_Z(1,1)), d_Z, int(m*n, c_size_t) * 8, hipMemcpyDeviceToHost))
  do j = 1, int(m)
     do i = 1, int(n)
        if (h_Z(i,j) /= -h_X(j,i)) then
           write(*,*) "FAILED! transpose Z(", i, ",", j, ") = ", h_Z(i,j), " expected ", -h_X(j,i)
           call exit(1)
        end if
     end do
  end do

  call rocsparseCheck(rocsparse_destroy_dnmat_descr(matX))
  call rocsparseCheck(rocsparse_destroy_dnmat_descr(matYcol))
  call rocsparseCheck(rocsparse_destroy_dnmat_descr(matYrow))
  call rocsparseCheck(rocsparse_destroy_dnmat_descr(matZ))
  call rocsparseCheck(rocsparse_destroy_dnvec_descr(alpha_two))
  call rocsparseCheck(rocsparse_destroy_dnvec_descr(alpha_minus_one))
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(d_X))
  call hipCheck(hipFree(d_Y))
  call hipCheck(hipFree(d_Z))
  call hipCheck(hipFree(d_two))
  call hipCheck(hipFree(d_minus_one))

  write(*,*) "PASSED!"

end program dnmat_copy_transpose
