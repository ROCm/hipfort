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

module hipfort_rccl_enums
  use, intrinsic :: iso_c_binding
  implicit none

  ! ncclResult_t
  enum, bind(c)
    enumerator :: ncclSuccess = 0
    enumerator :: ncclUnhandledCudaError = 1
    enumerator :: ncclSystemError = 2
    enumerator :: ncclInternalError = 3
    enumerator :: ncclInvalidArgument = 4
    enumerator :: ncclInvalidUsage = 5
    enumerator :: ncclRemoteError = 6
    enumerator :: ncclInProgress = 7
    enumerator :: ncclTimeout = 8
    enumerator :: ncclNumResults = 9
  end enum

  ! ncclHostCftMode_t
  enum, bind(c)
    enumerator :: ncclHostCftDefault = -2147483647 - 1
    enumerator :: ncclHostCftEnable = 1
    enumerator :: ncclHostCftDisable = 2
    enumerator :: ncclHostCftFallback = 3
  end enum

  ! ncclNvlsHostMode_t
  enum, bind(c)
    enumerator :: ncclNvlsHostModeDefault = -2147483647 - 1
    enumerator :: ncclNvlsHostModeEnable = 0
    enumerator :: ncclNvlsHostModeDisableTransport = 1
    enumerator :: ncclNvlsHostModeDisableSymmetricMultimem = 2
    enumerator :: ncclNvlsHostModeDisable = 2147483647
  end enum

  ! ncclCommMemStat_t
  enum, bind(c)
    enumerator :: ncclStatGpuMemSuspend = 0
    enumerator :: ncclStatGpuMemSuspended = 1
    enumerator :: ncclStatGpuMemPersist = 2
    enumerator :: ncclStatGpuMemTotal = 3
  end enum

  ! ncclRedOp_dummy_t
  enum, bind(c)
    enumerator :: ncclNumOps_dummy = 5
  end enum

  ! ncclRedOp_t
  enum, bind(c)
    enumerator :: ncclSum = 0
    enumerator :: ncclProd = 1
    enumerator :: ncclMax = 2
    enumerator :: ncclMin = 3
    enumerator :: ncclAvg = 4
    enumerator :: ncclNumOps = 5
    enumerator :: ncclMaxRedOp = 2147483647
  end enum

  ! ncclDataType_t
  enum, bind(c)
    enumerator :: ncclInt8 = 0
    enumerator :: ncclChar = 0
    enumerator :: ncclUint8 = 1
    enumerator :: ncclInt32 = 2
    enumerator :: ncclInt = 2
    enumerator :: ncclUint32 = 3
    enumerator :: ncclInt64 = 4
    enumerator :: ncclUint64 = 5
    enumerator :: ncclFloat16 = 6
    enumerator :: ncclHalf = 6
    enumerator :: ncclFloat32 = 7
    enumerator :: ncclFloat = 7
    enumerator :: ncclFloat64 = 8
    enumerator :: ncclDouble = 8
    enumerator :: ncclBfloat16 = 9
    enumerator :: ncclFloat8e4m3 = 10
    enumerator :: ncclFloat8e5m2 = 11
    enumerator :: ncclNumTypes = 12
  end enum

  ! ncclScalarResidence_t
  enum, bind(c)
    enumerator :: ncclScalarDevice = 0
    enumerator :: ncclScalarHostImmediate = 1
  end enum

  ! ncclEncryptionMode_t
  enum, bind(c)
    enumerator :: NCCL_ENCRYPTION_MODE_NONE = 0
    enumerator :: NCCL_ENCRYPTION_MODE_PSK = 1
  end enum

  integer(c_int), parameter :: NCCL_MAJOR = 2
  integer(c_int), parameter :: NCCL_MINOR = 32
  integer(c_int), parameter :: NCCL_PATCH = 3
  integer(c_int), parameter :: NCCL_VERSION_CODE = 23203
  integer(c_int), parameter :: RCCL_BFLOAT16 = 1
  integer(c_int), parameter :: RCCL_FLOAT8 = 1
  integer(c_int), parameter :: RCCL_GATHER_SCATTER = 1
  integer(c_int), parameter :: RCCL_ALLTOALLV = 1
  integer(c_int), parameter :: RCCL_ALLREDUCE_WITH_BIAS = 1
  integer(c_int), parameter :: RCCL_SUSPEND_RESUME = 1
  integer(c_int), parameter :: NCCL_UNIQUE_ID_BYTES = 128
  integer(c_int), parameter :: NCCL_SPLIT_NOCOLOR = -1
  integer(c_int), parameter :: NCCL_API_MAGIC = -889274641  ! 0xcafebeef
  integer(c_int), parameter :: NCCL_WIN_DEFAULT = 0
  integer(c_int), parameter :: NCCL_WIN_COLL_SYMMETRIC = 1
  integer(c_int), parameter :: NCCL_WIN_STRICT_ORDERING = 2
  integer(c_int), parameter :: NCCL_WIN_GIN_ONLY = 4
  integer(c_int), parameter :: NCCL_WIN_CFT_COUNTED = 8
  integer(c_int), parameter :: NCCL_WIN_REQUIRED_ALIGNMENT = 4096
  integer(c_int), parameter :: NCCL_CTA_POLICY_DEFAULT = 0
  integer(c_int), parameter :: NCCL_CTA_POLICY_EFFICIENCY = 1
  integer(c_int), parameter :: NCCL_CTA_POLICY_ZERO = 2
  integer(c_int), parameter :: NCCL_SHRINK_DEFAULT = 0
  integer(c_int), parameter :: NCCL_SHRINK_ABORT = 1
  integer(c_int), parameter :: NCCL_REVOKE_DEFAULT = 0
  integer(c_int), parameter :: NCCL_SUSPEND_MEM = 1

end module hipfort_rccl_enums
