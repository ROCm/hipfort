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
! rocsparse dcsrilu0_numeric_boost with optional boost_tol and boost_val
! (Fortran 2003 interfaces)
! see: https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/
!
! Binding behaviour checked: boost_tol and boost_val of
! rocsparse_dcsrilu0_numeric_boost are only read when enable_boost is set, so
! the typed form takes them as optional real(c_double) and passes NULL when
! they are absent. rocSPARSE keeps the two pointers in the info object and
! reads them (host pointer mode) during rocsparse_dcsrilu0, so when present
! they are target variables that outlive the factorization.
!
! 1. Boost off, both absent, on the tridiagonal matrix
!      A = [ 4 1 0 ; 1 4 1 ; 0 1 4 ]
!    whose ILU(0) is its exact LU (no fill-in).
! 2. Boost on, boost_tol = 1e-8 and boost_val = 2 present, on
!      A = [ 0 1 0 ; 1 4 1 ; 0 1 4 ]
!    whose first pivot is zero: it is replaced by 2, so the factors are
!      U = [ 2 1 0 ; . 7/2 1 ; . . 4-2/7 ],  L21 = 1/2,  L32 = 2/7,
!    which shows the library read both values through the pointers.
! In both cases the in-place factors are checked against the host values.
!!!!!!!!!!!!!!
!
program rocsparse_dcsrilu0_numeric_boost_opt
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse
  implicit none
  integer(c_int), parameter :: m = 3, nnz = 7
  integer(c_int), target :: hRowPtr(m+1) = (/0, 2, 5, 7/)
  integer(c_int), target :: hColInd(nnz) = (/0, 1, 0, 1, 2, 1, 2/)
  real(c_double) :: hVal(nnz), hExp(nnz)
  real(c_double), target :: boost_tol = 1.0d-8, boost_val = 2.0d0
  type(c_ptr) :: handle = c_null_ptr
  write(*,"(a)",advance="no") "-- Running test 'rocsparse_dcsrilu0_numeric_boost_opt' (Fortran 2003 interfaces) - "

  call rocsparseCheck(rocsparse_create_handle(handle))

  ! 1. Boost off, boost_tol and boost_val absent.
  hVal = (/4.0d0, 1.0d0, 1.0d0, 4.0d0, 1.0d0, 1.0d0, 4.0d0/)
  hExp(1) = 4.0d0
  hExp(2) = 1.0d0
  hExp(3) = 1.0d0/4.0d0
  hExp(4) = 4.0d0 - hExp(3)
  hExp(5) = 1.0d0
  hExp(6) = 1.0d0/hExp(4)
  hExp(7) = 4.0d0 - hExp(6)
  call check_ilu0(.false., "boost off")

  ! 2. Boost on, boost_tol and boost_val present.
  hVal = (/0.0d0, 1.0d0, 1.0d0, 4.0d0, 1.0d0, 1.0d0, 4.0d0/)
  hExp(1) = boost_val
  hExp(2) = 1.0d0
  hExp(3) = 1.0d0/boost_val
  hExp(4) = 4.0d0 - hExp(3)
  hExp(5) = 1.0d0
  hExp(6) = 1.0d0/hExp(4)
  hExp(7) = 4.0d0 - hExp(6)
  call check_ilu0(.true., "boost on")

  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"

contains

  ! Factor hVal in place on the GPU and compare with hExp.
  subroutine check_ilu0(boost, label)
    logical, intent(in) :: boost
    character(*), intent(in) :: label
    real(c_double), target :: hIn(nnz), hOut(nnz)
    type(c_ptr) :: descr, info
    type(c_ptr) :: dRowPtr, dColInd, dVal, dBuf
    integer(c_size_t) :: bufSize
    integer :: i

    hIn = hVal
    call hipCheck(hipMalloc(dRowPtr, int(m+1,c_size_t) * 4))
    call hipCheck(hipMalloc(dColInd, int(nnz,c_size_t) * 4))
    call hipCheck(hipMalloc(dVal,    int(nnz,c_size_t) * 8))
    call hipCheck(hipMemcpy(dRowPtr, c_loc(hRowPtr(1)), int(m+1,c_size_t) * 4, hipMemcpyHostToDevice))
    call hipCheck(hipMemcpy(dColInd, c_loc(hColInd(1)), int(nnz,c_size_t) * 4, hipMemcpyHostToDevice))
    call hipCheck(hipMemcpy(dVal,    c_loc(hIn(1)),     int(nnz,c_size_t) * 8, hipMemcpyHostToDevice))

    call rocsparseCheck(rocsparse_create_mat_descr(descr))
    call rocsparseCheck(rocsparse_create_mat_info(info))
    call rocsparseCheck(rocsparse_dcsrilu0_buffer_size(handle, m, nnz, descr, dVal, dRowPtr, &
         dColInd, info, bufSize))
    call hipCheck(hipMalloc(dBuf, max(bufSize, 1_c_size_t)))
    call rocsparseCheck(rocsparse_dcsrilu0_analysis(handle, m, nnz, descr, dVal, dRowPtr, dColInd, &
         info, rocsparse_analysis_policy_reuse, rocsparse_solve_policy_auto, dBuf))
    if (boost) then
       call rocsparseCheck(rocsparse_dcsrilu0_numeric_boost(handle, info, 1, boost_tol, boost_val))
    else
       call rocsparseCheck(rocsparse_dcsrilu0_numeric_boost(handle, info, 0))
    end if
    call rocsparseCheck(rocsparse_dcsrilu0(handle, m, nnz, descr, dVal, dRowPtr, dColInd, &
         info, rocsparse_solve_policy_auto, dBuf))
    call hipCheck(hipDeviceSynchronize())
    call hipCheck(hipMemcpy(c_loc(hOut(1)), dVal, int(nnz,c_size_t) * 8, hipMemcpyDeviceToHost))

    do i = 1, nnz
       if (abs(hOut(i) - hExp(i)) > 1.0d-12 * max(abs(hExp(i)), 1.0d0)) then
          write(*,*) "FAILED! ", label, ": val(", i, ") = ", hOut(i), " expected ", hExp(i)
          call exit(1)
       end if
    end do

    call rocsparseCheck(rocsparse_destroy_mat_info(info))
    call rocsparseCheck(rocsparse_destroy_mat_descr(descr))
    call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd)); call hipCheck(hipFree(dVal))
    call hipCheck(hipFree(dBuf))
  end subroutine check_ilu0

end program rocsparse_dcsrilu0_numeric_boost_opt
