!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2020-2026 Advanced Micro Devices, Inc. All rights reserved.
! [MITx11 License]
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
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
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
  integer(c_int), parameter :: hipsolverVersionMinor = 6
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
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: mode
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: ZgesvdjBatched
    end function hipsolverZgesvdjBatched

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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: Zhegvj
    end function hipsolverZhegvj

    !---------------------------------------------
    ! hipsolverDnCreate
    !---------------------------------------------
    !>  \brief An alias for `hipsolverCreate`.
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
    !>  \brief An alias for `hipsolverDestroy`.
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
    !>  \brief An alias for `hipsolverSetStream`.
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
    !>  \brief An alias for `hipsolverGetStream`.
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
    !>  \brief An alias for `hipsolverSetDeterministicMode`.
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
    !>  \brief An alias for `hipsolverGetDeterministicMode`.
    function hipsolverDnGetDeterministicMode(handle, mode) &
       result(DnGetDeterministicMode) &
       bind(C, name="hipsolverDnGetDeterministicMode")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: mode
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       type(c_ptr), value :: nev
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
       import :: c_ptr, HIPSOLVER_EIG_MODE_NOVECTOR, c_int64_t, c_int, HIPSOLVER_STATUS_SUCCESS
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
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
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
       import :: c_ptr, c_int64_t, c_int, HIPSOLVER_STATUS_SUCCESS
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
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
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
       integer(c_int) :: devInfo
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
       integer(c_int) :: devInfo
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnXgetrs
    end function hipsolverDnXgetrs

    !---------------------------------------------
    ! hipsolverDnXpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDnXpotrf_bufferSize(handle, params, uplo, n, dataTypeA, A, lda, computeType, &
                                          lworkOnDevice, lworkOnHost) &
       result(DnXpotrf_bufferSize) &
       bind(C, name="hipsolverDnXpotrf_bufferSize")
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int64_t, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_FILL_MODE_UPPER)), value :: uplo
       integer(c_int64_t), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_int64_t), value :: lda
       integer(c_int), value :: computeType
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
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
                 HIPSOLVER_STATUS_SUCCESS
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
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
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
                 HIPSOLVER_STATUS_SUCCESS
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
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
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
       import :: c_ptr, HIPSOLVER_FILL_MODE_UPPER, c_int64_t, c_int, HIPSOLVER_STATUS_SUCCESS
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
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
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
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: fact_alg
       type(c_ptr), value :: solve_alg
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfGet_Algs
    end function hipsolverRfGet_Algs

    !---------------------------------------------
    ! hipsolverRfGetMatrixFormat
    !---------------------------------------------
    function hipsolverRfGetMatrixFormat(handle, myFormat, diag) &
       result(RfGetMatrixFormat) &
       bind(C, name="hipsolverRfGetMatrixFormat")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: myFormat
       type(c_ptr), value :: diag
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: RfGetMatrixFormat
    end function hipsolverRfGetMatrixFormat

    !---------------------------------------------
    ! hipsolverRfGetNumericBoostReport
    !---------------------------------------------
    function hipsolverRfGetNumericBoostReport(handle, report) &
       result(RfGetNumericBoostReport) &
       bind(C, name="hipsolverRfGetNumericBoostReport")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: report
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
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       type(c_ptr), value :: fastMode
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
       import :: c_ptr, c_int, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: handle
       integer(c_int) :: position
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
       type(c_ptr), value :: singularity
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
       type(c_ptr), value :: singularity
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
       type(c_ptr), value :: singularity
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
       type(c_ptr), value :: singularity
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
       type(c_ptr), value :: singularity
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
      real(c_float) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSorgbr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSorgbr_bufferSize_rank_0,&
      hipsolverSorgbr_bufferSize_rank_1,&
      hipsolverSorgbr_bufferSize_full_rank
#endif
#endif
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
      real(c_double) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDorgbr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDorgbr_bufferSize_rank_0,&
      hipsolverDorgbr_bufferSize_rank_1,&
      hipsolverDorgbr_bufferSize_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCungbr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCungbr_bufferSize_rank_0,&
      hipsolverCungbr_bufferSize_rank_1,&
      hipsolverCungbr_bufferSize_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZungbr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZungbr_bufferSize_rank_0,&
      hipsolverZungbr_bufferSize_rank_1,&
      hipsolverZungbr_bufferSize_full_rank
#endif
#endif
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
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSorgbr_assumed_rank
#else
    module procedure &
      hipsolverSorgbr_rank_0,&
      hipsolverSorgbr_rank_1,&
      hipsolverSorgbr_full_rank
#endif
#endif
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
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDorgbr_assumed_rank
#else
    module procedure &
      hipsolverDorgbr_rank_0,&
      hipsolverDorgbr_rank_1,&
      hipsolverDorgbr_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCungbr_assumed_rank
#else
    module procedure &
      hipsolverCungbr_rank_0,&
      hipsolverCungbr_rank_1,&
      hipsolverCungbr_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZungbr_assumed_rank
#else
    module procedure &
      hipsolverZungbr_rank_0,&
      hipsolverZungbr_rank_1,&
      hipsolverZungbr_full_rank
#endif
#endif
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
      real(c_float) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSorgqr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSorgqr_bufferSize_rank_0,&
      hipsolverSorgqr_bufferSize_rank_1,&
      hipsolverSorgqr_bufferSize_full_rank
#endif
#endif
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
      real(c_double) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDorgqr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDorgqr_bufferSize_rank_0,&
      hipsolverDorgqr_bufferSize_rank_1,&
      hipsolverDorgqr_bufferSize_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCungqr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCungqr_bufferSize_rank_0,&
      hipsolverCungqr_bufferSize_rank_1,&
      hipsolverCungqr_bufferSize_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZungqr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZungqr_bufferSize_rank_0,&
      hipsolverZungqr_bufferSize_rank_1,&
      hipsolverZungqr_bufferSize_full_rank
#endif
#endif
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
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSorgqr_assumed_rank
#else
    module procedure &
      hipsolverSorgqr_rank_0,&
      hipsolverSorgqr_rank_1,&
      hipsolverSorgqr_full_rank
#endif
#endif
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
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDorgqr_assumed_rank
#else
    module procedure &
      hipsolverDorgqr_rank_0,&
      hipsolverDorgqr_rank_1,&
      hipsolverDorgqr_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCungqr_assumed_rank
#else
    module procedure &
      hipsolverCungqr_rank_0,&
      hipsolverCungqr_rank_1,&
      hipsolverCungqr_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZungqr_assumed_rank
#else
    module procedure &
      hipsolverZungqr_rank_0,&
      hipsolverZungqr_rank_1,&
      hipsolverZungqr_full_rank
#endif
#endif
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
      real(c_float) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSorgtr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSorgtr_bufferSize_rank_0,&
      hipsolverSorgtr_bufferSize_rank_1,&
      hipsolverSorgtr_bufferSize_full_rank
#endif
#endif
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
      real(c_double) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDorgtr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDorgtr_bufferSize_rank_0,&
      hipsolverDorgtr_bufferSize_rank_1,&
      hipsolverDorgtr_bufferSize_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCungtr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCungtr_bufferSize_rank_0,&
      hipsolverCungtr_bufferSize_rank_1,&
      hipsolverCungtr_bufferSize_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZungtr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZungtr_bufferSize_rank_0,&
      hipsolverZungtr_bufferSize_rank_1,&
      hipsolverZungtr_bufferSize_full_rank
#endif
#endif
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
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSorgtr_assumed_rank
#else
    module procedure &
      hipsolverSorgtr_rank_0,&
      hipsolverSorgtr_rank_1,&
      hipsolverSorgtr_full_rank
#endif
#endif
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
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDorgtr_assumed_rank
#else
    module procedure &
      hipsolverDorgtr_rank_0,&
      hipsolverDorgtr_rank_1,&
      hipsolverDorgtr_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCungtr_assumed_rank
#else
    module procedure &
      hipsolverCungtr_rank_0,&
      hipsolverCungtr_rank_1,&
      hipsolverCungtr_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZungtr_assumed_rank
#else
    module procedure &
      hipsolverZungtr_rank_0,&
      hipsolverZungtr_rank_1,&
      hipsolverZungtr_full_rank
#endif
#endif
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
      real(c_float) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSormqr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSormqr_bufferSize_rank_0,&
      hipsolverSormqr_bufferSize_rank_1,&
      hipsolverSormqr_bufferSize_full_rank
#endif
#endif
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
      real(c_double) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDormqr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDormqr_bufferSize_rank_0,&
      hipsolverDormqr_bufferSize_rank_1,&
      hipsolverDormqr_bufferSize_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCunmqr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCunmqr_bufferSize_rank_0,&
      hipsolverCunmqr_bufferSize_rank_1,&
      hipsolverCunmqr_bufferSize_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZunmqr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZunmqr_bufferSize_rank_0,&
      hipsolverZunmqr_bufferSize_rank_1,&
      hipsolverZunmqr_bufferSize_full_rank
#endif
#endif
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
      real(c_float) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSormqr_assumed_rank
#else
    module procedure &
      hipsolverSormqr_rank_0,&
      hipsolverSormqr_rank_1,&
      hipsolverSormqr_full_rank
#endif
#endif
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
      real(c_double) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDormqr_assumed_rank
#else
    module procedure &
      hipsolverDormqr_rank_0,&
      hipsolverDormqr_rank_1,&
      hipsolverDormqr_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCunmqr_assumed_rank
#else
    module procedure &
      hipsolverCunmqr_rank_0,&
      hipsolverCunmqr_rank_1,&
      hipsolverCunmqr_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZunmqr_assumed_rank
#else
    module procedure &
      hipsolverZunmqr_rank_0,&
      hipsolverZunmqr_rank_1,&
      hipsolverZunmqr_full_rank
#endif
#endif
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
      real(c_float) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSormtr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSormtr_bufferSize_rank_0,&
      hipsolverSormtr_bufferSize_rank_1,&
      hipsolverSormtr_bufferSize_full_rank
#endif
#endif
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
      real(c_double) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDormtr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDormtr_bufferSize_rank_0,&
      hipsolverDormtr_bufferSize_rank_1,&
      hipsolverDormtr_bufferSize_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCunmtr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCunmtr_bufferSize_rank_0,&
      hipsolverCunmtr_bufferSize_rank_1,&
      hipsolverCunmtr_bufferSize_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZunmtr_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZunmtr_bufferSize_rank_0,&
      hipsolverZunmtr_bufferSize_rank_1,&
      hipsolverZunmtr_bufferSize_full_rank
