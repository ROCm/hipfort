! Auto-generated enums for hipfort_hiprand
! DO NOT EDIT — re-run the generator to update.

module hipfort_hiprand_enums
  use, intrinsic :: iso_c_binding
  implicit none

  ! hiprandStatus
  enum, bind(c)
    enumerator :: HIPRAND_STATUS_SUCCESS = 0
    enumerator :: HIPRAND_STATUS_VERSION_MISMATCH = 100
    enumerator :: HIPRAND_STATUS_NOT_INITIALIZED = 101
    enumerator :: HIPRAND_STATUS_ALLOCATION_FAILED = 102
    enumerator :: HIPRAND_STATUS_TYPE_ERROR = 103
    enumerator :: HIPRAND_STATUS_OUT_OF_RANGE = 104
    enumerator :: HIPRAND_STATUS_LENGTH_NOT_MULTIPLE = 105
    enumerator :: HIPRAND_STATUS_DOUBLE_PRECISION_REQUIRED = 106
    enumerator :: HIPRAND_STATUS_LAUNCH_FAILURE = 201
    enumerator :: HIPRAND_STATUS_PREEXISTING_FAILURE = 202
    enumerator :: HIPRAND_STATUS_INITIALIZATION_FAILED = 203
    enumerator :: HIPRAND_STATUS_ARCH_MISMATCH = 204
    enumerator :: HIPRAND_STATUS_INTERNAL_ERROR = 999
    enumerator :: HIPRAND_STATUS_NOT_IMPLEMENTED = 1000
  end enum

  ! hiprandRngType
  enum, bind(c)
    enumerator :: HIPRAND_RNG_TEST = 0
    enumerator :: HIPRAND_RNG_PSEUDO_DEFAULT = 400
    enumerator :: HIPRAND_RNG_PSEUDO_XORWOW = 401
    enumerator :: HIPRAND_RNG_PSEUDO_MRG32K3A = 402
    enumerator :: HIPRAND_RNG_PSEUDO_MTGP32 = 403
    enumerator :: HIPRAND_RNG_PSEUDO_MT19937 = 404
    enumerator :: HIPRAND_RNG_PSEUDO_PHILOX4_32_10 = 405
    enumerator :: HIPRAND_RNG_QUASI_DEFAULT = 500
    enumerator :: HIPRAND_RNG_QUASI_SOBOL32 = 501
    enumerator :: HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32 = 502
    enumerator :: HIPRAND_RNG_QUASI_SOBOL64 = 503
    enumerator :: HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64 = 504
  end enum

  ! hiprandOrdering
  enum, bind(c)
    enumerator :: HIPRAND_ORDERING_PSEUDO_BEST = 100
    enumerator :: HIPRAND_ORDERING_PSEUDO_DEFAULT = 101
    enumerator :: HIPRAND_ORDERING_PSEUDO_SEEDED = 102
    enumerator :: HIPRAND_ORDERING_PSEUDO_LEGACY = 103
    enumerator :: HIPRAND_ORDERING_PSEUDO_DYNAMIC = 104
    enumerator :: HIPRAND_ORDERING_QUASI_DEFAULT = 201
  end enum

  ! hiprandDirectionVectorSet
  enum, bind(c)
    enumerator :: HIPRAND_DIRECTION_VECTORS_32_JOEKUO6 = 101
    enumerator :: HIPRAND_SCRAMBLED_DIRECTION_VECTORS_32_JOEKUO6 = 102
    enumerator :: HIPRAND_DIRECTION_VECTORS_64_JOEKUO6 = 103
    enumerator :: HIPRAND_SCRAMBLED_DIRECTION_VECTORS_64_JOEKUO6 = 104
  end enum

  !--- #define integer constants ---
  integer(c_int), parameter :: HIPRAND_VERSION = 300100
  integer(c_int), parameter :: HIPRAND_DEFAULT_MAX_BLOCK_SIZE = 256
  integer(c_int), parameter :: HIPRAND_DEFAULT_MIN_WARPS_PER_EU = 1

end module hipfort_hiprand_enums
