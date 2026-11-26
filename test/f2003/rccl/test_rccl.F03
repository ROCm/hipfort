!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (C) 2020-2026 Advanced Micro Devices, Inc. All rights reserved.
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

program test_rccl
  use iso_c_binding
  use hipfort_rccl
  use hipfort_rccl_enums
  use hipfort_rccl_types
  implicit none
  logical :: never
  type(c_ptr) :: v0
  integer(c_size_t) :: v1
  integer(c_int) :: v2
  type(ncclUniqueId) :: v3
  type(ncclConfig_t) :: v4
  type(c_ptr) :: v5(1)
  type(ncclCollConfig_t) :: v6
  type(ncclWaitSignalDesc_t) :: v7
  type(ncclSimInfo_t) :: v8
  type(ncclEncryptionConfig_t) :: v9

  ! Always .false., but not foldable by the compiler, so every guarded
  ! call is compiled and linked yet never run (no null-pointer segfaults).
  never = command_argument_count() > 1000000

    if (never) v2 = ncclMemAlloc_(v0, v1)
    if (never) v2 = ncclMemFree_(v0)
    if (never) v2 = ncclGetVersion_(v0)
    if (never) v2 = ncclGetUniqueId_(v3)
    if (never) v2 = ncclCommInitRankConfig_(v0, v2, v3, v2, v4)
    if (never) v2 = ncclCommInitRank_(v0, v2, v3, v2)
    if (never) v2 = ncclCommInitAll_(v5, v2, v0)
    if (never) v2 = ncclCommFinalize_(v0)
    if (never) v2 = ncclCommDestroy_(v0)
    if (never) v2 = ncclCommAbort_(v0)
    if (never) v2 = ncclCommRevoke_(v0, v2)
    if (never) v2 = ncclCommSplit_(v0, v2, v2, v0, v4)
    if (never) v2 = ncclCommShrink_(v0, v0, v2, v0, v4, v2)
    if (never) v2 = ncclCommGetUniqueId_(v0, v3)
    if (never) v2 = ncclCommGrow_(v0, v2, v3, v2, v0, v4)
    if (never) v2 = ncclCommInitRankScalable_(v0, v2, v2, v2, v3, v4)
    if (never) v0 = ncclGetErrorString_(v2)
    if (never) v0 = ncclGetLastError_(v0)
    if (never) call ncclResetDebugInit_()
    if (never) v2 = ncclCommGetAsyncError_(v0, v0)
    if (never) v2 = ncclCommCount_(v0, v0)
    if (never) v2 = ncclCommCuDevice_(v0, v0)
    if (never) v2 = ncclCommUserRank_(v0, v0)
    if (never) v2 = ncclCommRegister_(v0, v0, v1, v0)
    if (never) v2 = ncclCommDeregister_(v0, v0)
    if (never) v2 = ncclCommSuspend_(v0, v2)
    if (never) v2 = ncclCommResume_(v0)
    if (never) v2 = ncclCommMemStats_(v0, v2, v0)
    if (never) v2 = ncclCommWindowRegister_(v0, v0, v1, v0, v2)
    if (never) v2 = ncclCommWindowDeregister_(v0, v0)
    if (never) v2 = ncclWinGetUserPtr_(v0, v0, v0)
    if (never) v2 = ncclRedOpCreatePreMulSum_(v0, v0, v2, v2, v0)
    if (never) v2 = ncclRedOpDestroy_(v2, v0)
    if (never) v2 = ncclReduce_(v0, v0, v1, v2, v2, v2, v0, v0)
    if (never) v2 = ncclBcast_(v0, v1, v2, v2, v0, v0)
    if (never) v2 = ncclBroadcast_(v0, v0, v1, v2, v2, v0, v0)
    if (never) v2 = ncclAllReduce_(v0, v0, v1, v2, v2, v0, v0)
    if (never) v2 = ncclAllReduceWithBias_(v0, v0, v1, v2, v2, v0, v0, v0)
    if (never) v2 = ncclReduceScatter_(v0, v0, v1, v2, v2, v0, v0)
    if (never) v2 = ncclAllGather_(v0, v0, v1, v2, v0, v0)
    if (never) v2 = ncclAlltoAll_(v0, v0, v1, v2, v0, v0)
    if (never) v2 = ncclAlltoAllv_(v0, v0, v0, v0, v0, v0, v2, v0, v0)
    if (never) v2 = ncclGather_(v0, v0, v1, v2, v2, v0, v0)
    if (never) v2 = ncclScatter_(v0, v0, v1, v2, v2, v0, v0)
    if (never) v2 = ncclAllReduceConfig_(v0, v0, v1, v2, v2, v0, v0, v6)
    if (never) v2 = ncclBroadcastConfig_(v0, v0, v1, v2, v2, v0, v0, v6)
    if (never) v2 = ncclReduceConfig_(v0, v0, v1, v2, v2, v2, v0, v0, v6)
    if (never) v2 = ncclAllGatherConfig_(v0, v0, v1, v2, v0, v0, v6)
    if (never) v2 = ncclReduceScatterConfig_(v0, v0, v1, v2, v2, v0, v0, v6)
    if (never) v2 = ncclAlltoAllConfig_(v0, v0, v1, v2, v0, v0, v6)
    if (never) v2 = ncclGatherConfig_(v0, v0, v1, v2, v2, v0, v0, v6)
    if (never) v2 = ncclScatterConfig_(v0, v0, v1, v2, v2, v0, v0, v6)
    if (never) v2 = ncclSend_(v0, v1, v2, v2, v0, v0)
    if (never) v2 = ncclRecv_(v0, v1, v2, v2, v0, v0)
    if (never) v2 = ncclPutSignal_(v0, v1, v2, v2, v0, v1, v2, v2, v2, v0, v0)
    if (never) v2 = ncclSignal_(v2, v2, v2, v2, v0, v0)
    if (never) v2 = ncclWaitSignal_(v2, v7, v0, v0)
    if (never) v2 = ncclGroupStart_()
    if (never) v2 = ncclGroupEnd_()
    if (never) v2 = ncclGroupSimulateEnd_(v8)
    if (never) v2 = ncclSetEncryption_(v9)
    if (never) v2 = ncclParamBind_(v0, v0)
    if (never) v2 = ncclParamGetI8_(v0, v0)
    if (never) v2 = ncclParamGetI16_(v0, v0)
    if (never) v2 = ncclParamGetI32_(v0, v0)
    if (never) v2 = ncclParamGetI64_(v0, v0)
    if (never) v2 = ncclParamGetU8_(v0, v0)
    if (never) v2 = ncclParamGetU16_(v0, v0)
    if (never) v2 = ncclParamGetU32_(v0, v0)
    if (never) v2 = ncclParamGetU64_(v0, v0)
    if (never) v2 = ncclParamGetStr_(v0, v0)
    if (never) v2 = ncclParamGet_(v0, v0, v2, v0)
    if (never) v2 = ncclParamGetParameter_(v0, v0, v0)
    if (never) v2 = ncclParamGetAllParameterKeys_(v0, v0)
    if (never) call ncclParamDumpAll_()

  write(*,"(a)") "-- test_rccl (bind(C) symbols): PASSED (compile+link only)!"
end program test_rccl
