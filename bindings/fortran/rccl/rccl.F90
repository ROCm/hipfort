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

module rccl
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


  type, bind(c) :: ncclUniqueId
    character(c_char) :: internal(128)
  end type ncclUniqueId

  type, bind(c) :: ncclConfig_t
    integer(c_size_t) :: size
    integer(c_int) :: magic
    integer(c_int) :: version
    integer(c_int) :: blocking
    integer(c_int) :: cgaClusterSize
    integer(c_int) :: minCTAs
    integer(c_int) :: maxCTAs
    type(c_ptr) :: netName
    integer(c_int) :: splitShare
    integer(c_int) :: trafficClass
    type(c_ptr) :: commName
    integer(c_int) :: collnetEnable
    integer(c_int) :: CTAPolicy
    integer(c_int) :: shrinkShare
    integer(c_int) :: nvlsCTAs
    integer(c_int) :: nChannelsPerNetPeer
    integer(c_int) :: nvlinkCentricSched
    integer(c_int) :: graphUsageMode
    integer(c_int) :: numRmaCtx
    integer(c_int) :: maxP2pPeers
    integer(c_int) :: graphStreamOrdering
    integer(c_int) :: launchOrderImplicit
    integer(c_int) :: numRmaSig
    integer(c_int) :: rmaEagerInit
    integer(c_int) :: hostCftMode
    integer(c_int) :: nvlsHostMode
  end type ncclConfig_t

  type, bind(c) :: ncclConfigExt_t
    type(c_ptr) :: next
    integer(c_int32_t) :: key(2) !< 8-byte unnamed C struct: keeps the layout exact, fields not individually accessible
    integer(c_int64_t) :: val(1) !< 8-byte C union: keeps the layout exact, members not individually accessible
  end type ncclConfigExt_t

  type, bind(c) :: ncclCollConfig_t
    integer(c_size_t) :: size
    integer(c_int) :: magic
    integer(c_int) :: version
    type(c_ptr) :: ext
    integer(c_int) :: minCTAs
    integer(c_int) :: maxCTAs
    integer(c_int) :: nvlsCTAs
    integer(c_int) :: cgaClusterSize
    type(c_ptr) :: algSelection
    integer(c_int) :: forceAlgSelection
    integer(c_int) :: CTAPolicy
    integer(c_int64_t) :: userProfilerTag
    type(c_ptr) :: launchCompletionEvent
  end type ncclCollConfig_t

  type, bind(c) :: ncclSimInfo_t
    integer(c_size_t) :: size
    integer(c_int) :: magic
    integer(c_int) :: version
    real(c_float) :: estimatedTime
  end type ncclSimInfo_t

  type, bind(c) :: ncclWaitSignalDesc_t
    integer(c_int) :: opCnt
    integer(c_int) :: peer
    integer(c_int) :: sigIdx
    integer(c_int) :: ctx
  end type ncclWaitSignalDesc_t

  type, bind(c) :: ncclEncryptionConfig_t
    integer(c_size_t) :: size
    integer(c_int) :: magic
    integer(c_int) :: version
    integer(c_int) :: mode
    type(c_ptr) :: psk
  end type ncclEncryptionConfig_t


  interface ncclMemAlloc
    function ncclMemAlloc_(ptr,mySize) bind(c, name="ncclMemAlloc")
      import
      implicit none
      integer(c_int) :: ncclMemAlloc_
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
    end function
  end interface

  interface ncclMemFree
    function ncclMemFree_(ptr) bind(c, name="ncclMemFree")
      import
      implicit none
      integer(c_int) :: ncclMemFree_
      type(c_ptr),value :: ptr
    end function
  end interface

  interface ncclGetVersion
    function ncclGetVersion_(version) bind(c, name="ncclGetVersion")
      import
      implicit none
      integer(c_int) :: ncclGetVersion_
      type(c_ptr),value :: version
    end function

    module procedure ncclGetVersion_typed
  end interface

  interface ncclGetUniqueId
    function ncclGetUniqueId_(uniqueId) bind(c, name="ncclGetUniqueId")
      import
      implicit none
      integer(c_int) :: ncclGetUniqueId_
      type(ncclUniqueId) :: uniqueId
    end function
  end interface

  interface ncclCommInitRankConfig
    function ncclCommInitRankConfig_(comm,nranks,commId,rank,config) &
        bind(c, name="ncclCommInitRankConfig")
      import
      implicit none
      integer(c_int) :: ncclCommInitRankConfig_
      type(c_ptr) :: comm
      integer(c_int),value :: nranks
      type(ncclUniqueId),value :: commId
      integer(c_int),value :: rank
      type(ncclConfig_t) :: config
    end function
  end interface

  interface ncclCommInitRank
    function ncclCommInitRank_(comm,nranks,commId,rank) bind(c, name="ncclCommInitRank")
      import
      implicit none
      integer(c_int) :: ncclCommInitRank_
      type(c_ptr) :: comm
      integer(c_int),value :: nranks
      type(ncclUniqueId),value :: commId
      integer(c_int),value :: rank
    end function
  end interface

  interface ncclCommInitAll
    function ncclCommInitAll_(comm,ndev,devlist) bind(c, name="ncclCommInitAll")
      import
      implicit none
      integer(c_int) :: ncclCommInitAll_
      type(c_ptr) :: comm(*)
      integer(c_int),value :: ndev
      type(c_ptr),value :: devlist
    end function

