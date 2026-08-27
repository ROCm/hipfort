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

module hipfort_hipsparse_enums
  use, intrinsic :: iso_c_binding
  implicit none

  ! hipsparseStatus_t
  enum, bind(c)
    enumerator :: HIPSPARSE_STATUS_SUCCESS = 0
    enumerator :: HIPSPARSE_STATUS_NOT_INITIALIZED = 1
    enumerator :: HIPSPARSE_STATUS_ALLOC_FAILED = 2
    enumerator :: HIPSPARSE_STATUS_INVALID_VALUE = 3
    enumerator :: HIPSPARSE_STATUS_ARCH_MISMATCH = 4
    enumerator :: HIPSPARSE_STATUS_MAPPING_ERROR = 5
    enumerator :: HIPSPARSE_STATUS_EXECUTION_FAILED = 6
    enumerator :: HIPSPARSE_STATUS_INTERNAL_ERROR = 7
    enumerator :: HIPSPARSE_STATUS_MATRIX_TYPE_NOT_SUPPORTED = 8
    enumerator :: HIPSPARSE_STATUS_ZERO_PIVOT = 9
    enumerator :: HIPSPARSE_STATUS_NOT_SUPPORTED = 10
    enumerator :: HIPSPARSE_STATUS_INSUFFICIENT_RESOURCES = 11
  end enum

  ! hipsparsePointerMode_t
  enum, bind(c)
    enumerator :: HIPSPARSE_POINTER_MODE_HOST = 0
    enumerator :: HIPSPARSE_POINTER_MODE_DEVICE = 1
  end enum

  ! hipsparseAction_t
  enum, bind(c)
    enumerator :: HIPSPARSE_ACTION_SYMBOLIC = 0
    enumerator :: HIPSPARSE_ACTION_NUMERIC = 1
  end enum

  ! hipsparseMatrixType_t
  enum, bind(c)
    enumerator :: HIPSPARSE_MATRIX_TYPE_GENERAL = 0
    enumerator :: HIPSPARSE_MATRIX_TYPE_SYMMETRIC = 1
    enumerator :: HIPSPARSE_MATRIX_TYPE_HERMITIAN = 2
    enumerator :: HIPSPARSE_MATRIX_TYPE_TRIANGULAR = 3
  end enum

  ! hipsparseFillMode_t
  enum, bind(c)
    enumerator :: HIPSPARSE_FILL_MODE_LOWER = 0
    enumerator :: HIPSPARSE_FILL_MODE_UPPER = 1
  end enum

  ! hipsparseDiagType_t
  enum, bind(c)
    enumerator :: HIPSPARSE_DIAG_TYPE_NON_UNIT = 0
    enumerator :: HIPSPARSE_DIAG_TYPE_UNIT = 1
  end enum

  ! hipsparseIndexBase_t
  enum, bind(c)
    enumerator :: HIPSPARSE_INDEX_BASE_ZERO = 0
    enumerator :: HIPSPARSE_INDEX_BASE_ONE = 1
  end enum

  ! hipsparseOperation_t
  enum, bind(c)
    enumerator :: HIPSPARSE_OPERATION_NON_TRANSPOSE = 0
    enumerator :: HIPSPARSE_OPERATION_TRANSPOSE = 1
    enumerator :: HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE = 2
  end enum

  ! hipsparseHybPartition_t
  enum, bind(c)
    enumerator :: HIPSPARSE_HYB_PARTITION_AUTO = 0
    enumerator :: HIPSPARSE_HYB_PARTITION_USER = 1
    enumerator :: HIPSPARSE_HYB_PARTITION_MAX = 2
  end enum

  ! hipsparseSolvePolicy_t
  enum, bind(c)
    enumerator :: HIPSPARSE_SOLVE_POLICY_NO_LEVEL = 0
    enumerator :: HIPSPARSE_SOLVE_POLICY_USE_LEVEL = 1
  end enum

  ! hipsparseSideMode_t
  enum, bind(c)
    enumerator :: HIPSPARSE_SIDE_LEFT = 0
    enumerator :: HIPSPARSE_SIDE_RIGHT = 1
  end enum

  ! hipsparseDirection_t
  enum, bind(c)
    enumerator :: HIPSPARSE_DIRECTION_ROW = 0
    enumerator :: HIPSPARSE_DIRECTION_COLUMN = 1
  end enum

  ! hipsparseCsr2CscAlg_t
  enum, bind(c)
#ifdef USE_CUDA_NAMES
    enumerator :: HIPSPARSE_CSR2CSC_ALG_DEFAULT = 1
#else
    enumerator :: HIPSPARSE_CSR2CSC_ALG_DEFAULT = 0