#endif
#endif
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
      real(c_float) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSormtr_assumed_rank
#else
    module procedure &
      hipsolverSormtr_rank_0,&
      hipsolverSormtr_rank_1,&
      hipsolverSormtr_full_rank
#endif
#endif
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
      real(c_double) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDormtr_assumed_rank
#else
    module procedure &
      hipsolverDormtr_rank_0,&
      hipsolverDormtr_rank_1,&
      hipsolverDormtr_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCunmtr_assumed_rank
#else
    module procedure &
      hipsolverCunmtr_rank_0,&
      hipsolverCunmtr_rank_1,&
      hipsolverCunmtr_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZunmtr_assumed_rank
#else
    module procedure &
      hipsolverZunmtr_rank_0,&
      hipsolverZunmtr_rank_1,&
      hipsolverZunmtr_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSgebrd_assumed_rank
#else
    module procedure &
      hipsolverSgebrd_rank_0,&
      hipsolverSgebrd_rank_1,&
      hipsolverSgebrd_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDgebrd_assumed_rank
#else
    module procedure &
      hipsolverDgebrd_rank_0,&
      hipsolverDgebrd_rank_1,&
      hipsolverDgebrd_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCgebrd_assumed_rank
#else
    module procedure &
      hipsolverCgebrd_rank_0,&
      hipsolverCgebrd_rank_1,&
      hipsolverCgebrd_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZgebrd_assumed_rank
#else
    module procedure &
      hipsolverZgebrd_rank_0,&
      hipsolverZgebrd_rank_1,&
      hipsolverZgebrd_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSgeqrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSgeqrf_bufferSize_rank_0,&
      hipsolverSgeqrf_bufferSize_rank_1,&
      hipsolverSgeqrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDgeqrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDgeqrf_bufferSize_rank_0,&
      hipsolverDgeqrf_bufferSize_rank_1,&
      hipsolverDgeqrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCgeqrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCgeqrf_bufferSize_rank_0,&
      hipsolverCgeqrf_bufferSize_rank_1,&
      hipsolverCgeqrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZgeqrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZgeqrf_bufferSize_rank_0,&
      hipsolverZgeqrf_bufferSize_rank_1,&
      hipsolverZgeqrf_bufferSize_full_rank
#endif
#endif
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
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSgeqrf_assumed_rank
#else
    module procedure &
      hipsolverSgeqrf_rank_0,&
      hipsolverSgeqrf_rank_1,&
      hipsolverSgeqrf_full_rank
#endif
#endif
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
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDgeqrf_assumed_rank
#else
    module procedure &
      hipsolverDgeqrf_rank_0,&
      hipsolverDgeqrf_rank_1,&
      hipsolverDgeqrf_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCgeqrf_assumed_rank
#else
    module procedure &
      hipsolverCgeqrf_rank_0,&
      hipsolverCgeqrf_rank_1,&
      hipsolverCgeqrf_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZgeqrf_assumed_rank
#else
    module procedure &
      hipsolverZgeqrf_rank_0,&
      hipsolverZgeqrf_rank_1,&
      hipsolverZgeqrf_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSSgesv_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSSgesv_bufferSize_rank_0,&
      hipsolverSSgesv_bufferSize_rank_1,&
      hipsolverSSgesv_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDDgesv_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDDgesv_bufferSize_rank_0,&
      hipsolverDDgesv_bufferSize_rank_1,&
      hipsolverDDgesv_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCCgesv_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCCgesv_bufferSize_rank_0,&
      hipsolverCCgesv_bufferSize_rank_1,&
      hipsolverCCgesv_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZZgesv_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZZgesv_bufferSize_rank_0,&
      hipsolverZZgesv_bufferSize_rank_1,&
      hipsolverZZgesv_bufferSize_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSSgesv_assumed_rank
#else
    module procedure &
      hipsolverSSgesv_rank_0,&
      hipsolverSSgesv_rank_1,&
      hipsolverSSgesv_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDDgesv_assumed_rank
#else
    module procedure &
      hipsolverDDgesv_rank_0,&
      hipsolverDDgesv_rank_1,&
      hipsolverDDgesv_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCCgesv_assumed_rank
#else
    module procedure &
      hipsolverCCgesv_rank_0,&
      hipsolverCCgesv_rank_1,&
      hipsolverCCgesv_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZZgesv_assumed_rank
#else
    module procedure &
      hipsolverZZgesv_rank_0,&
      hipsolverZZgesv_rank_1,&
      hipsolverZZgesv_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSgetrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSgetrf_bufferSize_rank_0,&
      hipsolverSgetrf_bufferSize_rank_1,&
      hipsolverSgetrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDgetrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDgetrf_bufferSize_rank_0,&
      hipsolverDgetrf_bufferSize_rank_1,&
      hipsolverDgetrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCgetrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCgetrf_bufferSize_rank_0,&
      hipsolverCgetrf_bufferSize_rank_1,&
      hipsolverCgetrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZgetrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZgetrf_bufferSize_rank_0,&
      hipsolverZgetrf_bufferSize_rank_1,&
      hipsolverZgetrf_bufferSize_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSgetrf_assumed_rank
#else
    module procedure &
      hipsolverSgetrf_rank_0,&
      hipsolverSgetrf_rank_1,&
      hipsolverSgetrf_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDgetrf_assumed_rank
#else
    module procedure &
      hipsolverDgetrf_rank_0,&
      hipsolverDgetrf_rank_1,&
      hipsolverDgetrf_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCgetrf_assumed_rank
#else
    module procedure &
      hipsolverCgetrf_rank_0,&
      hipsolverCgetrf_rank_1,&
      hipsolverCgetrf_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZgetrf_assumed_rank
#else
    module procedure &
      hipsolverZgetrf_rank_0,&
      hipsolverZgetrf_rank_1,&
      hipsolverZgetrf_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSgetrs_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSgetrs_bufferSize_rank_0,&
      hipsolverSgetrs_bufferSize_rank_1,&
      hipsolverSgetrs_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDgetrs_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDgetrs_bufferSize_rank_0,&
      hipsolverDgetrs_bufferSize_rank_1,&
      hipsolverDgetrs_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCgetrs_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCgetrs_bufferSize_rank_0,&
      hipsolverCgetrs_bufferSize_rank_1,&
      hipsolverCgetrs_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZgetrs_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZgetrs_bufferSize_rank_0,&
      hipsolverZgetrs_bufferSize_rank_1,&
      hipsolverZgetrs_bufferSize_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSgetrs_assumed_rank
#else
    module procedure &
      hipsolverSgetrs_rank_0,&
      hipsolverSgetrs_rank_1,&
      hipsolverSgetrs_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDgetrs_assumed_rank
#else
    module procedure &
      hipsolverDgetrs_rank_0,&
      hipsolverDgetrs_rank_1,&
      hipsolverDgetrs_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCgetrs_assumed_rank
#else
    module procedure &
      hipsolverCgetrs_rank_0,&
      hipsolverCgetrs_rank_1,&
      hipsolverCgetrs_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZgetrs_assumed_rank
#else
    module procedure &
      hipsolverZgetrs_rank_0,&
      hipsolverZgetrs_rank_1,&
      hipsolverZgetrs_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSpotrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSpotrf_bufferSize_rank_0,&
      hipsolverSpotrf_bufferSize_rank_1,&
      hipsolverSpotrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDpotrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDpotrf_bufferSize_rank_0,&
      hipsolverDpotrf_bufferSize_rank_1,&
      hipsolverDpotrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCpotrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCpotrf_bufferSize_rank_0,&
      hipsolverCpotrf_bufferSize_rank_1,&
      hipsolverCpotrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZpotrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZpotrf_bufferSize_rank_0,&
      hipsolverZpotrf_bufferSize_rank_1,&
      hipsolverZpotrf_bufferSize_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSpotrf_assumed_rank
#else
    module procedure &
      hipsolverSpotrf_rank_0,&
      hipsolverSpotrf_rank_1,&
      hipsolverSpotrf_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDpotrf_assumed_rank
#else
    module procedure &
      hipsolverDpotrf_rank_0,&
      hipsolverDpotrf_rank_1,&
      hipsolverDpotrf_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCpotrf_assumed_rank
#else
    module procedure &
      hipsolverCpotrf_rank_0,&
      hipsolverCpotrf_rank_1,&
      hipsolverCpotrf_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZpotrf_assumed_rank
#else
    module procedure &
      hipsolverZpotrf_rank_0,&
      hipsolverZpotrf_rank_1,&
      hipsolverZpotrf_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSpotri_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSpotri_bufferSize_rank_0,&
      hipsolverSpotri_bufferSize_rank_1,&
      hipsolverSpotri_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDpotri_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDpotri_bufferSize_rank_0,&
      hipsolverDpotri_bufferSize_rank_1,&
      hipsolverDpotri_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCpotri_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCpotri_bufferSize_rank_0,&
      hipsolverCpotri_bufferSize_rank_1,&
      hipsolverCpotri_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZpotri_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZpotri_bufferSize_rank_0,&
      hipsolverZpotri_bufferSize_rank_1,&
      hipsolverZpotri_bufferSize_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSpotri_assumed_rank
#else
    module procedure &
      hipsolverSpotri_rank_0,&
      hipsolverSpotri_rank_1,&
      hipsolverSpotri_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDpotri_assumed_rank
#else
    module procedure &
      hipsolverDpotri_rank_0,&
      hipsolverDpotri_rank_1,&
      hipsolverDpotri_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCpotri_assumed_rank
#else
    module procedure &
      hipsolverCpotri_rank_0,&
      hipsolverCpotri_rank_1,&
      hipsolverCpotri_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZpotri_assumed_rank
#else
    module procedure &
      hipsolverZpotri_rank_0,&
      hipsolverZpotri_rank_1,&
      hipsolverZpotri_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSpotrs_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSpotrs_bufferSize_rank_0,&
      hipsolverSpotrs_bufferSize_rank_1,&
      hipsolverSpotrs_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDpotrs_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDpotrs_bufferSize_rank_0,&
      hipsolverDpotrs_bufferSize_rank_1,&
      hipsolverDpotrs_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCpotrs_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCpotrs_bufferSize_rank_0,&
      hipsolverCpotrs_bufferSize_rank_1,&
      hipsolverCpotrs_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZpotrs_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZpotrs_bufferSize_rank_0,&
      hipsolverZpotrs_bufferSize_rank_1,&
      hipsolverZpotrs_bufferSize_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSpotrs_assumed_rank