#ifdef USE_ASSUMED_RANK
    module procedure ncclCommInitAll_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      ncclCommInitAll_rank_0,&
      ncclCommInitAll_rank_1
#endif
#endif
  end interface

  interface ncclCommFinalize
    function ncclCommFinalize_(comm) bind(c, name="ncclCommFinalize")
      import
      implicit none
      integer(c_int) :: ncclCommFinalize_
      type(c_ptr),value :: comm
    end function
  end interface

  interface ncclCommDestroy
    function ncclCommDestroy_(comm) bind(c, name="ncclCommDestroy")
      import
      implicit none
      integer(c_int) :: ncclCommDestroy_
      type(c_ptr),value :: comm
    end function
  end interface

  interface ncclCommAbort
    function ncclCommAbort_(comm) bind(c, name="ncclCommAbort")
      import
      implicit none
      integer(c_int) :: ncclCommAbort_
      type(c_ptr),value :: comm
    end function
  end interface

  interface ncclCommRevoke
    function ncclCommRevoke_(comm,revokeFlags) bind(c, name="ncclCommRevoke")
      import
      implicit none
      integer(c_int) :: ncclCommRevoke_
      type(c_ptr),value :: comm
      integer(c_int),value :: revokeFlags
    end function
  end interface

  interface ncclCommSplit
    function ncclCommSplit_(comm,color,key,newcomm,config) bind(c, name="ncclCommSplit")
      import
      implicit none
      integer(c_int) :: ncclCommSplit_
      type(c_ptr),value :: comm
      integer(c_int),value :: color
      integer(c_int),value :: key
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
    end function
  end interface

  interface ncclCommShrink
    function ncclCommShrink_(comm,excludeRanksList,excludeRanksCount,newcomm,config,shrinkFlags) &
        bind(c, name="ncclCommShrink")
      import
      implicit none
      integer(c_int) :: ncclCommShrink_
      type(c_ptr),value :: comm
      type(c_ptr),value :: excludeRanksList
      integer(c_int),value :: excludeRanksCount
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
      integer(c_int),value :: shrinkFlags
    end function

#ifdef USE_ASSUMED_RANK
    module procedure ncclCommShrink_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      ncclCommShrink_rank_0,&
      ncclCommShrink_rank_1
