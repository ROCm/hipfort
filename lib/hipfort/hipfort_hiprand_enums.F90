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
#ifdef USE_CUDA_NAMES
    enumerator :: HIPRAND_RNG_PSEUDO_DEFAULT = 100
#else
    enumerator :: HIPRAND_RNG_PSEUDO_DEFAULT = 400
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPRAND_RNG_PSEUDO_XORWOW = 101
#else
    enumerator :: HIPRAND_RNG_PSEUDO_XORWOW = 401
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPRAND_RNG_PSEUDO_MRG32K3A = 121
#else
    enumerator :: HIPRAND_RNG_PSEUDO_MRG32K3A = 402
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPRAND_RNG_PSEUDO_MTGP32 = 141
#else
    enumerator :: HIPRAND_RNG_PSEUDO_MTGP32 = 403
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPRAND_RNG_PSEUDO_MT19937 = 142
#else
    enumerator :: HIPRAND_RNG_PSEUDO_MT19937 = 404
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPRAND_RNG_PSEUDO_PHILOX4_32_10 = 161
#else
    enumerator :: HIPRAND_RNG_PSEUDO_PHILOX4_32_10 = 405
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPRAND_RNG_QUASI_DEFAULT = 200
#else
    enumerator :: HIPRAND_RNG_QUASI_DEFAULT = 500
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPRAND_RNG_QUASI_SOBOL32 = 201
#else
    enumerator :: HIPRAND_RNG_QUASI_SOBOL32 = 501
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32 = 202
#else
    enumerator :: HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32 = 502
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPRAND_RNG_QUASI_SOBOL64 = 203
#else
    enumerator :: HIPRAND_RNG_QUASI_SOBOL64 = 503
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64 = 204
#else
    enumerator :: HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64 = 504
#endif
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

  integer(c_int), parameter :: HIPRAND_VERSION = 300400
  integer(c_int), parameter :: HIPRAND_DEFAULT_MAX_BLOCK_SIZE = 256
  integer(c_int), parameter :: HIPRAND_DEFAULT_MIN_WARPS_PER_EU = 1

end module hipfort_hiprand_enums
