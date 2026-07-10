! Auto-generated enums for hipfort_hipblas
! DO NOT EDIT — re-run the generator to update.

module hipfort_hipblas_enums
  use, intrinsic :: iso_c_binding
  implicit none

  ! hipblasStatus_t
  enum, bind(c)
    enumerator :: HIPBLAS_STATUS_SUCCESS = 0
    enumerator :: HIPBLAS_STATUS_NOT_INITIALIZED = 1
    enumerator :: HIPBLAS_STATUS_ALLOC_FAILED = 2
    enumerator :: HIPBLAS_STATUS_INVALID_VALUE = 3
    enumerator :: HIPBLAS_STATUS_MAPPING_ERROR = 4
    enumerator :: HIPBLAS_STATUS_EXECUTION_FAILED = 5
    enumerator :: HIPBLAS_STATUS_INTERNAL_ERROR = 6
    enumerator :: HIPBLAS_STATUS_NOT_SUPPORTED = 7
    enumerator :: HIPBLAS_STATUS_ARCH_MISMATCH = 8
    enumerator :: HIPBLAS_STATUS_HANDLE_IS_NULLPTR = 9
    enumerator :: HIPBLAS_STATUS_INVALID_ENUM = 10
    enumerator :: HIPBLAS_STATUS_UNKNOWN = 11
  end enum

  ! hipblasOperation_t
  enum, bind(c)
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_OP_N = 0
#else
    enumerator :: HIPBLAS_OP_N = 111
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_OP_T = 1
#else
    enumerator :: HIPBLAS_OP_T = 112
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_OP_C = 2
#else
    enumerator :: HIPBLAS_OP_C = 113
#endif
  end enum

  ! hipblasComputeType_t
  enum, bind(c)
    enumerator :: HIPBLAS_COMPUTE_16F = 0
    enumerator :: HIPBLAS_COMPUTE_16F_PEDANTIC = 1
    enumerator :: HIPBLAS_COMPUTE_32F = 2
    enumerator :: HIPBLAS_COMPUTE_32F_PEDANTIC = 3
    enumerator :: HIPBLAS_COMPUTE_32F_FAST_16F = 4
    enumerator :: HIPBLAS_COMPUTE_32F_FAST_16BF = 5
    enumerator :: HIPBLAS_COMPUTE_32F_FAST_TF32 = 6
    enumerator :: HIPBLAS_COMPUTE_64F = 7
    enumerator :: HIPBLAS_COMPUTE_64F_PEDANTIC = 8
    enumerator :: HIPBLAS_COMPUTE_32I = 9
    enumerator :: HIPBLAS_COMPUTE_32I_PEDANTIC = 10
    enumerator :: HIPBLAS_COMPUTE_32F_FAST_8F_FNUZ = 100
    enumerator :: HIPBLAS_COMPUTE_32F_FAST_8BF_FNUZ = 101
    enumerator :: HIPBLAS_COMPUTE_32F_FAST_8F8BF_FNUZ = 102
    enumerator :: HIPBLAS_COMPUTE_32F_FAST_8BF8F_FNUZ = 103
  end enum

  ! hipblasPointerMode_t
  enum, bind(c)
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_POINTER_MODE_HOST = 0
#else
    enumerator :: HIPBLAS_POINTER_MODE_HOST = 0
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_POINTER_MODE_DEVICE = 1
#else
    enumerator :: HIPBLAS_POINTER_MODE_DEVICE = 1
#endif
  end enum

  ! hipblasFillMode_t
  enum, bind(c)
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_FILL_MODE_UPPER = 1
#else
    enumerator :: HIPBLAS_FILL_MODE_UPPER = 121
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_FILL_MODE_LOWER = 0
#else
    enumerator :: HIPBLAS_FILL_MODE_LOWER = 122
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_FILL_MODE_FULL = 2
#else
    enumerator :: HIPBLAS_FILL_MODE_FULL = 123
#endif
  end enum

  ! hipblasDiagType_t
  enum, bind(c)
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_DIAG_NON_UNIT = 0
#else
    enumerator :: HIPBLAS_DIAG_NON_UNIT = 131
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_DIAG_UNIT = 1
#else
    enumerator :: HIPBLAS_DIAG_UNIT = 132
#endif
  end enum

  ! hipblasSideMode_t
  enum, bind(c)
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_SIDE_LEFT = 0
#else
    enumerator :: HIPBLAS_SIDE_LEFT = 141
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_SIDE_RIGHT = 1
#else
    enumerator :: HIPBLAS_SIDE_RIGHT = 142
#endif
    enumerator :: HIPBLAS_SIDE_BOTH = 143
  end enum

  ! hipblasMath_t
  enum, bind(c)
    enumerator :: HIPBLAS_DEFAULT_MATH = 0
    enumerator :: HIPBLAS_XF32_XDL_MATH = 1
    enumerator :: HIPBLAS_PEDANTIC_MATH = 2
    enumerator :: HIPBLAS_TF32_TENSOR_OP_MATH = 3
    enumerator :: HIPBLAS_MATH_DISALLOW_REDUCED_PRECISION_REDUCTION = 4
    enumerator :: HIPBLAS_TENSOR_OP_MATH = 5
  end enum

  ! hipblasGemmAlgo_t
  enum, bind(c)
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_GEMM_DEFAULT = -1
#else
    enumerator :: HIPBLAS_GEMM_DEFAULT = 160
#endif
  end enum

  ! hipblasAtomicsMode_t
  enum, bind(c)
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_ATOMICS_NOT_ALLOWED = 0
#else
    enumerator :: HIPBLAS_ATOMICS_NOT_ALLOWED = 0
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPBLAS_ATOMICS_ALLOWED = 1
#else
    enumerator :: HIPBLAS_ATOMICS_ALLOWED = 1
#endif
  end enum

  ! hipblasGemmFlags_t
  enum, bind(c)
    enumerator :: HIPBLAS_GEMM_FLAGS_NONE = 0
    enumerator :: HIPBLAS_GEMM_FLAGS_USE_CU_EFFICIENCY = 2
    enumerator :: HIPBLAS_GEMM_FLAGS_FP16_ALT_IMPL = 4
    enumerator :: HIPBLAS_GEMM_FLAGS_CHECK_SOLUTION_INDEX = 8
    enumerator :: HIPBLAS_GEMM_FLAGS_FP16_ALT_IMPL_RNZ = 16
  end enum

  ! hipblasLibraryProperty_t
  enum, bind(c)
    enumerator :: HIPBLAS_MAJOR_VERSION = 0
    enumerator :: HIPBLAS_MINOR_VERSION = 1
    enumerator :: HIPBLAS_PATCH_LEVEL = 2
  end enum

  !--- #define integer constants ---
  integer(c_int), parameter :: hipblasVersionMajor = 3
  integer(c_int), parameter :: hipblaseVersionMinor = 2
  integer(c_int), parameter :: hipblasVersionMinor = 2
  integer(c_int), parameter :: hipblasVersionPatch = 0

end module hipfort_hipblas_enums