#endif
#endif
  end interface

  interface ncclCommGetUniqueId
    function ncclCommGetUniqueId_(comm,uniqueId) bind(c, name="ncclCommGetUniqueId")
      import
      implicit none
      integer(c_int) :: ncclCommGetUniqueId_
      type(c_ptr),value :: comm
      type(ncclUniqueId) :: uniqueId
    end function
  end interface

  interface ncclCommGrow
    function ncclCommGrow_(comm,nRanks,uniqueId,rank,newcomm,config) bind(c, name="ncclCommGrow")
      import
      implicit none
      integer(c_int) :: ncclCommGrow_
      type(c_ptr),value :: comm
      integer(c_int),value :: nRanks
      type(ncclUniqueId) :: uniqueId
      integer(c_int),value :: rank
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
    end function
  end interface

  interface ncclCommInitRankScalable
    function ncclCommInitRankScalable_(newcomm,nranks,myrank,nId,commIds,config) &
        bind(c, name="ncclCommInitRankScalable")
      import
      implicit none
      integer(c_int) :: ncclCommInitRankScalable_
      type(c_ptr) :: newcomm
      integer(c_int),value :: nranks
      integer(c_int),value :: myrank
      integer(c_int),value :: nId
      type(ncclUniqueId) :: commIds
      type(ncclConfig_t) :: config
    end function
  end interface

  interface ncclGetErrorString
    function ncclGetErrorString_(myResult) bind(c, name="ncclGetErrorString")
      import
      implicit none
      type(c_ptr) :: ncclGetErrorString_
      integer(c_int),value :: myResult
    end function
  end interface

  interface ncclGetLastError
    function ncclGetLastError_(comm) bind(c, name="ncclGetLastError")
      import
      implicit none
      type(c_ptr) :: ncclGetLastError_
      type(c_ptr),value :: comm
    end function
  end interface

  interface ncclResetDebugInit
    subroutine ncclResetDebugInit_() bind(c, name="ncclResetDebugInit")
      import
      implicit none
    end subroutine
  end interface

  interface ncclCommGetAsyncError
    function ncclCommGetAsyncError_(comm,asyncError) bind(c, name="ncclCommGetAsyncError")
      import
      implicit none
      integer(c_int) :: ncclCommGetAsyncError_
      type(c_ptr),value :: comm
      type(c_ptr),value :: asyncError
    end function

    module procedure ncclCommGetAsyncError_typed
  end interface

  interface ncclCommCount
    function ncclCommCount_(comm,count) bind(c, name="ncclCommCount")
      import
      implicit none
      integer(c_int) :: ncclCommCount_
      type(c_ptr),value :: comm
      type(c_ptr),value :: count
    end function

    module procedure ncclCommCount_typed
  end interface

  interface ncclCommCuDevice
    function ncclCommCuDevice_(comm,device) bind(c, name="ncclCommCuDevice")
      import
      implicit none
      integer(c_int) :: ncclCommCuDevice_
      type(c_ptr),value :: comm
      type(c_ptr),value :: device
    end function

    module procedure ncclCommCuDevice_typed
  end interface

  interface ncclCommUserRank
    function ncclCommUserRank_(comm,rank) bind(c, name="ncclCommUserRank")
      import
      implicit none
      integer(c_int) :: ncclCommUserRank_
      type(c_ptr),value :: comm
      type(c_ptr),value :: rank
    end function

    module procedure ncclCommUserRank_typed
  end interface

  interface ncclCommRegister
    function ncclCommRegister_(comm,buff,mySize,handle) bind(c, name="ncclCommRegister")
      import
      implicit none
      integer(c_int) :: ncclCommRegister_
      type(c_ptr),value :: comm
      type(c_ptr),value :: buff
      integer(c_size_t),value :: mySize
      type(c_ptr) :: handle
    end function
  end interface

  interface ncclCommDeregister
    function ncclCommDeregister_(comm,handle) bind(c, name="ncclCommDeregister")
      import
      implicit none
      integer(c_int) :: ncclCommDeregister_
      type(c_ptr),value :: comm
      type(c_ptr),value :: handle
    end function
  end interface

  interface ncclCommSuspend
    function ncclCommSuspend_(comm,flags) bind(c, name="ncclCommSuspend")
      import
      implicit none
      integer(c_int) :: ncclCommSuspend_
      type(c_ptr),value :: comm
      integer(c_int),value :: flags
    end function
  end interface

  interface ncclCommResume
    function ncclCommResume_(comm) bind(c, name="ncclCommResume")
      import
      implicit none
      integer(c_int) :: ncclCommResume_
      type(c_ptr),value :: comm
    end function
  end interface

  interface ncclCommMemStats
    function ncclCommMemStats_(comm,stat,myValue) bind(c, name="ncclCommMemStats")
      import
      implicit none
      integer(c_int) :: ncclCommMemStats_
      type(c_ptr),value :: comm
      integer(c_int),value :: stat
      type(c_ptr),value :: myValue
    end function

    module procedure ncclCommMemStats_typed
  end interface

  interface ncclCommWindowRegister
    function ncclCommWindowRegister_(comm,buff,mySize,win,winFlags) &
        bind(c, name="ncclCommWindowRegister")
      import
      implicit none
      integer(c_int) :: ncclCommWindowRegister_
      type(c_ptr),value :: comm
      type(c_ptr),value :: buff
      integer(c_size_t),value :: mySize
      type(c_ptr) :: win
      integer(c_int),value :: winFlags
    end function
  end interface

  interface ncclCommWindowDeregister
    function ncclCommWindowDeregister_(comm,win) bind(c, name="ncclCommWindowDeregister")
      import
      implicit none
      integer(c_int) :: ncclCommWindowDeregister_
      type(c_ptr),value :: comm
      type(c_ptr),value :: win
    end function
  end interface

  interface ncclWinGetUserPtr
    function ncclWinGetUserPtr_(comm,win,outUserPtr) bind(c, name="ncclWinGetUserPtr")
      import
      implicit none
      integer(c_int) :: ncclWinGetUserPtr_
      type(c_ptr),value :: comm
      type(c_ptr),value :: win
      type(c_ptr) :: outUserPtr
    end function
  end interface

  interface ncclRedOpCreatePreMulSum
    function ncclRedOpCreatePreMulSum_(op,scalar,datatype,residence,comm) &
        bind(c, name="ncclRedOpCreatePreMulSum")
      import
      implicit none
      integer(c_int) :: ncclRedOpCreatePreMulSum_
      type(c_ptr),value :: op
      type(c_ptr),value :: scalar
      integer(c_int),value :: datatype
      integer(c_int),value :: residence
      type(c_ptr),value :: comm
    end function

    module procedure ncclRedOpCreatePreMulSum_typed
  end interface

  interface ncclRedOpDestroy
    function ncclRedOpDestroy_(op,comm) bind(c, name="ncclRedOpDestroy")
      import
      implicit none
      integer(c_int) :: ncclRedOpDestroy_
      integer(c_int),value :: op
      type(c_ptr),value :: comm
    end function
  end interface

  interface ncclReduce
    function ncclReduce_(sendbuff,recvbuff,count,datatype,op,root,comm,stream) &
        bind(c, name="ncclReduce")
      import
      implicit none
      integer(c_int) :: ncclReduce_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclBcast
    function ncclBcast_(buff,count,datatype,root,comm,stream) bind(c, name="ncclBcast")
      import
      implicit none
      integer(c_int) :: ncclBcast_
      type(c_ptr),value :: buff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclBroadcast
    function ncclBroadcast_(sendbuff,recvbuff,count,datatype,root,comm,stream) &
        bind(c, name="ncclBroadcast")
      import
      implicit none
      integer(c_int) :: ncclBroadcast_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclAllReduce
    function ncclAllReduce_(sendbuff,recvbuff,count,datatype,op,comm,stream) &
        bind(c, name="ncclAllReduce")
      import
      implicit none
      integer(c_int) :: ncclAllReduce_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclAllReduceWithBias
    function ncclAllReduceWithBias_(sendbuff,recvbuff,count,datatype,op,comm,stream,acc) &
        bind(c, name="ncclAllReduceWithBias")
      import
      implicit none
      integer(c_int) :: ncclAllReduceWithBias_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(c_ptr),value :: acc
    end function
  end interface

  interface ncclReduceScatter
    function ncclReduceScatter_(sendbuff,recvbuff,recvcount,datatype,op,comm,stream) &
        bind(c, name="ncclReduceScatter")
      import
      implicit none
      integer(c_int) :: ncclReduceScatter_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: recvcount
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclAllGather
    function ncclAllGather_(sendbuff,recvbuff,sendcount,datatype,comm,stream) &
        bind(c, name="ncclAllGather")
      import
      implicit none
      integer(c_int) :: ncclAllGather_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: sendcount
      integer(c_int),value :: datatype
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclAlltoAll
    function ncclAlltoAll_(sendbuff,recvbuff,count,datatype,comm,stream) &
        bind(c, name="ncclAlltoAll")
      import
      implicit none
      integer(c_int) :: ncclAlltoAll_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclAlltoAllv
    function ncclAlltoAllv_(sendbuff,sendcounts,sdispls,recvbuff,recvcounts,rdispls,datatype,comm, &
        stream) &
        bind(c, name="ncclAlltoAllv")
      import
      implicit none
      integer(c_int) :: ncclAlltoAllv_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: sendcounts
      type(c_ptr),value :: sdispls
      type(c_ptr),value :: recvbuff
      type(c_ptr),value :: recvcounts
      type(c_ptr),value :: rdispls
      integer(c_int),value :: datatype
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function

