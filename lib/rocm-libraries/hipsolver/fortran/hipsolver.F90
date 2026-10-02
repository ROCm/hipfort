!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (C) 2020-2026 Advanced Micro Devices, Inc. All rights reserved.
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

module hipsolver
  use, intrinsic :: iso_c_binding
  implicit none

  ! hipsolverStatus_t
  enum, bind(c)
    enumerator :: HIPSOLVER_STATUS_SUCCESS = 0
    enumerator :: HIPSOLVER_STATUS_NOT_INITIALIZED = 1
    enumerator :: HIPSOLVER_STATUS_ALLOC_FAILED = 2
    enumerator :: HIPSOLVER_STATUS_INVALID_VALUE = 3
    enumerator :: HIPSOLVER_STATUS_MAPPING_ERROR = 4
    enumerator :: HIPSOLVER_STATUS_EXECUTION_FAILED = 5
    enumerator :: HIPSOLVER_STATUS_INTERNAL_ERROR = 6
    enumerator :: HIPSOLVER_STATUS_NOT_SUPPORTED = 7
    enumerator :: HIPSOLVER_STATUS_ARCH_MISMATCH = 8
    enumerator :: HIPSOLVER_STATUS_HANDLE_IS_NULLPTR = 9
    enumerator :: HIPSOLVER_STATUS_INVALID_ENUM = 10
    enumerator :: HIPSOLVER_STATUS_UNKNOWN = 11
    enumerator :: HIPSOLVER_STATUS_ZERO_PIVOT = 12
    enumerator :: HIPSOLVER_STATUS_MATRIX_TYPE_NOT_SUPPORTED = 13
  end enum

  ! hipblasOperation_t
  enum, bind(c)
    enumerator :: HIPSOLVER_OP_N = 111
    enumerator :: HIPSOLVER_OP_T = 112
    enumerator :: HIPSOLVER_OP_C = 113
  end enum

  ! hipblasFillMode_t
  enum, bind(c)
    enumerator :: HIPSOLVER_FILL_MODE_UPPER = 121
    enumerator :: HIPSOLVER_FILL_MODE_LOWER = 122
    enumerator :: HIPSOLVER_FILL_MODE_FULL = 123
  end enum

  ! hipblasDiagType_t
  enum, bind(c)
    enumerator :: HIPSOLVER_DIAG_NON_UNIT = 131
    enumerator :: HIPSOLVER_DIAG_UNIT = 132
  end enum

  ! hipblasSideMode_t
  enum, bind(c)
    enumerator :: HIPSOLVER_SIDE_LEFT = 141
    enumerator :: HIPSOLVER_SIDE_RIGHT = 142
    enumerator :: HIPSOLVER_SIDE_BOTH = 143
  end enum

  ! hipsolverEigMode_t
  enum, bind(c)
    enumerator :: HIPSOLVER_EIG_MODE_NOVECTOR = 201
    enumerator :: HIPSOLVER_EIG_MODE_VECTOR = 202
  end enum

  ! hipsolverEigType_t
  enum, bind(c)
    enumerator :: HIPSOLVER_EIG_TYPE_1 = 211
    enumerator :: HIPSOLVER_EIG_TYPE_2 = 212
    enumerator :: HIPSOLVER_EIG_TYPE_3 = 213
  end enum

  ! hipsolverEigRange_t
  enum, bind(c)
    enumerator :: HIPSOLVER_EIG_RANGE_ALL = 221
    enumerator :: HIPSOLVER_EIG_RANGE_V = 222
    enumerator :: HIPSOLVER_EIG_RANGE_I = 223
  end enum

  ! hipsolverDeterministicMode_t
  enum, bind(c)
    enumerator :: HIPSOLVER_DETERMINISTIC_RESULTS = 241
    enumerator :: HIPSOLVER_ALLOW_NON_DETERMINISTIC_RESULTS = 242
  end enum

  ! hipsolverDirectMode_t
  enum, bind(c)
    enumerator :: HIPSOLVER_DIRECT_FORWARD = 251
    enumerator :: HIPSOLVER_DIRECT_BACKWARD = 252
  end enum

  ! hipsolverStorevMode_t
  enum, bind(c)
    enumerator :: HIPSOLVER_STOREV_COLUMNWISE = 261
    enumerator :: HIPSOLVER_STOREV_ROWWISE = 262
  end enum

  ! hipsolverAlgMode_t
  enum, bind(c)
    enumerator :: HIPSOLVER_ALG_0 = 231
    enumerator :: HIPSOLVER_ALG_1 = 232
  end enum

  ! hipsolverDnFunction_t
  enum, bind(c)
    enumerator :: HIPSOLVERDN_GETRF = 0
  end enum

  ! hipsolverRfFactorization_t
  enum, bind(c)
    enumerator :: HIPSOLVERRF_FACTORIZATION_ALG0 = 0
    enumerator :: HIPSOLVERRF_FACTORIZATION_ALG1 = 1
    enumerator :: HIPSOLVERRF_FACTORIZATION_ALG2 = 2
  end enum

  ! hipsolverRfMatrixFormat_t
  enum, bind(c)
    enumerator :: HIPSOLVERRF_MATRIX_FORMAT_CSR = 0
    enumerator :: HIPSOLVERRF_MATRIX_FORMAT_CSC = 1
  end enum

  ! hipsolverRfNumericBoostReport_t
  enum, bind(c)
    enumerator :: HIPSOLVERRF_NUMERIC_BOOST_NOT_USED = 0
    enumerator :: HIPSOLVERRF_NUMERIC_BOOST_USED = 1
  end enum

  ! hipsolverRfResetValuesFastMode_t
  enum, bind(c)
    enumerator :: HIPSOLVERRF_RESET_VALUES_FAST_MODE_OFF = 0
    enumerator :: HIPSOLVERRF_RESET_VALUES_FAST_MODE_ON = 1
  end enum

  ! hipsolverRfTriangularSolve_t
  enum, bind(c)
    enumerator :: HIPSOLVERRF_TRIANGULAR_SOLVE_ALG1 = 1
    enumerator :: HIPSOLVERRF_TRIANGULAR_SOLVE_ALG2 = 2
    enumerator :: HIPSOLVERRF_TRIANGULAR_SOLVE_ALG3 = 3
  end enum

  ! hipsolverRfUnitDiagonal_t
  enum, bind(c)
    enumerator :: HIPSOLVERRF_UNIT_DIAGONAL_STORED_L = 0
    enumerator :: HIPSOLVERRF_UNIT_DIAGONAL_STORED_U = 1
    enumerator :: HIPSOLVERRF_UNIT_DIAGONAL_ASSUMED_L = 2
    enumerator :: HIPSOLVERRF_UNIT_DIAGONAL_ASSUMED_U = 3
  end enum

  integer(c_int), parameter :: hipsolverVersionMajor = 3
  integer(c_int), parameter :: hipsolverVersionMinor = 8
  integer(c_int), parameter :: hipsolverVersionPatch = 0


  interface

    !---------------------------------------------
    ! hipsolverCreate
    !---------------------------------------------
    function hipsolverCreate(handle) &
       result(Create) &
       bind(C, name="hipsolverCreate")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr) :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Create
    end function hipsolverCreate

    !---------------------------------------------
    ! hipsolverDestroy
    !---------------------------------------------
    function hipsolverDestroy(handle) &
       result(Destroy) &
       bind(C, name="hipsolverDestroy")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Destroy
    end function hipsolverDestroy

    !---------------------------------------------
    ! hipsolverSetStream
    !---------------------------------------------
    function hipsolverSetStream(handle, streamId) &
       result(SetStream) &
       bind(C, name="hipsolverSetStream")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: streamId
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SetStream
    end function hipsolverSetStream

    !---------------------------------------------
    ! hipsolverGetStream
    !---------------------------------------------
    function hipsolverGetStream(handle, streamId) &
       result(GetStream) &
       bind(C, name="hipsolverGetStream")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr) :: streamId
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: GetStream
    end function hipsolverGetStream

    !---------------------------------------------
    ! hipsolverSetDeterministicMode
    !---------------------------------------------
    function hipsolverSetDeterministicMode(handle, mode) &
       result(SetDeterministicMode) &
       bind(C, name="hipsolverSetDeterministicMode")
       import :: c_ptr, HIPSOLVER_DETERMINISTIC_RESULTS, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_DETERMINISTIC_RESULTS)), value :: mode
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SetDeterministicMode
    end function hipsolverSetDeterministicMode

    !---------------------------------------------
    ! hipsolverGetDeterministicMode
    !---------------------------------------------
    function hipsolverGetDeterministicMode(handle, mode) &
       result(GetDeterministicMode) &
       bind(C, name="hipsolverGetDeterministicMode")
       import :: c_ptr, HIPSOLVER_DETERMINISTIC_RESULTS, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_DETERMINISTIC_RESULTS)) :: mode
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: GetDeterministicMode
    end function hipsolverGetDeterministicMode

    !---------------------------------------------
    ! hipsolverCreateGesvdjInfo
    !---------------------------------------------
    function hipsolverCreateGesvdjInfo(myInfo) &
       result(CreateGesvdjInfo) &
       bind(C, name="hipsolverCreateGesvdjInfo")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr) :: myInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CreateGesvdjInfo
    end function hipsolverCreateGesvdjInfo

    !---------------------------------------------
    ! hipsolverDestroyGesvdjInfo
    !---------------------------------------------
    function hipsolverDestroyGesvdjInfo(myInfo) &
       result(DestroyGesvdjInfo) &
       bind(C, name="hipsolverDestroyGesvdjInfo")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DestroyGesvdjInfo
    end function hipsolverDestroyGesvdjInfo

    !---------------------------------------------
    ! hipsolverXgesvdjSetMaxSweeps
    !---------------------------------------------
    function hipsolverXgesvdjSetMaxSweeps(myInfo, max_sweeps) &
       result(XgesvdjSetMaxSweeps) &
       bind(C, name="hipsolverXgesvdjSetMaxSweeps")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(c_int), value :: max_sweeps
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: XgesvdjSetMaxSweeps
    end function hipsolverXgesvdjSetMaxSweeps

    !---------------------------------------------
    ! hipsolverXgesvdjSetSortEig
    !---------------------------------------------
    function hipsolverXgesvdjSetSortEig(myInfo, sort_eig) &
       result(XgesvdjSetSortEig) &
       bind(C, name="hipsolverXgesvdjSetSortEig")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(c_int), value :: sort_eig
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: XgesvdjSetSortEig
    end function hipsolverXgesvdjSetSortEig

    !---------------------------------------------
    ! hipsolverXgesvdjSetTolerance
    !---------------------------------------------
    function hipsolverXgesvdjSetTolerance(myInfo, tolerance) &
       result(XgesvdjSetTolerance) &
       bind(C, name="hipsolverXgesvdjSetTolerance")
       import :: c_ptr, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       real(c_double), value :: tolerance
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: XgesvdjSetTolerance
    end function hipsolverXgesvdjSetTolerance

    !---------------------------------------------
    ! hipsolverXgesvdjGetResidual
    !---------------------------------------------
    function hipsolverXgesvdjGetResidual(handle, myInfo, residual) &
       result(XgesvdjGetResidual) &
       bind(C, name="hipsolverXgesvdjGetResidual")
       import :: c_ptr, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: myInfo
       real(c_double) :: residual
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: XgesvdjGetResidual
    end function hipsolverXgesvdjGetResidual

    !---------------------------------------------
    ! hipsolverXgesvdjGetSweeps
    !---------------------------------------------
    function hipsolverXgesvdjGetSweeps(handle, myInfo, executed_sweeps) &
       result(XgesvdjGetSweeps) &
       bind(C, name="hipsolverXgesvdjGetSweeps")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: myInfo
       integer(c_int) :: executed_sweeps
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: XgesvdjGetSweeps
    end function hipsolverXgesvdjGetSweeps

    !---------------------------------------------
    ! hipsolverCreateSyevjInfo
    !---------------------------------------------
    function hipsolverCreateSyevjInfo(myInfo) &
       result(CreateSyevjInfo) &
       bind(C, name="hipsolverCreateSyevjInfo")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr) :: myInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CreateSyevjInfo
    end function hipsolverCreateSyevjInfo

    !---------------------------------------------
    ! hipsolverDestroySyevjInfo
    !---------------------------------------------
    function hipsolverDestroySyevjInfo(myInfo) &
       result(DestroySyevjInfo) &
       bind(C, name="hipsolverDestroySyevjInfo")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DestroySyevjInfo
    end function hipsolverDestroySyevjInfo

    !---------------------------------------------
    ! hipsolverXsyevjSetMaxSweeps
    !---------------------------------------------
    function hipsolverXsyevjSetMaxSweeps(myInfo, max_sweeps) &
       result(XsyevjSetMaxSweeps) &
       bind(C, name="hipsolverXsyevjSetMaxSweeps")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(c_int), value :: max_sweeps
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: XsyevjSetMaxSweeps
    end function hipsolverXsyevjSetMaxSweeps

    !---------------------------------------------
    ! hipsolverXsyevjSetSortEig
    !---------------------------------------------
    function hipsolverXsyevjSetSortEig(myInfo, sort_eig) &
       result(XsyevjSetSortEig) &
       bind(C, name="hipsolverXsyevjSetSortEig")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(c_int), value :: sort_eig
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: XsyevjSetSortEig
    end function hipsolverXsyevjSetSortEig

    !---------------------------------------------
    ! hipsolverXsyevjSetTolerance
    !---------------------------------------------
    function hipsolverXsyevjSetTolerance(myInfo, tolerance) &
       result(XsyevjSetTolerance) &
       bind(C, name="hipsolverXsyevjSetTolerance")
       import :: c_ptr, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       real(c_double), value :: tolerance
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: XsyevjSetTolerance
    end function hipsolverXsyevjSetTolerance

    !---------------------------------------------
    ! hipsolverXsyevjGetResidual
    !---------------------------------------------
    function hipsolverXsyevjGetResidual(handle, myInfo, residual) &
       result(XsyevjGetResidual) &
       bind(C, name="hipsolverXsyevjGetResidual")
       import :: c_ptr, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: myInfo
       real(c_double) :: residual
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: XsyevjGetResidual
    end function hipsolverXsyevjGetResidual

    !---------------------------------------------
    ! hipsolverXsyevjGetSweeps
    !---------------------------------------------
    function hipsolverXsyevjGetSweeps(handle, myInfo, executed_sweeps) &
       result(XsyevjGetSweeps) &
       bind(C, name="hipsolverXsyevjGetSweeps")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: myInfo
       integer(c_int) :: executed_sweeps
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: XsyevjGetSweeps
    end function hipsolverXsyevjGetSweeps

    !---------------------------------------------
    ! hipsolverSgebrd_bufferSize
    !---------------------------------------------
    function hipsolverSgebrd_bufferSize(handle, m, n, lwork) &
       result(Sgebrd_bufferSize) &
       bind(C, name="hipsolverSgebrd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Sgebrd_bufferSize
    end function hipsolverSgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverDgebrd_bufferSize
    !---------------------------------------------
    function hipsolverDgebrd_bufferSize(handle, m, n, lwork) &
       result(Dgebrd_bufferSize) &
       bind(C, name="hipsolverDgebrd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dgebrd_bufferSize
    end function hipsolverDgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverCgebrd_bufferSize
    !---------------------------------------------
    function hipsolverCgebrd_bufferSize(handle, m, n, lwork) &
       result(Cgebrd_bufferSize) &
       bind(C, name="hipsolverCgebrd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Cgebrd_bufferSize
    end function hipsolverCgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverZgebrd_bufferSize
    !---------------------------------------------
    function hipsolverZgebrd_bufferSize(handle, m, n, lwork) &
       result(Zgebrd_bufferSize) &
       bind(C, name="hipsolverZgebrd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zgebrd_bufferSize
    end function hipsolverZgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverSSgels_bufferSize
    !---------------------------------------------
    function hipsolverSSgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, lwork) &
       result(SSgels_bufferSize) &
       bind(C, name="hipsolverSSgels_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SSgels_bufferSize
    end function hipsolverSSgels_bufferSize

    !---------------------------------------------
    ! hipsolverDDgels_bufferSize
    !---------------------------------------------
    function hipsolverDDgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, lwork) &
       result(DDgels_bufferSize) &
       bind(C, name="hipsolverDDgels_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DDgels_bufferSize
    end function hipsolverDDgels_bufferSize

    !---------------------------------------------
    ! hipsolverCCgels_bufferSize
    !---------------------------------------------
    function hipsolverCCgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, lwork) &
       result(CCgels_bufferSize) &
       bind(C, name="hipsolverCCgels_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CCgels_bufferSize
    end function hipsolverCCgels_bufferSize

    !---------------------------------------------
    ! hipsolverZZgels_bufferSize
    !---------------------------------------------
    function hipsolverZZgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, lwork) &
       result(ZZgels_bufferSize) &
       bind(C, name="hipsolverZZgels_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZZgels_bufferSize
    end function hipsolverZZgels_bufferSize

    !---------------------------------------------
    ! hipsolverSSgels
    !---------------------------------------------
    function hipsolverSSgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                             devInfo) &
       result(SSgels) &
       bind(C, name="hipsolverSSgels")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SSgels
    end function hipsolverSSgels

    !---------------------------------------------
    ! hipsolverDDgels
    !---------------------------------------------
    function hipsolverDDgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                             devInfo) &
       result(DDgels) &
       bind(C, name="hipsolverDDgels")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DDgels
    end function hipsolverDDgels

    !---------------------------------------------
    ! hipsolverCCgels
    !---------------------------------------------
    function hipsolverCCgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                             devInfo) &
       result(CCgels) &
       bind(C, name="hipsolverCCgels")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CCgels
    end function hipsolverCCgels

    !---------------------------------------------
    ! hipsolverZZgels
    !---------------------------------------------
    function hipsolverZZgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                             devInfo) &
       result(ZZgels) &
       bind(C, name="hipsolverZZgels")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZZgels
    end function hipsolverZZgels

    !---------------------------------------------
    ! hipsolverSgesvd_bufferSize
    !---------------------------------------------
    function hipsolverSgesvd_bufferSize(handle, jobu, jobv, m, n, lwork) &
       result(Sgesvd_bufferSize) &
       bind(C, name="hipsolverSgesvd_bufferSize")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Sgesvd_bufferSize
    end function hipsolverSgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverDgesvd_bufferSize
    !---------------------------------------------
    function hipsolverDgesvd_bufferSize(handle, jobu, jobv, m, n, lwork) &
       result(Dgesvd_bufferSize) &
       bind(C, name="hipsolverDgesvd_bufferSize")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dgesvd_bufferSize
    end function hipsolverDgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverCgesvd_bufferSize
    !---------------------------------------------
    function hipsolverCgesvd_bufferSize(handle, jobu, jobv, m, n, lwork) &
       result(Cgesvd_bufferSize) &
       bind(C, name="hipsolverCgesvd_bufferSize")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Cgesvd_bufferSize
    end function hipsolverCgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverZgesvd_bufferSize
    !---------------------------------------------
    function hipsolverZgesvd_bufferSize(handle, jobu, jobv, m, n, lwork) &
       result(Zgesvd_bufferSize) &
       bind(C, name="hipsolverZgesvd_bufferSize")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zgesvd_bufferSize
    end function hipsolverZgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverSgesvd
    !---------------------------------------------
    function hipsolverSgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                             rwork, devInfo) &
       result(Sgesvd) &
       bind(C, name="hipsolverSgesvd")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: rwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Sgesvd
    end function hipsolverSgesvd

    !---------------------------------------------
    ! hipsolverDgesvd
    !---------------------------------------------
    function hipsolverDgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                             rwork, devInfo) &
       result(Dgesvd) &
       bind(C, name="hipsolverDgesvd")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: rwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dgesvd
    end function hipsolverDgesvd

    !---------------------------------------------
    ! hipsolverCgesvd
    !---------------------------------------------
    function hipsolverCgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                             rwork, devInfo) &
       result(Cgesvd) &
       bind(C, name="hipsolverCgesvd")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: rwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Cgesvd
    end function hipsolverCgesvd

    !---------------------------------------------
    ! hipsolverZgesvd
    !---------------------------------------------
    function hipsolverZgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                             rwork, devInfo) &
       result(Zgesvd) &
       bind(C, name="hipsolverZgesvd")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: rwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zgesvd
    end function hipsolverZgesvd

    !---------------------------------------------
    ! hipsolverSgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverSgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                         lwork, params) &
       result(Sgesvdj_bufferSize) &
       bind(C, name="hipsolverSgesvdj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Sgesvdj_bufferSize
    end function hipsolverSgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverDgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverDgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                         lwork, params) &
       result(Dgesvdj_bufferSize) &
       bind(C, name="hipsolverDgesvdj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dgesvdj_bufferSize
    end function hipsolverDgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverCgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverCgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                         lwork, params) &
       result(Cgesvdj_bufferSize) &
       bind(C, name="hipsolverCgesvdj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Cgesvdj_bufferSize
    end function hipsolverCgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverZgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverZgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                         lwork, params) &
       result(Zgesvdj_bufferSize) &
       bind(C, name="hipsolverZgesvdj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zgesvdj_bufferSize
    end function hipsolverZgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverSgesvdj
    !---------------------------------------------
    function hipsolverSgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                              devInfo, params) &
       result(Sgesvdj) &
       bind(C, name="hipsolverSgesvdj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Sgesvdj
    end function hipsolverSgesvdj

    !---------------------------------------------
    ! hipsolverDgesvdj
    !---------------------------------------------
    function hipsolverDgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                              devInfo, params) &
       result(Dgesvdj) &
       bind(C, name="hipsolverDgesvdj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dgesvdj
    end function hipsolverDgesvdj

    !---------------------------------------------
    ! hipsolverCgesvdj
    !---------------------------------------------
    function hipsolverCgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                              devInfo, params) &
       result(Cgesvdj) &
       bind(C, name="hipsolverCgesvdj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Cgesvdj
    end function hipsolverCgesvdj

    !---------------------------------------------
    ! hipsolverZgesvdj
    !---------------------------------------------
    function hipsolverZgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                              devInfo, params) &
       result(Zgesvdj) &
       bind(C, name="hipsolverZgesvdj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zgesvdj
    end function hipsolverZgesvdj

    !---------------------------------------------
    ! hipsolverSgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverSgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                lwork, params, batch_count) &
       result(SgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverSgesvdjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SgesvdjBatched_bufferSize
    end function hipsolverSgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                lwork, params, batch_count) &
       result(DgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverDgesvdjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DgesvdjBatched_bufferSize
    end function hipsolverDgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverCgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverCgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                lwork, params, batch_count) &
       result(CgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverCgesvdjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CgesvdjBatched_bufferSize
    end function hipsolverCgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverZgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverZgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                lwork, params, batch_count) &
       result(ZgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverZgesvdjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZgesvdjBatched_bufferSize
    end function hipsolverZgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverSgesvdjBatched
    !---------------------------------------------
    function hipsolverSgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                     devInfo, params, batch_count) &
       result(SgesvdjBatched) &
       bind(C, name="hipsolverSgesvdjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SgesvdjBatched
    end function hipsolverSgesvdjBatched

    !---------------------------------------------
    ! hipsolverDgesvdjBatched
    !---------------------------------------------
    function hipsolverDgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                     devInfo, params, batch_count) &
       result(DgesvdjBatched) &
       bind(C, name="hipsolverDgesvdjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DgesvdjBatched
    end function hipsolverDgesvdjBatched

    !---------------------------------------------
    ! hipsolverCgesvdjBatched
    !---------------------------------------------
    function hipsolverCgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                     devInfo, params, batch_count) &
       result(CgesvdjBatched) &
       bind(C, name="hipsolverCgesvdjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CgesvdjBatched
    end function hipsolverCgesvdjBatched

    !---------------------------------------------
    ! hipsolverZgesvdjBatched
    !---------------------------------------------
    function hipsolverZgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                     devInfo, params, batch_count) &
       result(ZgesvdjBatched) &
       bind(C, name="hipsolverZgesvdjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZgesvdjBatched
    end function hipsolverZgesvdjBatched

    !---------------------------------------------
    ! hipsolverSgetrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverSgetrfBatched_bufferSize(handle, m, n, A, lda, strideP, lwork, batch_count) &
       result(SgetrfBatched_bufferSize) &
       bind(C, name="hipsolverSgetrfBatched_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int), value :: strideP
       type(c_ptr), value :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SgetrfBatched_bufferSize
    end function hipsolverSgetrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDgetrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverDgetrfBatched_bufferSize(handle, m, n, A, lda, strideP, lwork, batch_count) &
       result(DgetrfBatched_bufferSize) &
       bind(C, name="hipsolverDgetrfBatched_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int), value :: strideP
       type(c_ptr), value :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DgetrfBatched_bufferSize
    end function hipsolverDgetrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverCgetrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverCgetrfBatched_bufferSize(handle, m, n, A, lda, strideP, lwork, batch_count) &
       result(CgetrfBatched_bufferSize) &
       bind(C, name="hipsolverCgetrfBatched_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int), value :: strideP
       type(c_ptr), value :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CgetrfBatched_bufferSize
    end function hipsolverCgetrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverZgetrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverZgetrfBatched_bufferSize(handle, m, n, A, lda, strideP, lwork, batch_count) &
       result(ZgetrfBatched_bufferSize) &
       bind(C, name="hipsolverZgetrfBatched_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int), value :: strideP
       type(c_ptr), value :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZgetrfBatched_bufferSize
    end function hipsolverZgetrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverSgetrfBatched
    !---------------------------------------------
    function hipsolverSgetrfBatched(handle, m, n, A, lda, work, lwork, devIpiv, strideP, devInfo, &
                                    batch_count) &
       result(SgetrfBatched) &
       bind(C, name="hipsolverSgetrfBatched")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: strideP
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SgetrfBatched
    end function hipsolverSgetrfBatched

    !---------------------------------------------
    ! hipsolverDgetrfBatched
    !---------------------------------------------
    function hipsolverDgetrfBatched(handle, m, n, A, lda, work, lwork, devIpiv, strideP, devInfo, &
                                    batch_count) &
       result(DgetrfBatched) &
       bind(C, name="hipsolverDgetrfBatched")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: strideP
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DgetrfBatched
    end function hipsolverDgetrfBatched

    !---------------------------------------------
    ! hipsolverCgetrfBatched
    !---------------------------------------------
    function hipsolverCgetrfBatched(handle, m, n, A, lda, work, lwork, devIpiv, strideP, devInfo, &
                                    batch_count) &
       result(CgetrfBatched) &
       bind(C, name="hipsolverCgetrfBatched")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: strideP
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CgetrfBatched
    end function hipsolverCgetrfBatched

    !---------------------------------------------
    ! hipsolverZgetrfBatched
    !---------------------------------------------
    function hipsolverZgetrfBatched(handle, m, n, A, lda, work, lwork, devIpiv, strideP, devInfo, &
                                    batch_count) &
       result(ZgetrfBatched) &
       bind(C, name="hipsolverZgetrfBatched")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: strideP
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZgetrfBatched
    end function hipsolverZgetrfBatched

    !---------------------------------------------
    ! hipsolverSpotrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverSpotrfBatched_bufferSize(handle, uplo, n, A, lda, lwork, batch_count) &
       result(SpotrfBatched_bufferSize) &
       bind(C, name="hipsolverSpotrfBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpotrfBatched_bufferSize
    end function hipsolverSpotrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDpotrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverDpotrfBatched_bufferSize(handle, uplo, n, A, lda, lwork, batch_count) &
       result(DpotrfBatched_bufferSize) &
       bind(C, name="hipsolverDpotrfBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DpotrfBatched_bufferSize
    end function hipsolverDpotrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverCpotrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverCpotrfBatched_bufferSize(handle, uplo, n, A, lda, lwork, batch_count) &
       result(CpotrfBatched_bufferSize) &
       bind(C, name="hipsolverCpotrfBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CpotrfBatched_bufferSize
    end function hipsolverCpotrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverZpotrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverZpotrfBatched_bufferSize(handle, uplo, n, A, lda, lwork, batch_count) &
       result(ZpotrfBatched_bufferSize) &
       bind(C, name="hipsolverZpotrfBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZpotrfBatched_bufferSize
    end function hipsolverZpotrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverSpotrfBatched
    !---------------------------------------------
    function hipsolverSpotrfBatched(handle, uplo, n, A, lda, work, lwork, devInfo, batch_count) &
       result(SpotrfBatched) &
       bind(C, name="hipsolverSpotrfBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpotrfBatched
    end function hipsolverSpotrfBatched

    !---------------------------------------------
    ! hipsolverDpotrfBatched
    !---------------------------------------------
    function hipsolverDpotrfBatched(handle, uplo, n, A, lda, work, lwork, devInfo, batch_count) &
       result(DpotrfBatched) &
       bind(C, name="hipsolverDpotrfBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DpotrfBatched
    end function hipsolverDpotrfBatched

    !---------------------------------------------
    ! hipsolverCpotrfBatched
    !---------------------------------------------
    function hipsolverCpotrfBatched(handle, uplo, n, A, lda, work, lwork, devInfo, batch_count) &
       result(CpotrfBatched) &
       bind(C, name="hipsolverCpotrfBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CpotrfBatched
    end function hipsolverCpotrfBatched

    !---------------------------------------------
    ! hipsolverZpotrfBatched
    !---------------------------------------------
    function hipsolverZpotrfBatched(handle, uplo, n, A, lda, work, lwork, devInfo, batch_count) &
       result(ZpotrfBatched) &
       bind(C, name="hipsolverZpotrfBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZpotrfBatched
    end function hipsolverZpotrfBatched

    !---------------------------------------------
    ! hipsolverSpotrsBatched_bufferSize
    !---------------------------------------------
    function hipsolverSpotrsBatched_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork, &
                                               batch_count) &
       result(SpotrsBatched_bufferSize) &
       bind(C, name="hipsolverSpotrsBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpotrsBatched_bufferSize
    end function hipsolverSpotrsBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDpotrsBatched_bufferSize
    !---------------------------------------------
    function hipsolverDpotrsBatched_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork, &
                                               batch_count) &
       result(DpotrsBatched_bufferSize) &
       bind(C, name="hipsolverDpotrsBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DpotrsBatched_bufferSize
    end function hipsolverDpotrsBatched_bufferSize

    !---------------------------------------------
    ! hipsolverCpotrsBatched_bufferSize
    !---------------------------------------------
    function hipsolverCpotrsBatched_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork, &
                                               batch_count) &
       result(CpotrsBatched_bufferSize) &
       bind(C, name="hipsolverCpotrsBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CpotrsBatched_bufferSize
    end function hipsolverCpotrsBatched_bufferSize

    !---------------------------------------------
    ! hipsolverZpotrsBatched_bufferSize
    !---------------------------------------------
    function hipsolverZpotrsBatched_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork, &
                                               batch_count) &
       result(ZpotrsBatched_bufferSize) &
       bind(C, name="hipsolverZpotrsBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZpotrsBatched_bufferSize
    end function hipsolverZpotrsBatched_bufferSize

    !---------------------------------------------
    ! hipsolverSpotrsBatched
    !---------------------------------------------
    function hipsolverSpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo, &
                                    batch_count) &
       result(SpotrsBatched) &
       bind(C, name="hipsolverSpotrsBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpotrsBatched
    end function hipsolverSpotrsBatched

    !---------------------------------------------
    ! hipsolverDpotrsBatched
    !---------------------------------------------
    function hipsolverDpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo, &
                                    batch_count) &
       result(DpotrsBatched) &
       bind(C, name="hipsolverDpotrsBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DpotrsBatched
    end function hipsolverDpotrsBatched

    !---------------------------------------------
    ! hipsolverCpotrsBatched
    !---------------------------------------------
    function hipsolverCpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo, &
                                    batch_count) &
       result(CpotrsBatched) &
       bind(C, name="hipsolverCpotrsBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CpotrsBatched
    end function hipsolverCpotrsBatched

    !---------------------------------------------
    ! hipsolverZpotrsBatched
    !---------------------------------------------
    function hipsolverZpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo, &
                                    batch_count) &
       result(ZpotrsBatched) &
       bind(C, name="hipsolverZpotrsBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZpotrsBatched
    end function hipsolverZpotrsBatched

    !---------------------------------------------
    ! hipsolverSsyevdx_bufferSize
    !---------------------------------------------
    function hipsolverSsyevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                         nev, W, lwork) &
       result(Ssyevdx_bufferSize) &
       bind(C, name="hipsolverSsyevdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Ssyevdx_bufferSize
    end function hipsolverSsyevdx_bufferSize

    !---------------------------------------------
    ! hipsolverDsyevdx_bufferSize
    !---------------------------------------------
    function hipsolverDsyevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                         nev, W, lwork) &
       result(Dsyevdx_bufferSize) &
       bind(C, name="hipsolverDsyevdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dsyevdx_bufferSize
    end function hipsolverDsyevdx_bufferSize

    !---------------------------------------------
    ! hipsolverCheevdx_bufferSize
    !---------------------------------------------
    function hipsolverCheevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                         nev, W, lwork) &
       result(Cheevdx_bufferSize) &
       bind(C, name="hipsolverCheevdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Cheevdx_bufferSize
    end function hipsolverCheevdx_bufferSize

    !---------------------------------------------
    ! hipsolverZheevdx_bufferSize
    !---------------------------------------------
    function hipsolverZheevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                         nev, W, lwork) &
       result(Zheevdx_bufferSize) &
       bind(C, name="hipsolverZheevdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zheevdx_bufferSize
    end function hipsolverZheevdx_bufferSize

    !---------------------------------------------
    ! hipsolverSsyevdx
    !---------------------------------------------
    function hipsolverSsyevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, work, &
                              lwork, devInfo) &
       result(Ssyevdx) &
       bind(C, name="hipsolverSsyevdx")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Ssyevdx
    end function hipsolverSsyevdx

    !---------------------------------------------
    ! hipsolverDsyevdx
    !---------------------------------------------
    function hipsolverDsyevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, work, &
                              lwork, devInfo) &
       result(Dsyevdx) &
       bind(C, name="hipsolverDsyevdx")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dsyevdx
    end function hipsolverDsyevdx

    !---------------------------------------------
    ! hipsolverCheevdx
    !---------------------------------------------
    function hipsolverCheevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, work, &
                              lwork, devInfo) &
       result(Cheevdx) &
       bind(C, name="hipsolverCheevdx")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Cheevdx
    end function hipsolverCheevdx

    !---------------------------------------------
    ! hipsolverZheevdx
    !---------------------------------------------
    function hipsolverZheevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, work, &
                              lwork, devInfo) &
       result(Zheevdx) &
       bind(C, name="hipsolverZheevdx")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zheevdx
    end function hipsolverZheevdx

    !---------------------------------------------
    ! hipsolverSsyevj_bufferSize
    !---------------------------------------------
    function hipsolverSsyevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(Ssyevj_bufferSize) &
       bind(C, name="hipsolverSsyevj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Ssyevj_bufferSize
    end function hipsolverSsyevj_bufferSize

    !---------------------------------------------
    ! hipsolverDsyevj_bufferSize
    !---------------------------------------------
    function hipsolverDsyevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(Dsyevj_bufferSize) &
       bind(C, name="hipsolverDsyevj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dsyevj_bufferSize
    end function hipsolverDsyevj_bufferSize

    !---------------------------------------------
    ! hipsolverCheevj_bufferSize
    !---------------------------------------------
    function hipsolverCheevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(Cheevj_bufferSize) &
       bind(C, name="hipsolverCheevj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Cheevj_bufferSize
    end function hipsolverCheevj_bufferSize

    !---------------------------------------------
    ! hipsolverZheevj_bufferSize
    !---------------------------------------------
    function hipsolverZheevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(Zheevj_bufferSize) &
       bind(C, name="hipsolverZheevj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zheevj_bufferSize
    end function hipsolverZheevj_bufferSize

    !---------------------------------------------
    ! hipsolverSsyevj
    !---------------------------------------------
    function hipsolverSsyevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(Ssyevj) &
       bind(C, name="hipsolverSsyevj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Ssyevj
    end function hipsolverSsyevj

    !---------------------------------------------
    ! hipsolverDsyevj
    !---------------------------------------------
    function hipsolverDsyevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(Dsyevj) &
       bind(C, name="hipsolverDsyevj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dsyevj
    end function hipsolverDsyevj

    !---------------------------------------------
    ! hipsolverCheevj
    !---------------------------------------------
    function hipsolverCheevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(Cheevj) &
       bind(C, name="hipsolverCheevj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Cheevj
    end function hipsolverCheevj

    !---------------------------------------------
    ! hipsolverZheevj
    !---------------------------------------------
    function hipsolverZheevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(Zheevj) &
       bind(C, name="hipsolverZheevj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zheevj
    end function hipsolverZheevj

    !---------------------------------------------
    ! hipsolverSsyevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverSsyevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                               batch_count) &
       result(SsyevjBatched_bufferSize) &
       bind(C, name="hipsolverSsyevjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SsyevjBatched_bufferSize
    end function hipsolverSsyevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDsyevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDsyevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                               batch_count) &
       result(DsyevjBatched_bufferSize) &
       bind(C, name="hipsolverDsyevjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DsyevjBatched_bufferSize
    end function hipsolverDsyevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverCheevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverCheevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                               batch_count) &
       result(CheevjBatched_bufferSize) &
       bind(C, name="hipsolverCheevjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CheevjBatched_bufferSize
    end function hipsolverCheevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverZheevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverZheevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                               batch_count) &
       result(ZheevjBatched_bufferSize) &
       bind(C, name="hipsolverZheevjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZheevjBatched_bufferSize
    end function hipsolverZheevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverSsyevjBatched
    !---------------------------------------------
    function hipsolverSsyevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                    params, batch_count) &
       result(SsyevjBatched) &
       bind(C, name="hipsolverSsyevjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SsyevjBatched
    end function hipsolverSsyevjBatched

    !---------------------------------------------
    ! hipsolverDsyevjBatched
    !---------------------------------------------
    function hipsolverDsyevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                    params, batch_count) &
       result(DsyevjBatched) &
       bind(C, name="hipsolverDsyevjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DsyevjBatched
    end function hipsolverDsyevjBatched

    !---------------------------------------------
    ! hipsolverCheevjBatched
    !---------------------------------------------
    function hipsolverCheevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                    params, batch_count) &
       result(CheevjBatched) &
       bind(C, name="hipsolverCheevjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: CheevjBatched
    end function hipsolverCheevjBatched

    !---------------------------------------------
    ! hipsolverZheevjBatched
    !---------------------------------------------
    function hipsolverZheevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                    params, batch_count) &
       result(ZheevjBatched) &
       bind(C, name="hipsolverZheevjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZheevjBatched
    end function hipsolverZheevjBatched

    !---------------------------------------------
    ! hipsolverSsygvdx_bufferSize
    !---------------------------------------------
    function hipsolverSsygvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, &
                                         vu, il, iu, nev, W, lwork) &
       result(Ssygvdx_bufferSize) &
       bind(C, name="hipsolverSsygvdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Ssygvdx_bufferSize
    end function hipsolverSsygvdx_bufferSize

    !---------------------------------------------
    ! hipsolverDsygvdx_bufferSize
    !---------------------------------------------
    function hipsolverDsygvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, &
                                         vu, il, iu, nev, W, lwork) &
       result(Dsygvdx_bufferSize) &
       bind(C, name="hipsolverDsygvdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dsygvdx_bufferSize
    end function hipsolverDsygvdx_bufferSize

    !---------------------------------------------
    ! hipsolverChegvdx_bufferSize
    !---------------------------------------------
    function hipsolverChegvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, &
                                         vu, il, iu, nev, W, lwork) &
       result(Chegvdx_bufferSize) &
       bind(C, name="hipsolverChegvdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Chegvdx_bufferSize
    end function hipsolverChegvdx_bufferSize

    !---------------------------------------------
    ! hipsolverZhegvdx_bufferSize
    !---------------------------------------------
    function hipsolverZhegvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, &
                                         vu, il, iu, nev, W, lwork) &
       result(Zhegvdx_bufferSize) &
       bind(C, name="hipsolverZhegvdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zhegvdx_bufferSize
    end function hipsolverZhegvdx_bufferSize

    !---------------------------------------------
    ! hipsolverSsygvdx
    !---------------------------------------------
    function hipsolverSsygvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, iu, &
                              nev, W, work, lwork, devInfo) &
       result(Ssygvdx) &
       bind(C, name="hipsolverSsygvdx")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Ssygvdx
    end function hipsolverSsygvdx

    !---------------------------------------------
    ! hipsolverDsygvdx
    !---------------------------------------------
    function hipsolverDsygvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, iu, &
                              nev, W, work, lwork, devInfo) &
       result(Dsygvdx) &
       bind(C, name="hipsolverDsygvdx")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dsygvdx
    end function hipsolverDsygvdx

    !---------------------------------------------
    ! hipsolverChegvdx
    !---------------------------------------------
    function hipsolverChegvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, iu, &
                              nev, W, work, lwork, devInfo) &
       result(Chegvdx) &
       bind(C, name="hipsolverChegvdx")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Chegvdx
    end function hipsolverChegvdx

    !---------------------------------------------
    ! hipsolverZhegvdx
    !---------------------------------------------
    function hipsolverZhegvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, iu, &
                              nev, W, work, lwork, devInfo) &
       result(Zhegvdx) &
       bind(C, name="hipsolverZhegvdx")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zhegvdx
    end function hipsolverZhegvdx

    !---------------------------------------------
    ! hipsolverSsygvj_bufferSize
    !---------------------------------------------
    function hipsolverSsygvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                        params) &
       result(Ssygvj_bufferSize) &
       bind(C, name="hipsolverSsygvj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Ssygvj_bufferSize
    end function hipsolverSsygvj_bufferSize

    !---------------------------------------------
    ! hipsolverDsygvj_bufferSize
    !---------------------------------------------
    function hipsolverDsygvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                        params) &
       result(Dsygvj_bufferSize) &
       bind(C, name="hipsolverDsygvj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dsygvj_bufferSize
    end function hipsolverDsygvj_bufferSize

    !---------------------------------------------
    ! hipsolverChegvj_bufferSize
    !---------------------------------------------
    function hipsolverChegvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                        params) &
       result(Chegvj_bufferSize) &
       bind(C, name="hipsolverChegvj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Chegvj_bufferSize
    end function hipsolverChegvj_bufferSize

    !---------------------------------------------
    ! hipsolverZhegvj_bufferSize
    !---------------------------------------------
    function hipsolverZhegvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                        params) &
       result(Zhegvj_bufferSize) &
       bind(C, name="hipsolverZhegvj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zhegvj_bufferSize
    end function hipsolverZhegvj_bufferSize

    !---------------------------------------------
    ! hipsolverSsygvj
    !---------------------------------------------
    function hipsolverSsygvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo, params) &
       result(Ssygvj) &
       bind(C, name="hipsolverSsygvj")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Ssygvj
    end function hipsolverSsygvj

    !---------------------------------------------
    ! hipsolverDsygvj
    !---------------------------------------------
    function hipsolverDsygvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo, params) &
       result(Dsygvj) &
       bind(C, name="hipsolverDsygvj")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Dsygvj
    end function hipsolverDsygvj

    !---------------------------------------------
    ! hipsolverChegvj
    !---------------------------------------------
    function hipsolverChegvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo, params) &
       result(Chegvj) &
       bind(C, name="hipsolverChegvj")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Chegvj
    end function hipsolverChegvj

    !---------------------------------------------
    ! hipsolverZhegvj
    !---------------------------------------------
    function hipsolverZhegvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo, params) &
       result(Zhegvj) &
       bind(C, name="hipsolverZhegvj")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zhegvj
    end function hipsolverZhegvj

    !---------------------------------------------
    ! hipsolverDnCreate
    !---------------------------------------------
    function hipsolverDnCreate(handle) &
       result(DnCreate) &
       bind(C, name="hipsolverDnCreate")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr) :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCreate
    end function hipsolverDnCreate

    !---------------------------------------------
    ! hipsolverDnDestroy
    !---------------------------------------------
    function hipsolverDnDestroy(handle) &
       result(DnDestroy) &
       bind(C, name="hipsolverDnDestroy")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDestroy
    end function hipsolverDnDestroy

    !---------------------------------------------
    ! hipsolverDnSetStream
    !---------------------------------------------
    function hipsolverDnSetStream(handle, streamId) &
       result(DnSetStream) &
       bind(C, name="hipsolverDnSetStream")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: streamId
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSetStream
    end function hipsolverDnSetStream

    !---------------------------------------------
    ! hipsolverDnGetStream
    !---------------------------------------------
    function hipsolverDnGetStream(handle, streamId) &
       result(DnGetStream) &
       bind(C, name="hipsolverDnGetStream")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr) :: streamId
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnGetStream
    end function hipsolverDnGetStream

    !---------------------------------------------
    ! hipsolverDnSetDeterministicMode
    !---------------------------------------------
    function hipsolverDnSetDeterministicMode(handle, mode) &
       result(DnSetDeterministicMode) &
       bind(C, name="hipsolverDnSetDeterministicMode")
       import :: c_ptr, HIPSOLVER_DETERMINISTIC_RESULTS, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_DETERMINISTIC_RESULTS)), value :: mode
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSetDeterministicMode
    end function hipsolverDnSetDeterministicMode

    !---------------------------------------------
    ! hipsolverDnGetDeterministicMode
    !---------------------------------------------
    function hipsolverDnGetDeterministicMode(handle, mode) &
       result(DnGetDeterministicMode) &
       bind(C, name="hipsolverDnGetDeterministicMode")
       import :: c_ptr, HIPSOLVER_DETERMINISTIC_RESULTS, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_DETERMINISTIC_RESULTS)) :: mode
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnGetDeterministicMode
    end function hipsolverDnGetDeterministicMode

    !---------------------------------------------
    ! hipsolverDnCreateGesvdjInfo
    !---------------------------------------------
    function hipsolverDnCreateGesvdjInfo(myInfo) &
       result(DnCreateGesvdjInfo) &
       bind(C, name="hipsolverDnCreateGesvdjInfo")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr) :: myInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCreateGesvdjInfo
    end function hipsolverDnCreateGesvdjInfo

    !---------------------------------------------
    ! hipsolverDnDestroyGesvdjInfo
    !---------------------------------------------
    function hipsolverDnDestroyGesvdjInfo(myInfo) &
       result(DnDestroyGesvdjInfo) &
       bind(C, name="hipsolverDnDestroyGesvdjInfo")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDestroyGesvdjInfo
    end function hipsolverDnDestroyGesvdjInfo

    !---------------------------------------------
    ! hipsolverDnXgesvdjSetMaxSweeps
    !---------------------------------------------
    function hipsolverDnXgesvdjSetMaxSweeps(myInfo, max_sweeps) &
       result(DnXgesvdjSetMaxSweeps) &
       bind(C, name="hipsolverDnXgesvdjSetMaxSweeps")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(c_int), value :: max_sweeps
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgesvdjSetMaxSweeps
    end function hipsolverDnXgesvdjSetMaxSweeps

    !---------------------------------------------
    ! hipsolverDnXgesvdjSetSortEig
    !---------------------------------------------
    function hipsolverDnXgesvdjSetSortEig(myInfo, sort_eig) &
       result(DnXgesvdjSetSortEig) &
       bind(C, name="hipsolverDnXgesvdjSetSortEig")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(c_int), value :: sort_eig
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgesvdjSetSortEig
    end function hipsolverDnXgesvdjSetSortEig

    !---------------------------------------------
    ! hipsolverDnXgesvdjSetTolerance
    !---------------------------------------------
    function hipsolverDnXgesvdjSetTolerance(myInfo, tolerance) &
       result(DnXgesvdjSetTolerance) &
       bind(C, name="hipsolverDnXgesvdjSetTolerance")
       import :: c_ptr, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       real(c_double), value :: tolerance
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgesvdjSetTolerance
    end function hipsolverDnXgesvdjSetTolerance

    !---------------------------------------------
    ! hipsolverDnXgesvdjGetResidual
    !---------------------------------------------
    function hipsolverDnXgesvdjGetResidual(handle, myInfo, residual) &
       result(DnXgesvdjGetResidual) &
       bind(C, name="hipsolverDnXgesvdjGetResidual")
       import :: c_ptr, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: myInfo
       real(c_double) :: residual
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgesvdjGetResidual
    end function hipsolverDnXgesvdjGetResidual

    !---------------------------------------------
    ! hipsolverDnXgesvdjGetSweeps
    !---------------------------------------------
    function hipsolverDnXgesvdjGetSweeps(handle, myInfo, executed_sweeps) &
       result(DnXgesvdjGetSweeps) &
       bind(C, name="hipsolverDnXgesvdjGetSweeps")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: myInfo
       integer(c_int) :: executed_sweeps
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgesvdjGetSweeps
    end function hipsolverDnXgesvdjGetSweeps

    !---------------------------------------------
    ! hipsolverDnCreateSyevjInfo
    !---------------------------------------------
    function hipsolverDnCreateSyevjInfo(myInfo) &
       result(DnCreateSyevjInfo) &
       bind(C, name="hipsolverDnCreateSyevjInfo")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr) :: myInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCreateSyevjInfo
    end function hipsolverDnCreateSyevjInfo

    !---------------------------------------------
    ! hipsolverDnDestroySyevjInfo
    !---------------------------------------------
    function hipsolverDnDestroySyevjInfo(myInfo) &
       result(DnDestroySyevjInfo) &
       bind(C, name="hipsolverDnDestroySyevjInfo")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDestroySyevjInfo
    end function hipsolverDnDestroySyevjInfo

    !---------------------------------------------
    ! hipsolverDnXsyevjSetMaxSweeps
    !---------------------------------------------
    function hipsolverDnXsyevjSetMaxSweeps(myInfo, max_sweeps) &
       result(DnXsyevjSetMaxSweeps) &
       bind(C, name="hipsolverDnXsyevjSetMaxSweeps")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(c_int), value :: max_sweeps
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXsyevjSetMaxSweeps
    end function hipsolverDnXsyevjSetMaxSweeps

    !---------------------------------------------
    ! hipsolverDnXsyevjSetSortEig
    !---------------------------------------------
    function hipsolverDnXsyevjSetSortEig(myInfo, sort_eig) &
       result(DnXsyevjSetSortEig) &
       bind(C, name="hipsolverDnXsyevjSetSortEig")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       integer(c_int), value :: sort_eig
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXsyevjSetSortEig
    end function hipsolverDnXsyevjSetSortEig

    !---------------------------------------------
    ! hipsolverDnXsyevjSetTolerance
    !---------------------------------------------
    function hipsolverDnXsyevjSetTolerance(myInfo, tolerance) &
       result(DnXsyevjSetTolerance) &
       bind(C, name="hipsolverDnXsyevjSetTolerance")
       import :: c_ptr, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: myInfo
       real(c_double), value :: tolerance
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXsyevjSetTolerance
    end function hipsolverDnXsyevjSetTolerance

    !---------------------------------------------
    ! hipsolverDnXsyevjGetResidual
    !---------------------------------------------
    function hipsolverDnXsyevjGetResidual(handle, myInfo, residual) &
       result(DnXsyevjGetResidual) &
       bind(C, name="hipsolverDnXsyevjGetResidual")
       import :: c_ptr, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: myInfo
       real(c_double) :: residual
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXsyevjGetResidual
    end function hipsolverDnXsyevjGetResidual

    !---------------------------------------------
    ! hipsolverDnXsyevjGetSweeps
    !---------------------------------------------
    function hipsolverDnXsyevjGetSweeps(handle, myInfo, executed_sweeps) &
       result(DnXsyevjGetSweeps) &
       bind(C, name="hipsolverDnXsyevjGetSweeps")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: myInfo
       integer(c_int) :: executed_sweeps
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXsyevjGetSweeps
    end function hipsolverDnXsyevjGetSweeps

    !---------------------------------------------
    ! hipsolverDnSorgbr_bufferSize
    !---------------------------------------------
    function hipsolverDnSorgbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(DnSorgbr_bufferSize) &
       bind(C, name="hipsolverDnSorgbr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSorgbr_bufferSize
    end function hipsolverDnSorgbr_bufferSize

    !---------------------------------------------
    ! hipsolverDnDorgbr_bufferSize
    !---------------------------------------------
    function hipsolverDnDorgbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(DnDorgbr_bufferSize) &
       bind(C, name="hipsolverDnDorgbr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDorgbr_bufferSize
    end function hipsolverDnDorgbr_bufferSize

    !---------------------------------------------
    ! hipsolverDnCungbr_bufferSize
    !---------------------------------------------
    function hipsolverDnCungbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(DnCungbr_bufferSize) &
       bind(C, name="hipsolverDnCungbr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCungbr_bufferSize
    end function hipsolverDnCungbr_bufferSize

    !---------------------------------------------
    ! hipsolverDnZungbr_bufferSize
    !---------------------------------------------
    function hipsolverDnZungbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(DnZungbr_bufferSize) &
       bind(C, name="hipsolverDnZungbr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZungbr_bufferSize
    end function hipsolverDnZungbr_bufferSize

    !---------------------------------------------
    ! hipsolverDnSorgbr
    !---------------------------------------------
    function hipsolverDnSorgbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnSorgbr) &
       bind(C, name="hipsolverDnSorgbr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSorgbr
    end function hipsolverDnSorgbr

    !---------------------------------------------
    ! hipsolverDnDorgbr
    !---------------------------------------------
    function hipsolverDnDorgbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnDorgbr) &
       bind(C, name="hipsolverDnDorgbr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDorgbr
    end function hipsolverDnDorgbr

    !---------------------------------------------
    ! hipsolverDnCungbr
    !---------------------------------------------
    function hipsolverDnCungbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnCungbr) &
       bind(C, name="hipsolverDnCungbr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCungbr
    end function hipsolverDnCungbr

    !---------------------------------------------
    ! hipsolverDnZungbr
    !---------------------------------------------
    function hipsolverDnZungbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnZungbr) &
       bind(C, name="hipsolverDnZungbr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZungbr
    end function hipsolverDnZungbr

    !---------------------------------------------
    ! hipsolverDnSorgqr_bufferSize
    !---------------------------------------------
    function hipsolverDnSorgqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(DnSorgqr_bufferSize) &
       bind(C, name="hipsolverDnSorgqr_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSorgqr_bufferSize
    end function hipsolverDnSorgqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnDorgqr_bufferSize
    !---------------------------------------------
    function hipsolverDnDorgqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(DnDorgqr_bufferSize) &
       bind(C, name="hipsolverDnDorgqr_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDorgqr_bufferSize
    end function hipsolverDnDorgqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnCungqr_bufferSize
    !---------------------------------------------
    function hipsolverDnCungqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(DnCungqr_bufferSize) &
       bind(C, name="hipsolverDnCungqr_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCungqr_bufferSize
    end function hipsolverDnCungqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnZungqr_bufferSize
    !---------------------------------------------
    function hipsolverDnZungqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(DnZungqr_bufferSize) &
       bind(C, name="hipsolverDnZungqr_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZungqr_bufferSize
    end function hipsolverDnZungqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnSorgqr
    !---------------------------------------------
    function hipsolverDnSorgqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnSorgqr) &
       bind(C, name="hipsolverDnSorgqr")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSorgqr
    end function hipsolverDnSorgqr

    !---------------------------------------------
    ! hipsolverDnDorgqr
    !---------------------------------------------
    function hipsolverDnDorgqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnDorgqr) &
       bind(C, name="hipsolverDnDorgqr")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDorgqr
    end function hipsolverDnDorgqr

    !---------------------------------------------
    ! hipsolverDnCungqr
    !---------------------------------------------
    function hipsolverDnCungqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnCungqr) &
       bind(C, name="hipsolverDnCungqr")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCungqr
    end function hipsolverDnCungqr

    !---------------------------------------------
    ! hipsolverDnZungqr
    !---------------------------------------------
    function hipsolverDnZungqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnZungqr) &
       bind(C, name="hipsolverDnZungqr")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZungqr
    end function hipsolverDnZungqr

    !---------------------------------------------
    ! hipsolverDnSorgtr_bufferSize
    !---------------------------------------------
    function hipsolverDnSorgtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(DnSorgtr_bufferSize) &
       bind(C, name="hipsolverDnSorgtr_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSorgtr_bufferSize
    end function hipsolverDnSorgtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnDorgtr_bufferSize
    !---------------------------------------------
    function hipsolverDnDorgtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(DnDorgtr_bufferSize) &
       bind(C, name="hipsolverDnDorgtr_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDorgtr_bufferSize
    end function hipsolverDnDorgtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnCungtr_bufferSize
    !---------------------------------------------
    function hipsolverDnCungtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(DnCungtr_bufferSize) &
       bind(C, name="hipsolverDnCungtr_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCungtr_bufferSize
    end function hipsolverDnCungtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnZungtr_bufferSize
    !---------------------------------------------
    function hipsolverDnZungtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(DnZungtr_bufferSize) &
       bind(C, name="hipsolverDnZungtr_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZungtr_bufferSize
    end function hipsolverDnZungtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnSorgtr
    !---------------------------------------------
    function hipsolverDnSorgtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(DnSorgtr) &
       bind(C, name="hipsolverDnSorgtr")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSorgtr
    end function hipsolverDnSorgtr

    !---------------------------------------------
    ! hipsolverDnDorgtr
    !---------------------------------------------
    function hipsolverDnDorgtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(DnDorgtr) &
       bind(C, name="hipsolverDnDorgtr")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDorgtr
    end function hipsolverDnDorgtr

    !---------------------------------------------
    ! hipsolverDnCungtr
    !---------------------------------------------
    function hipsolverDnCungtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(DnCungtr) &
       bind(C, name="hipsolverDnCungtr")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCungtr
    end function hipsolverDnCungtr

    !---------------------------------------------
    ! hipsolverDnZungtr
    !---------------------------------------------
    function hipsolverDnZungtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(DnZungtr) &
       bind(C, name="hipsolverDnZungtr")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZungtr
    end function hipsolverDnZungtr

    !---------------------------------------------
    ! hipsolverDnSormqr_bufferSize
    !---------------------------------------------
    function hipsolverDnSormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnSormqr_bufferSize) &
       bind(C, name="hipsolverDnSormqr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSormqr_bufferSize
    end function hipsolverDnSormqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnDormqr_bufferSize
    !---------------------------------------------
    function hipsolverDnDormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnDormqr_bufferSize) &
       bind(C, name="hipsolverDnDormqr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDormqr_bufferSize
    end function hipsolverDnDormqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnCunmqr_bufferSize
    !---------------------------------------------
    function hipsolverDnCunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnCunmqr_bufferSize) &
       bind(C, name="hipsolverDnCunmqr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCunmqr_bufferSize
    end function hipsolverDnCunmqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnZunmqr_bufferSize
    !---------------------------------------------
    function hipsolverDnZunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnZunmqr_bufferSize) &
       bind(C, name="hipsolverDnZunmqr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZunmqr_bufferSize
    end function hipsolverDnZunmqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnSormqr
    !---------------------------------------------
    function hipsolverDnSormqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnSormqr) &
       bind(C, name="hipsolverDnSormqr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSormqr
    end function hipsolverDnSormqr

    !---------------------------------------------
    ! hipsolverDnDormqr
    !---------------------------------------------
    function hipsolverDnDormqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnDormqr) &
       bind(C, name="hipsolverDnDormqr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDormqr
    end function hipsolverDnDormqr

    !---------------------------------------------
    ! hipsolverDnCunmqr
    !---------------------------------------------
    function hipsolverDnCunmqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnCunmqr) &
       bind(C, name="hipsolverDnCunmqr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCunmqr
    end function hipsolverDnCunmqr

    !---------------------------------------------
    ! hipsolverDnZunmqr
    !---------------------------------------------
    function hipsolverDnZunmqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnZunmqr) &
       bind(C, name="hipsolverDnZunmqr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZunmqr
    end function hipsolverDnZunmqr

    !---------------------------------------------
    ! hipsolverDnSormtr_bufferSize
    !---------------------------------------------
    function hipsolverDnSormtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnSormtr_bufferSize) &
       bind(C, name="hipsolverDnSormtr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_FILL_MODE_UPPER, HIPSOLVER_OP_N, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSormtr_bufferSize
    end function hipsolverDnSormtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnDormtr_bufferSize
    !---------------------------------------------
    function hipsolverDnDormtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnDormtr_bufferSize) &
       bind(C, name="hipsolverDnDormtr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_FILL_MODE_UPPER, HIPSOLVER_OP_N, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDormtr_bufferSize
    end function hipsolverDnDormtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnCunmtr_bufferSize
    !---------------------------------------------
    function hipsolverDnCunmtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnCunmtr_bufferSize) &
       bind(C, name="hipsolverDnCunmtr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_FILL_MODE_UPPER, HIPSOLVER_OP_N, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCunmtr_bufferSize
    end function hipsolverDnCunmtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnZunmtr_bufferSize
    !---------------------------------------------
    function hipsolverDnZunmtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnZunmtr_bufferSize) &
       bind(C, name="hipsolverDnZunmtr_bufferSize")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_FILL_MODE_UPPER, HIPSOLVER_OP_N, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZunmtr_bufferSize
    end function hipsolverDnZunmtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnSormtr
    !---------------------------------------------
    function hipsolverDnSormtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnSormtr) &
       bind(C, name="hipsolverDnSormtr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_FILL_MODE_UPPER, HIPSOLVER_OP_N, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSormtr
    end function hipsolverDnSormtr

    !---------------------------------------------
    ! hipsolverDnDormtr
    !---------------------------------------------
    function hipsolverDnDormtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnDormtr) &
       bind(C, name="hipsolverDnDormtr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_FILL_MODE_UPPER, HIPSOLVER_OP_N, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDormtr
    end function hipsolverDnDormtr

    !---------------------------------------------
    ! hipsolverDnCunmtr
    !---------------------------------------------
    function hipsolverDnCunmtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnCunmtr) &
       bind(C, name="hipsolverDnCunmtr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_FILL_MODE_UPPER, HIPSOLVER_OP_N, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCunmtr
    end function hipsolverDnCunmtr

    !---------------------------------------------
    ! hipsolverDnZunmtr
    !---------------------------------------------
    function hipsolverDnZunmtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnZunmtr) &
       bind(C, name="hipsolverDnZunmtr")
       import :: c_ptr, HIPSOLVER_SIDE_LEFT, HIPSOLVER_FILL_MODE_UPPER, HIPSOLVER_OP_N, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_SIDE_LEFT)), value :: side
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZunmtr
    end function hipsolverDnZunmtr

    !---------------------------------------------
    ! hipsolverDnSgebrd_bufferSize
    !---------------------------------------------
    function hipsolverDnSgebrd_bufferSize(handle, m, n, lwork) &
       result(DnSgebrd_bufferSize) &
       bind(C, name="hipsolverDnSgebrd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgebrd_bufferSize
    end function hipsolverDnSgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgebrd_bufferSize
    !---------------------------------------------
    function hipsolverDnDgebrd_bufferSize(handle, m, n, lwork) &
       result(DnDgebrd_bufferSize) &
       bind(C, name="hipsolverDnDgebrd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgebrd_bufferSize
    end function hipsolverDnDgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgebrd_bufferSize
    !---------------------------------------------
    function hipsolverDnCgebrd_bufferSize(handle, m, n, lwork) &
       result(DnCgebrd_bufferSize) &
       bind(C, name="hipsolverDnCgebrd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgebrd_bufferSize
    end function hipsolverDnCgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgebrd_bufferSize
    !---------------------------------------------
    function hipsolverDnZgebrd_bufferSize(handle, m, n, lwork) &
       result(DnZgebrd_bufferSize) &
       bind(C, name="hipsolverDnZgebrd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgebrd_bufferSize
    end function hipsolverDnZgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgebrd
    !---------------------------------------------
    function hipsolverDnSgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(DnSgebrd) &
       bind(C, name="hipsolverDnSgebrd")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tauq
       type(c_ptr), value :: taup
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgebrd
    end function hipsolverDnSgebrd

    !---------------------------------------------
    ! hipsolverDnDgebrd
    !---------------------------------------------
    function hipsolverDnDgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(DnDgebrd) &
       bind(C, name="hipsolverDnDgebrd")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tauq
       type(c_ptr), value :: taup
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgebrd
    end function hipsolverDnDgebrd

    !---------------------------------------------
    ! hipsolverDnCgebrd
    !---------------------------------------------
    function hipsolverDnCgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(DnCgebrd) &
       bind(C, name="hipsolverDnCgebrd")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tauq
       type(c_ptr), value :: taup
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgebrd
    end function hipsolverDnCgebrd

    !---------------------------------------------
    ! hipsolverDnZgebrd
    !---------------------------------------------
    function hipsolverDnZgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(DnZgebrd) &
       bind(C, name="hipsolverDnZgebrd")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tauq
       type(c_ptr), value :: taup
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgebrd
    end function hipsolverDnZgebrd

    !---------------------------------------------
    ! hipsolverDnSSgels_bufferSize
    !---------------------------------------------
    function hipsolverDnSSgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork) &
       result(DnSSgels_bufferSize) &
       bind(C, name="hipsolverDnSSgels_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSSgels_bufferSize
    end function hipsolverDnSSgels_bufferSize

    !---------------------------------------------
    ! hipsolverDnDDgels_bufferSize
    !---------------------------------------------
    function hipsolverDnDDgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork) &
       result(DnDDgels_bufferSize) &
       bind(C, name="hipsolverDnDDgels_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDDgels_bufferSize
    end function hipsolverDnDDgels_bufferSize

    !---------------------------------------------
    ! hipsolverDnCCgels_bufferSize
    !---------------------------------------------
    function hipsolverDnCCgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork) &
       result(DnCCgels_bufferSize) &
       bind(C, name="hipsolverDnCCgels_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCCgels_bufferSize
    end function hipsolverDnCCgels_bufferSize

    !---------------------------------------------
    ! hipsolverDnZZgels_bufferSize
    !---------------------------------------------
    function hipsolverDnZZgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork) &
       result(DnZZgels_bufferSize) &
       bind(C, name="hipsolverDnZZgels_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZZgels_bufferSize
    end function hipsolverDnZZgels_bufferSize

    !---------------------------------------------
    ! hipsolverDnSSgels
    !---------------------------------------------
    function hipsolverDnSSgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                               devInfo) &
       result(DnSSgels) &
       bind(C, name="hipsolverDnSSgels")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSSgels
    end function hipsolverDnSSgels

    !---------------------------------------------
    ! hipsolverDnDDgels
    !---------------------------------------------
    function hipsolverDnDDgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                               devInfo) &
       result(DnDDgels) &
       bind(C, name="hipsolverDnDDgels")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDDgels
    end function hipsolverDnDDgels

    !---------------------------------------------
    ! hipsolverDnCCgels
    !---------------------------------------------
    function hipsolverDnCCgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                               devInfo) &
       result(DnCCgels) &
       bind(C, name="hipsolverDnCCgels")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCCgels
    end function hipsolverDnCCgels

    !---------------------------------------------
    ! hipsolverDnZZgels
    !---------------------------------------------
    function hipsolverDnZZgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                               devInfo) &
       result(DnZZgels) &
       bind(C, name="hipsolverDnZZgels")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZZgels
    end function hipsolverDnZZgels

    !---------------------------------------------
    ! hipsolverDnSgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverDnSgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnSgeqrf_bufferSize) &
       bind(C, name="hipsolverDnSgeqrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgeqrf_bufferSize
    end function hipsolverDnSgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverDnDgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnDgeqrf_bufferSize) &
       bind(C, name="hipsolverDnDgeqrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgeqrf_bufferSize
    end function hipsolverDnDgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverDnCgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnCgeqrf_bufferSize) &
       bind(C, name="hipsolverDnCgeqrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgeqrf_bufferSize
    end function hipsolverDnCgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverDnZgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnZgeqrf_bufferSize) &
       bind(C, name="hipsolverDnZgeqrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgeqrf_bufferSize
    end function hipsolverDnZgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgeqrf
    !---------------------------------------------
    function hipsolverDnSgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(DnSgeqrf) &
       bind(C, name="hipsolverDnSgeqrf")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgeqrf
    end function hipsolverDnSgeqrf

    !---------------------------------------------
    ! hipsolverDnDgeqrf
    !---------------------------------------------
    function hipsolverDnDgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(DnDgeqrf) &
       bind(C, name="hipsolverDnDgeqrf")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgeqrf
    end function hipsolverDnDgeqrf

    !---------------------------------------------
    ! hipsolverDnCgeqrf
    !---------------------------------------------
    function hipsolverDnCgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(DnCgeqrf) &
       bind(C, name="hipsolverDnCgeqrf")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgeqrf
    end function hipsolverDnCgeqrf

    !---------------------------------------------
    ! hipsolverDnZgeqrf
    !---------------------------------------------
    function hipsolverDnZgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(DnZgeqrf) &
       bind(C, name="hipsolverDnZgeqrf")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgeqrf
    end function hipsolverDnZgeqrf

    !---------------------------------------------
    ! hipsolverDnSSgesv_bufferSize
    !---------------------------------------------
    function hipsolverDnSSgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, &
                                          lwork) &
       result(DnSSgesv_bufferSize) &
       bind(C, name="hipsolverDnSSgesv_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSSgesv_bufferSize
    end function hipsolverDnSSgesv_bufferSize

    !---------------------------------------------
    ! hipsolverDnDDgesv_bufferSize
    !---------------------------------------------
    function hipsolverDnDDgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, &
                                          lwork) &
       result(DnDDgesv_bufferSize) &
       bind(C, name="hipsolverDnDDgesv_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDDgesv_bufferSize
    end function hipsolverDnDDgesv_bufferSize

    !---------------------------------------------
    ! hipsolverDnCCgesv_bufferSize
    !---------------------------------------------
    function hipsolverDnCCgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, &
                                          lwork) &
       result(DnCCgesv_bufferSize) &
       bind(C, name="hipsolverDnCCgesv_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCCgesv_bufferSize
    end function hipsolverDnCCgesv_bufferSize

    !---------------------------------------------
    ! hipsolverDnZZgesv_bufferSize
    !---------------------------------------------
    function hipsolverDnZZgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, &
                                          lwork) &
       result(DnZZgesv_bufferSize) &
       bind(C, name="hipsolverDnZZgesv_bufferSize")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZZgesv_bufferSize
    end function hipsolverDnZZgesv_bufferSize

    !---------------------------------------------
    ! hipsolverDnSSgesv
    !---------------------------------------------
    function hipsolverDnSSgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                               niters, devInfo) &
       result(DnSSgesv) &
       bind(C, name="hipsolverDnSSgesv")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSSgesv
    end function hipsolverDnSSgesv

    !---------------------------------------------
    ! hipsolverDnDDgesv
    !---------------------------------------------
    function hipsolverDnDDgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                               niters, devInfo) &
       result(DnDDgesv) &
       bind(C, name="hipsolverDnDDgesv")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDDgesv
    end function hipsolverDnDDgesv

    !---------------------------------------------
    ! hipsolverDnCCgesv
    !---------------------------------------------
    function hipsolverDnCCgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                               niters, devInfo) &
       result(DnCCgesv) &
       bind(C, name="hipsolverDnCCgesv")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCCgesv
    end function hipsolverDnCCgesv

    !---------------------------------------------
    ! hipsolverDnZZgesv
    !---------------------------------------------
    function hipsolverDnZZgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                               niters, devInfo) &
       result(DnZZgesv) &
       bind(C, name="hipsolverDnZZgesv")
       import :: c_ptr, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_size_t), value :: lwork
       type(c_ptr), value :: niters
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZZgesv
    end function hipsolverDnZZgesv

    !---------------------------------------------
    ! hipsolverDnSgesvd_bufferSize
    !---------------------------------------------
    function hipsolverDnSgesvd_bufferSize(handle, m, n, lwork) &
       result(DnSgesvd_bufferSize) &
       bind(C, name="hipsolverDnSgesvd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgesvd_bufferSize
    end function hipsolverDnSgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgesvd_bufferSize
    !---------------------------------------------
    function hipsolverDnDgesvd_bufferSize(handle, m, n, lwork) &
       result(DnDgesvd_bufferSize) &
       bind(C, name="hipsolverDnDgesvd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgesvd_bufferSize
    end function hipsolverDnDgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgesvd_bufferSize
    !---------------------------------------------
    function hipsolverDnCgesvd_bufferSize(handle, m, n, lwork) &
       result(DnCgesvd_bufferSize) &
       bind(C, name="hipsolverDnCgesvd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgesvd_bufferSize
    end function hipsolverDnCgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgesvd_bufferSize
    !---------------------------------------------
    function hipsolverDnZgesvd_bufferSize(handle, m, n, lwork) &
       result(DnZgesvd_bufferSize) &
       bind(C, name="hipsolverDnZgesvd_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgesvd_bufferSize
    end function hipsolverDnZgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgesvd
    !---------------------------------------------
    function hipsolverDnSgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                               rwork, devInfo) &
       result(DnSgesvd) &
       bind(C, name="hipsolverDnSgesvd")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: rwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgesvd
    end function hipsolverDnSgesvd

    !---------------------------------------------
    ! hipsolverDnDgesvd
    !---------------------------------------------
    function hipsolverDnDgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                               rwork, devInfo) &
       result(DnDgesvd) &
       bind(C, name="hipsolverDnDgesvd")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: rwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgesvd
    end function hipsolverDnDgesvd

    !---------------------------------------------
    ! hipsolverDnCgesvd
    !---------------------------------------------
    function hipsolverDnCgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                               rwork, devInfo) &
       result(DnCgesvd) &
       bind(C, name="hipsolverDnCgesvd")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: rwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgesvd
    end function hipsolverDnCgesvd

    !---------------------------------------------
    ! hipsolverDnZgesvd
    !---------------------------------------------
    function hipsolverDnZgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                               rwork, devInfo) &
       result(DnZgesvd) &
       bind(C, name="hipsolverDnZgesvd")
       import :: c_ptr, c_char, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       character(c_char), value :: jobu
       character(c_char), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: rwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgesvd
    end function hipsolverDnZgesvd

    !---------------------------------------------
    ! hipsolverDnSgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverDnSgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                           lwork, params) &
       result(DnSgesvdj_bufferSize) &
       bind(C, name="hipsolverDnSgesvdj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgesvdj_bufferSize
    end function hipsolverDnSgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverDnDgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                           lwork, params) &
       result(DnDgesvdj_bufferSize) &
       bind(C, name="hipsolverDnDgesvdj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgesvdj_bufferSize
    end function hipsolverDnDgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverDnCgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                           lwork, params) &
       result(DnCgesvdj_bufferSize) &
       bind(C, name="hipsolverDnCgesvdj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgesvdj_bufferSize
    end function hipsolverDnCgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverDnZgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                           lwork, params) &
       result(DnZgesvdj_bufferSize) &
       bind(C, name="hipsolverDnZgesvdj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgesvdj_bufferSize
    end function hipsolverDnZgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgesvdj
    !---------------------------------------------
    function hipsolverDnSgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                devInfo, params) &
       result(DnSgesvdj) &
       bind(C, name="hipsolverDnSgesvdj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgesvdj
    end function hipsolverDnSgesvdj

    !---------------------------------------------
    ! hipsolverDnDgesvdj
    !---------------------------------------------
    function hipsolverDnDgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                devInfo, params) &
       result(DnDgesvdj) &
       bind(C, name="hipsolverDnDgesvdj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgesvdj
    end function hipsolverDnDgesvdj

    !---------------------------------------------
    ! hipsolverDnCgesvdj
    !---------------------------------------------
    function hipsolverDnCgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                devInfo, params) &
       result(DnCgesvdj) &
       bind(C, name="hipsolverDnCgesvdj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgesvdj
    end function hipsolverDnCgesvdj

    !---------------------------------------------
    ! hipsolverDnZgesvdj
    !---------------------------------------------
    function hipsolverDnZgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                devInfo, params) &
       result(DnZgesvdj) &
       bind(C, name="hipsolverDnZgesvdj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgesvdj
    end function hipsolverDnZgesvdj

    !---------------------------------------------
    ! hipsolverDnSgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnSgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                  lwork, params, batch_count) &
       result(DnSgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverDnSgesvdjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgesvdjBatched_bufferSize
    end function hipsolverDnSgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnDgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                  lwork, params, batch_count) &
       result(DnDgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverDnDgesvdjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgesvdjBatched_bufferSize
    end function hipsolverDnDgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnCgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                  lwork, params, batch_count) &
       result(DnCgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverDnCgesvdjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgesvdjBatched_bufferSize
    end function hipsolverDnCgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnZgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                  lwork, params, batch_count) &
       result(DnZgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverDnZgesvdjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgesvdjBatched_bufferSize
    end function hipsolverDnZgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgesvdjBatched
    !---------------------------------------------
    function hipsolverDnSgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                       devInfo, params, batch_count) &
       result(DnSgesvdjBatched) &
       bind(C, name="hipsolverDnSgesvdjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgesvdjBatched
    end function hipsolverDnSgesvdjBatched

    !---------------------------------------------
    ! hipsolverDnDgesvdjBatched
    !---------------------------------------------
    function hipsolverDnDgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                       devInfo, params, batch_count) &
       result(DnDgesvdjBatched) &
       bind(C, name="hipsolverDnDgesvdjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgesvdjBatched
    end function hipsolverDnDgesvdjBatched

    !---------------------------------------------
    ! hipsolverDnCgesvdjBatched
    !---------------------------------------------
    function hipsolverDnCgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                       devInfo, params, batch_count) &
       result(DnCgesvdjBatched) &
       bind(C, name="hipsolverDnCgesvdjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgesvdjBatched
    end function hipsolverDnCgesvdjBatched

    !---------------------------------------------
    ! hipsolverDnZgesvdjBatched
    !---------------------------------------------
    function hipsolverDnZgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                       devInfo, params, batch_count) &
       result(DnZgesvdjBatched) &
       bind(C, name="hipsolverDnZgesvdjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: S
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgesvdjBatched
    end function hipsolverDnZgesvdjBatched

    !---------------------------------------------
    ! hipsolverDnSgesvdaStridedBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnSgesvdaStridedBatched_bufferSize(handle, jobz, rank, m, n, A, lda, &
                                                         strideA, S, strideS, U, ldu, strideU, V, &
                                                         ldv, strideV, lwork, batch_count) &
       result(DnSgesvdaStridedBatched_bufferSize) &
       bind(C, name="hipsolverDnSgesvdaStridedBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, c_int64_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       type(c_ptr), value :: S
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgesvdaStridedBatched_bufferSize
    end function hipsolverDnSgesvdaStridedBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgesvdaStridedBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnDgesvdaStridedBatched_bufferSize(handle, jobz, rank, m, n, A, lda, &
                                                         strideA, S, strideS, U, ldu, strideU, V, &
                                                         ldv, strideV, lwork, batch_count) &
       result(DnDgesvdaStridedBatched_bufferSize) &
       bind(C, name="hipsolverDnDgesvdaStridedBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, c_int64_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       type(c_ptr), value :: S
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgesvdaStridedBatched_bufferSize
    end function hipsolverDnDgesvdaStridedBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgesvdaStridedBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnCgesvdaStridedBatched_bufferSize(handle, jobz, rank, m, n, A, lda, &
                                                         strideA, S, strideS, U, ldu, strideU, V, &
                                                         ldv, strideV, lwork, batch_count) &
       result(DnCgesvdaStridedBatched_bufferSize) &
       bind(C, name="hipsolverDnCgesvdaStridedBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, c_int64_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       type(c_ptr), value :: S
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgesvdaStridedBatched_bufferSize
    end function hipsolverDnCgesvdaStridedBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgesvdaStridedBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnZgesvdaStridedBatched_bufferSize(handle, jobz, rank, m, n, A, lda, &
                                                         strideA, S, strideS, U, ldu, strideU, V, &
                                                         ldv, strideV, lwork, batch_count) &
       result(DnZgesvdaStridedBatched_bufferSize) &
       bind(C, name="hipsolverDnZgesvdaStridedBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, c_int64_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       type(c_ptr), value :: S
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       integer(c_int) :: lwork
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgesvdaStridedBatched_bufferSize
    end function hipsolverDnZgesvdaStridedBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgesvdaStridedBatched
    !---------------------------------------------
    function hipsolverDnSgesvdaStridedBatched(handle, jobz, rank, m, n, A, lda, strideA, S, &
                                              strideS, U, ldu, strideU, V, ldv, strideV, work, &
                                              lwork, devInfo, hRnrmF, batch_count) &
       result(DnSgesvdaStridedBatched) &
       bind(C, name="hipsolverDnSgesvdaStridedBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, c_int64_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       type(c_ptr), value :: S
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: hRnrmF
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgesvdaStridedBatched
    end function hipsolverDnSgesvdaStridedBatched

    !---------------------------------------------
    ! hipsolverDnDgesvdaStridedBatched
    !---------------------------------------------
    function hipsolverDnDgesvdaStridedBatched(handle, jobz, rank, m, n, A, lda, strideA, S, &
                                              strideS, U, ldu, strideU, V, ldv, strideV, work, &
                                              lwork, devInfo, hRnrmF, batch_count) &
       result(DnDgesvdaStridedBatched) &
       bind(C, name="hipsolverDnDgesvdaStridedBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, c_int64_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       type(c_ptr), value :: S
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: hRnrmF
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgesvdaStridedBatched
    end function hipsolverDnDgesvdaStridedBatched

    !---------------------------------------------
    ! hipsolverDnCgesvdaStridedBatched
    !---------------------------------------------
    function hipsolverDnCgesvdaStridedBatched(handle, jobz, rank, m, n, A, lda, strideA, S, &
                                              strideS, U, ldu, strideU, V, ldv, strideV, work, &
                                              lwork, devInfo, hRnrmF, batch_count) &
       result(DnCgesvdaStridedBatched) &
       bind(C, name="hipsolverDnCgesvdaStridedBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, c_int64_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       type(c_ptr), value :: S
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: hRnrmF
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgesvdaStridedBatched
    end function hipsolverDnCgesvdaStridedBatched

    !---------------------------------------------
    ! hipsolverDnZgesvdaStridedBatched
    !---------------------------------------------
    function hipsolverDnZgesvdaStridedBatched(handle, jobz, rank, m, n, A, lda, strideA, S, &
                                              strideS, U, ldu, strideU, V, ldv, strideV, work, &
                                              lwork, devInfo, hRnrmF, batch_count) &
       result(DnZgesvdaStridedBatched) &
       bind(C, name="hipsolverDnZgesvdaStridedBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int, c_int64_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       type(c_ptr), value :: S
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: hRnrmF
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgesvdaStridedBatched
    end function hipsolverDnZgesvdaStridedBatched

    !---------------------------------------------
    ! hipsolverDnSgetrf_bufferSize
    !---------------------------------------------
    function hipsolverDnSgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnSgetrf_bufferSize) &
       bind(C, name="hipsolverDnSgetrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgetrf_bufferSize
    end function hipsolverDnSgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgetrf_bufferSize
    !---------------------------------------------
    function hipsolverDnDgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnDgetrf_bufferSize) &
       bind(C, name="hipsolverDnDgetrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgetrf_bufferSize
    end function hipsolverDnDgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgetrf_bufferSize
    !---------------------------------------------
    function hipsolverDnCgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnCgetrf_bufferSize) &
       bind(C, name="hipsolverDnCgetrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgetrf_bufferSize
    end function hipsolverDnCgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgetrf_bufferSize
    !---------------------------------------------
    function hipsolverDnZgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnZgetrf_bufferSize) &
       bind(C, name="hipsolverDnZgetrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgetrf_bufferSize
    end function hipsolverDnZgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgetrf
    !---------------------------------------------
    function hipsolverDnSgetrf(handle, m, n, A, lda, work, devIpiv, devInfo) &
       result(DnSgetrf) &
       bind(C, name="hipsolverDnSgetrf")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgetrf
    end function hipsolverDnSgetrf

    !---------------------------------------------
    ! hipsolverDnDgetrf
    !---------------------------------------------
    function hipsolverDnDgetrf(handle, m, n, A, lda, work, devIpiv, devInfo) &
       result(DnDgetrf) &
       bind(C, name="hipsolverDnDgetrf")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgetrf
    end function hipsolverDnDgetrf

    !---------------------------------------------
    ! hipsolverDnCgetrf
    !---------------------------------------------
    function hipsolverDnCgetrf(handle, m, n, A, lda, work, devIpiv, devInfo) &
       result(DnCgetrf) &
       bind(C, name="hipsolverDnCgetrf")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgetrf
    end function hipsolverDnCgetrf

    !---------------------------------------------
    ! hipsolverDnZgetrf
    !---------------------------------------------
    function hipsolverDnZgetrf(handle, m, n, A, lda, work, devIpiv, devInfo) &
       result(DnZgetrf) &
       bind(C, name="hipsolverDnZgetrf")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgetrf
    end function hipsolverDnZgetrf

    !---------------------------------------------
    ! hipsolverDnSgetrs
    !---------------------------------------------
    function hipsolverDnSgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, devInfo) &
       result(DnSgetrs) &
       bind(C, name="hipsolverDnSgetrs")
       import :: c_ptr, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSgetrs
    end function hipsolverDnSgetrs

    !---------------------------------------------
    ! hipsolverDnDgetrs
    !---------------------------------------------
    function hipsolverDnDgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, devInfo) &
       result(DnDgetrs) &
       bind(C, name="hipsolverDnDgetrs")
       import :: c_ptr, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDgetrs
    end function hipsolverDnDgetrs

    !---------------------------------------------
    ! hipsolverDnCgetrs
    !---------------------------------------------
    function hipsolverDnCgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, devInfo) &
       result(DnCgetrs) &
       bind(C, name="hipsolverDnCgetrs")
       import :: c_ptr, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCgetrs
    end function hipsolverDnCgetrs

    !---------------------------------------------
    ! hipsolverDnZgetrs
    !---------------------------------------------
    function hipsolverDnZgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, devInfo) &
       result(DnZgetrs) &
       bind(C, name="hipsolverDnZgetrs")
       import :: c_ptr, HIPSOLVER_OP_N, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devIpiv
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZgetrs
    end function hipsolverDnZgetrs

    !---------------------------------------------
    ! hipsolverDnSpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDnSpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnSpotrf_bufferSize) &
       bind(C, name="hipsolverDnSpotrf_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSpotrf_bufferSize
    end function hipsolverDnSpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnDpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDnDpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnDpotrf_bufferSize) &
       bind(C, name="hipsolverDnDpotrf_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDpotrf_bufferSize
    end function hipsolverDnDpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnCpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDnCpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnCpotrf_bufferSize) &
       bind(C, name="hipsolverDnCpotrf_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCpotrf_bufferSize
    end function hipsolverDnCpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnZpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDnZpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnZpotrf_bufferSize) &
       bind(C, name="hipsolverDnZpotrf_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZpotrf_bufferSize
    end function hipsolverDnZpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnSpotrf
    !---------------------------------------------
    function hipsolverDnSpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnSpotrf) &
       bind(C, name="hipsolverDnSpotrf")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSpotrf
    end function hipsolverDnSpotrf

    !---------------------------------------------
    ! hipsolverDnDpotrf
    !---------------------------------------------
    function hipsolverDnDpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnDpotrf) &
       bind(C, name="hipsolverDnDpotrf")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDpotrf
    end function hipsolverDnDpotrf

    !---------------------------------------------
    ! hipsolverDnCpotrf
    !---------------------------------------------
    function hipsolverDnCpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnCpotrf) &
       bind(C, name="hipsolverDnCpotrf")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCpotrf
    end function hipsolverDnCpotrf

    !---------------------------------------------
    ! hipsolverDnZpotrf
    !---------------------------------------------
    function hipsolverDnZpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnZpotrf) &
       bind(C, name="hipsolverDnZpotrf")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZpotrf
    end function hipsolverDnZpotrf

    !---------------------------------------------
    ! hipsolverDnSpotrfBatched
    !---------------------------------------------
    function hipsolverDnSpotrfBatched(handle, uplo, n, A, lda, devInfo, batch_count) &
       result(DnSpotrfBatched) &
       bind(C, name="hipsolverDnSpotrfBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSpotrfBatched
    end function hipsolverDnSpotrfBatched

    !---------------------------------------------
    ! hipsolverDnDpotrfBatched
    !---------------------------------------------
    function hipsolverDnDpotrfBatched(handle, uplo, n, A, lda, devInfo, batch_count) &
       result(DnDpotrfBatched) &
       bind(C, name="hipsolverDnDpotrfBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDpotrfBatched
    end function hipsolverDnDpotrfBatched

    !---------------------------------------------
    ! hipsolverDnCpotrfBatched
    !---------------------------------------------
    function hipsolverDnCpotrfBatched(handle, uplo, n, A, lda, devInfo, batch_count) &
       result(DnCpotrfBatched) &
       bind(C, name="hipsolverDnCpotrfBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCpotrfBatched
    end function hipsolverDnCpotrfBatched

    !---------------------------------------------
    ! hipsolverDnZpotrfBatched
    !---------------------------------------------
    function hipsolverDnZpotrfBatched(handle, uplo, n, A, lda, devInfo, batch_count) &
       result(DnZpotrfBatched) &
       bind(C, name="hipsolverDnZpotrfBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZpotrfBatched
    end function hipsolverDnZpotrfBatched

    !---------------------------------------------
    ! hipsolverDnSpotri_bufferSize
    !---------------------------------------------
    function hipsolverDnSpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnSpotri_bufferSize) &
       bind(C, name="hipsolverDnSpotri_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSpotri_bufferSize
    end function hipsolverDnSpotri_bufferSize

    !---------------------------------------------
    ! hipsolverDnDpotri_bufferSize
    !---------------------------------------------
    function hipsolverDnDpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnDpotri_bufferSize) &
       bind(C, name="hipsolverDnDpotri_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDpotri_bufferSize
    end function hipsolverDnDpotri_bufferSize

    !---------------------------------------------
    ! hipsolverDnCpotri_bufferSize
    !---------------------------------------------
    function hipsolverDnCpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnCpotri_bufferSize) &
       bind(C, name="hipsolverDnCpotri_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCpotri_bufferSize
    end function hipsolverDnCpotri_bufferSize

    !---------------------------------------------
    ! hipsolverDnZpotri_bufferSize
    !---------------------------------------------
    function hipsolverDnZpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnZpotri_bufferSize) &
       bind(C, name="hipsolverDnZpotri_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZpotri_bufferSize
    end function hipsolverDnZpotri_bufferSize

    !---------------------------------------------
    ! hipsolverDnSpotri
    !---------------------------------------------
    function hipsolverDnSpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnSpotri) &
       bind(C, name="hipsolverDnSpotri")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSpotri
    end function hipsolverDnSpotri

    !---------------------------------------------
    ! hipsolverDnDpotri
    !---------------------------------------------
    function hipsolverDnDpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnDpotri) &
       bind(C, name="hipsolverDnDpotri")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDpotri
    end function hipsolverDnDpotri

    !---------------------------------------------
    ! hipsolverDnCpotri
    !---------------------------------------------
    function hipsolverDnCpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnCpotri) &
       bind(C, name="hipsolverDnCpotri")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCpotri
    end function hipsolverDnCpotri

    !---------------------------------------------
    ! hipsolverDnZpotri
    !---------------------------------------------
    function hipsolverDnZpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnZpotri) &
       bind(C, name="hipsolverDnZpotri")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZpotri
    end function hipsolverDnZpotri

    !---------------------------------------------
    ! hipsolverDnSpotrs
    !---------------------------------------------
    function hipsolverDnSpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo) &
       result(DnSpotrs) &
       bind(C, name="hipsolverDnSpotrs")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSpotrs
    end function hipsolverDnSpotrs

    !---------------------------------------------
    ! hipsolverDnDpotrs
    !---------------------------------------------
    function hipsolverDnDpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo) &
       result(DnDpotrs) &
       bind(C, name="hipsolverDnDpotrs")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDpotrs
    end function hipsolverDnDpotrs

    !---------------------------------------------
    ! hipsolverDnCpotrs
    !---------------------------------------------
    function hipsolverDnCpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo) &
       result(DnCpotrs) &
       bind(C, name="hipsolverDnCpotrs")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCpotrs
    end function hipsolverDnCpotrs

    !---------------------------------------------
    ! hipsolverDnZpotrs
    !---------------------------------------------
    function hipsolverDnZpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo) &
       result(DnZpotrs) &
       bind(C, name="hipsolverDnZpotrs")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZpotrs
    end function hipsolverDnZpotrs

    !---------------------------------------------
    ! hipsolverDnSpotrsBatched
    !---------------------------------------------
    function hipsolverDnSpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo, batch_count) &
       result(DnSpotrsBatched) &
       bind(C, name="hipsolverDnSpotrsBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSpotrsBatched
    end function hipsolverDnSpotrsBatched

    !---------------------------------------------
    ! hipsolverDnDpotrsBatched
    !---------------------------------------------
    function hipsolverDnDpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo, batch_count) &
       result(DnDpotrsBatched) &
       bind(C, name="hipsolverDnDpotrsBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDpotrsBatched
    end function hipsolverDnDpotrsBatched

    !---------------------------------------------
    ! hipsolverDnCpotrsBatched
    !---------------------------------------------
    function hipsolverDnCpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo, batch_count) &
       result(DnCpotrsBatched) &
       bind(C, name="hipsolverDnCpotrsBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCpotrsBatched
    end function hipsolverDnCpotrsBatched

    !---------------------------------------------
    ! hipsolverDnZpotrsBatched
    !---------------------------------------------
    function hipsolverDnZpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo, batch_count) &
       result(DnZpotrsBatched) &
       bind(C, name="hipsolverDnZpotrsBatched")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: devInfo
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZpotrsBatched
    end function hipsolverDnZpotrsBatched

    !---------------------------------------------
    ! hipsolverDnSsyevd_bufferSize
    !---------------------------------------------
    function hipsolverDnSsyevd_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork) &
       result(DnSsyevd_bufferSize) &
       bind(C, name="hipsolverDnSsyevd_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsyevd_bufferSize
    end function hipsolverDnSsyevd_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsyevd_bufferSize
    !---------------------------------------------
    function hipsolverDnDsyevd_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork) &
       result(DnDsyevd_bufferSize) &
       bind(C, name="hipsolverDnDsyevd_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsyevd_bufferSize
    end function hipsolverDnDsyevd_bufferSize

    !---------------------------------------------
    ! hipsolverDnCheevd_bufferSize
    !---------------------------------------------
    function hipsolverDnCheevd_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork) &
       result(DnCheevd_bufferSize) &
       bind(C, name="hipsolverDnCheevd_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCheevd_bufferSize
    end function hipsolverDnCheevd_bufferSize

    !---------------------------------------------
    ! hipsolverDnZheevd_bufferSize
    !---------------------------------------------
    function hipsolverDnZheevd_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork) &
       result(DnZheevd_bufferSize) &
       bind(C, name="hipsolverDnZheevd_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZheevd_bufferSize
    end function hipsolverDnZheevd_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsyevd
    !---------------------------------------------
    function hipsolverDnSsyevd(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo) &
       result(DnSsyevd) &
       bind(C, name="hipsolverDnSsyevd")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsyevd
    end function hipsolverDnSsyevd

    !---------------------------------------------
    ! hipsolverDnDsyevd
    !---------------------------------------------
    function hipsolverDnDsyevd(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo) &
       result(DnDsyevd) &
       bind(C, name="hipsolverDnDsyevd")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsyevd
    end function hipsolverDnDsyevd

    !---------------------------------------------
    ! hipsolverDnCheevd
    !---------------------------------------------
    function hipsolverDnCheevd(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo) &
       result(DnCheevd) &
       bind(C, name="hipsolverDnCheevd")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCheevd
    end function hipsolverDnCheevd

    !---------------------------------------------
    ! hipsolverDnZheevd
    !---------------------------------------------
    function hipsolverDnZheevd(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo) &
       result(DnZheevd) &
       bind(C, name="hipsolverDnZheevd")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZheevd
    end function hipsolverDnZheevd

    !---------------------------------------------
    ! hipsolverDnSsyevdx_bufferSize
    !---------------------------------------------
    function hipsolverDnSsyevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                           nev, W, lwork) &
       result(DnSsyevdx_bufferSize) &
       bind(C, name="hipsolverDnSsyevdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsyevdx_bufferSize
    end function hipsolverDnSsyevdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsyevdx_bufferSize
    !---------------------------------------------
    function hipsolverDnDsyevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                           nev, W, lwork) &
       result(DnDsyevdx_bufferSize) &
       bind(C, name="hipsolverDnDsyevdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsyevdx_bufferSize
    end function hipsolverDnDsyevdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnCheevdx_bufferSize
    !---------------------------------------------
    function hipsolverDnCheevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                           nev, W, lwork) &
       result(DnCheevdx_bufferSize) &
       bind(C, name="hipsolverDnCheevdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCheevdx_bufferSize
    end function hipsolverDnCheevdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnZheevdx_bufferSize
    !---------------------------------------------
    function hipsolverDnZheevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                           nev, W, lwork) &
       result(DnZheevdx_bufferSize) &
       bind(C, name="hipsolverDnZheevdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZheevdx_bufferSize
    end function hipsolverDnZheevdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsyevdx
    !---------------------------------------------
    function hipsolverDnSsyevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, &
                                work, lwork, devInfo) &
       result(DnSsyevdx) &
       bind(C, name="hipsolverDnSsyevdx")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsyevdx
    end function hipsolverDnSsyevdx

    !---------------------------------------------
    ! hipsolverDnDsyevdx
    !---------------------------------------------
    function hipsolverDnDsyevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, &
                                work, lwork, devInfo) &
       result(DnDsyevdx) &
       bind(C, name="hipsolverDnDsyevdx")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsyevdx
    end function hipsolverDnDsyevdx

    !---------------------------------------------
    ! hipsolverDnCheevdx
    !---------------------------------------------
    function hipsolverDnCheevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, &
                                work, lwork, devInfo) &
       result(DnCheevdx) &
       bind(C, name="hipsolverDnCheevdx")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCheevdx
    end function hipsolverDnCheevdx

    !---------------------------------------------
    ! hipsolverDnZheevdx
    !---------------------------------------------
    function hipsolverDnZheevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, &
                                work, lwork, devInfo) &
       result(DnZheevdx) &
       bind(C, name="hipsolverDnZheevdx")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZheevdx
    end function hipsolverDnZheevdx

    !---------------------------------------------
    ! hipsolverDnSsyevj_bufferSize
    !---------------------------------------------
    function hipsolverDnSsyevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(DnSsyevj_bufferSize) &
       bind(C, name="hipsolverDnSsyevj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsyevj_bufferSize
    end function hipsolverDnSsyevj_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsyevj_bufferSize
    !---------------------------------------------
    function hipsolverDnDsyevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(DnDsyevj_bufferSize) &
       bind(C, name="hipsolverDnDsyevj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsyevj_bufferSize
    end function hipsolverDnDsyevj_bufferSize

    !---------------------------------------------
    ! hipsolverDnCheevj_bufferSize
    !---------------------------------------------
    function hipsolverDnCheevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(DnCheevj_bufferSize) &
       bind(C, name="hipsolverDnCheevj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCheevj_bufferSize
    end function hipsolverDnCheevj_bufferSize

    !---------------------------------------------
    ! hipsolverDnZheevj_bufferSize
    !---------------------------------------------
    function hipsolverDnZheevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(DnZheevj_bufferSize) &
       bind(C, name="hipsolverDnZheevj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZheevj_bufferSize
    end function hipsolverDnZheevj_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsyevj
    !---------------------------------------------
    function hipsolverDnSsyevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(DnSsyevj) &
       bind(C, name="hipsolverDnSsyevj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsyevj
    end function hipsolverDnSsyevj

    !---------------------------------------------
    ! hipsolverDnDsyevj
    !---------------------------------------------
    function hipsolverDnDsyevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(DnDsyevj) &
       bind(C, name="hipsolverDnDsyevj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsyevj
    end function hipsolverDnDsyevj

    !---------------------------------------------
    ! hipsolverDnCheevj
    !---------------------------------------------
    function hipsolverDnCheevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(DnCheevj) &
       bind(C, name="hipsolverDnCheevj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCheevj
    end function hipsolverDnCheevj

    !---------------------------------------------
    ! hipsolverDnZheevj
    !---------------------------------------------
    function hipsolverDnZheevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(DnZheevj) &
       bind(C, name="hipsolverDnZheevj")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZheevj
    end function hipsolverDnZheevj

    !---------------------------------------------
    ! hipsolverDnSsyevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnSsyevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                                 batch_count) &
       result(DnSsyevjBatched_bufferSize) &
       bind(C, name="hipsolverDnSsyevjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsyevjBatched_bufferSize
    end function hipsolverDnSsyevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsyevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnDsyevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                                 batch_count) &
       result(DnDsyevjBatched_bufferSize) &
       bind(C, name="hipsolverDnDsyevjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsyevjBatched_bufferSize
    end function hipsolverDnDsyevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnCheevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnCheevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                                 batch_count) &
       result(DnCheevjBatched_bufferSize) &
       bind(C, name="hipsolverDnCheevjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCheevjBatched_bufferSize
    end function hipsolverDnCheevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnZheevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnZheevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                                 batch_count) &
       result(DnZheevjBatched_bufferSize) &
       bind(C, name="hipsolverDnZheevjBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZheevjBatched_bufferSize
    end function hipsolverDnZheevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsyevjBatched
    !---------------------------------------------
    function hipsolverDnSsyevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                      params, batch_count) &
       result(DnSsyevjBatched) &
       bind(C, name="hipsolverDnSsyevjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsyevjBatched
    end function hipsolverDnSsyevjBatched

    !---------------------------------------------
    ! hipsolverDnDsyevjBatched
    !---------------------------------------------
    function hipsolverDnDsyevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                      params, batch_count) &
       result(DnDsyevjBatched) &
       bind(C, name="hipsolverDnDsyevjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsyevjBatched
    end function hipsolverDnDsyevjBatched

    !---------------------------------------------
    ! hipsolverDnCheevjBatched
    !---------------------------------------------
    function hipsolverDnCheevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                      params, batch_count) &
       result(DnCheevjBatched) &
       bind(C, name="hipsolverDnCheevjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCheevjBatched
    end function hipsolverDnCheevjBatched

    !---------------------------------------------
    ! hipsolverDnZheevjBatched
    !---------------------------------------------
    function hipsolverDnZheevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                      params, batch_count) &
       result(DnZheevjBatched) &
       bind(C, name="hipsolverDnZheevjBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZheevjBatched
    end function hipsolverDnZheevjBatched

    !---------------------------------------------
    ! hipsolverDnSsygvd_bufferSize
    !---------------------------------------------
    function hipsolverDnSsygvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(DnSsygvd_bufferSize) &
       bind(C, name="hipsolverDnSsygvd_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsygvd_bufferSize
    end function hipsolverDnSsygvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsygvd_bufferSize
    !---------------------------------------------
    function hipsolverDnDsygvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(DnDsygvd_bufferSize) &
       bind(C, name="hipsolverDnDsygvd_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsygvd_bufferSize
    end function hipsolverDnDsygvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnChegvd_bufferSize
    !---------------------------------------------
    function hipsolverDnChegvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(DnChegvd_bufferSize) &
       bind(C, name="hipsolverDnChegvd_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnChegvd_bufferSize
    end function hipsolverDnChegvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnZhegvd_bufferSize
    !---------------------------------------------
    function hipsolverDnZhegvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(DnZhegvd_bufferSize) &
       bind(C, name="hipsolverDnZhegvd_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZhegvd_bufferSize
    end function hipsolverDnZhegvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsygvd
    !---------------------------------------------
    function hipsolverDnSsygvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo) &
       result(DnSsygvd) &
       bind(C, name="hipsolverDnSsygvd")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsygvd
    end function hipsolverDnSsygvd

    !---------------------------------------------
    ! hipsolverDnDsygvd
    !---------------------------------------------
    function hipsolverDnDsygvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo) &
       result(DnDsygvd) &
       bind(C, name="hipsolverDnDsygvd")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsygvd
    end function hipsolverDnDsygvd

    !---------------------------------------------
    ! hipsolverDnChegvd
    !---------------------------------------------
    function hipsolverDnChegvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo) &
       result(DnChegvd) &
       bind(C, name="hipsolverDnChegvd")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnChegvd
    end function hipsolverDnChegvd

    !---------------------------------------------
    ! hipsolverDnZhegvd
    !---------------------------------------------
    function hipsolverDnZhegvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo) &
       result(DnZhegvd) &
       bind(C, name="hipsolverDnZhegvd")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZhegvd
    end function hipsolverDnZhegvd

    !---------------------------------------------
    ! hipsolverDnSsygvdx_bufferSize
    !---------------------------------------------
    function hipsolverDnSsygvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, &
                                           vl, vu, il, iu, nev, W, lwork) &
       result(DnSsygvdx_bufferSize) &
       bind(C, name="hipsolverDnSsygvdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsygvdx_bufferSize
    end function hipsolverDnSsygvdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsygvdx_bufferSize
    !---------------------------------------------
    function hipsolverDnDsygvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, &
                                           vl, vu, il, iu, nev, W, lwork) &
       result(DnDsygvdx_bufferSize) &
       bind(C, name="hipsolverDnDsygvdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsygvdx_bufferSize
    end function hipsolverDnDsygvdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnChegvdx_bufferSize
    !---------------------------------------------
    function hipsolverDnChegvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, &
                                           vl, vu, il, iu, nev, W, lwork) &
       result(DnChegvdx_bufferSize) &
       bind(C, name="hipsolverDnChegvdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnChegvdx_bufferSize
    end function hipsolverDnChegvdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnZhegvdx_bufferSize
    !---------------------------------------------
    function hipsolverDnZhegvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, &
                                           vl, vu, il, iu, nev, W, lwork) &
       result(DnZhegvdx_bufferSize) &
       bind(C, name="hipsolverDnZhegvdx_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZhegvdx_bufferSize
    end function hipsolverDnZhegvdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsygvdx
    !---------------------------------------------
    function hipsolverDnSsygvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, &
                                iu, nev, W, work, lwork, devInfo) &
       result(DnSsygvdx) &
       bind(C, name="hipsolverDnSsygvdx")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsygvdx
    end function hipsolverDnSsygvdx

    !---------------------------------------------
    ! hipsolverDnDsygvdx
    !---------------------------------------------
    function hipsolverDnDsygvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, &
                                iu, nev, W, work, lwork, devInfo) &
       result(DnDsygvdx) &
       bind(C, name="hipsolverDnDsygvdx")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsygvdx
    end function hipsolverDnDsygvdx

    !---------------------------------------------
    ! hipsolverDnChegvdx
    !---------------------------------------------
    function hipsolverDnChegvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, &
                                iu, nev, W, work, lwork, devInfo) &
       result(DnChegvdx) &
       bind(C, name="hipsolverDnChegvdx")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnChegvdx
    end function hipsolverDnChegvdx

    !---------------------------------------------
    ! hipsolverDnZhegvdx
    !---------------------------------------------
    function hipsolverDnZhegvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, &
                                iu, nev, W, work, lwork, devInfo) &
       result(DnZhegvdx) &
       bind(C, name="hipsolverDnZhegvdx")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_EIG_RANGE_ALL, &
                 HIPSOLVER_FILL_MODE_UPPER, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_EIG_RANGE_ALL)), value :: range
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZhegvdx
    end function hipsolverDnZhegvdx

    !---------------------------------------------
    ! hipsolverDnSsygvj_bufferSize
    !---------------------------------------------
    function hipsolverDnSsygvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                          params) &
       result(DnSsygvj_bufferSize) &
       bind(C, name="hipsolverDnSsygvj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsygvj_bufferSize
    end function hipsolverDnSsygvj_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsygvj_bufferSize
    !---------------------------------------------
    function hipsolverDnDsygvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                          params) &
       result(DnDsygvj_bufferSize) &
       bind(C, name="hipsolverDnDsygvj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsygvj_bufferSize
    end function hipsolverDnDsygvj_bufferSize

    !---------------------------------------------
    ! hipsolverDnChegvj_bufferSize
    !---------------------------------------------
    function hipsolverDnChegvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                          params) &
       result(DnChegvj_bufferSize) &
       bind(C, name="hipsolverDnChegvj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnChegvj_bufferSize
    end function hipsolverDnChegvj_bufferSize

    !---------------------------------------------
    ! hipsolverDnZhegvj_bufferSize
    !---------------------------------------------
    function hipsolverDnZhegvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                          params) &
       result(DnZhegvj_bufferSize) &
       bind(C, name="hipsolverDnZhegvj_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       integer(c_int) :: lwork
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZhegvj_bufferSize
    end function hipsolverDnZhegvj_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsygvj
    !---------------------------------------------
    function hipsolverDnSsygvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo, params) &
       result(DnSsygvj) &
       bind(C, name="hipsolverDnSsygvj")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsygvj
    end function hipsolverDnSsygvj

    !---------------------------------------------
    ! hipsolverDnDsygvj
    !---------------------------------------------
    function hipsolverDnDsygvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo, params) &
       result(DnDsygvj) &
       bind(C, name="hipsolverDnDsygvj")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsygvj
    end function hipsolverDnDsygvj

    !---------------------------------------------
    ! hipsolverDnChegvj
    !---------------------------------------------
    function hipsolverDnChegvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo, params) &
       result(DnChegvj) &
       bind(C, name="hipsolverDnChegvj")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnChegvj
    end function hipsolverDnChegvj

    !---------------------------------------------
    ! hipsolverDnZhegvj
    !---------------------------------------------
    function hipsolverDnZhegvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo, params) &
       result(DnZhegvj) &
       bind(C, name="hipsolverDnZhegvj")
       import :: c_ptr, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                 c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_EIG_TYPE_1)), value :: itype
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: W
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZhegvj
    end function hipsolverDnZhegvj

    !---------------------------------------------
    ! hipsolverDnSsytrd_bufferSize
    !---------------------------------------------
    function hipsolverDnSsytrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(DnSsytrd_bufferSize) &
       bind(C, name="hipsolverDnSsytrd_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsytrd_bufferSize
    end function hipsolverDnSsytrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsytrd_bufferSize
    !---------------------------------------------
    function hipsolverDnDsytrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(DnDsytrd_bufferSize) &
       bind(C, name="hipsolverDnDsytrd_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsytrd_bufferSize
    end function hipsolverDnDsytrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnChetrd_bufferSize
    !---------------------------------------------
    function hipsolverDnChetrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(DnChetrd_bufferSize) &
       bind(C, name="hipsolverDnChetrd_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnChetrd_bufferSize
    end function hipsolverDnChetrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnZhetrd_bufferSize
    !---------------------------------------------
    function hipsolverDnZhetrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(DnZhetrd_bufferSize) &
       bind(C, name="hipsolverDnZhetrd_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tau
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZhetrd_bufferSize
    end function hipsolverDnZhetrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsytrd
    !---------------------------------------------
    function hipsolverDnSsytrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(DnSsytrd) &
       bind(C, name="hipsolverDnSsytrd")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsytrd
    end function hipsolverDnSsytrd

    !---------------------------------------------
    ! hipsolverDnDsytrd
    !---------------------------------------------
    function hipsolverDnDsytrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(DnDsytrd) &
       bind(C, name="hipsolverDnDsytrd")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsytrd
    end function hipsolverDnDsytrd

    !---------------------------------------------
    ! hipsolverDnChetrd
    !---------------------------------------------
    function hipsolverDnChetrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(DnChetrd) &
       bind(C, name="hipsolverDnChetrd")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnChetrd
    end function hipsolverDnChetrd

    !---------------------------------------------
    ! hipsolverDnZhetrd
    !---------------------------------------------
    function hipsolverDnZhetrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(DnZhetrd) &
       bind(C, name="hipsolverDnZhetrd")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: D
       type(c_ptr), value :: E
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZhetrd
    end function hipsolverDnZhetrd

    !---------------------------------------------
    ! hipsolverDnSsytrf_bufferSize
    !---------------------------------------------
    function hipsolverDnSsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(DnSsytrf_bufferSize) &
       bind(C, name="hipsolverDnSsytrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsytrf_bufferSize
    end function hipsolverDnSsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsytrf_bufferSize
    !---------------------------------------------
    function hipsolverDnDsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(DnDsytrf_bufferSize) &
       bind(C, name="hipsolverDnDsytrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsytrf_bufferSize
    end function hipsolverDnDsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnCsytrf_bufferSize
    !---------------------------------------------
    function hipsolverDnCsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(DnCsytrf_bufferSize) &
       bind(C, name="hipsolverDnCsytrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCsytrf_bufferSize
    end function hipsolverDnCsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnZsytrf_bufferSize
    !---------------------------------------------
    function hipsolverDnZsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(DnZsytrf_bufferSize) &
       bind(C, name="hipsolverDnZsytrf_bufferSize")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZsytrf_bufferSize
    end function hipsolverDnZsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsytrf
    !---------------------------------------------
    function hipsolverDnSsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(DnSsytrf) &
       bind(C, name="hipsolverDnSsytrf")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: ipiv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSsytrf
    end function hipsolverDnSsytrf

    !---------------------------------------------
    ! hipsolverDnDsytrf
    !---------------------------------------------
    function hipsolverDnDsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(DnDsytrf) &
       bind(C, name="hipsolverDnDsytrf")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: ipiv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDsytrf
    end function hipsolverDnDsytrf

    !---------------------------------------------
    ! hipsolverDnCsytrf
    !---------------------------------------------
    function hipsolverDnCsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(DnCsytrf) &
       bind(C, name="hipsolverDnCsytrf")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: ipiv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCsytrf
    end function hipsolverDnCsytrf

    !---------------------------------------------
    ! hipsolverDnZsytrf
    !---------------------------------------------
    function hipsolverDnZsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(DnZsytrf) &
       bind(C, name="hipsolverDnZsytrf")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: ipiv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnZsytrf
    end function hipsolverDnZsytrf

    !---------------------------------------------
    ! hipsolverDnCreateParams
    !---------------------------------------------
    function hipsolverDnCreateParams(params) &
       result(DnCreateParams) &
       bind(C, name="hipsolverDnCreateParams")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr) :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCreateParams
    end function hipsolverDnCreateParams

    !---------------------------------------------
    ! hipsolverDnDestroyParams
    !---------------------------------------------
    function hipsolverDnDestroyParams(params) &
       result(DnDestroyParams) &
       bind(C, name="hipsolverDnDestroyParams")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDestroyParams
    end function hipsolverDnDestroyParams

    !---------------------------------------------
    ! hipsolverDnSetAdvOptions
    !---------------------------------------------
    function hipsolverDnSetAdvOptions(params, func, alg) &
       result(DnSetAdvOptions) &
       bind(C, name="hipsolverDnSetAdvOptions")
       import :: c_ptr, HIPSOLVERDN_GETRF, HIPSOLVER_ALG_0, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: params
       integer(kind(HIPSOLVERDN_GETRF)), value :: func
       integer(kind(HIPSOLVER_ALG_0)), value :: alg
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSetAdvOptions
    end function hipsolverDnSetAdvOptions

    !---------------------------------------------
    ! hipsolverDnXgeev_bufferSize
    !---------------------------------------------
    function hipsolverDnXgeev_bufferSize(handle, params, jobvl, jobvr, n, dataTypeA, A, lda, &
                                         dataTypeW, W, dataTypeVL, VL, ldvl, dataTypeVR, VR, ldvr, &
                                         computeType, lworkOnDevice, lworkOnHost) &
       result(DnXgeev_bufferSize) &
       bind(C, name="hipsolverDnXgeev_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int64_t, c_int, c_size_t, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobvl
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobvr
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: dataTypeVL
       type(c_ptr), value :: VL
       integer(c_int64_t), value :: ldvl
       integer(c_int), value :: dataTypeVR
       type(c_ptr), value :: VR
       integer(c_int64_t), value :: ldvr
       integer(c_int), value :: computeType
       integer(c_size_t) :: lworkOnDevice
       integer(c_size_t) :: lworkOnHost
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgeev_bufferSize
    end function hipsolverDnXgeev_bufferSize

    !---------------------------------------------
    ! hipsolverDnXgeev
    !---------------------------------------------
    function hipsolverDnXgeev(handle, params, jobvl, jobvr, n, dataTypeA, A, lda, dataTypeW, W, &
                              dataTypeVL, VL, ldvl, dataTypeVR, VR, ldvr, computeType, &
                              workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, devInfo) &
       result(DnXgeev) &
       bind(C, name="hipsolverDnXgeev")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int64_t, c_int, c_size_t, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobvl
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobvr
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: dataTypeVL
       type(c_ptr), value :: VL
       integer(c_int64_t), value :: ldvl
       integer(c_int), value :: dataTypeVR
       type(c_ptr), value :: VR
       integer(c_int64_t), value :: ldvr
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_size_t), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_size_t), value :: lworkOnHost
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgeev
    end function hipsolverDnXgeev

    !---------------------------------------------
    ! hipsolverDnXgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverDnXgeqrf_bufferSize(handle, params, m, n, dataTypeA, A, lda, dataTypeTau, &
                                          tau, computeType, lworkOnDevice, lworkOnHost) &
       result(DnXgeqrf_bufferSize) &
       bind(C, name="hipsolverDnXgeqrf_bufferSize")
       import :: c_ptr, c_int64_t, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int64_t), value :: m
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: dataTypeTau
       type(c_ptr), value :: tau
       integer(c_int), value :: computeType
       integer(c_size_t) :: lworkOnDevice
       integer(c_size_t) :: lworkOnHost
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgeqrf_bufferSize
    end function hipsolverDnXgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnXgeqrf
    !---------------------------------------------
    function hipsolverDnXgeqrf(handle, params, m, n, dataTypeA, A, lda, dataTypeTau, tau, &
                               computeType, workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, &
                               devInfo) &
       result(DnXgeqrf) &
       bind(C, name="hipsolverDnXgeqrf")
       import :: c_ptr, c_int64_t, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int64_t), value :: m
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: dataTypeTau
       type(c_ptr), value :: tau
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_size_t), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_size_t), value :: lworkOnHost
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgeqrf
    end function hipsolverDnXgeqrf

    !---------------------------------------------
    ! hipsolverDnXgetrf_bufferSize
    !---------------------------------------------
    function hipsolverDnXgetrf_bufferSize(handle, params, m, n, dataTypeA, A, lda, computeType, &
                                          lworkOnDevice, lworkOnHost) &
       result(DnXgetrf_bufferSize) &
       bind(C, name="hipsolverDnXgetrf_bufferSize")
       import :: c_ptr, c_int64_t, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int64_t), value :: m
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: computeType
       integer(c_size_t) :: lworkOnDevice
       integer(c_size_t) :: lworkOnHost
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgetrf_bufferSize
    end function hipsolverDnXgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnXgetrf
    !---------------------------------------------
    function hipsolverDnXgetrf(handle, params, m, n, dataTypeA, A, lda, devIpiv, computeType, &
                               workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, devInfo) &
       result(DnXgetrf) &
       bind(C, name="hipsolverDnXgetrf")
       import :: c_ptr, c_int64_t, c_int, c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int64_t), value :: m
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_size_t), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_size_t), value :: lworkOnHost
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgetrf
    end function hipsolverDnXgetrf

    !---------------------------------------------
    ! hipsolverDnXgetrs
    !---------------------------------------------
    function hipsolverDnXgetrs(handle, params, trans, n, nrhs, dataTypeA, A, lda, devIpiv, &
                               dataTypeB, B, ldb, devInfo) &
       result(DnXgetrs) &
       bind(C, name="hipsolverDnXgetrs")
       import :: c_ptr, HIPSOLVER_OP_N, c_int64_t, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_OP_N)), value :: trans
       integer(c_int64_t), value :: n
       integer(c_int64_t), value :: nrhs
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: dataTypeB
       type(c_ptr), value :: B
       integer(c_int64_t), value :: ldb
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgetrs
    end function hipsolverDnXgetrs

    !---------------------------------------------
    ! hipsolverDnXlarft_bufferSize
    !---------------------------------------------
    function hipsolverDnXlarft_bufferSize(handle, params, myDirect, storev, n, k, dataTypeV, V, &
                                          ldv, dataTypeTau, tau, dataTypeT, T, ldt, computeType, &
                                          lworkOnDevice, lworkOnHost) &
       result(DnXlarft_bufferSize) &
       bind(C, name="hipsolverDnXlarft_bufferSize")
       import :: c_ptr, HIPSOLVER_DIRECT_FORWARD, HIPSOLVER_STOREV_COLUMNWISE, c_int64_t, c_int, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_DIRECT_FORWARD)), value :: myDirect
       integer(kind(HIPSOLVER_STOREV_COLUMNWISE)), value :: storev
       integer(c_int64_t), value :: n
       integer(c_int64_t), value :: k
       integer(c_int), value :: dataTypeV
       type(c_ptr), value :: V
       integer(c_int64_t), value :: ldv
       integer(c_int), value :: dataTypeTau
       type(c_ptr), value :: tau
       integer(c_int), value :: dataTypeT
       type(c_ptr), value :: T
       integer(c_int64_t), value :: ldt
       integer(c_int), value :: computeType
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXlarft_bufferSize
    end function hipsolverDnXlarft_bufferSize

    !---------------------------------------------
    ! hipsolverDnXlarft
    !---------------------------------------------
    function hipsolverDnXlarft(handle, params, myDirect, storev, n, k, dataTypeV, V, ldv, &
                               dataTypeTau, tau, dataTypeT, T, ldt, computeType, workOnDevice, &
                               lworkOnDevice, workOnHost, lworkOnHost) &
       result(DnXlarft) &
       bind(C, name="hipsolverDnXlarft")
       import :: c_ptr, HIPSOLVER_DIRECT_FORWARD, HIPSOLVER_STOREV_COLUMNWISE, c_int64_t, c_int, &
                 c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_DIRECT_FORWARD)), value :: myDirect
       integer(kind(HIPSOLVER_STOREV_COLUMNWISE)), value :: storev
       integer(c_int64_t), value :: n
       integer(c_int64_t), value :: k
       integer(c_int), value :: dataTypeV
       type(c_ptr), value :: V
       integer(c_int64_t), value :: ldv
       integer(c_int), value :: dataTypeTau
       type(c_ptr), value :: tau
       integer(c_int), value :: dataTypeT
       type(c_ptr), value :: T
       integer(c_int64_t), value :: ldt
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_size_t), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_size_t), value :: lworkOnHost
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXlarft
    end function hipsolverDnXlarft

    !---------------------------------------------
    ! hipsolverDnXpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDnXpotrf_bufferSize(handle, params, uplo, n, dataTypeA, A, lda, computeType, &
                                          lworkOnDevice, lworkOnHost) &
       result(DnXpotrf_bufferSize) &
       bind(C, name="hipsolverDnXpotrf_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int64_t, c_int, c_size_t, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: computeType
       integer(c_size_t) :: lworkOnDevice
       integer(c_size_t) :: lworkOnHost
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXpotrf_bufferSize
    end function hipsolverDnXpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnXpotrf
    !---------------------------------------------
    function hipsolverDnXpotrf(handle, params, uplo, n, dataTypeA, A, lda, computeType, &
                               workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, myInfo) &
       result(DnXpotrf) &
       bind(C, name="hipsolverDnXpotrf")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int64_t, c_int, c_size_t, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_size_t), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_size_t), value :: lworkOnHost
       type(c_ptr), value :: myInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXpotrf
    end function hipsolverDnXpotrf

    !---------------------------------------------
    ! hipsolverDnXpotrs
    !---------------------------------------------
    function hipsolverDnXpotrs(handle, params, uplo, n, nrhs, dataTypeA, A, lda, dataTypeB, B, &
                               ldb, myInfo) &
       result(DnXpotrs) &
       bind(C, name="hipsolverDnXpotrs")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int64_t, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int64_t), value :: n
       integer(c_int64_t), value :: nrhs
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: dataTypeB
       type(c_ptr), value :: B
       integer(c_int64_t), value :: ldb
       type(c_ptr), value :: myInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXpotrs
    end function hipsolverDnXpotrs

    !---------------------------------------------
    ! hipsolverDnXsyevd_bufferSize
    !---------------------------------------------
    function hipsolverDnXsyevd_bufferSize(handle, params, jobz, uplo, n, dataTypeA, A, lda, &
                                          dataTypeW, W, computeType, lworkOnDevice, lworkOnHost) &
       result(DnXsyevd_bufferSize) &
       bind(C, name="hipsolverDnXsyevd_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int64_t, c_int, &
                 c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: computeType
       integer(c_size_t) :: lworkOnDevice
       integer(c_size_t) :: lworkOnHost
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXsyevd_bufferSize
    end function hipsolverDnXsyevd_bufferSize

    !---------------------------------------------
    ! hipsolverDnXsyevd
    !---------------------------------------------
    function hipsolverDnXsyevd(handle, params, jobz, uplo, n, dataTypeA, A, lda, dataTypeW, W, &
                               computeType, workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, &
                               devInfo) &
       result(DnXsyevd) &
       bind(C, name="hipsolverDnXsyevd")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int64_t, c_int, &
                 c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_size_t), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_size_t), value :: lworkOnHost
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXsyevd
    end function hipsolverDnXsyevd

    !---------------------------------------------
    ! hipsolverDnXsyevBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnXsyevBatched_bufferSize(handle, params, jobz, uplo, n, dataTypeA, A, lda, &
                                                dataTypeW, W, computeType, lworkOnDevice, &
                                                lworkOnHost, batchSize) &
       result(DnXsyevBatched_bufferSize) &
       bind(C, name="hipsolverDnXsyevBatched_bufferSize")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int64_t, c_int, &
                 c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: computeType
       integer(c_size_t) :: lworkOnDevice
       integer(c_size_t) :: lworkOnHost
       integer(c_int64_t), value :: batchSize
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXsyevBatched_bufferSize
    end function hipsolverDnXsyevBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnXsyevBatched
    !---------------------------------------------
    function hipsolverDnXsyevBatched(handle, params, jobz, uplo, n, dataTypeA, A, lda, dataTypeW, &
                                     W, computeType, workOnDevice, lworkOnDevice, workOnHost, &
                                     lworkOnHost, devInfo, batchSize) &
       result(DnXsyevBatched) &
       bind(C, name="hipsolverDnXsyevBatched")
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, c_int64_t, c_int, &
                 c_size_t, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)), value :: jobz
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_size_t), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_size_t), value :: lworkOnHost
       type(c_ptr), value :: devInfo
       integer(c_int64_t), value :: batchSize
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXsyevBatched
    end function hipsolverDnXsyevBatched

    !---------------------------------------------
    ! hipsolverDnXsytrs_bufferSize
    !---------------------------------------------
    function hipsolverDnXsytrs_bufferSize(handle, uplo, n, nrhs, dataTypeA, A, lda, devIpiv, &
                                          dataTypeB, B, ldb, lworkOnDevice, lworkOnHost) &
       result(DnXsytrs_bufferSize) &
       bind(C, name="hipsolverDnXsytrs_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int64_t, c_int, c_size_t, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int64_t), value :: n
       integer(c_int64_t), value :: nrhs
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: dataTypeB
       type(c_ptr), value :: B
       integer(c_int64_t), value :: ldb
       integer(c_size_t) :: lworkOnDevice
       integer(c_size_t) :: lworkOnHost
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXsytrs_bufferSize
    end function hipsolverDnXsytrs_bufferSize

    !---------------------------------------------
    ! hipsolverDnXsytrs
    !---------------------------------------------
    function hipsolverDnXsytrs(handle, uplo, n, nrhs, dataTypeA, A, lda, devIpiv, dataTypeB, B, &
                               ldb, workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, devInfo) &
       result(DnXsytrs) &
       bind(C, name="hipsolverDnXsytrs")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int64_t, c_int, c_size_t, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int64_t), value :: n
       integer(c_int64_t), value :: nrhs
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: dataTypeB
       type(c_ptr), value :: B
       integer(c_int64_t), value :: ldb
       type(c_ptr), value :: workOnDevice
       integer(c_size_t), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_size_t), value :: lworkOnHost
       type(c_ptr), value :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXsytrs
    end function hipsolverDnXsytrs

    !---------------------------------------------
    ! hipsolverRfCreate
    !---------------------------------------------
    function hipsolverRfCreate(handle) &
       result(RfCreate) &
       bind(C, name="hipsolverRfCreate")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr) :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfCreate
    end function hipsolverRfCreate

    !---------------------------------------------
    ! hipsolverRfDestroy
    !---------------------------------------------
    function hipsolverRfDestroy(handle) &
       result(RfDestroy) &
       bind(C, name="hipsolverRfDestroy")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfDestroy
    end function hipsolverRfDestroy

    !---------------------------------------------
    ! hipsolverRfSetupDevice
    !---------------------------------------------
    function hipsolverRfSetupDevice(n, nnzA, csrRowPtrA, csrColIndA, csrValA, nnzL, csrRowPtrL, &
                                    csrColIndL, csrValL, nnzU, csrRowPtrU, csrColIndU, csrValU, P, &
                                    Q, handle) &
       result(RfSetupDevice) &
       bind(C, name="hipsolverRfSetupDevice")
       import :: c_int, c_ptr, HIPSOLVER_STATUS_SUCCESS
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrRowPtrA
       type(c_ptr), value :: csrColIndA
       type(c_ptr), value :: csrValA
       integer(c_int), value :: nnzL
       type(c_ptr), value :: csrRowPtrL
       type(c_ptr), value :: csrColIndL
       type(c_ptr), value :: csrValL
       integer(c_int), value :: nnzU
       type(c_ptr), value :: csrRowPtrU
       type(c_ptr), value :: csrColIndU
       type(c_ptr), value :: csrValU
       type(c_ptr), value :: P
       type(c_ptr), value :: Q
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfSetupDevice
    end function hipsolverRfSetupDevice

    !---------------------------------------------
    ! hipsolverRfSetupHost
    !---------------------------------------------
    function hipsolverRfSetupHost(n, nnzA, h_csrRowPtrA, h_csrColIndA, h_csrValA, nnzL, &
                                  h_csrRowPtrL, h_csrColIndL, h_csrValL, nnzU, h_csrRowPtrU, &
                                  h_csrColIndU, h_csrValU, h_P, h_Q, handle) &
       result(RfSetupHost) &
       bind(C, name="hipsolverRfSetupHost")
       import :: c_int, c_ptr, HIPSOLVER_STATUS_SUCCESS
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: h_csrRowPtrA
       type(c_ptr), value :: h_csrColIndA
       type(c_ptr), value :: h_csrValA
       integer(c_int), value :: nnzL
       type(c_ptr), value :: h_csrRowPtrL
       type(c_ptr), value :: h_csrColIndL
       type(c_ptr), value :: h_csrValL
       integer(c_int), value :: nnzU
       type(c_ptr), value :: h_csrRowPtrU
       type(c_ptr), value :: h_csrColIndU
       type(c_ptr), value :: h_csrValU
       type(c_ptr), value :: h_P
       type(c_ptr), value :: h_Q
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfSetupHost
    end function hipsolverRfSetupHost

    !---------------------------------------------
    ! hipsolverRfAccessBundledFactorsDevice
    !---------------------------------------------
    function hipsolverRfAccessBundledFactorsDevice(handle, nnzM, Mp, Mi, Mx) &
       result(RfAccessBundledFactorsDevice) &
       bind(C, name="hipsolverRfAccessBundledFactorsDevice")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int) :: nnzM
       type(c_ptr) :: Mp
       type(c_ptr) :: Mi
       type(c_ptr) :: Mx
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfAccessBundledFactorsDevice
    end function hipsolverRfAccessBundledFactorsDevice

    !---------------------------------------------
    ! hipsolverRfAnalyze
    !---------------------------------------------
    function hipsolverRfAnalyze(handle) &
       result(RfAnalyze) &
       bind(C, name="hipsolverRfAnalyze")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfAnalyze
    end function hipsolverRfAnalyze

    !---------------------------------------------
    ! hipsolverRfExtractBundledFactorsHost
    !---------------------------------------------
    function hipsolverRfExtractBundledFactorsHost(handle, h_nnzM, h_Mp, h_Mi, h_Mx) &
       result(RfExtractBundledFactorsHost) &
       bind(C, name="hipsolverRfExtractBundledFactorsHost")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int) :: h_nnzM
       type(c_ptr) :: h_Mp
       type(c_ptr) :: h_Mi
       type(c_ptr) :: h_Mx
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfExtractBundledFactorsHost
    end function hipsolverRfExtractBundledFactorsHost

    !---------------------------------------------
    ! hipsolverRfExtractSplitFactorsHost
    !---------------------------------------------
    function hipsolverRfExtractSplitFactorsHost(handle, h_nnzL, h_Lp, h_Li, h_Lx, h_nnzU, h_Up, &
                                                h_Ui, h_Ux) &
       result(RfExtractSplitFactorsHost) &
       bind(C, name="hipsolverRfExtractSplitFactorsHost")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int) :: h_nnzL
       type(c_ptr) :: h_Lp
       type(c_ptr) :: h_Li
       type(c_ptr) :: h_Lx
       integer(c_int) :: h_nnzU
       type(c_ptr) :: h_Up
       type(c_ptr) :: h_Ui
       type(c_ptr) :: h_Ux
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfExtractSplitFactorsHost
    end function hipsolverRfExtractSplitFactorsHost

    !---------------------------------------------
    ! hipsolverRfGet_Algs
    !---------------------------------------------
    function hipsolverRfGet_Algs(handle, fact_alg, solve_alg) &
       result(RfGet_Algs) &
       bind(C, name="hipsolverRfGet_Algs")
       import :: c_ptr, HIPSOLVERRF_FACTORIZATION_ALG0, HIPSOLVERRF_TRIANGULAR_SOLVE_ALG1, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVERRF_FACTORIZATION_ALG0)) :: fact_alg
       integer(kind(HIPSOLVERRF_TRIANGULAR_SOLVE_ALG1)) :: solve_alg
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfGet_Algs
    end function hipsolverRfGet_Algs

    !---------------------------------------------
    ! hipsolverRfGetMatrixFormat
    !---------------------------------------------
    function hipsolverRfGetMatrixFormat(handle, myFormat, diag) &
       result(RfGetMatrixFormat) &
       bind(C, name="hipsolverRfGetMatrixFormat")
       import :: c_ptr, HIPSOLVERRF_MATRIX_FORMAT_CSR, HIPSOLVERRF_UNIT_DIAGONAL_STORED_L, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVERRF_MATRIX_FORMAT_CSR)) :: myFormat
       integer(kind(HIPSOLVERRF_UNIT_DIAGONAL_STORED_L)) :: diag
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfGetMatrixFormat
    end function hipsolverRfGetMatrixFormat

    !---------------------------------------------
    ! hipsolverRfGetNumericBoostReport
    !---------------------------------------------
    function hipsolverRfGetNumericBoostReport(handle, report) &
       result(RfGetNumericBoostReport) &
       bind(C, name="hipsolverRfGetNumericBoostReport")
       import :: c_ptr, HIPSOLVERRF_NUMERIC_BOOST_NOT_USED, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVERRF_NUMERIC_BOOST_NOT_USED)) :: report
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfGetNumericBoostReport
    end function hipsolverRfGetNumericBoostReport

    !---------------------------------------------
    ! hipsolverRfGetNumericProperties
    !---------------------------------------------
    function hipsolverRfGetNumericProperties(handle, zero, boost) &
       result(RfGetNumericProperties) &
       bind(C, name="hipsolverRfGetNumericProperties")
       import :: c_ptr, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       real(c_double) :: zero
       real(c_double) :: boost
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfGetNumericProperties
    end function hipsolverRfGetNumericProperties

    !---------------------------------------------
    ! hipsolverRfGetResetValuesFastMode
    !---------------------------------------------
    function hipsolverRfGetResetValuesFastMode(handle, fastMode) &
       result(RfGetResetValuesFastMode) &
       bind(C, name="hipsolverRfGetResetValuesFastMode")
       import :: c_ptr, HIPSOLVERRF_RESET_VALUES_FAST_MODE_OFF, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVERRF_RESET_VALUES_FAST_MODE_OFF)) :: fastMode
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfGetResetValuesFastMode
    end function hipsolverRfGetResetValuesFastMode

    !---------------------------------------------
    ! hipsolverRfRefactor
    !---------------------------------------------
    function hipsolverRfRefactor(handle) &
       result(RfRefactor) &
       bind(C, name="hipsolverRfRefactor")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfRefactor
    end function hipsolverRfRefactor

    !---------------------------------------------
    ! hipsolverRfResetValues
    !---------------------------------------------
    function hipsolverRfResetValues(n, nnzA, csrRowPtrA, csrColIndA, csrValA, P, Q, handle) &
       result(RfResetValues) &
       bind(C, name="hipsolverRfResetValues")
       import :: c_int, c_ptr, HIPSOLVER_STATUS_SUCCESS
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrRowPtrA
       type(c_ptr), value :: csrColIndA
       type(c_ptr), value :: csrValA
       type(c_ptr), value :: P
       type(c_ptr), value :: Q
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfResetValues
    end function hipsolverRfResetValues

    !---------------------------------------------
    ! hipsolverRfSetAlgs
    !---------------------------------------------
    function hipsolverRfSetAlgs(handle, fact_alg, solve_alg) &
       result(RfSetAlgs) &
       bind(C, name="hipsolverRfSetAlgs")
       import :: c_ptr, HIPSOLVERRF_FACTORIZATION_ALG0, HIPSOLVERRF_TRIANGULAR_SOLVE_ALG1, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVERRF_FACTORIZATION_ALG0)), value :: fact_alg
       integer(kind(HIPSOLVERRF_TRIANGULAR_SOLVE_ALG1)), value :: solve_alg
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfSetAlgs
    end function hipsolverRfSetAlgs

    !---------------------------------------------
    ! hipsolverRfSetMatrixFormat
    !---------------------------------------------
    function hipsolverRfSetMatrixFormat(handle, myFormat, diag) &
       result(RfSetMatrixFormat) &
       bind(C, name="hipsolverRfSetMatrixFormat")
       import :: c_ptr, HIPSOLVERRF_MATRIX_FORMAT_CSR, HIPSOLVERRF_UNIT_DIAGONAL_STORED_L, &
                 HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVERRF_MATRIX_FORMAT_CSR)), value :: myFormat
       integer(kind(HIPSOLVERRF_UNIT_DIAGONAL_STORED_L)), value :: diag
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfSetMatrixFormat
    end function hipsolverRfSetMatrixFormat

    !---------------------------------------------
    ! hipsolverRfSetNumericProperties
    !---------------------------------------------
    function hipsolverRfSetNumericProperties(handle, effective_zero, boost_val) &
       result(RfSetNumericProperties) &
       bind(C, name="hipsolverRfSetNumericProperties")
       import :: c_ptr, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       real(c_double), value :: effective_zero
       real(c_double), value :: boost_val
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfSetNumericProperties
    end function hipsolverRfSetNumericProperties

    !---------------------------------------------
    ! hipsolverRfSetResetValuesFastMode
    !---------------------------------------------
    function hipsolverRfSetResetValuesFastMode(handle, fastMode) &
       result(RfSetResetValuesFastMode) &
       bind(C, name="hipsolverRfSetResetValuesFastMode")
       import :: c_ptr, HIPSOLVERRF_RESET_VALUES_FAST_MODE_OFF, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVERRF_RESET_VALUES_FAST_MODE_OFF)), value :: fastMode
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfSetResetValuesFastMode
    end function hipsolverRfSetResetValuesFastMode

    !---------------------------------------------
    ! hipsolverRfSolve
    !---------------------------------------------
    function hipsolverRfSolve(handle, P, Q, nrhs, Temp, ldt, XF, ldxf) &
       result(RfSolve) &
       bind(C, name="hipsolverRfSolve")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: P
       type(c_ptr), value :: Q
       integer(c_int), value :: nrhs
       type(c_ptr), value :: Temp
       integer(c_int), value :: ldt
       type(c_ptr), value :: XF
       integer(c_int), value :: ldxf
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfSolve
    end function hipsolverRfSolve

    !---------------------------------------------
    ! hipsolverRfBatchSetupHost
    !---------------------------------------------
    function hipsolverRfBatchSetupHost(batchSize, n, nnzA, h_csrRowPtrA, h_csrColIndA, &
                                       h_csrValA_array, nnzL, h_csrRowPtrL, h_csrColIndL, &
                                       h_csrValL, nnzU, h_csrRowPtrU, h_csrColIndU, h_csrValU, &
                                       h_P, h_Q, handle) &
       result(RfBatchSetupHost) &
       bind(C, name="hipsolverRfBatchSetupHost")
       import :: c_int, c_ptr, HIPSOLVER_STATUS_SUCCESS
       integer(c_int), value :: batchSize
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: h_csrRowPtrA
       type(c_ptr), value :: h_csrColIndA
       type(c_ptr) :: h_csrValA_array
       integer(c_int), value :: nnzL
       type(c_ptr), value :: h_csrRowPtrL
       type(c_ptr), value :: h_csrColIndL
       type(c_ptr), value :: h_csrValL
       integer(c_int), value :: nnzU
       type(c_ptr), value :: h_csrRowPtrU
       type(c_ptr), value :: h_csrColIndU
       type(c_ptr), value :: h_csrValU
       type(c_ptr), value :: h_P
       type(c_ptr), value :: h_Q
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfBatchSetupHost
    end function hipsolverRfBatchSetupHost

    !---------------------------------------------
    ! hipsolverRfBatchAnalyze
    !---------------------------------------------
    function hipsolverRfBatchAnalyze(handle) &
       result(RfBatchAnalyze) &
       bind(C, name="hipsolverRfBatchAnalyze")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfBatchAnalyze
    end function hipsolverRfBatchAnalyze

    !---------------------------------------------
    ! hipsolverRfBatchRefactor
    !---------------------------------------------
    function hipsolverRfBatchRefactor(handle) &
       result(RfBatchRefactor) &
       bind(C, name="hipsolverRfBatchRefactor")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfBatchRefactor
    end function hipsolverRfBatchRefactor

    !---------------------------------------------
    ! hipsolverRfBatchResetValues
    !---------------------------------------------
    function hipsolverRfBatchResetValues(batchSize, n, nnzA, csrRowPtrA, csrColIndA, &
                                         csrValA_array, P, Q, handle) &
       result(RfBatchResetValues) &
       bind(C, name="hipsolverRfBatchResetValues")
       import :: c_int, c_ptr, HIPSOLVER_STATUS_SUCCESS
       integer(c_int), value :: batchSize
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrRowPtrA
       type(c_ptr), value :: csrColIndA
       type(c_ptr) :: csrValA_array
       type(c_ptr), value :: P
       type(c_ptr), value :: Q
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfBatchResetValues
    end function hipsolverRfBatchResetValues

    !---------------------------------------------
    ! hipsolverRfBatchSolve
    !---------------------------------------------
    function hipsolverRfBatchSolve(handle, P, Q, nrhs, Temp, ldt, XF_array, ldxf) &
       result(RfBatchSolve) &
       bind(C, name="hipsolverRfBatchSolve")
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: P
       type(c_ptr), value :: Q
       integer(c_int), value :: nrhs
       type(c_ptr), value :: Temp
       integer(c_int), value :: ldt
       type(c_ptr) :: XF_array
       integer(c_int), value :: ldxf
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfBatchSolve
    end function hipsolverRfBatchSolve

    !---------------------------------------------
    ! hipsolverRfBatchZeroPivot
    !---------------------------------------------
    function hipsolverRfBatchZeroPivot(handle, position) &
       result(RfBatchZeroPivot) &
       bind(C, name="hipsolverRfBatchZeroPivot")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: position
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfBatchZeroPivot
    end function hipsolverRfBatchZeroPivot

    !---------------------------------------------
    ! hipsolverSpCreate
    !---------------------------------------------
    function hipsolverSpCreate(handle) &
       result(SpCreate) &
       bind(C, name="hipsolverSpCreate")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr) :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpCreate
    end function hipsolverSpCreate

    !---------------------------------------------
    ! hipsolverSpDestroy
    !---------------------------------------------
    function hipsolverSpDestroy(handle) &
       result(SpDestroy) &
       bind(C, name="hipsolverSpDestroy")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpDestroy
    end function hipsolverSpDestroy

    !---------------------------------------------
    ! hipsolverSpSetStream
    !---------------------------------------------
    function hipsolverSpSetStream(handle, streamId) &
       result(SpSetStream) &
       bind(C, name="hipsolverSpSetStream")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: streamId
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpSetStream
    end function hipsolverSpSetStream

    !---------------------------------------------
    ! hipsolverSpScsrlsvchol
    !---------------------------------------------
    function hipsolverSpScsrlsvchol(handle, n, nnzA, descrA, csrVal, csrRowPtr, csrColInd, b, &
                                    tolerance, reorder, x, singularity) &
       result(SpScsrlsvchol) &
       bind(C, name="hipsolverSpScsrlsvchol")
       import :: c_ptr, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       type(c_ptr), value :: csrRowPtr
       type(c_ptr), value :: csrColInd
       type(c_ptr), value :: b
       real(c_float), value :: tolerance
       integer(c_int), value :: reorder
       type(c_ptr), value :: x
       integer(c_int) :: singularity
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpScsrlsvchol
    end function hipsolverSpScsrlsvchol

    !---------------------------------------------
    ! hipsolverSpDcsrlsvchol
    !---------------------------------------------
    function hipsolverSpDcsrlsvchol(handle, n, nnzA, descrA, csrVal, csrRowPtr, csrColInd, b, &
                                    tolerance, reorder, x, singularity) &
       result(SpDcsrlsvchol) &
       bind(C, name="hipsolverSpDcsrlsvchol")
       import :: c_ptr, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       type(c_ptr), value :: csrRowPtr
       type(c_ptr), value :: csrColInd
       type(c_ptr), value :: b
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       type(c_ptr), value :: x
       integer(c_int) :: singularity
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpDcsrlsvchol
    end function hipsolverSpDcsrlsvchol

    !---------------------------------------------
    ! hipsolverSpScsrlsvcholHost
    !---------------------------------------------
    function hipsolverSpScsrlsvcholHost(handle, n, nnzA, descrA, csrVal, csrRowPtr, csrColInd, b, &
                                        tolerance, reorder, x, singularity) &
       result(SpScsrlsvcholHost) &
       bind(C, name="hipsolverSpScsrlsvcholHost")
       import :: c_ptr, c_int, c_float, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       type(c_ptr), value :: csrRowPtr
       type(c_ptr), value :: csrColInd
       type(c_ptr), value :: b
       real(c_float), value :: tolerance
       integer(c_int), value :: reorder
       type(c_ptr), value :: x
       integer(c_int) :: singularity
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpScsrlsvcholHost
    end function hipsolverSpScsrlsvcholHost

    !---------------------------------------------
    ! hipsolverSpDcsrlsvcholHost
    !---------------------------------------------
    function hipsolverSpDcsrlsvcholHost(handle, n, nnzA, descrA, csrVal, csrRowPtr, csrColInd, b, &
                                        tolerance, reorder, x, singularity) &
       result(SpDcsrlsvcholHost) &
       bind(C, name="hipsolverSpDcsrlsvcholHost")
       import :: c_ptr, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       type(c_ptr), value :: csrRowPtr
       type(c_ptr), value :: csrColInd
       type(c_ptr), value :: b
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       type(c_ptr), value :: x
       integer(c_int) :: singularity
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpDcsrlsvcholHost
    end function hipsolverSpDcsrlsvcholHost

    !---------------------------------------------
    ! hipsolverSpScsrlsvqr
    !---------------------------------------------
    function hipsolverSpScsrlsvqr(handle, n, nnz, descrA, csrVal, csrRowPts, csrColInd, b, &
                                  tolerance, reorder, x, singularity) &
       result(SpScsrlsvqr) &
       bind(C, name="hipsolverSpScsrlsvqr")
       import :: c_ptr, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       type(c_ptr), value :: csrRowPts
       type(c_ptr), value :: csrColInd
       type(c_ptr), value :: b
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       type(c_ptr), value :: x
       integer(c_int) :: singularity
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpScsrlsvqr
    end function hipsolverSpScsrlsvqr

    !---------------------------------------------
    ! hipsolverSpDcsrlsvqr
    !---------------------------------------------
    function hipsolverSpDcsrlsvqr(handle, n, nnz, descrA, csrVal, csrRowPts, csrColInd, b, &
                                  tolerance, reorder, x, singularity) &
       result(SpDcsrlsvqr) &
       bind(C, name="hipsolverSpDcsrlsvqr")
       import :: c_ptr, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       type(c_ptr), value :: csrRowPts
       type(c_ptr), value :: csrColInd
       type(c_ptr), value :: b
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       type(c_ptr), value :: x
       integer(c_int) :: singularity
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpDcsrlsvqr
    end function hipsolverSpDcsrlsvqr

    !---------------------------------------------
    ! hipsolverSpCcsrlsvqr
    !---------------------------------------------
    function hipsolverSpCcsrlsvqr(handle, n, nnz, descrA, csrVal, csrRowPts, csrColInd, b, &
                                  tolerance, reorder, x, singularity) &
       result(SpCcsrlsvqr) &
       bind(C, name="hipsolverSpCcsrlsvqr")
       import :: c_ptr, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       type(c_ptr), value :: csrRowPts
       type(c_ptr), value :: csrColInd
       type(c_ptr), value :: b
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       type(c_ptr), value :: x
       integer(c_int) :: singularity
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpCcsrlsvqr
    end function hipsolverSpCcsrlsvqr

    !---------------------------------------------
    ! hipsolverSpZcsrlsvqr
    !---------------------------------------------
    function hipsolverSpZcsrlsvqr(handle, n, nnz, descrA, csrVal, csrRowPts, csrColInd, b, &
                                  tolerance, reorder, x, singularity) &
       result(SpZcsrlsvqr) &
       bind(C, name="hipsolverSpZcsrlsvqr")
       import :: c_ptr, c_int, c_double, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       type(c_ptr), value :: csrRowPts
       type(c_ptr), value :: csrColInd
       type(c_ptr), value :: b
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       type(c_ptr), value :: x
       integer(c_int) :: singularity
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: SpZcsrlsvqr
    end function hipsolverSpZcsrlsvqr

  end interface

  interface hipsolverSorgbr_bufferSize
    function hipsolverSorgbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverSorgbr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDorgbr_bufferSize
    function hipsolverDorgbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDorgbr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCungbr_bufferSize
    function hipsolverCungbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverCungbr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZungbr_bufferSize
    function hipsolverZungbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverZungbr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSorgbr
    function hipsolverSorgbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverSorgbr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDorgbr
    function hipsolverDorgbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDorgbr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCungbr
    function hipsolverCungbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverCungbr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZungbr
    function hipsolverZungbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverZungbr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSorgqr_bufferSize
    function hipsolverSorgqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverSorgqr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDorgqr_bufferSize
    function hipsolverDorgqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDorgqr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCungqr_bufferSize
    function hipsolverCungqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverCungqr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZungqr_bufferSize
    function hipsolverZungqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverZungqr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSorgqr
    function hipsolverSorgqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverSorgqr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDorgqr
    function hipsolverDorgqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDorgqr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCungqr
    function hipsolverCungqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverCungqr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZungqr
    function hipsolverZungqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverZungqr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSorgtr_bufferSize
    function hipsolverSorgtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverSorgtr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDorgtr_bufferSize
    function hipsolverDorgtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverDorgtr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCungtr_bufferSize
    function hipsolverCungtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverCungtr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZungtr_bufferSize
    function hipsolverZungtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverZungtr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSorgtr
    function hipsolverSorgtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverSorgtr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDorgtr
    function hipsolverDorgtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDorgtr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCungtr
    function hipsolverCungtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverCungtr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZungtr
    function hipsolverZungtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverZungtr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSormqr_bufferSize
    function hipsolverSormqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverSormqr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDormqr_bufferSize
    function hipsolverDormqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDormqr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCunmqr_bufferSize
    function hipsolverCunmqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverCunmqr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZunmqr_bufferSize
    function hipsolverZunmqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverZunmqr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSormqr
    function hipsolverSormqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverSormqr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDormqr
    function hipsolverDormqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDormqr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCunmqr
    function hipsolverCunmqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverCunmqr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZunmqr
    function hipsolverZunmqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverZunmqr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSormtr_bufferSize
    function hipsolverSormtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverSormtr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDormtr_bufferSize
    function hipsolverDormtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDormtr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCunmtr_bufferSize
    function hipsolverCunmtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverCunmtr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZunmtr_bufferSize
    function hipsolverZunmtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverZunmtr_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSormtr
    function hipsolverSormtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverSormtr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDormtr
    function hipsolverDormtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDormtr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCunmtr
    function hipsolverCunmtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverCunmtr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZunmtr
    function hipsolverZunmtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverZunmtr")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSgebrd
    function hipsolverSgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverSgebrd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDgebrd
    function hipsolverDgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverDgebrd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCgebrd
    function hipsolverCgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverCgebrd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZgebrd
    function hipsolverZgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverZgebrd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSgeqrf_bufferSize
    function hipsolverSgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverSgeqrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDgeqrf_bufferSize
    function hipsolverDgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDgeqrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCgeqrf_bufferSize
    function hipsolverCgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverCgeqrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZgeqrf_bufferSize
    function hipsolverZgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverZgeqrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSgeqrf
    function hipsolverSgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverSgeqrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDgeqrf
    function hipsolverDgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDgeqrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCgeqrf
    function hipsolverCgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverCgeqrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZgeqrf
    function hipsolverZgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverZgeqrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSSgesv_bufferSize
    function hipsolverSSgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverSSgesv_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function
  end interface

  interface hipsolverDDgesv_bufferSize
    function hipsolverDDgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverDDgesv_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function
  end interface

  interface hipsolverCCgesv_bufferSize
    function hipsolverCCgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverCCgesv_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function
  end interface

  interface hipsolverZZgesv_bufferSize
    function hipsolverZZgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverZZgesv_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function
  end interface

  interface hipsolverSSgesv
    function hipsolverSSgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverSSgesv")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDDgesv
    function hipsolverDDgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDDgesv")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCCgesv
    function hipsolverCCgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverCCgesv")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZZgesv
    function hipsolverZZgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverZZgesv")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSgetrf_bufferSize
    function hipsolverSgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverSgetrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDgetrf_bufferSize
    function hipsolverDgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDgetrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCgetrf_bufferSize
    function hipsolverCgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverCgetrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZgetrf_bufferSize
    function hipsolverZgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverZgetrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSgetrf
    function hipsolverSgetrf_(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) &
        bind(c, name="hipsolverSgetrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDgetrf
    function hipsolverDgetrf_(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) &
        bind(c, name="hipsolverDgetrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCgetrf
    function hipsolverCgetrf_(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) &
        bind(c, name="hipsolverCgetrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZgetrf
    function hipsolverZgetrf_(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) &
        bind(c, name="hipsolverZgetrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSgetrs_bufferSize
    function hipsolverSgetrs_bufferSize_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) &
        bind(c, name="hipsolverSgetrs_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDgetrs_bufferSize
    function hipsolverDgetrs_bufferSize_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) &
        bind(c, name="hipsolverDgetrs_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCgetrs_bufferSize
    function hipsolverCgetrs_bufferSize_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) &
        bind(c, name="hipsolverCgetrs_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZgetrs_bufferSize
    function hipsolverZgetrs_bufferSize_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) &
        bind(c, name="hipsolverZgetrs_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSgetrs
    function hipsolverSgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverSgetrs")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDgetrs
    function hipsolverDgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverDgetrs")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCgetrs
    function hipsolverCgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverCgetrs")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZgetrs
    function hipsolverZgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverZgetrs")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSpotrf_bufferSize
    function hipsolverSpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverSpotrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDpotrf_bufferSize
    function hipsolverDpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDpotrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCpotrf_bufferSize
    function hipsolverCpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverCpotrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZpotrf_bufferSize
    function hipsolverZpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverZpotrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSpotrf
    function hipsolverSpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverSpotrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDpotrf
    function hipsolverDpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDpotrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCpotrf
    function hipsolverCpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverCpotrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZpotrf
    function hipsolverZpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverZpotrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSpotri_bufferSize
    function hipsolverSpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverSpotri_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDpotri_bufferSize
    function hipsolverDpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDpotri_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCpotri_bufferSize
    function hipsolverCpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverCpotri_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZpotri_bufferSize
    function hipsolverZpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverZpotri_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSpotri
    function hipsolverSpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverSpotri")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDpotri
    function hipsolverDpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDpotri")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCpotri
    function hipsolverCpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverCpotri")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZpotri
    function hipsolverZpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverZpotri")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSpotrs_bufferSize
    function hipsolverSpotrs_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork) &
        bind(c, name="hipsolverSpotrs_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDpotrs_bufferSize
    function hipsolverDpotrs_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork) &
        bind(c, name="hipsolverDpotrs_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCpotrs_bufferSize
    function hipsolverCpotrs_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork) &
        bind(c, name="hipsolverCpotrs_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZpotrs_bufferSize
    function hipsolverZpotrs_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork) &
        bind(c, name="hipsolverZpotrs_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSpotrs
    function hipsolverSpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverSpotrs")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDpotrs
    function hipsolverDpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverDpotrs")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCpotrs
    function hipsolverCpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverCpotrs")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZpotrs
    function hipsolverZpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverZpotrs")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSsyevd_bufferSize
    function hipsolverSsyevd_bufferSize_(handle,jobz,uplo,n,A,lda,D,lwork) &
        bind(c, name="hipsolverSsyevd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDsyevd_bufferSize
    function hipsolverDsyevd_bufferSize_(handle,jobz,uplo,n,A,lda,D,lwork) &
        bind(c, name="hipsolverDsyevd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCheevd_bufferSize
    function hipsolverCheevd_bufferSize_(handle,jobz,uplo,n,A,lda,D,lwork) &
        bind(c, name="hipsolverCheevd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZheevd_bufferSize
    function hipsolverZheevd_bufferSize_(handle,jobz,uplo,n,A,lda,D,lwork) &
        bind(c, name="hipsolverZheevd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSsyevd
    function hipsolverSsyevd_(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) &
        bind(c, name="hipsolverSsyevd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDsyevd
    function hipsolverDsyevd_(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) &
        bind(c, name="hipsolverDsyevd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCheevd
    function hipsolverCheevd_(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) &
        bind(c, name="hipsolverCheevd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZheevd
    function hipsolverZheevd_(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) &
        bind(c, name="hipsolverZheevd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSsygvd_bufferSize
    function hipsolverSsygvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverSsygvd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDsygvd_bufferSize
    function hipsolverDsygvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverDsygvd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverChegvd_bufferSize
    function hipsolverChegvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverChegvd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZhegvd_bufferSize
    function hipsolverZhegvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverZhegvd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSsygvd
    function hipsolverSsygvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverSsygvd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDsygvd
    function hipsolverDsygvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDsygvd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverChegvd
    function hipsolverChegvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverChegvd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZhegvd
    function hipsolverZhegvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverZhegvd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSsytrd_bufferSize
    function hipsolverSsytrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverSsytrd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDsytrd_bufferSize
    function hipsolverDsytrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverDsytrd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverChetrd_bufferSize
    function hipsolverChetrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverChetrd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZhetrd_bufferSize
    function hipsolverZhetrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverZhetrd_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSsytrd
    function hipsolverSsytrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverSsytrd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDsytrd
    function hipsolverDsytrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDsytrd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverChetrd
    function hipsolverChetrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverChetrd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZhetrd
    function hipsolverZhetrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverZhetrd")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverSsytrf_bufferSize
    function hipsolverSsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverSsytrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDsytrf_bufferSize
    function hipsolverDsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverDsytrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverCsytrf_bufferSize
    function hipsolverCsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverCsytrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverZsytrf_bufferSize
    function hipsolverZsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverZsytrf_bufferSize")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverSsytrf
    function hipsolverSsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverSsytrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverDsytrf
    function hipsolverDsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverDsytrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverCsytrf
    function hipsolverCsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverCsytrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface

  interface hipsolverZsytrf
    function hipsolverZsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverZsytrf")
      use iso_c_binding
      import
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function
  end interface


  contains

    subroutine hipsolverCheck(status)
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: status
      if (status /= HIPSOLVER_STATUS_SUCCESS) then
        write (*, *) "HIPSOLVER ERROR: code = ", status
        stop 1
      end if
    end subroutine hipsolverCheck
end module hipsolver
