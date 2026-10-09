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

program test_hip
  use iso_c_binding
  use hipfort
#ifdef USE_CUDA_NAMES
  use hipfort_cuda_errors
#endif
  use hipfort_enums
  use hipfort_types
  use hipfort_hipmalloc
  use hipfort_hipmemcpy
  use hipfort_hiphostregister
  use hipfort_auxiliary
  implicit none
  logical :: never
  integer(c_int) :: v0
  type(hipChannelFormatDesc) :: v1
  type(c_ptr) :: v2
  type(hipUUID) :: v3
  integer(c_size_t) :: v4
  type(hipDeviceProp_t) :: v5
  type(hipIpcMemHandle_t) :: v6
  type(hipIpcEventHandle_t) :: v7
  integer(c_int32_t) :: v8
  type(c_funptr) :: v9
  integer(c_int64_t) :: v10
  type(hipBatchMemOpNodeParams) :: v11
  type(hipPointerAttribute_t) :: v12
  type(hipExternalSemaphoreHandleDesc) :: v13
  type(hipExternalSemaphoreSignalParams) :: v14
  type(hipExternalSemaphoreWaitParams) :: v15
  type(hipExternalMemoryHandleDesc) :: v16
  type(hipExternalMemoryBufferDesc) :: v17
  type(hipMemLocation) :: v18
  type(hipMemAccessDesc) :: v19
  type(hipMemPoolProps) :: v20
  type(hipMemPoolPtrExportData) :: v21
  character(c_char) :: v22
  integer(c_short) :: v23
  type(hipPitchedPtr) :: v24
  type(hipExtent) :: v25
  type(HIP_ARRAY_DESCRIPTOR) :: v26
  type(HIP_ARRAY3D_DESCRIPTOR) :: v27
  type(hip_Memcpy2D) :: v28
  type(hipMemcpy3DParms) :: v29
  type(HIP_MEMCPY3D) :: v30
  type(hipMemcpyAttributes) :: v31
  type(hipMemcpy3DBatchOp) :: v32
  type(hipMemcpy3DPeerParms) :: v33
  type(hipFuncAttributes) :: v34
  type(hipFunctionLaunchParams) :: v35
  type(dim3) :: v36
  type(hipLaunchParams) :: v37
  type(hipLaunchConfig_t) :: v38
  type(HIP_LAUNCH_CONFIG) :: v39
  type(hipResourceDesc) :: v40
  type(hipTextureDesc) :: v41
  type(hipResourceViewDesc) :: v42
  type(HIP_RESOURCE_DESC) :: v43
  type(HIP_TEXTURE_DESC) :: v44
  type(HIP_RESOURCE_VIEW_DESC) :: v45
  type(textureReference) :: v46
  real(c_float) :: v47
  type(hipMipmappedArray) :: v48
  type(hipGraphEdgeData) :: v49
  type(hipGraphInstantiateParams) :: v50
  type(hipGraphNodeParams) :: v51
  type(hipKernelNodeParams) :: v52
  type(hipMemsetParams) :: v53
  type(hipHostNodeParams) :: v54
  type(hipMemAllocNodeParams) :: v55
  type(hipExternalSemaphoreWaitNodeParams) :: v56
  type(hipExternalSemaphoreSignalNodeParams) :: v57
  type(hipMemAllocationProp) :: v58
  type(hipArrayMapInfo) :: v59

  ! Always .false., but not foldable by the compiler, so every guarded
  ! call is compiled and linked yet never run (no null-pointer segfaults).
  never = command_argument_count() > 1000000

    if (never) v1 = hipCreateChannelDesc_(v0, v0, v0, v0, v0)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipInit_(v0)