#ifdef USE_ASSUMED_RANK
    module procedure ncclAlltoAllv_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      ncclAlltoAllv_rank_0,&
      ncclAlltoAllv_rank_1
#endif
#endif
  end interface

  interface ncclGather
    function ncclGather_(sendbuff,recvbuff,count,datatype,root,comm,stream) &
        bind(c, name="ncclGather")
      import
      implicit none
      integer(c_int) :: ncclGather_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclScatter
    function ncclScatter_(sendbuff,recvbuff,count,datatype,root,comm,stream) &
        bind(c, name="ncclScatter")
      import
      implicit none
      integer(c_int) :: ncclScatter_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclAllReduceConfig
    function ncclAllReduceConfig_(sendbuff,recvbuff,count,datatype,op,comm,stream,config) &
        bind(c, name="ncclAllReduceConfig")
      import
      implicit none
      integer(c_int) :: ncclAllReduceConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclBroadcastConfig
    function ncclBroadcastConfig_(sendbuff,recvbuff,count,datatype,root,comm,stream,config) &
        bind(c, name="ncclBroadcastConfig")
      import
      implicit none
      integer(c_int) :: ncclBroadcastConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclReduceConfig
    function ncclReduceConfig_(sendbuff,recvbuff,count,datatype,op,root,comm,stream,config) &
        bind(c, name="ncclReduceConfig")
      import
      implicit none
      integer(c_int) :: ncclReduceConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclAllGatherConfig
    function ncclAllGatherConfig_(sendbuff,recvbuff,sendcount,datatype,comm,stream,config) &
        bind(c, name="ncclAllGatherConfig")
      import
      implicit none
      integer(c_int) :: ncclAllGatherConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: sendcount
      integer(c_int),value :: datatype
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclReduceScatterConfig
    function ncclReduceScatterConfig_(sendbuff,recvbuff,recvcount,datatype,op,comm,stream,config) &
        bind(c, name="ncclReduceScatterConfig")
      import
      implicit none
      integer(c_int) :: ncclReduceScatterConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: recvcount
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclAlltoAllConfig
    function ncclAlltoAllConfig_(sendbuff,recvbuff,count,datatype,comm,stream,config) &
        bind(c, name="ncclAlltoAllConfig")
      import
      implicit none
      integer(c_int) :: ncclAlltoAllConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclGatherConfig
    function ncclGatherConfig_(sendbuff,recvbuff,count,datatype,root,comm,stream,config) &
        bind(c, name="ncclGatherConfig")
      import
      implicit none
      integer(c_int) :: ncclGatherConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclScatterConfig
    function ncclScatterConfig_(sendbuff,recvbuff,count,datatype,root,comm,stream,config) &
        bind(c, name="ncclScatterConfig")
      import
      implicit none
      integer(c_int) :: ncclScatterConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclSend
    function ncclSend_(sendbuff,count,datatype,peer,comm,stream) bind(c, name="ncclSend")
      import
      implicit none
      integer(c_int) :: ncclSend_
      type(c_ptr),value :: sendbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: peer
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclRecv
    function ncclRecv_(recvbuff,count,datatype,peer,comm,stream) bind(c, name="ncclRecv")
      import
      implicit none
      integer(c_int) :: ncclRecv_
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: peer
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclPutSignal
    function ncclPutSignal_(localbuff,count,datatype,peer,peerWin,peerWinOffset,sigIdx,ctx,flags, &
        comm,stream) &
        bind(c, name="ncclPutSignal")
      import
      implicit none
      integer(c_int) :: ncclPutSignal_
      type(c_ptr),value :: localbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: peer
      type(c_ptr),value :: peerWin
      integer(c_size_t),value :: peerWinOffset
      integer(c_int),value :: sigIdx
      integer(c_int),value :: ctx
      integer(c_int),value :: flags
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclSignal
    function ncclSignal_(peer,sigIdx,ctx,flags,comm,stream) bind(c, name="ncclSignal")
      import
      implicit none
      integer(c_int) :: ncclSignal_
      integer(c_int),value :: peer
      integer(c_int),value :: sigIdx
      integer(c_int),value :: ctx
      integer(c_int),value :: flags
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclWaitSignal
    function ncclWaitSignal_(nDesc,signalDescs,comm,stream) bind(c, name="ncclWaitSignal")
      import
      implicit none
      integer(c_int) :: ncclWaitSignal_
      integer(c_int),value :: nDesc
      type(ncclWaitSignalDesc_t) :: signalDescs
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclGroupStart
    function ncclGroupStart_() bind(c, name="ncclGroupStart")
      import
      implicit none
      integer(c_int) :: ncclGroupStart_
    end function
  end interface

  interface ncclGroupEnd
    function ncclGroupEnd_() bind(c, name="ncclGroupEnd")
      import
      implicit none
      integer(c_int) :: ncclGroupEnd_
    end function
  end interface

  interface ncclGroupSimulateEnd
    function ncclGroupSimulateEnd_(simInfo) bind(c, name="ncclGroupSimulateEnd")
      import
      implicit none
      integer(c_int) :: ncclGroupSimulateEnd_
      type(ncclSimInfo_t) :: simInfo
    end function
  end interface

  interface ncclSetEncryption
    function ncclSetEncryption_(config) bind(c, name="ncclSetEncryption")
      import
      implicit none
      integer(c_int) :: ncclSetEncryption_
      type(ncclEncryptionConfig_t) :: config
    end function
  end interface

  interface ncclParamBind
    function ncclParamBind_(out,key) bind(c, name="ncclParamBind")
      import
      implicit none
      integer(c_int) :: ncclParamBind_
      type(c_ptr) :: out
      type(c_ptr),value :: key
    end function
  end interface

  interface ncclParamGetI8
    function ncclParamGetI8_(h,out) bind(c, name="ncclParamGetI8")
      import
      implicit none
      integer(c_int) :: ncclParamGetI8_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetI8_typed
  end interface

  interface ncclParamGetI16
    function ncclParamGetI16_(h,out) bind(c, name="ncclParamGetI16")
      import
      implicit none
      integer(c_int) :: ncclParamGetI16_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetI16_typed
  end interface

  interface ncclParamGetI32
    function ncclParamGetI32_(h,out) bind(c, name="ncclParamGetI32")
      import
      implicit none
      integer(c_int) :: ncclParamGetI32_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetI32_typed
  end interface

  interface ncclParamGetI64
    function ncclParamGetI64_(h,out) bind(c, name="ncclParamGetI64")
      import
      implicit none
      integer(c_int) :: ncclParamGetI64_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetI64_typed
  end interface

  interface ncclParamGetU8
    function ncclParamGetU8_(h,out) bind(c, name="ncclParamGetU8")
      import
      implicit none
      integer(c_int) :: ncclParamGetU8_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetU8_typed
  end interface

  interface ncclParamGetU16
    function ncclParamGetU16_(h,out) bind(c, name="ncclParamGetU16")
      import
      implicit none
      integer(c_int) :: ncclParamGetU16_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetU16_typed
  end interface

  interface ncclParamGetU32
    function ncclParamGetU32_(h,out) bind(c, name="ncclParamGetU32")
      import
      implicit none
      integer(c_int) :: ncclParamGetU32_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetU32_typed
  end interface

  interface ncclParamGetU64
    function ncclParamGetU64_(h,out) bind(c, name="ncclParamGetU64")
      import
      implicit none
      integer(c_int) :: ncclParamGetU64_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetU64_typed
  end interface

  interface ncclParamGetStr
    function ncclParamGetStr_(h,out) bind(c, name="ncclParamGetStr")
      import
      implicit none
      integer(c_int) :: ncclParamGetStr_
      type(c_ptr),value :: h
      type(c_ptr) :: out
    end function
  end interface

  interface ncclParamGet
    function ncclParamGet_(h,out,maxLen,len) bind(c, name="ncclParamGet")
      import
      implicit none
      integer(c_int) :: ncclParamGet_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
      integer(c_int),value :: maxLen
      type(c_ptr),value :: len
    end function

    module procedure ncclParamGet_typed
  end interface

  interface ncclParamGetParameter
    function ncclParamGetParameter_(key,myValue,valueLen) bind(c, name="ncclParamGetParameter")
      import
      implicit none
      integer(c_int) :: ncclParamGetParameter_
      type(c_ptr),value :: key
      type(c_ptr) :: myValue
      type(c_ptr),value :: valueLen
    end function

    module procedure ncclParamGetParameter_typed
  end interface

  interface ncclParamGetAllParameterKeys
    function ncclParamGetAllParameterKeys_(table,tableLen) &
        bind(c, name="ncclParamGetAllParameterKeys")
      import
      implicit none
      integer(c_int) :: ncclParamGetAllParameterKeys_
      type(c_ptr) :: table
      type(c_ptr),value :: tableLen
    end function

    module procedure ncclParamGetAllParameterKeys_typed
  end interface

  interface ncclParamDumpAll
    subroutine ncclParamDumpAll_() bind(c, name="ncclParamDumpAll")
      import
      implicit none
    end subroutine
  end interface


  contains

    subroutine ncclCheck(status)
      implicit none
      integer(kind(ncclSuccess)) :: status
      character(len=22) :: name
      if (status /= ncclSuccess) then
        name = "unknown status"
        select case (status)
        case (ncclUnhandledCudaError)
          name = "ncclUnhandledCudaError"
        case (ncclSystemError)
          name = "ncclSystemError"
        case (ncclInternalError)
          name = "ncclInternalError"
        case (ncclInvalidArgument)
          name = "ncclInvalidArgument"
        case (ncclInvalidUsage)
          name = "ncclInvalidUsage"
        case (ncclRemoteError)
          name = "ncclRemoteError"
        case (ncclInProgress)
          name = "ncclInProgress"
        case (ncclTimeout)
          name = "ncclTimeout"
        case (ncclNumResults)
          name = "ncclNumResults"
        end select
        write (*, "(a,i0,a)") "RCCL ERROR: " // trim(name) // " (code ", status, ")"
        stop 1
      end if
    end subroutine ncclCheck
    function ncclGetVersion_typed(version)
      implicit none
      integer(kind(ncclSuccess)) :: ncclGetVersion_typed
      integer(c_int),target :: version
      !
      ncclGetVersion_typed = ncclGetVersion_(c_loc(version))
    end function

    function ncclCommGetAsyncError_typed(comm,asyncError)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommGetAsyncError_typed
      type(c_ptr), value :: comm
      integer(kind(ncclSuccess)),target :: asyncError
      !
      ncclCommGetAsyncError_typed = ncclCommGetAsyncError_(comm,c_loc(asyncError))
    end function

    function ncclCommCount_typed(comm,count)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommCount_typed
      type(c_ptr), value :: comm
      integer(c_int),target :: count
      !
      ncclCommCount_typed = ncclCommCount_(comm,c_loc(count))
    end function

    function ncclCommCuDevice_typed(comm,device)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommCuDevice_typed
      type(c_ptr), value :: comm
      integer(c_int),target :: device
      !
      ncclCommCuDevice_typed = ncclCommCuDevice_(comm,c_loc(device))
    end function

    function ncclCommUserRank_typed(comm,rank)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommUserRank_typed
      type(c_ptr), value :: comm
      integer(c_int),target :: rank
      !
      ncclCommUserRank_typed = ncclCommUserRank_(comm,c_loc(rank))
    end function

    function ncclCommMemStats_typed(comm,stat,myValue)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommMemStats_typed
      type(c_ptr), value :: comm
      integer(kind(ncclStatGpuMemSuspend)) :: stat
      integer(c_int64_t),target :: myValue
      !
      ncclCommMemStats_typed = ncclCommMemStats_(comm,stat,c_loc(myValue))
    end function

    function ncclRedOpCreatePreMulSum_typed(op,scalar,datatype,residence,comm)
      implicit none
      integer(kind(ncclSuccess)) :: ncclRedOpCreatePreMulSum_typed
      integer(kind(ncclSum)),target :: op
      type(c_ptr), value :: scalar
      integer(kind(ncclInt8)) :: datatype
      integer(kind(ncclScalarDevice)) :: residence
      type(c_ptr), value :: comm
      !
      ncclRedOpCreatePreMulSum_typed = ncclRedOpCreatePreMulSum_(c_loc(op),scalar,datatype, &
        residence,comm)
    end function

    function ncclParamGetI8_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetI8_typed
      type(c_ptr), value :: h
      integer(c_int8_t),target :: out
      !
      ncclParamGetI8_typed = ncclParamGetI8_(h,c_loc(out))
    end function

    function ncclParamGetI16_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetI16_typed
      type(c_ptr), value :: h
      integer(c_int16_t),target :: out
      !
      ncclParamGetI16_typed = ncclParamGetI16_(h,c_loc(out))
    end function

    function ncclParamGetI32_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetI32_typed
      type(c_ptr), value :: h
      integer(c_int32_t),target :: out
      !
      ncclParamGetI32_typed = ncclParamGetI32_(h,c_loc(out))
    end function

    function ncclParamGetI64_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetI64_typed
      type(c_ptr), value :: h
      integer(c_int64_t),target :: out
      !
      ncclParamGetI64_typed = ncclParamGetI64_(h,c_loc(out))
    end function

    function ncclParamGetU8_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetU8_typed
      type(c_ptr), value :: h
      integer(c_int8_t),target :: out
      !
      ncclParamGetU8_typed = ncclParamGetU8_(h,c_loc(out))
    end function

    function ncclParamGetU16_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetU16_typed
      type(c_ptr), value :: h
      integer(c_int16_t),target :: out
      !
      ncclParamGetU16_typed = ncclParamGetU16_(h,c_loc(out))
    end function

    function ncclParamGetU32_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetU32_typed
      type(c_ptr), value :: h
      integer(c_int32_t),target :: out
      !
      ncclParamGetU32_typed = ncclParamGetU32_(h,c_loc(out))
    end function

    function ncclParamGetU64_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetU64_typed
      type(c_ptr), value :: h
      integer(c_int64_t),target :: out
      !
      ncclParamGetU64_typed = ncclParamGetU64_(h,c_loc(out))
    end function

    function ncclParamGet_typed(h,out,maxLen,len)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGet_typed
      type(c_ptr), value :: h
      type(c_ptr), value :: out
      integer(c_int) :: maxLen
      integer(c_int),target :: len
      !
      ncclParamGet_typed = ncclParamGet_(h,out,maxLen,c_loc(len))
    end function

    function ncclParamGetParameter_typed(key,myValue,valueLen)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetParameter_typed
      type(c_ptr), value :: key
      type(c_ptr) :: myValue
      integer(c_int),target :: valueLen
      !
      ncclParamGetParameter_typed = ncclParamGetParameter_(key,myValue,c_loc(valueLen))
    end function

    function ncclParamGetAllParameterKeys_typed(table,tableLen)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetAllParameterKeys_typed
      type(c_ptr) :: table
      integer(c_int),target :: tableLen
      !
      ncclParamGetAllParameterKeys_typed = ncclParamGetAllParameterKeys_(table,c_loc(tableLen))
    end function


