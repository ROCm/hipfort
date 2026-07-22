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

module hipfort_rocrand_enums
  use, intrinsic :: iso_c_binding
  implicit none

  ! rocrand_status
  enum, bind(c)
    enumerator :: ROCRAND_STATUS_SUCCESS = 0
    enumerator :: ROCRAND_STATUS_VERSION_MISMATCH = 100
    enumerator :: ROCRAND_STATUS_NOT_CREATED = 101
    enumerator :: ROCRAND_STATUS_ALLOCATION_FAILED = 102
    enumerator :: ROCRAND_STATUS_TYPE_ERROR = 103
    enumerator :: ROCRAND_STATUS_OUT_OF_RANGE = 104
    enumerator :: ROCRAND_STATUS_LENGTH_NOT_MULTIPLE = 105
    enumerator :: ROCRAND_STATUS_DOUBLE_PRECISION_REQUIRED = 106
    enumerator :: ROCRAND_STATUS_LAUNCH_FAILURE = 107
    enumerator :: ROCRAND_STATUS_INTERNAL_ERROR = 108
  end enum

  ! rocrand_rng_type
  enum, bind(c)
    enumerator :: ROCRAND_RNG_PSEUDO_DEFAULT = 400
    enumerator :: ROCRAND_RNG_PSEUDO_XORWOW = 401
    enumerator :: ROCRAND_RNG_PSEUDO_MRG32K3A = 402
    enumerator :: ROCRAND_RNG_PSEUDO_MTGP32 = 403
    enumerator :: ROCRAND_RNG_PSEUDO_PHILOX4_32_10 = 404
    enumerator :: ROCRAND_RNG_PSEUDO_MRG31K3P = 405
    enumerator :: ROCRAND_RNG_PSEUDO_LFSR113 = 406
    enumerator :: ROCRAND_RNG_PSEUDO_MT19937 = 407
    enumerator :: ROCRAND_RNG_PSEUDO_THREEFRY2_32_20 = 408
    enumerator :: ROCRAND_RNG_PSEUDO_THREEFRY2_64_20 = 409
    enumerator :: ROCRAND_RNG_PSEUDO_THREEFRY4_32_20 = 410
    enumerator :: ROCRAND_RNG_PSEUDO_THREEFRY4_64_20 = 411
    enumerator :: ROCRAND_RNG_QUASI_DEFAULT = 500
    enumerator :: ROCRAND_RNG_QUASI_SOBOL32 = 501
    enumerator :: ROCRAND_RNG_QUASI_SCRAMBLED_SOBOL32 = 502
    enumerator :: ROCRAND_RNG_QUASI_SOBOL64 = 504
    enumerator :: ROCRAND_RNG_QUASI_SCRAMBLED_SOBOL64 = 505
  end enum

  ! rocrand_ordering
  enum, bind(c)
    enumerator :: ROCRAND_ORDERING_PSEUDO_BEST = 100
    enumerator :: ROCRAND_ORDERING_PSEUDO_DEFAULT = 101
    enumerator :: ROCRAND_ORDERING_PSEUDO_SEEDED = 102
    enumerator :: ROCRAND_ORDERING_PSEUDO_LEGACY = 103
    enumerator :: ROCRAND_ORDERING_PSEUDO_DYNAMIC = 104
    enumerator :: ROCRAND_ORDERING_QUASI_DEFAULT = 201
  end enum

  ! rocrand_direction_vector_set
  enum, bind(c)
    enumerator :: ROCRAND_DIRECTION_VECTORS_32_JOEKUO6 = 101
    enumerator :: ROCRAND_SCRAMBLED_DIRECTION_VECTORS_32_JOEKUO6 = 102
    enumerator :: ROCRAND_DIRECTION_VECTORS_64_JOEKUO6 = 103
    enumerator :: ROCRAND_SCRAMBLED_DIRECTION_VECTORS_64_JOEKUO6 = 104
  end enum

  integer(c_int), parameter :: ROCRAND_VERSION = 400200
  integer(c_int), parameter :: ROCRAND_DEFAULT_MAX_BLOCK_SIZE = 256

end module hipfort_rocrand_enums
