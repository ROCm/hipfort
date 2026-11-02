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
! hipsparse Dcsrilu02_numericBoost with its optional tol and boost_val
! (Fortran 2003 interfaces)
! see: https://rocm.docs.amd.com/projects/hipSPARSE/en/latest/
!
! Binding behaviour checked: tol and boost_val of the typed form of
! hipsparseDcsrilu02_numericBoost are optional host reals; an absent one is
! passed as NULL, which the library accepts when enable_boost = 0. When present
! they are passed by address and the library keeps the pointers (it reads the
! values in host pointer mode during csrilu02), so they are TARGET variables of
! the main program that outlive the factorization.
!
! A is the 5x5 tridiagonal matrix tridiag(-1, 4, -1). It has no fill-in, so its
! ILU(0) equals its LU, computed on the host for comparison:
! - enable_boost = 0, tol and boost_val absent: the plain LU;
! - enable_boost = 1, tol = 10, boost_val = 8: every pivot (all in (3, 4]) is
!   <= tol, so each is replaced by boost_val (with the pivot's sign) before
!   the rows below use it.
!
! f2003 style: device buffers are type(c_ptr) allocated by byte count; host data
! is moved with hipMemcpy + c_loc.
!!!!!!!!!!!!!!
!
program hipsparse_dcsrilu02_boost_optional
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsparse
  implicit none
  integer(c_int), parameter :: m = 5, nnz = 13
  integer(c_int), target :: hRowPtr(m+1) = (/0, 2, 5, 8, 11, 13/)
  integer(c_int), target :: hColInd(nnz) = (/0, 1,  0, 1, 2,  1, 2, 3,  2, 3, 4,  3, 4/)
  real(c_double), target :: hVal(nnz) = (/4.0d0, -1.0d0,  -1.0d0, 4.0d0, -1.0d0, &
                                          -1.0d0, 4.0d0, -1.0d0,  -1.0d0, 4.0d0, -1.0d0, &
                                          -1.0d0, 4.0d0/)
  ! Kept alive until the boosted csrilu02 is done: the library holds their addresses.
  real(c_double), target :: tol = 10.0d0, boost_val = 8.0d0
  type(c_ptr) :: handle = c_null_ptr, descrA = c_null_ptr
  type(c_ptr) :: dRowPtr, dColInd, dVal
  write(*,"(a)",advance="no") "-- Running test 'hipsparse_dcsrilu02_boost_optional' (Fortran 2003 interfaces) - "

  call hipCheck(hipMalloc(dRowPtr, int(m+1,c_size_t) * 4))
  call hipCheck(hipMalloc(dColInd, int(nnz,c_size_t) * 4))
  call hipCheck(hipMalloc(dVal,    int(nnz,c_size_t) * 8))
  call hipCheck(hipMemcpy(dRowPtr, c_loc(hRowPtr(1)), int(m+1,c_size_t) * 4, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dColInd, c_loc(hColInd(1)), int(nnz,c_size_t) * 4, hipMemcpyHostToDevice))

  call hipsparseCheck(hipsparseCreate(handle))
  call hipsparseCheck(hipsparseCreateMatDescr(descrA))
  call hipsparseCheck(hipsparseSetMatType(descrA, HIPSPARSE_MATRIX_TYPE_GENERAL))
  call hipsparseCheck(hipsparseSetMatIndexBase(descrA, HIPSPARSE_INDEX_BASE_ZERO))

  call factorize_and_check(.false.)
  call factorize_and_check(.true.)

  call hipsparseCheck(hipsparseDestroyMatDescr(descrA))
  call hipsparseCheck(hipsparseDestroy(handle))
  call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd)); call hipCheck(hipFree(dVal))
  call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"

contains

  ! ILU(0) of A on the GPU, without boost (tol and boost_val absent) or with it,
  ! compared with the host LU of the tridiagonal matrix.
  subroutine factorize_and_check(boost)
    logical, intent(in) :: boost
    type(c_ptr) :: info, dBuf
    integer(c_int) :: bufSize, pivot, i, k
    real(c_double), target :: hOut(nnz)
    real(c_double) :: hExp(nnz), d(m), l(m)

    ! Host LU: d(k) the pivots, l(k) the multipliers of the subdiagonal.
    d(1) = 4.0d0
    if (boost .and. abs(d(1)) <= tol) d(1) = sign(abs(boost_val), d(1))
    l(1) = 0.0d0
    do k = 2, m
       l(k) = -1.0d0 / d(k-1)
       d(k) = 4.0d0 - l(k) * (-1.0d0)
       if (boost .and. abs(d(k)) <= tol) d(k) = sign(abs(boost_val), d(k))
    end do
    ! In CSR order: row 1 is (d, -1), rows 2..m-1 (l, d, -1), row m (l, d).
    i = 0
    do k = 1, m
       if (k > 1) then
          i = i + 1; hExp(i) = l(k)
       end if
       i = i + 1; hExp(i) = d(k)
       if (k < m) then
          i = i + 1; hExp(i) = -1.0d0
       end if
    end do

    call hipCheck(hipMemcpy(dVal, c_loc(hVal(1)), int(nnz,c_size_t) * 8, hipMemcpyHostToDevice))
    call hipsparseCheck(hipsparseCreateCsrilu02Info(info))
    call hipsparseCheck(hipsparseDcsrilu02_bufferSize(handle, m, nnz, descrA, dVal, dRowPtr, &
         dColInd, info, bufSize))
    call hipCheck(hipMalloc(dBuf, int(max(bufSize,1),c_size_t)))
    call hipsparseCheck(hipsparseDcsrilu02_analysis(handle, m, nnz, descrA, dVal, dRowPtr, &
         dColInd, info, HIPSPARSE_SOLVE_POLICY_NO_LEVEL, dBuf))
    if (boost) then
       call hipsparseCheck(hipsparseDcsrilu02_numericBoost(handle, info, 1, tol, boost_val))
    else
       call hipsparseCheck(hipsparseDcsrilu02_numericBoost(handle, info, 0))
    end if
    call hipsparseCheck(hipsparseDcsrilu02(handle, m, nnz, descrA, dVal, dRowPtr, dColInd, &
         info, HIPSPARSE_SOLVE_POLICY_NO_LEVEL, dBuf))
    call hipCheck(hipDeviceSynchronize())
    pivot = -2
    call hipsparseCheck(hipsparseXcsrilu02_zeroPivot(handle, info, pivot))
    if (pivot /= -1) then
       write(*,*) "FAILED! boost = ", boost, ": zero pivot at ", pivot, " (expected -1)"; call exit(1)
    end if
    call hipCheck(hipMemcpy(c_loc(hOut(1)), dVal, int(nnz,c_size_t) * 8, hipMemcpyDeviceToHost))

    do i = 1, nnz
       if (abs(hOut(i) - hExp(i)) > 1.0d-12) then
          write(*,*) "FAILED! boost = ", boost, ": val(", i, ") = ", hOut(i), " expected ", hExp(i)
          call exit(1)
       end if
    end do
    call hipsparseCheck(hipsparseDestroyCsrilu02Info(info))
    call hipCheck(hipFree(dBuf))
  end subroutine factorize_and_check

end program hipsparse_dcsrilu02_boost_optional