#else
    module procedure &
      hipsolverSpotrs_rank_0,&
      hipsolverSpotrs_rank_1,&
      hipsolverSpotrs_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDpotrs_assumed_rank
#else
    module procedure &
      hipsolverDpotrs_rank_0,&
      hipsolverDpotrs_rank_1,&
      hipsolverDpotrs_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCpotrs_assumed_rank
#else
    module procedure &
      hipsolverCpotrs_rank_0,&
      hipsolverCpotrs_rank_1,&
      hipsolverCpotrs_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZpotrs_assumed_rank
#else
    module procedure &
      hipsolverZpotrs_rank_0,&
      hipsolverZpotrs_rank_1,&
      hipsolverZpotrs_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSsyevd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSsyevd_bufferSize_rank_0,&
      hipsolverSsyevd_bufferSize_rank_1,&
      hipsolverSsyevd_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDsyevd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDsyevd_bufferSize_rank_0,&
      hipsolverDsyevd_bufferSize_rank_1,&
      hipsolverDsyevd_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCheevd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCheevd_bufferSize_rank_0,&
      hipsolverCheevd_bufferSize_rank_1,&
      hipsolverCheevd_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZheevd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZheevd_bufferSize_rank_0,&
      hipsolverZheevd_bufferSize_rank_1,&
      hipsolverZheevd_bufferSize_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSsyevd_assumed_rank
#else
    module procedure &
      hipsolverSsyevd_rank_0,&
      hipsolverSsyevd_rank_1,&
      hipsolverSsyevd_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDsyevd_assumed_rank
#else
    module procedure &
      hipsolverDsyevd_rank_0,&
      hipsolverDsyevd_rank_1,&
      hipsolverDsyevd_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCheevd_assumed_rank
#else
    module procedure &
      hipsolverCheevd_rank_0,&
      hipsolverCheevd_rank_1,&
      hipsolverCheevd_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZheevd_assumed_rank
#else
    module procedure &
      hipsolverZheevd_rank_0,&
      hipsolverZheevd_rank_1,&
      hipsolverZheevd_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSsygvd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSsygvd_bufferSize_rank_0,&
      hipsolverSsygvd_bufferSize_rank_1,&
      hipsolverSsygvd_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDsygvd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDsygvd_bufferSize_rank_0,&
      hipsolverDsygvd_bufferSize_rank_1,&
      hipsolverDsygvd_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverChegvd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverChegvd_bufferSize_rank_0,&
      hipsolverChegvd_bufferSize_rank_1,&
      hipsolverChegvd_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZhegvd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZhegvd_bufferSize_rank_0,&
      hipsolverZhegvd_bufferSize_rank_1,&
      hipsolverZhegvd_bufferSize_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSsygvd_assumed_rank
#else
    module procedure &
      hipsolverSsygvd_rank_0,&
      hipsolverSsygvd_rank_1,&
      hipsolverSsygvd_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDsygvd_assumed_rank
#else
    module procedure &
      hipsolverDsygvd_rank_0,&
      hipsolverDsygvd_rank_1,&
      hipsolverDsygvd_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverChegvd_assumed_rank
#else
    module procedure &
      hipsolverChegvd_rank_0,&
      hipsolverChegvd_rank_1,&
      hipsolverChegvd_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZhegvd_assumed_rank
#else
    module procedure &
      hipsolverZhegvd_rank_0,&
      hipsolverZhegvd_rank_1,&
      hipsolverZhegvd_full_rank
#endif
#endif
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
      real(c_float) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSsytrd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSsytrd_bufferSize_rank_0,&
      hipsolverSsytrd_bufferSize_rank_1,&
      hipsolverSsytrd_bufferSize_full_rank
#endif
#endif
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
      real(c_double) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDsytrd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDsytrd_bufferSize_rank_0,&
      hipsolverDsytrd_bufferSize_rank_1,&
      hipsolverDsytrd_bufferSize_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverChetrd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverChetrd_bufferSize_rank_0,&
      hipsolverChetrd_bufferSize_rank_1,&
      hipsolverChetrd_bufferSize_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZhetrd_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZhetrd_bufferSize_rank_0,&
      hipsolverZhetrd_bufferSize_rank_1,&
      hipsolverZhetrd_bufferSize_full_rank
#endif
#endif
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
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSsytrd_assumed_rank
#else
    module procedure &
      hipsolverSsytrd_rank_0,&
      hipsolverSsytrd_rank_1,&
      hipsolverSsytrd_full_rank
#endif
#endif
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
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDsytrd_assumed_rank
#else
    module procedure &
      hipsolverDsytrd_rank_0,&
      hipsolverDsytrd_rank_1,&
      hipsolverDsytrd_full_rank
#endif
#endif
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
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverChetrd_assumed_rank
#else
    module procedure &
      hipsolverChetrd_rank_0,&
      hipsolverChetrd_rank_1,&
      hipsolverChetrd_full_rank
#endif
#endif
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
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZhetrd_assumed_rank
#else
    module procedure &
      hipsolverZhetrd_rank_0,&
      hipsolverZhetrd_rank_1,&
      hipsolverZhetrd_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSsytrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverSsytrf_bufferSize_rank_0,&
      hipsolverSsytrf_bufferSize_rank_1,&
      hipsolverSsytrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDsytrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverDsytrf_bufferSize_rank_0,&
      hipsolverDsytrf_bufferSize_rank_1,&
      hipsolverDsytrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCsytrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverCsytrf_bufferSize_rank_0,&
      hipsolverCsytrf_bufferSize_rank_1,&
      hipsolverCsytrf_bufferSize_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZsytrf_bufferSize_assumed_rank
#else
    module procedure &
      hipsolverZsytrf_bufferSize_rank_0,&
      hipsolverZsytrf_bufferSize_rank_1,&
      hipsolverZsytrf_bufferSize_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverSsytrf_assumed_rank
#else
    module procedure &
      hipsolverSsytrf_rank_0,&
      hipsolverSsytrf_rank_1,&
      hipsolverSsytrf_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverDsytrf_assumed_rank
#else
    module procedure &
      hipsolverDsytrf_rank_0,&
      hipsolverDsytrf_rank_1,&
      hipsolverDsytrf_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverCsytrf_assumed_rank
#else
    module procedure &
      hipsolverCsytrf_rank_0,&
      hipsolverCsytrf_rank_1,&
      hipsolverCsytrf_full_rank
#endif
#endif
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
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipsolverZsytrf_assumed_rank
#else
    module procedure &
      hipsolverZsytrf_rank_0,&
      hipsolverZsytrf_rank_1,&
      hipsolverZsytrf_full_rank
#endif
#endif
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

