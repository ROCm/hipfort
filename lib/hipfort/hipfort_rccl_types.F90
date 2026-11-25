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

module hipfort_rccl_types
  use, intrinsic :: iso_c_binding
  implicit none

  type, bind(c) :: ncclUniqueId
    character(c_char) :: internal(128) !< Opaque array>
  end type ncclUniqueId

  type, bind(c) :: ncclConfig_t
    integer(c_size_t) :: size !< Should not be touched
    integer(c_int) :: magic !< Should not be touched
    integer(c_int) :: version !< Should not be touched
    integer(c_int) :: blocking !< Whether or not calls should block or not
    integer(c_int) :: cgaClusterSize !< Cooperative group array cluster size
    integer(c_int) :: minCTAs !< Minimum number of cooperative thread arrays (blocks)
    integer(c_int) :: maxCTAs !< Maximum number of cooperative thread arrays (blocks)
    type(c_ptr) :: netName !< Force NCCL to use a specfic network
    integer(c_int) :: splitShare !< Allow communicators to share resources
    integer(c_int) :: trafficClass !< Traffic class
    type(c_ptr) :: commName !< Name of the communicator
    integer(c_int) :: collnetEnable !< Check for collnet enablement
    integer(c_int) :: CTAPolicy !< CTA Policy
    integer(c_int) :: shrinkShare !< Shrink size
    integer(c_int) :: nvlsCTAs !< Number of NVLS cooperative thread arrays (blocks)
    integer(c_int) :: nChannelsPerNetPeer !< Number of channels per NET peer
    integer(c_int) :: nvlinkCentricSched !< nvlinkCentricSched
    integer(c_int) :: graphUsageMode !< CUDA Graph usage mode hint
    integer(c_int) :: numRmaCtx !< Number of RMA contexts
    integer(c_int) :: maxP2pPeers !< Maximum number of P2P peers
    integer(c_int) :: graphStreamOrdering !< CUDA Graph stream ordering mode
    integer(c_int) :: launchOrderImplicit !< Implicit launch order between communicators
    integer(c_int) :: numRmaSig !< Number of RMA signals
    integer(c_int) :: rmaEagerInit !< Eagerly initialize RMA resources
    integer(c_int) :: hostCftMode !< Host collective fault tolerance mode, see ncclHostCftMode_t
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

end module hipfort_rccl_types