#if defined(USE_ASSUMED_SHAPE) || defined(USE_ASSUMED_RANK)

#ifdef USE_ASSUMED_RANK
    function ncclCommInitAll_assumed_rank(comm,ndev,devlist)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommInitAll_assumed_rank
      type(c_ptr) :: comm(*)
      integer(c_int) :: ndev
      integer(c_int),target,dimension(..) :: devlist
      !
      ncclCommInitAll_assumed_rank = ncclCommInitAll_(comm,ndev,c_loc(devlist))
    end function

#else
    function ncclCommInitAll_rank_0(comm,ndev,devlist)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommInitAll_rank_0
      type(c_ptr) :: comm(*)
      integer(c_int) :: ndev
      integer(c_int),target :: devlist
      !
      ncclCommInitAll_rank_0 = ncclCommInitAll_(comm,ndev,c_loc(devlist))
    end function

    function ncclCommInitAll_rank_1(comm,ndev,devlist)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommInitAll_rank_1
      type(c_ptr) :: comm(*)
      integer(c_int) :: ndev
      integer(c_int),target,dimension(:) :: devlist
      !
      ncclCommInitAll_rank_1 = ncclCommInitAll_(comm,ndev,c_loc(devlist))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function ncclCommShrink_assumed_rank(comm,excludeRanksList,excludeRanksCount,newcomm,config, &
        shrinkFlags)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommShrink_assumed_rank
      type(c_ptr), value :: comm
      integer(c_int),target,dimension(..) :: excludeRanksList
      integer(c_int) :: excludeRanksCount
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
      integer(c_int) :: shrinkFlags
      !
      ncclCommShrink_assumed_rank = ncclCommShrink_(comm,c_loc(excludeRanksList), &
        excludeRanksCount,newcomm,config,shrinkFlags)
    end function