#ifdef USE_FPOINTER_INTERFACES

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSorgbr_bufferSize_assumed_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgbr_bufferSize_assumed_rank = hipsolverSorgbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#else
    function hipsolverSorgbr_bufferSize_rank_0(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgbr_bufferSize_rank_0 = hipsolverSorgbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverSorgbr_bufferSize_rank_1(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgbr_bufferSize_rank_1 = hipsolverSorgbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverSorgbr_bufferSize_full_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgbr_bufferSize_full_rank = hipsolverSorgbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDorgbr_bufferSize_assumed_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgbr_bufferSize_assumed_rank = hipsolverDorgbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#else
    function hipsolverDorgbr_bufferSize_rank_0(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgbr_bufferSize_rank_0 = hipsolverDorgbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverDorgbr_bufferSize_rank_1(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgbr_bufferSize_rank_1 = hipsolverDorgbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverDorgbr_bufferSize_full_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgbr_bufferSize_full_rank = hipsolverDorgbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCungbr_bufferSize_assumed_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungbr_bufferSize_assumed_rank = hipsolverCungbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#else
    function hipsolverCungbr_bufferSize_rank_0(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungbr_bufferSize_rank_0 = hipsolverCungbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverCungbr_bufferSize_rank_1(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungbr_bufferSize_rank_1 = hipsolverCungbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverCungbr_bufferSize_full_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungbr_bufferSize_full_rank = hipsolverCungbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZungbr_bufferSize_assumed_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungbr_bufferSize_assumed_rank = hipsolverZungbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#else
    function hipsolverZungbr_bufferSize_rank_0(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungbr_bufferSize_rank_0 = hipsolverZungbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverZungbr_bufferSize_rank_1(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungbr_bufferSize_rank_1 = hipsolverZungbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverZungbr_bufferSize_full_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungbr_bufferSize_full_rank = hipsolverZungbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSorgbr_assumed_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgbr_assumed_rank = hipsolverSorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work, &
        lwork,devInfo)
    end function

#else
    function hipsolverSorgbr_rank_0(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgbr_rank_0 = hipsolverSorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverSorgbr_rank_1(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgbr_rank_1 = hipsolverSorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverSorgbr_full_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgbr_full_rank = hipsolverSorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDorgbr_assumed_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgbr_assumed_rank = hipsolverDorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work, &
        lwork,devInfo)
    end function

#else
    function hipsolverDorgbr_rank_0(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgbr_rank_0 = hipsolverDorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverDorgbr_rank_1(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgbr_rank_1 = hipsolverDorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverDorgbr_full_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgbr_full_rank = hipsolverDorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCungbr_assumed_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungbr_assumed_rank = hipsolverCungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work, &
        lwork,devInfo)
    end function

#else
    function hipsolverCungbr_rank_0(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungbr_rank_0 = hipsolverCungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverCungbr_rank_1(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungbr_rank_1 = hipsolverCungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverCungbr_full_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungbr_full_rank = hipsolverCungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZungbr_assumed_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungbr_assumed_rank = hipsolverZungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work, &
        lwork,devInfo)
    end function

#else
    function hipsolverZungbr_rank_0(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungbr_rank_0 = hipsolverZungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverZungbr_rank_1(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungbr_rank_1 = hipsolverZungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverZungbr_full_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungbr_full_rank = hipsolverZungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSorgqr_bufferSize_assumed_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgqr_bufferSize_assumed_rank = hipsolverSorgqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#else
    function hipsolverSorgqr_bufferSize_rank_0(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgqr_bufferSize_rank_0 = hipsolverSorgqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverSorgqr_bufferSize_rank_1(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgqr_bufferSize_rank_1 = hipsolverSorgqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverSorgqr_bufferSize_full_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgqr_bufferSize_full_rank = hipsolverSorgqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDorgqr_bufferSize_assumed_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgqr_bufferSize_assumed_rank = hipsolverDorgqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#else
    function hipsolverDorgqr_bufferSize_rank_0(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgqr_bufferSize_rank_0 = hipsolverDorgqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverDorgqr_bufferSize_rank_1(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgqr_bufferSize_rank_1 = hipsolverDorgqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverDorgqr_bufferSize_full_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgqr_bufferSize_full_rank = hipsolverDorgqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCungqr_bufferSize_assumed_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungqr_bufferSize_assumed_rank = hipsolverCungqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#else
    function hipsolverCungqr_bufferSize_rank_0(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungqr_bufferSize_rank_0 = hipsolverCungqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverCungqr_bufferSize_rank_1(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungqr_bufferSize_rank_1 = hipsolverCungqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverCungqr_bufferSize_full_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungqr_bufferSize_full_rank = hipsolverCungqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZungqr_bufferSize_assumed_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungqr_bufferSize_assumed_rank = hipsolverZungqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#else
    function hipsolverZungqr_bufferSize_rank_0(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungqr_bufferSize_rank_0 = hipsolverZungqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverZungqr_bufferSize_rank_1(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungqr_bufferSize_rank_1 = hipsolverZungqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverZungqr_bufferSize_full_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungqr_bufferSize_full_rank = hipsolverZungqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSorgqr_assumed_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgqr_assumed_rank = hipsolverSorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverSorgqr_rank_0(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgqr_rank_0 = hipsolverSorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSorgqr_rank_1(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgqr_rank_1 = hipsolverSorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSorgqr_full_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgqr_full_rank = hipsolverSorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDorgqr_assumed_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgqr_assumed_rank = hipsolverDorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverDorgqr_rank_0(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgqr_rank_0 = hipsolverDorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDorgqr_rank_1(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgqr_rank_1 = hipsolverDorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDorgqr_full_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgqr_full_rank = hipsolverDorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCungqr_assumed_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungqr_assumed_rank = hipsolverCungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverCungqr_rank_0(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungqr_rank_0 = hipsolverCungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCungqr_rank_1(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungqr_rank_1 = hipsolverCungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCungqr_full_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungqr_full_rank = hipsolverCungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZungqr_assumed_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungqr_assumed_rank = hipsolverZungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverZungqr_rank_0(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungqr_rank_0 = hipsolverZungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZungqr_rank_1(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungqr_rank_1 = hipsolverZungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZungqr_full_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungqr_full_rank = hipsolverZungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSorgtr_bufferSize_assumed_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgtr_bufferSize_assumed_rank = hipsolverSorgtr_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,tau,lwork)
    end function

#else
    function hipsolverSorgtr_bufferSize_rank_0(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgtr_bufferSize_rank_0 = hipsolverSorgtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverSorgtr_bufferSize_rank_1(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgtr_bufferSize_rank_1 = hipsolverSorgtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverSorgtr_bufferSize_full_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgtr_bufferSize_full_rank = hipsolverSorgtr_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDorgtr_bufferSize_assumed_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgtr_bufferSize_assumed_rank = hipsolverDorgtr_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,tau,lwork)
    end function

#else
    function hipsolverDorgtr_bufferSize_rank_0(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgtr_bufferSize_rank_0 = hipsolverDorgtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverDorgtr_bufferSize_rank_1(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgtr_bufferSize_rank_1 = hipsolverDorgtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverDorgtr_bufferSize_full_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgtr_bufferSize_full_rank = hipsolverDorgtr_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCungtr_bufferSize_assumed_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungtr_bufferSize_assumed_rank = hipsolverCungtr_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,tau,lwork)
    end function

#else
    function hipsolverCungtr_bufferSize_rank_0(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungtr_bufferSize_rank_0 = hipsolverCungtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverCungtr_bufferSize_rank_1(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungtr_bufferSize_rank_1 = hipsolverCungtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverCungtr_bufferSize_full_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungtr_bufferSize_full_rank = hipsolverCungtr_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZungtr_bufferSize_assumed_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungtr_bufferSize_assumed_rank = hipsolverZungtr_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,tau,lwork)
    end function

#else
    function hipsolverZungtr_bufferSize_rank_0(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungtr_bufferSize_rank_0 = hipsolverZungtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverZungtr_bufferSize_rank_1(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungtr_bufferSize_rank_1 = hipsolverZungtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverZungtr_bufferSize_full_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungtr_bufferSize_full_rank = hipsolverZungtr_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSorgtr_assumed_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgtr_assumed_rank = hipsolverSorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverSorgtr_rank_0(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgtr_rank_0 = hipsolverSorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSorgtr_rank_1(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgtr_rank_1 = hipsolverSorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSorgtr_full_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgtr_full_rank = hipsolverSorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDorgtr_assumed_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgtr_assumed_rank = hipsolverDorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverDorgtr_rank_0(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgtr_rank_0 = hipsolverDorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDorgtr_rank_1(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgtr_rank_1 = hipsolverDorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDorgtr_full_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgtr_full_rank = hipsolverDorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCungtr_assumed_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungtr_assumed_rank = hipsolverCungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverCungtr_rank_0(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungtr_rank_0 = hipsolverCungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCungtr_rank_1(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungtr_rank_1 = hipsolverCungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCungtr_full_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungtr_full_rank = hipsolverCungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZungtr_assumed_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungtr_assumed_rank = hipsolverZungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverZungtr_rank_0(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungtr_rank_0 = hipsolverZungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZungtr_rank_1(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungtr_rank_1 = hipsolverZungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZungtr_full_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungtr_full_rank = hipsolverZungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSormqr_bufferSize_assumed_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormqr_bufferSize_assumed_rank = hipsolverSormqr_bufferSize_(handle,side,trans,m,n, &
        k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#else
    function hipsolverSormqr_bufferSize_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormqr_bufferSize_rank_0 = hipsolverSormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverSormqr_bufferSize_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormqr_bufferSize_rank_1 = hipsolverSormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverSormqr_bufferSize_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormqr_bufferSize_full_rank = hipsolverSormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDormqr_bufferSize_assumed_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormqr_bufferSize_assumed_rank = hipsolverDormqr_bufferSize_(handle,side,trans,m,n, &
        k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#else
    function hipsolverDormqr_bufferSize_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormqr_bufferSize_rank_0 = hipsolverDormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverDormqr_bufferSize_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormqr_bufferSize_rank_1 = hipsolverDormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverDormqr_bufferSize_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormqr_bufferSize_full_rank = hipsolverDormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCunmqr_bufferSize_assumed_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmqr_bufferSize_assumed_rank = hipsolverCunmqr_bufferSize_(handle,side,trans,m,n, &
        k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#else
    function hipsolverCunmqr_bufferSize_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmqr_bufferSize_rank_0 = hipsolverCunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverCunmqr_bufferSize_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmqr_bufferSize_rank_1 = hipsolverCunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverCunmqr_bufferSize_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmqr_bufferSize_full_rank = hipsolverCunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZunmqr_bufferSize_assumed_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmqr_bufferSize_assumed_rank = hipsolverZunmqr_bufferSize_(handle,side,trans,m,n, &
        k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#else
    function hipsolverZunmqr_bufferSize_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmqr_bufferSize_rank_0 = hipsolverZunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverZunmqr_bufferSize_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmqr_bufferSize_rank_1 = hipsolverZunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverZunmqr_bufferSize_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmqr_bufferSize_full_rank = hipsolverZunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSormqr_assumed_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormqr_assumed_rank = hipsolverSormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#else
    function hipsolverSormqr_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormqr_rank_0 = hipsolverSormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverSormqr_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormqr_rank_1 = hipsolverSormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverSormqr_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormqr_full_rank = hipsolverSormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDormqr_assumed_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormqr_assumed_rank = hipsolverDormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#else
    function hipsolverDormqr_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormqr_rank_0 = hipsolverDormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverDormqr_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormqr_rank_1 = hipsolverDormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverDormqr_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormqr_full_rank = hipsolverDormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCunmqr_assumed_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmqr_assumed_rank = hipsolverCunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#else
    function hipsolverCunmqr_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmqr_rank_0 = hipsolverCunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverCunmqr_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmqr_rank_1 = hipsolverCunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverCunmqr_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmqr_full_rank = hipsolverCunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZunmqr_assumed_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmqr_assumed_rank = hipsolverZunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#else
    function hipsolverZunmqr_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmqr_rank_0 = hipsolverZunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverZunmqr_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmqr_rank_1 = hipsolverZunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverZunmqr_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmqr_full_rank = hipsolverZunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSormtr_bufferSize_assumed_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc, &
        lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormtr_bufferSize_assumed_rank = hipsolverSormtr_bufferSize_(handle,side,uplo, &
        trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#else
    function hipsolverSormtr_bufferSize_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormtr_bufferSize_rank_0 = hipsolverSormtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverSormtr_bufferSize_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormtr_bufferSize_rank_1 = hipsolverSormtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverSormtr_bufferSize_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormtr_bufferSize_full_rank = hipsolverSormtr_bufferSize_(handle,side,uplo,trans,m, &
        n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDormtr_bufferSize_assumed_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc, &
        lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormtr_bufferSize_assumed_rank = hipsolverDormtr_bufferSize_(handle,side,uplo, &
        trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#else
    function hipsolverDormtr_bufferSize_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormtr_bufferSize_rank_0 = hipsolverDormtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverDormtr_bufferSize_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormtr_bufferSize_rank_1 = hipsolverDormtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverDormtr_bufferSize_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormtr_bufferSize_full_rank = hipsolverDormtr_bufferSize_(handle,side,uplo,trans,m, &
        n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCunmtr_bufferSize_assumed_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc, &
        lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmtr_bufferSize_assumed_rank = hipsolverCunmtr_bufferSize_(handle,side,uplo, &
        trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#else
    function hipsolverCunmtr_bufferSize_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmtr_bufferSize_rank_0 = hipsolverCunmtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverCunmtr_bufferSize_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmtr_bufferSize_rank_1 = hipsolverCunmtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverCunmtr_bufferSize_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmtr_bufferSize_full_rank = hipsolverCunmtr_bufferSize_(handle,side,uplo,trans,m, &
        n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZunmtr_bufferSize_assumed_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc, &
        lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmtr_bufferSize_assumed_rank = hipsolverZunmtr_bufferSize_(handle,side,uplo, &
        trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#else
    function hipsolverZunmtr_bufferSize_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmtr_bufferSize_rank_0 = hipsolverZunmtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverZunmtr_bufferSize_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmtr_bufferSize_rank_1 = hipsolverZunmtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverZunmtr_bufferSize_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmtr_bufferSize_full_rank = hipsolverZunmtr_bufferSize_(handle,side,uplo,trans,m, &
        n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSormtr_assumed_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormtr_assumed_rank = hipsolverSormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#else
    function hipsolverSormtr_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormtr_rank_0 = hipsolverSormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverSormtr_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormtr_rank_1 = hipsolverSormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverSormtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormtr_full_rank = hipsolverSormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDormtr_assumed_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormtr_assumed_rank = hipsolverDormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#else
    function hipsolverDormtr_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormtr_rank_0 = hipsolverDormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverDormtr_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormtr_rank_1 = hipsolverDormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverDormtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormtr_full_rank = hipsolverDormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCunmtr_assumed_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmtr_assumed_rank = hipsolverCunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#else
    function hipsolverCunmtr_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmtr_rank_0 = hipsolverCunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverCunmtr_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmtr_rank_1 = hipsolverCunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverCunmtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmtr_full_rank = hipsolverCunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZunmtr_assumed_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,contiguous,dimension(..) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmtr_assumed_rank = hipsolverZunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#else
    function hipsolverZunmtr_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmtr_rank_0 = hipsolverZunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverZunmtr_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmtr_rank_1 = hipsolverZunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverZunmtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmtr_full_rank = hipsolverZunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSgebrd_assumed_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: D
      real(c_float),target,contiguous,dimension(..) :: E
      real(c_float),target,contiguous,dimension(..) :: tauq
      real(c_float),target,contiguous,dimension(..) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgebrd_assumed_rank = hipsolverSgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#else
    function hipsolverSgebrd_rank_0(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      real(c_float),target :: tauq
      real(c_float),target :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgebrd_rank_0 = hipsolverSgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverSgebrd_rank_1(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float),target,dimension(:) :: tauq
      real(c_float),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgebrd_rank_1 = hipsolverSgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverSgebrd_full_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float),target,dimension(:) :: tauq
      real(c_float),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgebrd_full_rank = hipsolverSgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDgebrd_assumed_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: D
      real(c_double),target,contiguous,dimension(..) :: E
      real(c_double),target,contiguous,dimension(..) :: tauq
      real(c_double),target,contiguous,dimension(..) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgebrd_assumed_rank = hipsolverDgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#else
    function hipsolverDgebrd_rank_0(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      real(c_double),target :: tauq
      real(c_double),target :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgebrd_rank_0 = hipsolverDgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverDgebrd_rank_1(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double),target,dimension(:) :: tauq
      real(c_double),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgebrd_rank_1 = hipsolverDgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverDgebrd_full_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double),target,dimension(:) :: tauq
      real(c_double),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgebrd_full_rank = hipsolverDgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCgebrd_assumed_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: D
      real(c_float),target,contiguous,dimension(..) :: E
      complex(c_float_complex),target,contiguous,dimension(..) :: tauq
      complex(c_float_complex),target,contiguous,dimension(..) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgebrd_assumed_rank = hipsolverCgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#else
    function hipsolverCgebrd_rank_0(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      complex(c_float_complex),target :: tauq
      complex(c_float_complex),target :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgebrd_rank_0 = hipsolverCgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverCgebrd_rank_1(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex),target,dimension(:) :: tauq
      complex(c_float_complex),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgebrd_rank_1 = hipsolverCgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverCgebrd_full_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex),target,dimension(:) :: tauq
      complex(c_float_complex),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgebrd_full_rank = hipsolverCgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZgebrd_assumed_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: D
      real(c_double),target,contiguous,dimension(..) :: E
      complex(c_double_complex),target,contiguous,dimension(..) :: tauq
      complex(c_double_complex),target,contiguous,dimension(..) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgebrd_assumed_rank = hipsolverZgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#else
    function hipsolverZgebrd_rank_0(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      complex(c_double_complex),target :: tauq
      complex(c_double_complex),target :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgebrd_rank_0 = hipsolverZgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverZgebrd_rank_1(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex),target,dimension(:) :: tauq
      complex(c_double_complex),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgebrd_rank_1 = hipsolverZgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverZgebrd_full_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex),target,dimension(:) :: tauq
      complex(c_double_complex),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgebrd_full_rank = hipsolverZgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSgeqrf_bufferSize_assumed_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgeqrf_bufferSize_assumed_rank = hipsolverSgeqrf_bufferSize_(handle,m,n,c_loc(A), &
        lda,lwork)
    end function

#else
    function hipsolverSgeqrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgeqrf_bufferSize_rank_0 = hipsolverSgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSgeqrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgeqrf_bufferSize_rank_1 = hipsolverSgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSgeqrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgeqrf_bufferSize_full_rank = hipsolverSgeqrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDgeqrf_bufferSize_assumed_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgeqrf_bufferSize_assumed_rank = hipsolverDgeqrf_bufferSize_(handle,m,n,c_loc(A), &
        lda,lwork)
    end function

#else
    function hipsolverDgeqrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgeqrf_bufferSize_rank_0 = hipsolverDgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDgeqrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgeqrf_bufferSize_rank_1 = hipsolverDgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDgeqrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgeqrf_bufferSize_full_rank = hipsolverDgeqrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCgeqrf_bufferSize_assumed_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgeqrf_bufferSize_assumed_rank = hipsolverCgeqrf_bufferSize_(handle,m,n,c_loc(A), &
        lda,lwork)
    end function

#else
    function hipsolverCgeqrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgeqrf_bufferSize_rank_0 = hipsolverCgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCgeqrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgeqrf_bufferSize_rank_1 = hipsolverCgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCgeqrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgeqrf_bufferSize_full_rank = hipsolverCgeqrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZgeqrf_bufferSize_assumed_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgeqrf_bufferSize_assumed_rank = hipsolverZgeqrf_bufferSize_(handle,m,n,c_loc(A), &
        lda,lwork)
    end function

#else
    function hipsolverZgeqrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgeqrf_bufferSize_rank_0 = hipsolverZgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZgeqrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgeqrf_bufferSize_rank_1 = hipsolverZgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZgeqrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgeqrf_bufferSize_full_rank = hipsolverZgeqrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSgeqrf_assumed_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgeqrf_assumed_rank = hipsolverSgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverSgeqrf_rank_0(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgeqrf_rank_0 = hipsolverSgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSgeqrf_rank_1(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgeqrf_rank_1 = hipsolverSgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSgeqrf_full_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgeqrf_full_rank = hipsolverSgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDgeqrf_assumed_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgeqrf_assumed_rank = hipsolverDgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverDgeqrf_rank_0(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgeqrf_rank_0 = hipsolverDgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDgeqrf_rank_1(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgeqrf_rank_1 = hipsolverDgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDgeqrf_full_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgeqrf_full_rank = hipsolverDgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCgeqrf_assumed_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgeqrf_assumed_rank = hipsolverCgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverCgeqrf_rank_0(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgeqrf_rank_0 = hipsolverCgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCgeqrf_rank_1(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgeqrf_rank_1 = hipsolverCgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCgeqrf_full_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgeqrf_full_rank = hipsolverCgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZgeqrf_assumed_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgeqrf_assumed_rank = hipsolverZgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#else
    function hipsolverZgeqrf_rank_0(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgeqrf_rank_0 = hipsolverZgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZgeqrf_rank_1(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgeqrf_rank_1 = hipsolverZgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZgeqrf_full_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgeqrf_full_rank = hipsolverZgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSSgesv_bufferSize_assumed_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      real(c_float),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_float),target,contiguous,dimension(..) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverSSgesv_bufferSize_assumed_rank = hipsolverSSgesv_bufferSize_(handle,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#else
    function hipsolverSSgesv_bufferSize_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_float),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverSSgesv_bufferSize_rank_0 = hipsolverSSgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverSSgesv_bufferSize_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverSSgesv_bufferSize_rank_1 = hipsolverSSgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverSSgesv_bufferSize_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverSSgesv_bufferSize_full_rank = hipsolverSSgesv_bufferSize_(handle,n,nrhs,c_loc(A), &
        lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDDgesv_bufferSize_assumed_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      real(c_double),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_double),target,contiguous,dimension(..) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverDDgesv_bufferSize_assumed_rank = hipsolverDDgesv_bufferSize_(handle,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#else
    function hipsolverDDgesv_bufferSize_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_double),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverDDgesv_bufferSize_rank_0 = hipsolverDDgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverDDgesv_bufferSize_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverDDgesv_bufferSize_rank_1 = hipsolverDDgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverDDgesv_bufferSize_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverDDgesv_bufferSize_full_rank = hipsolverDDgesv_bufferSize_(handle,n,nrhs,c_loc(A), &
        lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCCgesv_bufferSize_assumed_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      complex(c_float_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target,contiguous,dimension(..) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverCCgesv_bufferSize_assumed_rank = hipsolverCCgesv_bufferSize_(handle,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#else
    function hipsolverCCgesv_bufferSize_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverCCgesv_bufferSize_rank_0 = hipsolverCCgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverCCgesv_bufferSize_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target,dimension(:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverCCgesv_bufferSize_rank_1 = hipsolverCCgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverCCgesv_bufferSize_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverCCgesv_bufferSize_full_rank = hipsolverCCgesv_bufferSize_(handle,n,nrhs,c_loc(A), &
        lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZZgesv_bufferSize_assumed_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      complex(c_double_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target,contiguous,dimension(..) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverZZgesv_bufferSize_assumed_rank = hipsolverZZgesv_bufferSize_(handle,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#else
    function hipsolverZZgesv_bufferSize_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverZZgesv_bufferSize_rank_0 = hipsolverZZgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverZZgesv_bufferSize_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target,dimension(:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverZZgesv_bufferSize_rank_1 = hipsolverZZgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverZZgesv_bufferSize_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverZZgesv_bufferSize_full_rank = hipsolverZZgesv_bufferSize_(handle,n,nrhs,c_loc(A), &
        lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSSgesv_assumed_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork, &
        niters,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      real(c_float),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_float),target,contiguous,dimension(..) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverSSgesv_assumed_rank = hipsolverSSgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#else
    function hipsolverSSgesv_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_float),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverSSgesv_rank_0 = hipsolverSSgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverSSgesv_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverSSgesv_rank_1 = hipsolverSSgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverSSgesv_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverSSgesv_full_rank = hipsolverSSgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDDgesv_assumed_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork, &
        niters,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      real(c_double),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_double),target,contiguous,dimension(..) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverDDgesv_assumed_rank = hipsolverDDgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#else
    function hipsolverDDgesv_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_double),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverDDgesv_rank_0 = hipsolverDDgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverDDgesv_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverDDgesv_rank_1 = hipsolverDDgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverDDgesv_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverDDgesv_full_rank = hipsolverDDgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCCgesv_assumed_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork, &
        niters,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      complex(c_float_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target,contiguous,dimension(..) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverCCgesv_assumed_rank = hipsolverCCgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#else
    function hipsolverCCgesv_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverCCgesv_rank_0 = hipsolverCCgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverCCgesv_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target,dimension(:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverCCgesv_rank_1 = hipsolverCCgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverCCgesv_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverCCgesv_full_rank = hipsolverCCgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZZgesv_assumed_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork, &
        niters,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      complex(c_double_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target,contiguous,dimension(..) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverZZgesv_assumed_rank = hipsolverZZgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#else
    function hipsolverZZgesv_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverZZgesv_rank_0 = hipsolverZZgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverZZgesv_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target,dimension(:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverZZgesv_rank_1 = hipsolverZZgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverZZgesv_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverZZgesv_full_rank = hipsolverZZgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSgetrf_bufferSize_assumed_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgetrf_bufferSize_assumed_rank = hipsolverSgetrf_bufferSize_(handle,m,n,c_loc(A), &
        lda,lwork)
    end function

#else
    function hipsolverSgetrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgetrf_bufferSize_rank_0 = hipsolverSgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSgetrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgetrf_bufferSize_rank_1 = hipsolverSgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSgetrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgetrf_bufferSize_full_rank = hipsolverSgetrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDgetrf_bufferSize_assumed_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgetrf_bufferSize_assumed_rank = hipsolverDgetrf_bufferSize_(handle,m,n,c_loc(A), &
        lda,lwork)
    end function

#else
    function hipsolverDgetrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgetrf_bufferSize_rank_0 = hipsolverDgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDgetrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgetrf_bufferSize_rank_1 = hipsolverDgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDgetrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgetrf_bufferSize_full_rank = hipsolverDgetrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCgetrf_bufferSize_assumed_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgetrf_bufferSize_assumed_rank = hipsolverCgetrf_bufferSize_(handle,m,n,c_loc(A), &
        lda,lwork)
    end function

#else
    function hipsolverCgetrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgetrf_bufferSize_rank_0 = hipsolverCgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCgetrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgetrf_bufferSize_rank_1 = hipsolverCgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCgetrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgetrf_bufferSize_full_rank = hipsolverCgetrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZgetrf_bufferSize_assumed_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgetrf_bufferSize_assumed_rank = hipsolverZgetrf_bufferSize_(handle,m,n,c_loc(A), &
        lda,lwork)
    end function

#else
    function hipsolverZgetrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgetrf_bufferSize_rank_0 = hipsolverZgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZgetrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgetrf_bufferSize_rank_1 = hipsolverZgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZgetrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgetrf_bufferSize_full_rank = hipsolverZgetrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSgetrf_assumed_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverSgetrf_assumed_rank = hipsolverSgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#else
    function hipsolverSgetrf_rank_0(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverSgetrf_rank_0 = hipsolverSgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverSgetrf_rank_1(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverSgetrf_rank_1 = hipsolverSgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverSgetrf_full_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverSgetrf_full_rank = hipsolverSgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDgetrf_assumed_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverDgetrf_assumed_rank = hipsolverDgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#else
    function hipsolverDgetrf_rank_0(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverDgetrf_rank_0 = hipsolverDgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverDgetrf_rank_1(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverDgetrf_rank_1 = hipsolverDgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverDgetrf_full_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverDgetrf_full_rank = hipsolverDgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCgetrf_assumed_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverCgetrf_assumed_rank = hipsolverCgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#else
    function hipsolverCgetrf_rank_0(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverCgetrf_rank_0 = hipsolverCgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverCgetrf_rank_1(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverCgetrf_rank_1 = hipsolverCgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverCgetrf_full_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverCgetrf_full_rank = hipsolverCgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZgetrf_assumed_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverZgetrf_assumed_rank = hipsolverZgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#else
    function hipsolverZgetrf_rank_0(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverZgetrf_rank_0 = hipsolverZgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverZgetrf_rank_1(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverZgetrf_rank_1 = hipsolverZgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverZgetrf_full_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverZgetrf_full_rank = hipsolverZgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSgetrs_bufferSize_assumed_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      real(c_float),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSgetrs_bufferSize_assumed_rank = hipsolverSgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#else
    function hipsolverSgetrs_bufferSize_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_float),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSgetrs_bufferSize_rank_0 = hipsolverSgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverSgetrs_bufferSize_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSgetrs_bufferSize_rank_1 = hipsolverSgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverSgetrs_bufferSize_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSgetrs_bufferSize_full_rank = hipsolverSgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDgetrs_bufferSize_assumed_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      real(c_double),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDgetrs_bufferSize_assumed_rank = hipsolverDgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#else
    function hipsolverDgetrs_bufferSize_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_double),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDgetrs_bufferSize_rank_0 = hipsolverDgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverDgetrs_bufferSize_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDgetrs_bufferSize_rank_1 = hipsolverDgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverDgetrs_bufferSize_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDgetrs_bufferSize_full_rank = hipsolverDgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCgetrs_bufferSize_assumed_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      complex(c_float_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCgetrs_bufferSize_assumed_rank = hipsolverCgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#else
    function hipsolverCgetrs_bufferSize_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCgetrs_bufferSize_rank_0 = hipsolverCgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverCgetrs_bufferSize_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCgetrs_bufferSize_rank_1 = hipsolverCgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverCgetrs_bufferSize_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCgetrs_bufferSize_full_rank = hipsolverCgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZgetrs_bufferSize_assumed_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      complex(c_double_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZgetrs_bufferSize_assumed_rank = hipsolverZgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#else
    function hipsolverZgetrs_bufferSize_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZgetrs_bufferSize_rank_0 = hipsolverZgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverZgetrs_bufferSize_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZgetrs_bufferSize_rank_1 = hipsolverZgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverZgetrs_bufferSize_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZgetrs_bufferSize_full_rank = hipsolverZgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSgetrs_assumed_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      real(c_float),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgetrs_assumed_rank = hipsolverSgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#else
    function hipsolverSgetrs_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_float),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgetrs_rank_0 = hipsolverSgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverSgetrs_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgetrs_rank_1 = hipsolverSgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverSgetrs_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgetrs_full_rank = hipsolverSgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDgetrs_assumed_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      real(c_double),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgetrs_assumed_rank = hipsolverDgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#else
    function hipsolverDgetrs_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_double),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgetrs_rank_0 = hipsolverDgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverDgetrs_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgetrs_rank_1 = hipsolverDgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverDgetrs_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgetrs_full_rank = hipsolverDgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCgetrs_assumed_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      complex(c_float_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgetrs_assumed_rank = hipsolverCgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#else
    function hipsolverCgetrs_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgetrs_rank_0 = hipsolverCgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverCgetrs_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgetrs_rank_1 = hipsolverCgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverCgetrs_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgetrs_full_rank = hipsolverCgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZgetrs_assumed_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork, &
        devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: devIpiv
      complex(c_double_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgetrs_assumed_rank = hipsolverZgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#else
    function hipsolverZgetrs_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgetrs_rank_0 = hipsolverZgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverZgetrs_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgetrs_rank_1 = hipsolverZgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverZgetrs_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgetrs_full_rank = hipsolverZgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSpotrf_bufferSize_assumed_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotrf_bufferSize_assumed_rank = hipsolverSpotrf_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,lwork)
    end function

#else
    function hipsolverSpotrf_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotrf_bufferSize_rank_0 = hipsolverSpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverSpotrf_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotrf_bufferSize_rank_1 = hipsolverSpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverSpotrf_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotrf_bufferSize_full_rank = hipsolverSpotrf_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDpotrf_bufferSize_assumed_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotrf_bufferSize_assumed_rank = hipsolverDpotrf_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,lwork)
    end function

#else
    function hipsolverDpotrf_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotrf_bufferSize_rank_0 = hipsolverDpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverDpotrf_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotrf_bufferSize_rank_1 = hipsolverDpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverDpotrf_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotrf_bufferSize_full_rank = hipsolverDpotrf_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCpotrf_bufferSize_assumed_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotrf_bufferSize_assumed_rank = hipsolverCpotrf_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,lwork)
    end function

#else
    function hipsolverCpotrf_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotrf_bufferSize_rank_0 = hipsolverCpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverCpotrf_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotrf_bufferSize_rank_1 = hipsolverCpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverCpotrf_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotrf_bufferSize_full_rank = hipsolverCpotrf_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZpotrf_bufferSize_assumed_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotrf_bufferSize_assumed_rank = hipsolverZpotrf_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,lwork)
    end function

#else
    function hipsolverZpotrf_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotrf_bufferSize_rank_0 = hipsolverZpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverZpotrf_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotrf_bufferSize_rank_1 = hipsolverZpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverZpotrf_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotrf_bufferSize_full_rank = hipsolverZpotrf_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSpotrf_assumed_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrf_assumed_rank = hipsolverSpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#else
    function hipsolverSpotrf_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrf_rank_0 = hipsolverSpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverSpotrf_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrf_rank_1 = hipsolverSpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverSpotrf_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrf_full_rank = hipsolverSpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDpotrf_assumed_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrf_assumed_rank = hipsolverDpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#else
    function hipsolverDpotrf_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrf_rank_0 = hipsolverDpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverDpotrf_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrf_rank_1 = hipsolverDpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverDpotrf_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrf_full_rank = hipsolverDpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCpotrf_assumed_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrf_assumed_rank = hipsolverCpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#else
    function hipsolverCpotrf_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrf_rank_0 = hipsolverCpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverCpotrf_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrf_rank_1 = hipsolverCpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverCpotrf_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrf_full_rank = hipsolverCpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZpotrf_assumed_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrf_assumed_rank = hipsolverZpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#else
    function hipsolverZpotrf_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrf_rank_0 = hipsolverZpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverZpotrf_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrf_rank_1 = hipsolverZpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverZpotrf_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrf_full_rank = hipsolverZpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSpotri_bufferSize_assumed_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotri_bufferSize_assumed_rank = hipsolverSpotri_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,lwork)
    end function

#else
    function hipsolverSpotri_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotri_bufferSize_rank_0 = hipsolverSpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverSpotri_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotri_bufferSize_rank_1 = hipsolverSpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverSpotri_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotri_bufferSize_full_rank = hipsolverSpotri_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDpotri_bufferSize_assumed_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotri_bufferSize_assumed_rank = hipsolverDpotri_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,lwork)
    end function

#else
    function hipsolverDpotri_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotri_bufferSize_rank_0 = hipsolverDpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverDpotri_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotri_bufferSize_rank_1 = hipsolverDpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverDpotri_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotri_bufferSize_full_rank = hipsolverDpotri_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCpotri_bufferSize_assumed_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotri_bufferSize_assumed_rank = hipsolverCpotri_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,lwork)
    end function

#else
    function hipsolverCpotri_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotri_bufferSize_rank_0 = hipsolverCpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverCpotri_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotri_bufferSize_rank_1 = hipsolverCpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverCpotri_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotri_bufferSize_full_rank = hipsolverCpotri_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZpotri_bufferSize_assumed_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotri_bufferSize_assumed_rank = hipsolverZpotri_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,lwork)
    end function

#else
    function hipsolverZpotri_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotri_bufferSize_rank_0 = hipsolverZpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverZpotri_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotri_bufferSize_rank_1 = hipsolverZpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverZpotri_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotri_bufferSize_full_rank = hipsolverZpotri_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSpotri_assumed_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotri_assumed_rank = hipsolverSpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#else
    function hipsolverSpotri_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotri_rank_0 = hipsolverSpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverSpotri_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotri_rank_1 = hipsolverSpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverSpotri_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotri_full_rank = hipsolverSpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDpotri_assumed_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotri_assumed_rank = hipsolverDpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#else
    function hipsolverDpotri_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotri_rank_0 = hipsolverDpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverDpotri_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotri_rank_1 = hipsolverDpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverDpotri_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotri_full_rank = hipsolverDpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCpotri_assumed_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotri_assumed_rank = hipsolverCpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#else
    function hipsolverCpotri_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotri_rank_0 = hipsolverCpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverCpotri_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotri_rank_1 = hipsolverCpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverCpotri_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotri_full_rank = hipsolverCpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZpotri_assumed_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotri_assumed_rank = hipsolverZpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#else
    function hipsolverZpotri_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotri_rank_0 = hipsolverZpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverZpotri_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotri_rank_1 = hipsolverZpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverZpotri_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotri_full_rank = hipsolverZpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSpotrs_bufferSize_assumed_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSpotrs_bufferSize_assumed_rank = hipsolverSpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#else
    function hipsolverSpotrs_bufferSize_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSpotrs_bufferSize_rank_0 = hipsolverSpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverSpotrs_bufferSize_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSpotrs_bufferSize_rank_1 = hipsolverSpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverSpotrs_bufferSize_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSpotrs_bufferSize_full_rank = hipsolverSpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDpotrs_bufferSize_assumed_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDpotrs_bufferSize_assumed_rank = hipsolverDpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#else
    function hipsolverDpotrs_bufferSize_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDpotrs_bufferSize_rank_0 = hipsolverDpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverDpotrs_bufferSize_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDpotrs_bufferSize_rank_1 = hipsolverDpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverDpotrs_bufferSize_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDpotrs_bufferSize_full_rank = hipsolverDpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCpotrs_bufferSize_assumed_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCpotrs_bufferSize_assumed_rank = hipsolverCpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#else
    function hipsolverCpotrs_bufferSize_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCpotrs_bufferSize_rank_0 = hipsolverCpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverCpotrs_bufferSize_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCpotrs_bufferSize_rank_1 = hipsolverCpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverCpotrs_bufferSize_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCpotrs_bufferSize_full_rank = hipsolverCpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZpotrs_bufferSize_assumed_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZpotrs_bufferSize_assumed_rank = hipsolverZpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#else
    function hipsolverZpotrs_bufferSize_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZpotrs_bufferSize_rank_0 = hipsolverZpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverZpotrs_bufferSize_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZpotrs_bufferSize_rank_1 = hipsolverZpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverZpotrs_bufferSize_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZpotrs_bufferSize_full_rank = hipsolverZpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSpotrs_assumed_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrs_assumed_rank = hipsolverSpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B), &
        ldb,work,lwork,devInfo)
    end function

#else
    function hipsolverSpotrs_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrs_rank_0 = hipsolverSpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverSpotrs_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrs_rank_1 = hipsolverSpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverSpotrs_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrs_full_rank = hipsolverSpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb, &
        work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDpotrs_assumed_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrs_assumed_rank = hipsolverDpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B), &
        ldb,work,lwork,devInfo)
    end function

#else
    function hipsolverDpotrs_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrs_rank_0 = hipsolverDpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverDpotrs_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrs_rank_1 = hipsolverDpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverDpotrs_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrs_full_rank = hipsolverDpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb, &
        work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCpotrs_assumed_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrs_assumed_rank = hipsolverCpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B), &
        ldb,work,lwork,devInfo)
    end function

#else
    function hipsolverCpotrs_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrs_rank_0 = hipsolverCpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverCpotrs_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrs_rank_1 = hipsolverCpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverCpotrs_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrs_full_rank = hipsolverCpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb, &
        work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZpotrs_assumed_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrs_assumed_rank = hipsolverZpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B), &
        ldb,work,lwork,devInfo)
    end function

#else
    function hipsolverZpotrs_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrs_rank_0 = hipsolverZpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverZpotrs_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrs_rank_1 = hipsolverZpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverZpotrs_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrs_full_rank = hipsolverZpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb, &
        work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSsyevd_bufferSize_assumed_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: D
      integer(c_int) :: lwork
      !
      hipsolverSsyevd_bufferSize_assumed_rank = hipsolverSsyevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#else
    function hipsolverSsyevd_bufferSize_rank_0(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      integer(c_int) :: lwork
      !
      hipsolverSsyevd_bufferSize_rank_0 = hipsolverSsyevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverSsyevd_bufferSize_rank_1(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverSsyevd_bufferSize_rank_1 = hipsolverSsyevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverSsyevd_bufferSize_full_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverSsyevd_bufferSize_full_rank = hipsolverSsyevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDsyevd_bufferSize_assumed_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: D
      integer(c_int) :: lwork
      !
      hipsolverDsyevd_bufferSize_assumed_rank = hipsolverDsyevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#else
    function hipsolverDsyevd_bufferSize_rank_0(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      integer(c_int) :: lwork
      !
      hipsolverDsyevd_bufferSize_rank_0 = hipsolverDsyevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverDsyevd_bufferSize_rank_1(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverDsyevd_bufferSize_rank_1 = hipsolverDsyevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverDsyevd_bufferSize_full_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverDsyevd_bufferSize_full_rank = hipsolverDsyevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCheevd_bufferSize_assumed_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: D
      integer(c_int) :: lwork
      !
      hipsolverCheevd_bufferSize_assumed_rank = hipsolverCheevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#else
    function hipsolverCheevd_bufferSize_rank_0(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      integer(c_int) :: lwork
      !
      hipsolverCheevd_bufferSize_rank_0 = hipsolverCheevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverCheevd_bufferSize_rank_1(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverCheevd_bufferSize_rank_1 = hipsolverCheevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverCheevd_bufferSize_full_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverCheevd_bufferSize_full_rank = hipsolverCheevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZheevd_bufferSize_assumed_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: D
      integer(c_int) :: lwork
      !
      hipsolverZheevd_bufferSize_assumed_rank = hipsolverZheevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#else
    function hipsolverZheevd_bufferSize_rank_0(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      integer(c_int) :: lwork
      !
      hipsolverZheevd_bufferSize_rank_0 = hipsolverZheevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverZheevd_bufferSize_rank_1(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverZheevd_bufferSize_rank_1 = hipsolverZheevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverZheevd_bufferSize_full_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverZheevd_bufferSize_full_rank = hipsolverZheevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSsyevd_assumed_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsyevd_assumed_rank = hipsolverSsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D), &
        work,lwork,devInfo)
    end function

#else
    function hipsolverSsyevd_rank_0(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsyevd_rank_0 = hipsolverSsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverSsyevd_rank_1(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsyevd_rank_1 = hipsolverSsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverSsyevd_full_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsyevd_full_rank = hipsolverSsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDsyevd_assumed_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsyevd_assumed_rank = hipsolverDsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D), &
        work,lwork,devInfo)
    end function

#else
    function hipsolverDsyevd_rank_0(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsyevd_rank_0 = hipsolverDsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverDsyevd_rank_1(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsyevd_rank_1 = hipsolverDsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverDsyevd_full_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsyevd_full_rank = hipsolverDsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCheevd_assumed_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCheevd_assumed_rank = hipsolverCheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D), &
        work,lwork,devInfo)
    end function

#else
    function hipsolverCheevd_rank_0(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCheevd_rank_0 = hipsolverCheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverCheevd_rank_1(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCheevd_rank_1 = hipsolverCheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverCheevd_full_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCheevd_full_rank = hipsolverCheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZheevd_assumed_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZheevd_assumed_rank = hipsolverZheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D), &
        work,lwork,devInfo)
    end function

#else
    function hipsolverZheevd_rank_0(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZheevd_rank_0 = hipsolverZheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverZheevd_rank_1(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZheevd_rank_1 = hipsolverZheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverZheevd_full_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZheevd_full_rank = hipsolverZheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSsygvd_bufferSize_assumed_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_float),target,contiguous,dimension(..) :: W
      integer(c_int) :: lwork
      !
      hipsolverSsygvd_bufferSize_assumed_rank = hipsolverSsygvd_bufferSize_(handle,itype,jobz, &
        uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#else
    function hipsolverSsygvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: W
      integer(c_int) :: lwork
      !
      hipsolverSsygvd_bufferSize_rank_0 = hipsolverSsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverSsygvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverSsygvd_bufferSize_rank_1 = hipsolverSsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverSsygvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverSsygvd_bufferSize_full_rank = hipsolverSsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDsygvd_bufferSize_assumed_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_double),target,contiguous,dimension(..) :: W
      integer(c_int) :: lwork
      !
      hipsolverDsygvd_bufferSize_assumed_rank = hipsolverDsygvd_bufferSize_(handle,itype,jobz, &
        uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#else
    function hipsolverDsygvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: W
      integer(c_int) :: lwork
      !
      hipsolverDsygvd_bufferSize_rank_0 = hipsolverDsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverDsygvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverDsygvd_bufferSize_rank_1 = hipsolverDsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverDsygvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverDsygvd_bufferSize_full_rank = hipsolverDsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverChegvd_bufferSize_assumed_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_float),target,contiguous,dimension(..) :: W
      integer(c_int) :: lwork
      !
      hipsolverChegvd_bufferSize_assumed_rank = hipsolverChegvd_bufferSize_(handle,itype,jobz, &
        uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#else
    function hipsolverChegvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: W
      integer(c_int) :: lwork
      !
      hipsolverChegvd_bufferSize_rank_0 = hipsolverChegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverChegvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverChegvd_bufferSize_rank_1 = hipsolverChegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverChegvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverChegvd_bufferSize_full_rank = hipsolverChegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZhegvd_bufferSize_assumed_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_double),target,contiguous,dimension(..) :: W
      integer(c_int) :: lwork
      !
      hipsolverZhegvd_bufferSize_assumed_rank = hipsolverZhegvd_bufferSize_(handle,itype,jobz, &
        uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#else
    function hipsolverZhegvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: W
      integer(c_int) :: lwork
      !
      hipsolverZhegvd_bufferSize_rank_0 = hipsolverZhegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverZhegvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverZhegvd_bufferSize_rank_1 = hipsolverZhegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverZhegvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverZhegvd_bufferSize_full_rank = hipsolverZhegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSsygvd_assumed_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_float),target,contiguous,dimension(..) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsygvd_assumed_rank = hipsolverSsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda, &
        c_loc(B),ldb,c_loc(W),work,lwork,devInfo)
    end function

#else
    function hipsolverSsygvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsygvd_rank_0 = hipsolverSsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverSsygvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsygvd_rank_1 = hipsolverSsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverSsygvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsygvd_full_rank = hipsolverSsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDsygvd_assumed_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_double),target,contiguous,dimension(..) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsygvd_assumed_rank = hipsolverDsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda, &
        c_loc(B),ldb,c_loc(W),work,lwork,devInfo)
    end function

#else
    function hipsolverDsygvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsygvd_rank_0 = hipsolverDsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverDsygvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsygvd_rank_1 = hipsolverDsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverDsygvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsygvd_full_rank = hipsolverDsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverChegvd_assumed_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_float),target,contiguous,dimension(..) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChegvd_assumed_rank = hipsolverChegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda, &
        c_loc(B),ldb,c_loc(W),work,lwork,devInfo)
    end function

#else
    function hipsolverChegvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChegvd_rank_0 = hipsolverChegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverChegvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChegvd_rank_1 = hipsolverChegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverChegvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChegvd_full_rank = hipsolverChegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZhegvd_assumed_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,contiguous,dimension(..) :: B
      integer(c_int) :: ldb
      real(c_double),target,contiguous,dimension(..) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhegvd_assumed_rank = hipsolverZhegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda, &
        c_loc(B),ldb,c_loc(W),work,lwork,devInfo)
    end function

#else
    function hipsolverZhegvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhegvd_rank_0 = hipsolverZhegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverZhegvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhegvd_rank_1 = hipsolverZhegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverZhegvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhegvd_full_rank = hipsolverZhegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSsytrd_bufferSize_assumed_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: D
      real(c_float),target,contiguous,dimension(..) :: E
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSsytrd_bufferSize_assumed_rank = hipsolverSsytrd_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#else
    function hipsolverSsytrd_bufferSize_rank_0(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSsytrd_bufferSize_rank_0 = hipsolverSsytrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverSsytrd_bufferSize_rank_1(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSsytrd_bufferSize_rank_1 = hipsolverSsytrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverSsytrd_bufferSize_full_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSsytrd_bufferSize_full_rank = hipsolverSsytrd_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDsytrd_bufferSize_assumed_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: D
      real(c_double),target,contiguous,dimension(..) :: E
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDsytrd_bufferSize_assumed_rank = hipsolverDsytrd_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#else
    function hipsolverDsytrd_bufferSize_rank_0(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDsytrd_bufferSize_rank_0 = hipsolverDsytrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverDsytrd_bufferSize_rank_1(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDsytrd_bufferSize_rank_1 = hipsolverDsytrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverDsytrd_bufferSize_full_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDsytrd_bufferSize_full_rank = hipsolverDsytrd_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverChetrd_bufferSize_assumed_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: D
      real(c_float),target,contiguous,dimension(..) :: E
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverChetrd_bufferSize_assumed_rank = hipsolverChetrd_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#else
    function hipsolverChetrd_bufferSize_rank_0(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverChetrd_bufferSize_rank_0 = hipsolverChetrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverChetrd_bufferSize_rank_1(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverChetrd_bufferSize_rank_1 = hipsolverChetrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverChetrd_bufferSize_full_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverChetrd_bufferSize_full_rank = hipsolverChetrd_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZhetrd_bufferSize_assumed_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: D
      real(c_double),target,contiguous,dimension(..) :: E
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZhetrd_bufferSize_assumed_rank = hipsolverZhetrd_bufferSize_(handle,uplo,n, &
        c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#else
    function hipsolverZhetrd_bufferSize_rank_0(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZhetrd_bufferSize_rank_0 = hipsolverZhetrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverZhetrd_bufferSize_rank_1(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZhetrd_bufferSize_rank_1 = hipsolverZhetrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverZhetrd_bufferSize_full_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZhetrd_bufferSize_full_rank = hipsolverZhetrd_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSsytrd_assumed_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: D
      real(c_float),target,contiguous,dimension(..) :: E
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrd_assumed_rank = hipsolverSsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D), &
        c_loc(E),tau,work,lwork,devInfo)
    end function

#else
    function hipsolverSsytrd_rank_0(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrd_rank_0 = hipsolverSsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverSsytrd_rank_1(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrd_rank_1 = hipsolverSsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverSsytrd_full_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrd_full_rank = hipsolverSsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDsytrd_assumed_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: D
      real(c_double),target,contiguous,dimension(..) :: E
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrd_assumed_rank = hipsolverDsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D), &
        c_loc(E),tau,work,lwork,devInfo)
    end function

#else
    function hipsolverDsytrd_rank_0(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrd_rank_0 = hipsolverDsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverDsytrd_rank_1(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrd_rank_1 = hipsolverDsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverDsytrd_full_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrd_full_rank = hipsolverDsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverChetrd_assumed_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_float),target,contiguous,dimension(..) :: D
      real(c_float),target,contiguous,dimension(..) :: E
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChetrd_assumed_rank = hipsolverChetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D), &
        c_loc(E),tau,work,lwork,devInfo)
    end function

#else
    function hipsolverChetrd_rank_0(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChetrd_rank_0 = hipsolverChetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverChetrd_rank_1(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChetrd_rank_1 = hipsolverChetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverChetrd_full_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChetrd_full_rank = hipsolverChetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZhetrd_assumed_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      real(c_double),target,contiguous,dimension(..) :: D
      real(c_double),target,contiguous,dimension(..) :: E
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhetrd_assumed_rank = hipsolverZhetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D), &
        c_loc(E),tau,work,lwork,devInfo)
    end function

#else
    function hipsolverZhetrd_rank_0(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhetrd_rank_0 = hipsolverZhetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverZhetrd_rank_1(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhetrd_rank_1 = hipsolverZhetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverZhetrd_full_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhetrd_full_rank = hipsolverZhetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        tau,work,lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSsytrf_bufferSize_assumed_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSsytrf_bufferSize_assumed_rank = hipsolverSsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#else
    function hipsolverSsytrf_bufferSize_rank_0(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSsytrf_bufferSize_rank_0 = hipsolverSsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSsytrf_bufferSize_rank_1(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSsytrf_bufferSize_rank_1 = hipsolverSsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSsytrf_bufferSize_full_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSsytrf_bufferSize_full_rank = hipsolverSsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDsytrf_bufferSize_assumed_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDsytrf_bufferSize_assumed_rank = hipsolverDsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#else
    function hipsolverDsytrf_bufferSize_rank_0(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDsytrf_bufferSize_rank_0 = hipsolverDsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDsytrf_bufferSize_rank_1(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDsytrf_bufferSize_rank_1 = hipsolverDsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDsytrf_bufferSize_full_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDsytrf_bufferSize_full_rank = hipsolverDsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCsytrf_bufferSize_assumed_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCsytrf_bufferSize_assumed_rank = hipsolverCsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#else
    function hipsolverCsytrf_bufferSize_rank_0(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCsytrf_bufferSize_rank_0 = hipsolverCsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCsytrf_bufferSize_rank_1(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCsytrf_bufferSize_rank_1 = hipsolverCsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCsytrf_bufferSize_full_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCsytrf_bufferSize_full_rank = hipsolverCsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZsytrf_bufferSize_assumed_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_bufferSize_assumed_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZsytrf_bufferSize_assumed_rank = hipsolverZsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#else
    function hipsolverZsytrf_bufferSize_rank_0(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZsytrf_bufferSize_rank_0 = hipsolverZsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZsytrf_bufferSize_rank_1(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZsytrf_bufferSize_rank_1 = hipsolverZsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZsytrf_bufferSize_full_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZsytrf_bufferSize_full_rank = hipsolverZsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverSsytrf_assumed_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrf_assumed_rank = hipsolverSsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#else
    function hipsolverSsytrf_rank_0(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrf_rank_0 = hipsolverSsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverSsytrf_rank_1(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrf_rank_1 = hipsolverSsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverSsytrf_full_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrf_full_rank = hipsolverSsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverDsytrf_assumed_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrf_assumed_rank = hipsolverDsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#else
    function hipsolverDsytrf_rank_0(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrf_rank_0 = hipsolverDsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverDsytrf_rank_1(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrf_rank_1 = hipsolverDsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverDsytrf_full_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrf_full_rank = hipsolverDsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverCsytrf_assumed_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCsytrf_assumed_rank = hipsolverCsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#else
    function hipsolverCsytrf_rank_0(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCsytrf_rank_0 = hipsolverCsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverCsytrf_rank_1(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCsytrf_rank_1 = hipsolverCsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverCsytrf_full_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCsytrf_full_rank = hipsolverCsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipsolverZsytrf_assumed_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_assumed_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,contiguous,dimension(..) :: A
      integer(c_int) :: lda
      integer(c_int),target,contiguous,dimension(..) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZsytrf_assumed_rank = hipsolverZsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#else
    function hipsolverZsytrf_rank_0(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZsytrf_rank_0 = hipsolverZsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverZsytrf_rank_1(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZsytrf_rank_1 = hipsolverZsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverZsytrf_full_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZsytrf_full_rank = hipsolverZsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#endif
#endif
end module hipsolver
