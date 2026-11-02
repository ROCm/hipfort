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
! hipsparse size queries taking a single scalar (Fortran 2008 interfaces)
! see: https://rocm.docs.amd.com/projects/hipSPARSE/en/latest/
!
! Binding behaviour checked: the alpha of hipsparseScsrsm2_bufferSizeExt and
! the threshold of hipsparseSpruneDense2csr_bufferSize are single values (they
! used to be one-element arrays). Through the generic name both resolve to
! their _rank_1 form with a real scalar, device arrays and a host
! integer(c_size_t) size. Each size is then used for the real computation:
!
!   1. csrsm2: solve L*X = alpha*B for two right-hand sides, with
!        L = [ 2 0 0 ]   X = [ 1 4 ]   alpha = 2
!            [ 1 2 0 ]       [ 2 5 ]   B = L*X / alpha
!            [ 3 1 2 ]       [ 3 6 ]
!   2. prune: drop the entries |a| <= threshold = 1.5 of the 3x3 dense matrix
!        A = [ 1  4  0 ]
!            [ 2  1 -3 ]   -> CSR of [ . 4 . ; 2 . -3 ; . 5 2 ], nnz = 5
!            [ 0  5  2 ]
!      with pruneDense2csrNnz (host nnz) and pruneDense2csr. rocSPARSE needs no
!      workspace here and reports 0 bytes (the C API does the same), so the
!      size is checked to have been written (sentinel -1) rather than to be > 0.
!!!!!!!!!!!!!!
!
program hipsparse_size_query_scalars
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsparse
  implicit none
  integer :: i
  ! csrsm2 data
  integer(c_int), parameter :: m = 3, nrhs = 2, nnzL = 6
  integer(c_int) :: hRowPtr(m+1) = (/0, 1, 3, 6/)
  integer(c_int) :: hColInd(nnzL) = (/0, 0, 1, 0, 1, 2/)
  real(c_float)  :: hValL(nnzL) = (/2.0, 1.0, 2.0, 3.0, 1.0, 2.0/)
  real(c_float)  :: hX(m*nrhs) = (/1.0, 2.0, 3.0, 4.0, 5.0, 6.0/)
  real(c_float)  :: hB(m*nrhs)
  real(c_float)  :: alpha = 2.0
  ! prune data (column-major)
  integer(c_int), parameter :: pm = 3, pn = 3
  real(c_float)  :: hA(pm*pn) = (/1.0, 2.0, 0.0,  4.0, 1.0, 5.0,  0.0, -3.0, 2.0/)
  real(c_float)  :: threshold = 1.5
  integer(c_int) :: expRowPtr(pm+1) = (/0, 1, 3, 5/)
  integer(c_int) :: expColInd(5) = (/1, 0, 2, 1, 2/)
  real(c_float)  :: expCsrVal(5) = (/4.0, 2.0, -3.0, 5.0, 2.0/)
  integer(c_int) :: hPRowPtr(pm+1), hPColInd(pm*pn), nnzP
  real(c_float)  :: hPVal(pm*pn)
  type(c_ptr) :: handle = c_null_ptr, descrL = c_null_ptr, descrP = c_null_ptr
  type(c_ptr) :: info = c_null_ptr, dBuf = c_null_ptr, dPBuf = c_null_ptr
  real(c_float), pointer :: dValL(:), dB(:), dA(:), dPVal(:)
  integer(c_int), pointer :: dRowPtr(:), dColInd(:), dPRowPtr(:), dPColInd(:)
  integer(c_size_t) :: bufSize, pBufSize
  write(*,"(a)",advance="no") "-- Running test 'hipsparse_size_query_scalars' (Fortran 2008 interfaces) - "

  call hipsparseCheck(hipsparseCreate(handle))

  ! ---- 1. csrsm2 ----
  hB(1) = hValL(1)*hX(1)
  hB(2) = hValL(2)*hX(1) + hValL(3)*hX(2)
  hB(3) = hValL(4)*hX(1) + hValL(5)*hX(2) + hValL(6)*hX(3)
  hB(4) = hValL(1)*hX(4)
  hB(5) = hValL(2)*hX(4) + hValL(3)*hX(5)
  hB(6) = hValL(4)*hX(4) + hValL(5)*hX(5) + hValL(6)*hX(6)
  hB = hB / alpha
  call hipCheck(hipMalloc(dValL,   source=hValL))
  call hipCheck(hipMalloc(dRowPtr, source=hRowPtr))
  call hipCheck(hipMalloc(dColInd, source=hColInd))
  call hipCheck(hipMalloc(dB,      source=hB))
  call hipsparseCheck(hipsparseCreateMatDescr(descrL))
  call hipsparseCheck(hipsparseSetMatFillMode(descrL, HIPSPARSE_FILL_MODE_LOWER))
  call hipsparseCheck(hipsparseSetMatDiagType(descrL, HIPSPARSE_DIAG_TYPE_NON_UNIT))
  call hipsparseCheck(hipsparseCreateCsrsm2Info(info))

  bufSize = -1
  call hipsparseCheck(hipsparseScsrsm2_bufferSizeExt(handle, 0, HIPSPARSE_OPERATION_NON_TRANSPOSE, &
       HIPSPARSE_OPERATION_NON_TRANSPOSE, m, nrhs, nnzL, alpha, descrL, dValL, dRowPtr, dColInd, &
       dB, m, info, HIPSPARSE_SOLVE_POLICY_NO_LEVEL, bufSize))
  if (bufSize <= 0) then
     write(*,*) "FAILED! csrsm2 buffer size = ", bufSize, " (expected > 0)"; call exit(1)
  end if
  call hipCheck(hipMalloc(dBuf, bufSize))
  call hipsparseCheck(hipsparseScsrsm2_analysis(handle, 0, HIPSPARSE_OPERATION_NON_TRANSPOSE, &
       HIPSPARSE_OPERATION_NON_TRANSPOSE, m, nrhs, nnzL, alpha, descrL, dValL, dRowPtr, dColInd, &
       dB, m, info, HIPSPARSE_SOLVE_POLICY_NO_LEVEL, dBuf))
  call hipsparseCheck(hipsparseScsrsm2_solve(handle, 0, HIPSPARSE_OPERATION_NON_TRANSPOSE, &
       HIPSPARSE_OPERATION_NON_TRANSPOSE, m, nrhs, nnzL, alpha, descrL, dValL, dRowPtr, dColInd, &
       dB, m, info, HIPSPARSE_SOLVE_POLICY_NO_LEVEL, dBuf))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hB, dB, hipMemcpyDeviceToHost))
  do i = 1, m*nrhs
     if (abs(hB(i) - hX(i)) > 1.0e-5) then
        write(*,*) "FAILED! csrsm2 X(", i, ") = ", hB(i), " expected ", hX(i); call exit(1)
     end if
  end do

  ! ---- 2. pruneDense2csr ----
  call hipCheck(hipMalloc(dA,       source=hA))
  call hipCheck(hipMalloc(dPRowPtr, mold=hPRowPtr))
  call hipCheck(hipMalloc(dPColInd, mold=hPColInd))   ! capacity m*n, enough for any nnz
  call hipCheck(hipMalloc(dPVal,    mold=hPVal))
  call hipsparseCheck(hipsparseCreateMatDescr(descrP))

  pBufSize = -1
  call hipsparseCheck(hipsparseSpruneDense2csr_bufferSize(handle, pm, pn, dA, pm, threshold, &
       descrP, dPVal, dPRowPtr, dPColInd, pBufSize))
  if (pBufSize < 0) then
     write(*,*) "FAILED! prune buffer size not written: ", pBufSize; call exit(1)
  end if
  call hipCheck(hipMalloc(dPBuf, max(pBufSize, 1_c_size_t)))
  nnzP = -1
  call hipsparseCheck(hipsparseSpruneDense2csrNnz(handle, pm, pn, dA, pm, threshold, descrP, &
       dPRowPtr, nnzP, dPBuf))
  if (nnzP /= 5) then
     write(*,*) "FAILED! pruneDense2csrNnz nnz = ", nnzP, " expected 5"; call exit(1)
  end if
  call hipsparseCheck(hipsparseSpruneDense2csr(handle, pm, pn, dA, pm, threshold, descrP, &
       dPVal, dPRowPtr, dPColInd, dPBuf))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hPRowPtr, dPRowPtr, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hPColInd, dPColInd, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hPVal,    dPVal,    hipMemcpyDeviceToHost))
  if (any(hPRowPtr /= expRowPtr) .or. any(hPColInd(1:5) /= expColInd) .or. &
      any(hPVal(1:5) /= expCsrVal)) then
     write(*,*) "FAILED! pruned CSR row_ptr=", hPRowPtr, " col_ind=", hPColInd(1:5), &
                " val=", hPVal(1:5); call exit(1)
  end if

  call hipsparseCheck(hipsparseDestroyCsrsm2Info(info))
  call hipsparseCheck(hipsparseDestroyMatDescr(descrL))
  call hipsparseCheck(hipsparseDestroyMatDescr(descrP))
  call hipsparseCheck(hipsparseDestroy(handle))
  call hipCheck(hipFree(dValL)); call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd))
  call hipCheck(hipFree(dB)); call hipCheck(hipFree(dBuf))
  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dPRowPtr)); call hipCheck(hipFree(dPColInd))
  call hipCheck(hipFree(dPVal)); call hipCheck(hipFree(dPBuf))
  call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program hipsparse_size_query_scalars