#else
    function ncclCommShrink_rank_0(comm,excludeRanksList,excludeRanksCount,newcomm,config, &
        shrinkFlags)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommShrink_rank_0
      type(c_ptr), value :: comm
      integer(c_int),target :: excludeRanksList
      integer(c_int) :: excludeRanksCount
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
      integer(c_int) :: shrinkFlags
      !
      ncclCommShrink_rank_0 = ncclCommShrink_(comm,c_loc(excludeRanksList),excludeRanksCount, &
        newcomm,config,shrinkFlags)
    end function

    function ncclCommShrink_rank_1(comm,excludeRanksList,excludeRanksCount,newcomm,config, &
        shrinkFlags)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommShrink_rank_1
      type(c_ptr), value :: comm
      integer(c_int),target,dimension(:) :: excludeRanksList
      integer(c_int) :: excludeRanksCount
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
      integer(c_int) :: shrinkFlags
      !
      ncclCommShrink_rank_1 = ncclCommShrink_(comm,c_loc(excludeRanksList),excludeRanksCount, &
        newcomm,config,shrinkFlags)
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function ncclAlltoAllv_assumed_rank(sendbuff,sendcounts,sdispls,recvbuff,recvcounts,rdispls, &
        datatype,comm,stream)
      implicit none
      integer(kind(ncclSuccess)) :: ncclAlltoAllv_assumed_rank
      type(c_ptr), value :: sendbuff
      integer(c_size_t),target,dimension(..) :: sendcounts
      integer(c_size_t),target,dimension(..) :: sdispls
      type(c_ptr), value :: recvbuff
      integer(c_size_t),target,dimension(..) :: recvcounts
      integer(c_size_t),target,dimension(..) :: rdispls
      integer(kind(ncclInt8)) :: datatype
      type(c_ptr), value :: comm
      type(c_ptr), value :: stream
      !
      ncclAlltoAllv_assumed_rank = ncclAlltoAllv_(sendbuff,c_loc(sendcounts),c_loc(sdispls), &
        recvbuff,c_loc(recvcounts),c_loc(rdispls),datatype,comm,stream)
    end function