#endif
    enumerator :: HIPSPARSE_CSR2CSC_ALG1 = 1
    enumerator :: HIPSPARSE_CSR2CSC_ALG2 = 2
  end enum

  ! hipsparseFormat_t
  enum, bind(c)
    enumerator :: HIPSPARSE_FORMAT_CSR = 1
    enumerator :: HIPSPARSE_FORMAT_CSC = 2
    enumerator :: HIPSPARSE_FORMAT_COO = 3
    enumerator :: HIPSPARSE_FORMAT_COO_AOS = 4
    enumerator :: HIPSPARSE_FORMAT_BLOCKED_ELL = 5
    enumerator :: HIPSPARSE_FORMAT_SLICED_ELL = 6
  end enum

  ! hipsparseOrder_t
  enum, bind(c)
    enumerator :: HIPSPARSE_ORDER_COLUMN = 1
    enumerator :: HIPSPARSE_ORDER_COL = 1
    enumerator :: HIPSPARSE_ORDER_ROW = 2
  end enum

  ! hipsparseIndexType_t
  enum, bind(c)
    enumerator :: HIPSPARSE_INDEX_16U = 1
    enumerator :: HIPSPARSE_INDEX_32I = 2
    enumerator :: HIPSPARSE_INDEX_64I = 3
  end enum

  ! hipsparseSpMVAlg_t
  enum, bind(c)
    enumerator :: HIPSPARSE_MV_ALG_DEFAULT = 0
    enumerator :: HIPSPARSE_COOMV_ALG = 1
    enumerator :: HIPSPARSE_CSRMV_ALG1 = 2
    enumerator :: HIPSPARSE_CSRMV_ALG2 = 3
    enumerator :: HIPSPARSE_SPMV_ALG_DEFAULT = 0
    enumerator :: HIPSPARSE_SPMV_COO_ALG1 = 1
    enumerator :: HIPSPARSE_SPMV_CSR_ALG1 = 2
    enumerator :: HIPSPARSE_SPMV_CSR_ALG2 = 3
    enumerator :: HIPSPARSE_SPMV_COO_ALG2 = 4
    enumerator :: HIPSPARSE_SPMV_SELL_ALG1 = 5
    enumerator :: HIPSPARSE_SPMV_CSR_ALG3 = 7
  end enum

  ! hipsparseSpMMAlg_t
  enum, bind(c)
    enumerator :: HIPSPARSE_MM_ALG_DEFAULT = 0
    enumerator :: HIPSPARSE_COOMM_ALG1 = 1
    enumerator :: HIPSPARSE_COOMM_ALG2 = 2
    enumerator :: HIPSPARSE_COOMM_ALG3 = 3
    enumerator :: HIPSPARSE_CSRMM_ALG1 = 4
    enumerator :: HIPSPARSE_SPMM_ALG_DEFAULT = 0
    enumerator :: HIPSPARSE_SPMM_COO_ALG1 = 1
    enumerator :: HIPSPARSE_SPMM_COO_ALG2 = 2
    enumerator :: HIPSPARSE_SPMM_COO_ALG3 = 3
    enumerator :: HIPSPARSE_SPMM_COO_ALG4 = 5
    enumerator :: HIPSPARSE_SPMM_CSR_ALG1 = 4
    enumerator :: HIPSPARSE_SPMM_CSR_ALG2 = 6
    enumerator :: HIPSPARSE_SPMM_CSR_ALG3 = 12
    enumerator :: HIPSPARSE_SPMM_BLOCKED_ELL_ALG1 = 13
    enumerator :: HIPSPARSE_SPMM_BSR_ALG1 = 14
  end enum

  ! hipsparseSparseToDenseAlg_t
  enum, bind(c)
    enumerator :: HIPSPARSE_SPARSETODENSE_ALG_DEFAULT = 0
  end enum

  ! hipsparseDenseToSparseAlg_t
  enum, bind(c)
    enumerator :: HIPSPARSE_DENSETOSPARSE_ALG_DEFAULT = 0
  end enum

  ! hipsparseSDDMMAlg_t
  enum, bind(c)
    enumerator :: HIPSPARSE_SDDMM_ALG_DEFAULT = 0
  end enum

  ! hipsparseSpSVAlg_t
  enum, bind(c)
    enumerator :: HIPSPARSE_SPSV_ALG_DEFAULT = 0
  end enum

  ! hipsparseSpSMAlg_t
  enum, bind(c)
    enumerator :: HIPSPARSE_SPSM_ALG_DEFAULT = 0
  end enum

  ! hipsparseSpMatAttribute_t
  enum, bind(c)
    enumerator :: HIPSPARSE_SPMAT_FILL_MODE = 0
    enumerator :: HIPSPARSE_SPMAT_DIAG_TYPE = 1
  end enum

  ! hipsparseSpGEMMAlg_t
  enum, bind(c)
    enumerator :: HIPSPARSE_SPGEMM_DEFAULT = 0
    enumerator :: HIPSPARSE_SPGEMM_CSR_ALG_DETERMINISTIC = 1
    enumerator :: HIPSPARSE_SPGEMM_CSR_ALG_NONDETERMINISTIC = 2
    enumerator :: HIPSPARSE_SPGEMM_ALG1 = 3
    enumerator :: HIPSPARSE_SPGEMM_ALG2 = 4
    enumerator :: HIPSPARSE_SPGEMM_ALG3 = 5
  end enum

  integer(c_int), parameter :: hipsparseVersionMajor = 4
  integer(c_int), parameter :: hipsparseVersionMinor = 2
  integer(c_int), parameter :: hipsparseVersionPatch = 0

end module hipfort_hipsparse_enums
