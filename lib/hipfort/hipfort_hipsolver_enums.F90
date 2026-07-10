! Auto-generated enums for hipfort_hipsolver
! DO NOT EDIT — re-run the generator to update.

module hipfort_hipsolver_enums
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
    enumerator :: HIPBLAS_OP_N = 111
    enumerator :: HIPBLAS_OP_T = 112
    enumerator :: HIPBLAS_OP_C = 113
  end enum

  ! hipblasFillMode_t
  enum, bind(c)
    enumerator :: HIPBLAS_FILL_MODE_UPPER = 121
    enumerator :: HIPBLAS_FILL_MODE_LOWER = 122
    enumerator :: HIPBLAS_FILL_MODE_FULL = 123
  end enum

  ! hipblasDiagType_t
  enum, bind(c)
    enumerator :: HIPBLAS_DIAG_NON_UNIT = 131
    enumerator :: HIPBLAS_DIAG_UNIT = 132
  end enum

  ! hipblasSideMode_t
  enum, bind(c)
    enumerator :: HIPBLAS_SIDE_LEFT = 141
    enumerator :: HIPBLAS_SIDE_RIGHT = 142
    enumerator :: HIPBLAS_SIDE_BOTH = 143
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

  !--- #define integer constants ---
  integer(c_int), parameter :: hipsolverVersionMajor = 3
  integer(c_int), parameter :: hipsolverVersionMinor = 2
  integer(c_int), parameter :: hipsolverVersionPatch = 0

end module hipfort_hipsolver_enums