#else
    function ncclAlltoAllv_rank_0(sendbuff,sendcounts,sdispls,recvbuff,recvcounts,rdispls, &
        datatype,comm,stream)
      implicit none
      integer(kind(ncclSuccess)) :: ncclAlltoAllv_rank_0
      type(c_ptr), value :: sendbuff
      integer(c_size_t),target :: sendcounts
      integer(c_size_t),target :: sdispls
      type(c_ptr), value :: recvbuff
      integer(c_size_t),target :: recvcounts
      integer(c_size_t),target :: rdispls
      integer(kind(ncclInt8)) :: datatype
      type(c_ptr), value :: comm
      type(c_ptr), value :: stream
      !
      ncclAlltoAllv_rank_0 = ncclAlltoAllv_(sendbuff,c_loc(sendcounts),c_loc(sdispls),recvbuff, &
        c_loc(recvcounts),c_loc(rdispls),datatype,comm,stream)
    end function

    function ncclAlltoAllv_rank_1(sendbuff,sendcounts,sdispls,recvbuff,recvcounts,rdispls, &
        datatype,comm,stream)
      implicit none
      integer(kind(ncclSuccess)) :: ncclAlltoAllv_rank_1
      type(c_ptr), value :: sendbuff
      integer(c_size_t),target,dimension(:) :: sendcounts
      integer(c_size_t),target,dimension(:) :: sdispls
      type(c_ptr), value :: recvbuff
      integer(c_size_t),target,dimension(:) :: recvcounts
      integer(c_size_t),target,dimension(:) :: rdispls
      integer(kind(ncclInt8)) :: datatype
      type(c_ptr), value :: comm
      type(c_ptr), value :: stream
      !
      ncclAlltoAllv_rank_1 = ncclAlltoAllv_(sendbuff,c_loc(sendcounts),c_loc(sdispls),recvbuff, &
        c_loc(recvcounts),c_loc(rdispls),datatype,comm,stream)
    end function

#endif
#endif
end module rccl