#endif
    if (never) v0 = hipDriverGetVersion_(v2)
    if (never) v0 = hipRuntimeGetVersion_(v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipDeviceGet_(v2, v0)
    if (never) v0 = hipDeviceComputeCapability_(v2, v2, v0)
    if (never) v0 = hipDeviceGetName_(v2, v0, v0)
#endif
    if (never) v0 = hipDeviceGetUuid_(v3, v0)
    if (never) v0 = hipDeviceGetLuid_(v2, v2, v0)
    if (never) v0 = hipDeviceGetP2PAttribute_(v2, v0, v0, v0)
    if (never) v0 = hipDeviceGetPCIBusId_(v2, v0, v0)
    if (never) v0 = hipDeviceGetByPCIBusId_(v2, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipDeviceTotalMem_(v2, v0)
#endif
    if (never) v0 = hipDeviceSynchronize_()
    if (never) v0 = hipDeviceReset_()
    if (never) v0 = hipSetDevice_(v0)
    if (never) v0 = hipSetValidDevices_(v2, v0)
    if (never) v0 = hipGetDevice_(v2)
    if (never) v0 = hipGetDeviceCount_(v2)
    if (never) v0 = hipDeviceGetAttribute_(v2, v0, v0)
    if (never) v0 = hipDeviceGetDefaultMemPool_(v2, v0)
    if (never) v0 = hipDeviceSetMemPool_(v0, v2)
    if (never) v0 = hipDeviceGetMemPool_(v2, v0)
    if (never) v0 = hipDeviceGetTexture1DLinearMaxWidth_(v2, v1, v0)
    if (never) v0 = hipDeviceSetCacheConfig_(v0)
    if (never) v0 = hipDeviceGetCacheConfig_(v2)
    if (never) v0 = hipDeviceGetLimit_(v2, v0)
    if (never) v0 = hipDeviceSetLimit_(v0, v4)
    if (never) v0 = hipDeviceGetSharedMemConfig_(v2)
    if (never) v0 = hipGetDeviceFlags_(v2)
    if (never) v0 = hipDeviceSetSharedMemConfig_(v0)
    if (never) v0 = hipSetDeviceFlags_(v0)
    if (never) v0 = hipInitDevice_(v0, v0, v0)
    if (never) v0 = hipChooseDeviceR0600_(v2, v5)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipExtGetLinkTypeAndHopCount_(v0, v0, v2, v2)
#endif
    if (never) v0 = hipIpcGetMemHandle_(v6, v2)
    if (never) v0 = hipIpcOpenMemHandle_(v2, v6, v0)
    if (never) v0 = hipIpcCloseMemHandle_(v2)
    if (never) v0 = hipIpcGetEventHandle_(v7, v2)
    if (never) v0 = hipIpcOpenEventHandle_(v2, v7)
    if (never) v0 = hipFuncSetAttribute_(v2, v0, v0)
    if (never) v0 = hipFuncSetCacheConfig_(v2, v0)
    if (never) v0 = hipFuncSetSharedMemConfig_(v2, v0)
    if (never) v0 = hipGetLastError_()
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipExtGetLastError_()
#endif
    if (never) v0 = hipPeekAtLastError_()
    if (never) v2 = hipGetErrorName_(v0)
    if (never) v2 = hipGetErrorString_(v0)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipDrvGetErrorName_(v0, v2)
    if (never) v0 = hipDrvGetErrorString_(v0, v2)
#endif
    if (never) v0 = hipStreamCreate_(v2)
    if (never) v0 = hipStreamCreateWithFlags_(v2, v0)
    if (never) v0 = hipStreamCreateWithPriority_(v2, v0, v0)
    if (never) v0 = hipDeviceGetStreamPriorityRange_(v2, v2)
    if (never) v0 = hipStreamDestroy_(v2)
    if (never) v0 = hipStreamQuery_(v2)
    if (never) v0 = hipStreamSynchronize_(v2)
    if (never) v0 = hipStreamWaitEvent_(v2, v2, v0)
    if (never) v0 = hipStreamGetFlags_(v2, v2)
    if (never) v0 = hipStreamGetId_(v2, v2)
    if (never) v0 = hipStreamGetPriority_(v2, v2)
    if (never) v0 = hipStreamGetDevice_(v2, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipExtStreamCreateWithCUMask_(v2, v8, v2)
    if (never) v0 = hipExtStreamGetCUMask_(v2, v8, v2)
#endif
    if (never) v0 = hipStreamAddCallback_(v2, v9, v2, v0)
    if (never) v0 = hipStreamSetAttribute_(v2, v0, v2)
    if (never) v0 = hipStreamGetAttribute_(v2, v0, v2)
    if (never) v0 = hipStreamCopyAttributes_(v2, v2)
    if (never) v0 = hipStreamWaitValue32_(v2, v2, v8, v0, v8)
    if (never) v0 = hipStreamWaitValue64_(v2, v2, v10, v0, v10)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipStreamWriteValue32_(v2, v2, v8, v0)
    if (never) v0 = hipStreamWriteValue64_(v2, v2, v10, v0)
#endif
    if (never) v0 = hipStreamBatchMemOp_(v2, v0, v2, v0)
    if (never) v0 = hipGraphAddBatchMemOpNode_(v2, v2, v2, v4, v11)
    if (never) v0 = hipGraphBatchMemOpNodeGetParams_(v2, v11)
    if (never) v0 = hipGraphBatchMemOpNodeSetParams_(v2, v11)
    if (never) v0 = hipGraphExecBatchMemOpNodeSetParams_(v2, v2, v11)
    if (never) v0 = hipEventCreateWithFlags_(v2, v0)
    if (never) v0 = hipEventCreate_(v2)
    if (never) v0 = hipEventRecordWithFlags_(v2, v2, v0)
    if (never) v0 = hipEventRecord_(v2, v2)
    if (never) v0 = hipEventDestroy_(v2)
    if (never) v0 = hipEventSynchronize_(v2)
    if (never) v0 = hipEventElapsedTime_(v2, v2, v2)
    if (never) v0 = hipEventQuery_(v2)
    if (never) v0 = hipPointerSetAttribute_(v2, v0, v2)
    if (never) v0 = hipPointerGetAttributes_(v12, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipPointerGetAttribute_(v2, v0, v2)
    if (never) v0 = hipDrvPointerGetAttributes_(v0, v2, v2, v2)
#endif
    if (never) v0 = hipImportExternalSemaphore_(v2, v13)
    if (never) v0 = hipSignalExternalSemaphoresAsync_(v2, v14, v0, v2)
    if (never) v0 = hipWaitExternalSemaphoresAsync_(v2, v15, v0, v2)
    if (never) v0 = hipDestroyExternalSemaphore_(v2)
    if (never) v0 = hipImportExternalMemory_(v2, v16)
    if (never) v0 = hipExternalMemoryGetMappedBuffer_(v2, v2, v17)
    if (never) v0 = hipDestroyExternalMemory_(v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipExtMallocWithFlags_(v2, v4, v0)
#endif
    if (never) v0 = hipMallocHost_(v2, v4)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipMemAllocHost_(v2, v4)
    if (never) v0 = hipMemPrefetchAsync_(v2, v4, v0, v2)
#endif
    if (never) v0 = hipMemPrefetchAsync_v2_(v2, v4, v18, v0, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipMemAdvise_(v2, v4, v0, v0)
#endif
    if (never) v0 = hipMemAdvise_v2_(v2, v4, v0, v18)
    if (never) v0 = hipMemRangeGetAttribute_(v2, v4, v0, v2, v4)
    if (never) v0 = hipMemRangeGetAttributes_(v2, v2, v2, v4, v2, v4)
    if (never) v0 = hipStreamAttachMemAsync_(v2, v2, v4, v0)
    if (never) v0 = hipMallocAsync_(v2, v4, v2)
    if (never) v0 = hipFreeAsync_(v2, v2)
    if (never) v0 = hipMemPoolTrimTo_(v2, v4)
    if (never) v0 = hipMemPoolSetAttribute_(v2, v0, v2)
    if (never) v0 = hipMemPoolGetAttribute_(v2, v0, v2)
    if (never) v0 = hipMemPoolSetAccess_(v2, v19, v4)
    if (never) v0 = hipMemPoolGetAccess_(v2, v2, v18)
    if (never) v0 = hipMemPoolCreate_(v2, v20)
    if (never) v0 = hipMemPoolDestroy_(v2)
    if (never) v0 = hipMallocFromPoolAsync_(v2, v4, v2, v2)
    if (never) v0 = hipMemPoolExportToShareableHandle_(v2, v2, v0, v0)
    if (never) v0 = hipMemPoolImportFromShareableHandle_(v2, v2, v0, v0)
    if (never) v0 = hipMemPoolExportPointer_(v21, v2)
    if (never) v0 = hipMemPoolImportPointer_(v2, v2, v21)
    if (never) v0 = hipHostAlloc_(v2, v4, v0)
    if (never) v0 = hipMallocPitch_(v2, v2, v4, v4)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipMemAllocPitch_(v2, v2, v4, v4, v0)
#endif
    if (never) v0 = hipFreeHost_(v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipMemcpyWithStream_(v2, v2, v4, v0, v2)
    if (never) v0 = hipMemcpyHtoD_(v2, v2, v4)
    if (never) v0 = hipMemcpyDtoH_(v2, v2, v4)
    if (never) v0 = hipMemcpyDtoD_(v2, v2, v4)
#endif
    if (never) v0 = hipMemcpyAtoD_(v2, v2, v4, v4)
    if (never) v0 = hipMemcpyDtoA_(v2, v4, v2, v4)
    if (never) v0 = hipMemcpyAtoA_(v2, v4, v2, v4, v4)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipMemcpyHtoDAsync_(v2, v2, v4, v2)
    if (never) v0 = hipMemcpyDtoHAsync_(v2, v2, v4, v2)
    if (never) v0 = hipMemcpyDtoDAsync_(v2, v2, v4, v2)
#endif
    if (never) v0 = hipMemcpyAtoHAsync_(v2, v2, v4, v4, v2)
    if (never) v0 = hipMemcpyHtoAAsync_(v2, v4, v2, v4, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipModuleGetGlobal_(v2, v2, v2, v2)
#endif
    if (never) v0 = hipGetSymbolAddress_(v2, v2)
    if (never) v0 = hipGetSymbolSize_(v2, v2)
    if (never) v0 = hipGetProcAddress_(v2, v2, v0, v10, v2)
    if (never) v0 = hipMemcpyToSymbol_(v2, v2, v4, v4, v0)
    if (never) v0 = hipMemcpyToSymbolAsync_(v2, v2, v4, v4, v0, v2)
    if (never) v0 = hipMemcpyFromSymbol_(v2, v2, v4, v4, v0)
    if (never) v0 = hipMemcpyFromSymbolAsync_(v2, v2, v4, v4, v0, v2)
    if (never) v0 = hipMemset_(v2, v0, v4)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipMemsetD8_(v2, v22, v4)
    if (never) v0 = hipMemsetD8Async_(v2, v22, v4, v2)
    if (never) v0 = hipMemsetD16_(v2, v23, v4)
    if (never) v0 = hipMemsetD16Async_(v2, v23, v4, v2)
    if (never) v0 = hipMemsetD32_(v2, v0, v4)
#endif
    if (never) v0 = hipMemsetAsync_(v2, v0, v4, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipMemsetD32Async_(v2, v0, v4, v2)
#endif
    if (never) v0 = hipMemset2D_(v2, v4, v0, v4, v4)
    if (never) v0 = hipMemset2DAsync_(v2, v4, v0, v4, v4, v2)
    if (never) v0 = hipMemset3D_(v24, v0, v25)
    if (never) v0 = hipMemset3DAsync_(v24, v0, v25, v2)
    if (never) v0 = hipMemsetD2D8_(v2, v4, v22, v4, v4)
    if (never) v0 = hipMemsetD2D8Async_(v2, v4, v22, v4, v4, v2)
    if (never) v0 = hipMemsetD2D16_(v2, v4, v23, v4, v4)
    if (never) v0 = hipMemsetD2D16Async_(v2, v4, v23, v4, v4, v2)
    if (never) v0 = hipMemsetD2D32_(v2, v4, v0, v4, v4)
    if (never) v0 = hipMemsetD2D32Async_(v2, v4, v0, v4, v4, v2)
    if (never) v0 = hipMemGetInfo_(v2, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipMemPtrGetInfo_(v2, v2)
#endif
    if (never) v0 = hipMallocArray_(v2, v1, v4, v4, v0)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipArrayCreate_(v2, v26)
    if (never) v0 = hipArrayDestroy_(v2)
    if (never) v0 = hipArray3DCreate_(v2, v27)
#endif
    if (never) v0 = hipMalloc3D_(v24, v25)
    if (never) v0 = hipFreeArray_(v2)
    if (never) v0 = hipMalloc3DArray_(v2, v1, v25, v0)
    if (never) v0 = hipArrayGetInfo_(v1, v25, v2, v2)
    if (never) v0 = hipArrayGetDescriptor_(v26, v2)
    if (never) v0 = hipArray3DGetDescriptor_(v27, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipMemcpyParam2D_(v28)
    if (never) v0 = hipMemcpyParam2DAsync_(v28, v2)
#endif
    if (never) v0 = hipMemcpy2DToArray_(v2, v4, v4, v2, v4, v4, v4, v0)
    if (never) v0 = hipMemcpy2DToArrayAsync_(v2, v4, v4, v2, v4, v4, v4, v0, v2)
    if (never) v0 = hipMemcpy2DArrayToArray_(v2, v4, v4, v2, v4, v4, v4, v4, v0)
    if (never) v0 = hipMemcpyToArray_(v2, v4, v4, v2, v4, v0)
    if (never) v0 = hipMemcpyFromArray_(v2, v2, v4, v4, v4, v0)
    if (never) v0 = hipMemcpy2DFromArray_(v2, v4, v2, v4, v4, v4, v4, v0)
    if (never) v0 = hipMemcpy2DFromArrayAsync_(v2, v4, v2, v4, v4, v4, v4, v0, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipMemcpyAtoH_(v2, v2, v4, v4)
    if (never) v0 = hipMemcpyHtoA_(v2, v4, v2, v4)
#endif
    if (never) v0 = hipMemcpy3D_(v29)
    if (never) v0 = hipMemcpy3DAsync_(v29, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipDrvMemcpy3D_(v30)
    if (never) v0 = hipDrvMemcpy3DAsync_(v30, v2)
    if (never) v0 = hipMemGetAddressRange_(v2, v2, v2)
#endif
    if (never) v0 = hipMemcpyBatchAsync_(v2, v2, v2, v4, v31, v2, v4, v2, v2)
    if (never) v0 = hipMemcpy3DBatchAsync_(v4, v32, v2, v10, v2)
    if (never) v0 = hipMemcpy3DPeer_(v33)
    if (never) v0 = hipMemcpy3DPeerAsync_(v33, v2)
    if (never) v0 = hipDeviceCanAccessPeer_(v2, v0, v0)
    if (never) v0 = hipDeviceEnablePeerAccess_(v0, v0)
    if (never) v0 = hipDeviceDisablePeerAccess_(v0)
    if (never) v0 = hipMemcpyPeer_(v2, v0, v2, v0, v4)
    if (never) v0 = hipMemcpyPeerAsync_(v2, v0, v2, v0, v4, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipCtxCreate_(v2, v0, v0)
    if (never) v0 = hipCtxDestroy_(v2)
    if (never) v0 = hipCtxPopCurrent_(v2)
    if (never) v0 = hipCtxPushCurrent_(v2)
    if (never) v0 = hipCtxSetCurrent_(v2)
    if (never) v0 = hipCtxGetCurrent_(v2)
    if (never) v0 = hipCtxGetDevice_(v2)
    if (never) v0 = hipCtxGetApiVersion_(v2, v2)
    if (never) v0 = hipCtxGetCacheConfig_(v2)
    if (never) v0 = hipCtxSetCacheConfig_(v0)
    if (never) v0 = hipCtxSetSharedMemConfig_(v0)
    if (never) v0 = hipCtxGetSharedMemConfig_(v2)
    if (never) v0 = hipCtxSynchronize_()
    if (never) v0 = hipCtxGetFlags_(v2)
    if (never) v0 = hipCtxEnablePeerAccess_(v2, v0)
    if (never) v0 = hipCtxDisablePeerAccess_(v2)
    if (never) v0 = hipDevicePrimaryCtxGetState_(v0, v2, v2)
    if (never) v0 = hipDevicePrimaryCtxRelease_(v0)
    if (never) v0 = hipDevicePrimaryCtxRetain_(v2, v0)
    if (never) v0 = hipDevicePrimaryCtxReset_(v0)
    if (never) v0 = hipDevicePrimaryCtxSetFlags_(v0, v0)
#endif
    if (never) v0 = hipModuleLoadFatBinary_(v2, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipModuleLoad_(v2, v2)
    if (never) v0 = hipModuleUnload_(v2)
    if (never) v0 = hipModuleGetFunction_(v2, v2, v2)
#endif
    if (never) v0 = hipModuleGetFunctionCount_(v2, v2)
    if (never) v0 = hipLibraryLoadData_(v2, v2, v2, v2, v0, v2, v2, v0)
    if (never) v0 = hipLibraryLoadFromFile_(v2, v2, v2, v2, v0, v2, v2, v0)
    if (never) v0 = hipLibraryUnload_(v2)
    if (never) v0 = hipLibraryGetKernel_(v2, v2, v2)
    if (never) v0 = hipLibraryGetKernelCount_(v2, v2)
    if (never) v0 = hipLibraryEnumerateKernels_(v2, v0, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipKernelGetLibrary_(v2, v2)
    if (never) v0 = hipKernelGetName_(v2, v2)
#endif
    if (never) v0 = hipFuncGetAttributes_(v34, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipFuncGetAttribute_(v2, v0, v2)
#endif
    if (never) v0 = hipGetFuncBySymbol_(v2, v2)
    if (never) v0 = hipGetDriverEntryPoint_(v2, v2, v10, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipModuleGetTexRef_(v2, v2, v2)
    if (never) v0 = hipModuleLoadData_(v2, v2)
    if (never) v0 = hipModuleLoadDataEx_(v2, v2, v0, v2, v2)
#endif
    if (never) v0 = hipLinkAddData_(v2, v0, v2, v4, v2, v0, v2, v2)
    if (never) v0 = hipLinkAddFile_(v2, v0, v2, v0, v2, v2)
    if (never) v0 = hipLinkComplete_(v2, v2, v2)
    if (never) v0 = hipLinkCreate_(v0, v2, v2, v2)
    if (never) v0 = hipLinkDestroy_(v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipModuleLaunchKernel_(v2, v0, v0, v0, v0, v0, v0, v0, v2, v2, v2)
    if (never) v0 = hipModuleLaunchCooperativeKernel_(v2, v0, v0, v0, v0, v0, v0, v0, v2, v2)
    if (never) v0 = hipModuleLaunchCooperativeKernelMultiDevice_(v35, v0, v0)
#endif
    if (never) v0 = hipLaunchCooperativeKernel_(v2, v36, v36, v2, v0, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipLaunchCooperativeKernelMultiDevice_(v37, v0, v0)
    if (never) v0 = hipExtLaunchMultiKernelMultiDevice_(v37, v0, v0)
#endif
    if (never) v0 = hipLaunchKernelExC_(v38, v2, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipDrvLaunchKernelEx_(v39, v2, v2, v2)
#endif
    if (never) v0 = hipMemGetHandleForAddressRange_(v2, v2, v4, v0, v10)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipModuleOccupancyMaxPotentialBlockSize_(v2, v2, v2, v4, v0)
    if (never) v0 = hipModuleOccupancyMaxPotentialBlockSizeWithFlags_(v2, v2, v2, v4, v0, v0)
    if (never) v0 = hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_(v2, v2, v0, v4)
    if (never) v0 = hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_(v2, v2, v0, v4, v0)
#endif
    if (never) v0 = hipOccupancyMaxActiveBlocksPerMultiprocessor_(v2, v9, v0, v4)
    if (never) v0 = hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_(v2, v9, v0, v4, v0)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipOccupancyMaxPotentialBlockSize_(v2, v2, v9, v4, v0)
#endif
    if (never) v0 = hipOccupancyAvailableDynamicSMemPerBlock_(v2, v9, v0, v0)
    if (never) v0 = hipProfilerStart_()
    if (never) v0 = hipProfilerStop_()
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipConfigureCall_(v36, v36, v4, v2)
    if (never) v0 = hipSetupArgument_(v2, v4, v4)
    if (never) v0 = hipLaunchByPtr_(v2)
#endif
    if (never) v0 = hipLaunchKernel_(v2, v36, v36, v2, v4, v2)
    if (never) v0 = hipLaunchHostFunc_(v2, v9, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipDrvMemcpy2DUnaligned_(v28)
    if (never) v0 = hipExtLaunchKernel_(v2, v36, v36, v2, v4, v2, v2, v2, v0)
#endif
    if (never) v0 = hipCreateTextureObject_(v2, v40, v41, v42)
    if (never) v0 = hipDestroyTextureObject_(v2)
    if (never) v0 = hipGetChannelDesc_(v1, v2)
    if (never) v0 = hipGetTextureObjectResourceDesc_(v40, v2)
    if (never) v0 = hipGetTextureObjectResourceViewDesc_(v42, v2)
    if (never) v0 = hipGetTextureObjectTextureDesc_(v41, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipTexObjectCreate_(v2, v43, v44, v45)
    if (never) v0 = hipTexObjectDestroy_(v2)
    if (never) v0 = hipTexObjectGetResourceDesc_(v43, v2)
    if (never) v0 = hipTexObjectGetResourceViewDesc_(v45, v2)
    if (never) v0 = hipTexObjectGetTextureDesc_(v44, v2)
#endif
    if (never) v0 = hipMallocMipmappedArray_(v2, v1, v25, v0, v0)
    if (never) v0 = hipFreeMipmappedArray_(v2)
    if (never) v0 = hipGetMipmappedArrayLevel_(v2, v2, v0)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipMipmappedArrayCreate_(v2, v27, v0)
    if (never) v0 = hipMipmappedArrayDestroy_(v2)
    if (never) v0 = hipMipmappedArrayGetLevel_(v2, v2, v0)
    if (never) v0 = hipBindTextureToMipmappedArray_(v46, v2, v1)
    if (never) v0 = hipGetTextureReference_(v2, v2)
#endif
    if (never) v0 = hipTexRefGetBorderColor_(v2, v46)
    if (never) v0 = hipTexRefGetArray_(v2, v46)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipTexRefSetAddressMode_(v46, v0, v0)
    if (never) v0 = hipTexRefSetArray_(v46, v2, v0)
    if (never) v0 = hipTexRefSetFilterMode_(v46, v0)
    if (never) v0 = hipTexRefSetFlags_(v46, v0)
    if (never) v0 = hipTexRefSetFormat_(v46, v0, v0)
    if (never) v0 = hipBindTexture_(v2, v46, v2, v1, v4)
    if (never) v0 = hipBindTexture2D_(v2, v46, v2, v1, v4, v4, v4)
    if (never) v0 = hipBindTextureToArray_(v46, v2, v1)
    if (never) v0 = hipGetTextureAlignmentOffset_(v2, v46)
    if (never) v0 = hipUnbindTexture_(v46)
    if (never) v0 = hipTexRefGetAddress_(v2, v46)
    if (never) v0 = hipTexRefGetAddressMode_(v2, v46, v0)
    if (never) v0 = hipTexRefGetFilterMode_(v2, v46)
    if (never) v0 = hipTexRefGetFlags_(v2, v46)
    if (never) v0 = hipTexRefGetFormat_(v2, v2, v46)
    if (never) v0 = hipTexRefGetMaxAnisotropy_(v2, v46)
    if (never) v0 = hipTexRefGetMipmapFilterMode_(v2, v46)
    if (never) v0 = hipTexRefGetMipmapLevelBias_(v2, v46)
    if (never) v0 = hipTexRefGetMipmapLevelClamp_(v2, v2, v46)
    if (never) v0 = hipTexRefGetMipMappedArray_(v2, v46)
    if (never) v0 = hipTexRefSetAddress_(v2, v46, v2, v4)
    if (never) v0 = hipTexRefSetAddress2D_(v46, v26, v2, v4)
    if (never) v0 = hipTexRefSetMaxAnisotropy_(v46, v0)
    if (never) v0 = hipTexRefSetBorderColor_(v46, v2)
    if (never) v0 = hipTexRefSetMipmapFilterMode_(v46, v0)
    if (never) v0 = hipTexRefSetMipmapLevelBias_(v46, v47)
    if (never) v0 = hipTexRefSetMipmapLevelClamp_(v46, v47, v47)
    if (never) v0 = hipTexRefSetMipmappedArray_(v46, v48, v0)
    if (never) v2 = hipApiName_(v8)
    if (never) v2 = hipKernelNameRef_(v2)
    if (never) v2 = hipKernelNameRefByPtr_(v2, v2)
    if (never) v0 = hipGetStreamDeviceId_(v2)
#endif
    if (never) v0 = hipStreamBeginCapture_(v2, v0)
    if (never) v0 = hipStreamBeginCaptureToGraph_(v2, v2, v2, v49, v4, v0)
    if (never) v0 = hipStreamEndCapture_(v2, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipStreamGetCaptureInfo_(v2, v2, v2)
    if (never) v0 = hipStreamGetCaptureInfo_v2_(v2, v2, v2, v2, v2, v2)
#endif
    if (never) v0 = hipStreamIsCapturing_(v2, v2)
    if (never) v0 = hipStreamUpdateCaptureDependencies_(v2, v2, v4, v0)
    if (never) v0 = hipThreadExchangeStreamCaptureMode_(v2)
    if (never) v0 = hipGraphCreate_(v2, v0)
    if (never) v0 = hipGraphDestroy_(v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipGraphAddDependencies_(v2, v2, v2, v4)
    if (never) v0 = hipGraphRemoveDependencies_(v2, v2, v2, v4)
    if (never) v0 = hipGraphGetEdges_(v2, v2, v2, v2)
#endif
    if (never) v0 = hipGraphGetNodes_(v2, v2, v2)
    if (never) v0 = hipGraphGetRootNodes_(v2, v2, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipGraphNodeGetDependencies_(v2, v2, v2)
    if (never) v0 = hipGraphNodeGetDependentNodes_(v2, v2, v2)
#endif
    if (never) v0 = hipGraphNodeGetType_(v2, v2)
    if (never) v0 = hipGraphDestroyNode_(v2)
    if (never) v0 = hipGraphClone_(v2, v2)
    if (never) v0 = hipGraphNodeFindInClone_(v2, v2, v2)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipGraphInstantiate_(v2, v2, v2, v2, v4)
#endif
    if (never) v0 = hipGraphInstantiateWithFlags_(v2, v2, v10)
    if (never) v0 = hipGraphInstantiateWithParams_(v2, v2, v50)
    if (never) v0 = hipGraphLaunch_(v2, v2)
    if (never) v0 = hipGraphUpload_(v2, v2)
    if (never) v0 = hipGraphAddNode_(v2, v2, v2, v4, v51)
    if (never) v0 = hipGraphExecGetFlags_(v2, v2)
    if (never) v0 = hipGraphNodeSetParams_(v2, v51)
    if (never) v0 = hipGraphExecNodeSetParams_(v2, v2, v51)
    if (never) v0 = hipGraphExecDestroy_(v2)
    if (never) v0 = hipGraphExecUpdate_(v2, v2, v2, v2)
    if (never) v0 = hipGraphAddKernelNode_(v2, v2, v2, v4, v52)
    if (never) v0 = hipGraphKernelNodeGetParams_(v2, v52)
    if (never) v0 = hipGraphKernelNodeSetParams_(v2, v52)
    if (never) v0 = hipGraphExecKernelNodeSetParams_(v2, v2, v52)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipDrvGraphAddMemcpyNode_(v2, v2, v2, v4, v30, v2)
#endif
    if (never) v0 = hipGraphAddMemcpyNode_(v2, v2, v2, v4, v29)
    if (never) v0 = hipGraphMemcpyNodeGetParams_(v2, v29)
    if (never) v0 = hipGraphMemcpyNodeSetParams_(v2, v29)
    if (never) v0 = hipGraphKernelNodeSetAttribute_(v2, v0, v2)
    if (never) v0 = hipGraphKernelNodeGetAttribute_(v2, v0, v2)
    if (never) v0 = hipGraphExecMemcpyNodeSetParams_(v2, v2, v29)
    if (never) v0 = hipGraphAddMemcpyNode1D_(v2, v2, v2, v4, v2, v2, v4, v0)
    if (never) v0 = hipGraphMemcpyNodeSetParams1D_(v2, v2, v2, v4, v0)
    if (never) v0 = hipGraphExecMemcpyNodeSetParams1D_(v2, v2, v2, v2, v4, v0)
    if (never) v0 = hipGraphAddMemcpyNodeFromSymbol_(v2, v2, v2, v4, v2, v2, v4, v4, v0)
    if (never) v0 = hipGraphMemcpyNodeSetParamsFromSymbol_(v2, v2, v2, v4, v4, v0)
    if (never) v0 = hipGraphExecMemcpyNodeSetParamsFromSymbol_(v2, v2, v2, v2, v4, v4, v0)
    if (never) v0 = hipGraphAddMemcpyNodeToSymbol_(v2, v2, v2, v4, v2, v2, v4, v4, v0)
    if (never) v0 = hipGraphMemcpyNodeSetParamsToSymbol_(v2, v2, v2, v4, v4, v0)
    if (never) v0 = hipGraphExecMemcpyNodeSetParamsToSymbol_(v2, v2, v2, v2, v4, v4, v0)
    if (never) v0 = hipGraphAddMemsetNode_(v2, v2, v2, v4, v53)
    if (never) v0 = hipGraphMemsetNodeGetParams_(v2, v53)
    if (never) v0 = hipGraphMemsetNodeSetParams_(v2, v53)
    if (never) v0 = hipGraphExecMemsetNodeSetParams_(v2, v2, v53)
    if (never) v0 = hipGraphAddHostNode_(v2, v2, v2, v4, v54)
    if (never) v0 = hipGraphHostNodeGetParams_(v2, v54)
    if (never) v0 = hipGraphHostNodeSetParams_(v2, v54)
    if (never) v0 = hipGraphExecHostNodeSetParams_(v2, v2, v54)
    if (never) v0 = hipGraphAddChildGraphNode_(v2, v2, v2, v4, v2)
    if (never) v0 = hipGraphChildGraphNodeGetGraph_(v2, v2)
    if (never) v0 = hipGraphExecChildGraphNodeSetParams_(v2, v2, v2)
    if (never) v0 = hipGraphAddEmptyNode_(v2, v2, v2, v4)
    if (never) v0 = hipGraphAddEventRecordNode_(v2, v2, v2, v4, v2)
    if (never) v0 = hipGraphEventRecordNodeGetEvent_(v2, v2)
    if (never) v0 = hipGraphEventRecordNodeSetEvent_(v2, v2)
    if (never) v0 = hipGraphExecEventRecordNodeSetEvent_(v2, v2, v2)
    if (never) v0 = hipGraphAddEventWaitNode_(v2, v2, v2, v4, v2)
    if (never) v0 = hipGraphEventWaitNodeGetEvent_(v2, v2)
    if (never) v0 = hipGraphEventWaitNodeSetEvent_(v2, v2)
    if (never) v0 = hipGraphExecEventWaitNodeSetEvent_(v2, v2, v2)
    if (never) v0 = hipGraphAddMemAllocNode_(v2, v2, v2, v4, v55)
    if (never) v0 = hipGraphMemAllocNodeGetParams_(v2, v55)
    if (never) v0 = hipGraphAddMemFreeNode_(v2, v2, v2, v4, v2)
    if (never) v0 = hipGraphMemFreeNodeGetParams_(v2, v2)
    if (never) v0 = hipDeviceGetGraphMemAttribute_(v0, v0, v2)
    if (never) v0 = hipDeviceSetGraphMemAttribute_(v0, v0, v2)
    if (never) v0 = hipDeviceGraphMemTrim_(v0)
    if (never) v0 = hipUserObjectCreate_(v2, v2, v9, v0, v0)
    if (never) v0 = hipUserObjectRelease_(v2, v0)
    if (never) v0 = hipUserObjectRetain_(v2, v0)
    if (never) v0 = hipGraphRetainUserObject_(v2, v2, v0, v0)
    if (never) v0 = hipGraphReleaseUserObject_(v2, v2, v0)
    if (never) v0 = hipGraphDebugDotPrint_(v2, v2, v0)
    if (never) v0 = hipGraphKernelNodeCopyAttributes_(v2, v2)
    if (never) v0 = hipGraphNodeSetEnabled_(v2, v2, v0)
    if (never) v0 = hipGraphNodeGetEnabled_(v2, v2, v2)
    if (never) v0 = hipGraphAddExternalSemaphoresWaitNode_(v2, v2, v2, v4, v56)
    if (never) v0 = hipGraphAddExternalSemaphoresSignalNode_(v2, v2, v2, v4, v57)
    if (never) v0 = hipGraphExternalSemaphoresSignalNodeSetParams_(v2, v57)
    if (never) v0 = hipGraphExternalSemaphoresWaitNodeSetParams_(v2, v56)
    if (never) v0 = hipGraphExternalSemaphoresSignalNodeGetParams_(v2, v57)
    if (never) v0 = hipGraphExternalSemaphoresWaitNodeGetParams_(v2, v56)
    if (never) v0 = hipGraphExecExternalSemaphoresSignalNodeSetParams_(v2, v2, v57)
    if (never) v0 = hipGraphExecExternalSemaphoresWaitNodeSetParams_(v2, v2, v56)
#ifndef USE_CUDA_NAMES
    if (never) v0 = hipDrvGraphMemcpyNodeGetParams_(v2, v30)
    if (never) v0 = hipDrvGraphMemcpyNodeSetParams_(v2, v30)
    if (never) v0 = hipDrvGraphAddMemsetNode_(v2, v2, v2, v4, v53, v2)
    if (never) v0 = hipDrvGraphAddMemFreeNode_(v2, v2, v2, v4, v2)
    if (never) v0 = hipDrvGraphExecMemcpyNodeSetParams_(v2, v2, v30, v2)
    if (never) v0 = hipDrvGraphExecMemsetNodeSetParams_(v2, v2, v53, v2)
#endif
    if (never) v0 = hipMemAddressFree_(v2, v4)
    if (never) v0 = hipMemAddressReserve_(v2, v4, v4, v2, v10)
    if (never) v0 = hipMemCreate_(v2, v4, v58, v10)
    if (never) v0 = hipMemExportToShareableHandle_(v2, v2, v0, v10)
    if (never) v0 = hipMemGetAccess_(v2, v18, v2)
    if (never) v0 = hipMemGetAllocationGranularity_(v2, v58, v0)
    if (never) v0 = hipMemGetAllocationPropertiesFromHandle_(v58, v2)
    if (never) v0 = hipMemImportFromShareableHandle_(v2, v2, v0)
    if (never) v0 = hipMemMap_(v2, v4, v4, v2, v10)
    if (never) v0 = hipMemMapArrayAsync_(v59, v0, v2)
    if (never) v0 = hipMemRelease_(v2)
    if (never) v0 = hipMemRetainAllocationHandle_(v2, v2)
    if (never) v0 = hipMemSetAccess_(v2, v4, v19, v4)
    if (never) v0 = hipMemUnmap_(v2, v4)
    if (never) v0 = hipGraphicsMapResources_(v0, v2, v2)
    if (never) v0 = hipGraphicsSubResourceGetMappedArray_(v2, v2, v0, v0)
    if (never) v0 = hipGraphicsResourceGetMappedPointer_(v2, v2, v2)
    if (never) v0 = hipGraphicsUnmapResources_(v0, v2, v2)
    if (never) v0 = hipGraphicsUnregisterResource_(v2)
    if (never) v0 = hipCreateSurfaceObject_(v2, v40)
    if (never) v0 = hipDestroySurfaceObject_(v2)
    if (never) v0 = hipMemcpy_spt_(v2, v2, v4, v0)
    if (never) v0 = hipMemcpyToSymbol_spt_(v2, v2, v4, v4, v0)
    if (never) v0 = hipMemcpyFromSymbol_spt_(v2, v2, v4, v4, v0)
    if (never) v0 = hipMemcpy2D_spt_(v2, v4, v2, v4, v4, v4, v0)
    if (never) v0 = hipMemcpy2DFromArray_spt_(v2, v4, v2, v4, v4, v4, v4, v0)
    if (never) v0 = hipMemcpy3D_spt_(v29)
    if (never) v0 = hipMemset_spt_(v2, v0, v4)
    if (never) v0 = hipMemsetAsync_spt_(v2, v0, v4, v2)
    if (never) v0 = hipMemset2D_spt_(v2, v4, v0, v4, v4)
    if (never) v0 = hipMemset2DAsync_spt_(v2, v4, v0, v4, v4, v2)
    if (never) v0 = hipMemset3DAsync_spt_(v24, v0, v25, v2)
    if (never) v0 = hipMemset3D_spt_(v24, v0, v25)
    if (never) v0 = hipMemcpyAsync_spt_(v2, v2, v4, v0, v2)
    if (never) v0 = hipMemcpy3DAsync_spt_(v29, v2)
    if (never) v0 = hipMemcpy2DAsync_spt_(v2, v4, v2, v4, v4, v4, v0, v2)
    if (never) v0 = hipMemcpyFromSymbolAsync_spt_(v2, v2, v4, v4, v0, v2)
    if (never) v0 = hipMemcpyToSymbolAsync_spt_(v2, v2, v4, v4, v0, v2)
    if (never) v0 = hipMemcpyFromArray_spt_(v2, v2, v4, v4, v4, v0)
    if (never) v0 = hipMemcpy2DToArray_spt_(v2, v4, v4, v2, v4, v4, v4, v0)
    if (never) v0 = hipMemcpy2DFromArrayAsync_spt_(v2, v4, v2, v4, v4, v4, v4, v0, v2)
    if (never) v0 = hipMemcpy2DToArrayAsync_spt_(v2, v4, v4, v2, v4, v4, v4, v0, v2)
    if (never) v0 = hipStreamQuery_spt_(v2)
    if (never) v0 = hipStreamSynchronize_spt_(v2)
    if (never) v0 = hipStreamGetPriority_spt_(v2, v2)
    if (never) v0 = hipStreamWaitEvent_spt_(v2, v2, v0)
    if (never) v0 = hipStreamGetFlags_spt_(v2, v2)
    if (never) v0 = hipStreamAddCallback_spt_(v2, v9, v2, v0)
    if (never) v0 = hipEventRecord_spt_(v2, v2)
    if (never) v0 = hipLaunchCooperativeKernel_spt_(v2, v36, v36, v2, v8, v2)
    if (never) v0 = hipLaunchKernel_spt_(v2, v36, v36, v2, v4, v2)
    if (never) v0 = hipGraphLaunch_spt_(v2, v2)
    if (never) v0 = hipStreamBeginCapture_spt_(v2, v0)
    if (never) v0 = hipStreamEndCapture_spt_(v2, v2)
    if (never) v0 = hipStreamIsCapturing_spt_(v2, v2)
    if (never) v0 = hipStreamGetCaptureInfo_spt_(v2, v2, v2)
    if (never) v0 = hipStreamGetCaptureInfo_v2_spt_(v2, v2, v2, v2, v2, v2)
    if (never) v0 = hipLaunchHostFunc_spt_(v2, v9, v2)
    if (never) v0 = hipGetDriverEntryPoint_spt_(v2, v2, v10, v2)
    if (never) v0 = hipMalloc_(v2, v4)
    if (never) v0 = hipMallocManaged_(v2, v4, v0)
    if (never) v0 = hipHostMalloc_(v2, v4, v0)
    if (never) v0 = hipFree_(v2)
    if (never) v0 = hipHostFree_(v2)
    if (never) v0 = hipMemcpy_(v2, v2, v4, v0)
    if (never) v0 = hipMemcpyAsync_(v2, v2, v4, v0, v2)
    if (never) v0 = hipMemcpy2D_(v2, v4, v2, v4, v4, v4, v0)
    if (never) v0 = hipMemcpy2DAsync_(v2, v4, v2, v4, v4, v4, v0, v2)
    if (never) v0 = hipHostRegister_(v2, v4, v0)
    if (never) v0 = hipHostUnregister_(v2)
    if (never) v0 = hipHostGetDevicePointer_(v2, v2, v0)
    if (never) v0 = hipHostGetFlags_(v0, v2)
    if (never) v0 = hipGetDeviceProperties_(v5, v0)

  write(*,"(a)") "-- test_hip (bind(C) symbols): PASSED (compile+link only)!"
end program test_hip
