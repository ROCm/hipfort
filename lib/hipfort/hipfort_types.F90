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

module hipfort_types
  use, intrinsic :: iso_c_binding
  implicit none

  type, bind(c) :: hipDeviceArch_t
    integer(c_int32_t) :: opaque(1)
  end type hipDeviceArch_t

  type, bind(c) :: hipUUID
    character(c_char) :: bytes(16)
  end type hipUUID

#ifdef USE_CUDA_NAMES
  type,bind(c) :: hipDeviceProp_t  ! as of cuda 13.3 (CUDART 13030); ABI-stable across 13.3 updates
    character(kind=c_char) :: name(256)
    character(kind=c_char) :: uuid(16)
    character(kind=c_char) :: luid(8)
    integer(c_int) :: luidDeviceNodeMask
    integer(c_size_t) :: totalGlobalMem
    integer(c_size_t) :: sharedMemPerBlock
    integer(c_int) :: regsPerBlock
    integer(c_int) :: warpSize
    integer(c_size_t) :: memPitch
    integer(c_int) :: maxThreadsPerBlock
    integer(c_int) :: maxThreadsDim(3)
    integer(c_int) :: maxGridSize(3)
    integer(c_size_t) :: totalConstMem
    integer(c_int) :: major
    integer(c_int) :: minor
    integer(c_size_t) :: textureAlignment
    integer(c_size_t) :: texturePitchAlignment
    integer(c_int) :: multiProcessorCount
    integer(c_int) :: integrated
    integer(c_int) :: canMapHostMemory
    integer(c_int) :: maxTexture1D
    integer(c_int) :: maxTexture1DMipmap
    integer(c_int) :: maxTexture2D(2)
    integer(c_int) :: maxTexture2DMipmap(2)
    integer(c_int) :: maxTexture2DLinear(3)
    integer(c_int) :: maxTexture2DGather(2)
    integer(c_int) :: maxTexture3D(3)
    integer(c_int) :: maxTexture3DAlt(3)
    integer(c_int) :: maxTextureCubemap
    integer(c_int) :: maxTexture1DLayered(2)
    integer(c_int) :: maxTexture2DLayered(3)
    integer(c_int) :: maxTextureCubemapLayered(2)
    integer(c_int) :: maxSurface1D
    integer(c_int) :: maxSurface2D(2)
    integer(c_int) :: maxSurface3D(3)
    integer(c_int) :: maxSurface1DLayered(2)
    integer(c_int) :: maxSurface2DLayered(3)
    integer(c_int) :: maxSurfaceCubemap
    integer(c_int) :: maxSurfaceCubemapLayered(2)
    integer(c_size_t) :: surfaceAlignment
    integer(c_int) :: concurrentKernels
    integer(c_int) :: ECCEnabled
    integer(c_int) :: pciBusID
    integer(c_int) :: pciDeviceID
    integer(c_int) :: pciDomainID
    integer(c_int) :: tccDriver
    integer(c_int) :: asyncEngineCount
    integer(c_int) :: unifiedAddressing
    integer(c_int) :: memoryBusWidth
    integer(c_int) :: l2CacheSize
    integer(c_int) :: persistingL2CacheMaxSize
    integer(c_int) :: maxThreadsPerMultiProcessor
    integer(c_int) :: streamPrioritiesSupported
    integer(c_int) :: globalL1CacheSupported
    integer(c_int) :: localL1CacheSupported
    integer(c_size_t) :: sharedMemPerMultiprocessor
    integer(c_int) :: regsPerMultiprocessor
    integer(c_int) :: managedMemory
    integer(c_int) :: isMultiGpuBoard
    integer(c_int) :: multiGpuBoardGroupID
    integer(c_int) :: hostNativeAtomicSupported
    integer(c_int) :: pageableMemoryAccess
    integer(c_int) :: concurrentManagedAccess
    integer(c_int) :: computePreemptionSupported
    integer(c_int) :: canUseHostPointerForRegisteredMem
    integer(c_int) :: cooperativeLaunch
    integer(c_size_t) :: sharedMemPerBlockOptin
    integer(c_int) :: pageableMemoryAccessUsesHostPageTables
    integer(c_int) :: directManagedMemAccessFromHost
    integer(c_int) :: maxBlocksPerMultiProcessor
    integer(c_int) :: accessPolicyMaxWindowSize
    integer(c_size_t) :: reservedSharedMemPerBlock
    integer(c_int) :: hostRegisterSupported
    integer(c_int) :: sparseCudaArraySupported
    integer(c_int) :: hostRegisterReadOnlySupported
    integer(c_int) :: timelineSemaphoreInteropSupported
    integer(c_int) :: memoryPoolsSupported
    integer(c_int) :: gpuDirectRDMASupported
    integer(c_int) :: gpuDirectRDMAFlushWritesOptions
    integer(c_int) :: gpuDirectRDMAWritesOrdering
    integer(c_int) :: memoryPoolSupportedHandleTypes
    integer(c_int) :: deferredMappingCudaArraySupported
    integer(c_int) :: ipcEventSupported
    integer(c_int) :: clusterLaunch
    integer(c_int) :: unifiedFunctionPointers
    integer(c_int) :: deviceNumaConfig
    integer(c_int) :: deviceNumaId
    integer(c_int) :: mpsEnabled
    integer(c_int) :: hostNumaId
    integer(c_int) :: gpuPciDeviceID
    integer(c_int) :: gpuPciSubsystemID
    integer(c_int) :: hostNumaMultinodeIpcSupported
    integer(c_int) :: reserved(56)
  end type hipDeviceProp_t
#else
  type, bind(c) :: hipDeviceProp_t
    character(c_char) :: name(256)
    type(hipUUID) :: uuid
    character(c_char) :: luid(8)
    integer(c_int) :: luidDeviceNodeMask
    integer(c_size_t) :: totalGlobalMem
    integer(c_size_t) :: sharedMemPerBlock
    integer(c_int) :: regsPerBlock
    integer(c_int) :: warpSize
    integer(c_size_t) :: memPitch
    integer(c_int) :: maxThreadsPerBlock
    integer(c_int) :: maxThreadsDim(3)
    integer(c_int) :: maxGridSize(3)
    integer(c_int) :: clockRate
    integer(c_size_t) :: totalConstMem
    integer(c_int) :: major
    integer(c_int) :: minor
    integer(c_size_t) :: textureAlignment
    integer(c_size_t) :: texturePitchAlignment
    integer(c_int) :: deviceOverlap
    integer(c_int) :: multiProcessorCount
    integer(c_int) :: kernelExecTimeoutEnabled
    integer(c_int) :: integrated
    integer(c_int) :: canMapHostMemory
    integer(c_int) :: computeMode
    integer(c_int) :: maxTexture1D
    integer(c_int) :: maxTexture1DMipmap
    integer(c_int) :: maxTexture1DLinear
    integer(c_int) :: maxTexture2D(2)
    integer(c_int) :: maxTexture2DMipmap(2)
    integer(c_int) :: maxTexture2DLinear(3)
    integer(c_int) :: maxTexture2DGather(2)
    integer(c_int) :: maxTexture3D(3)
    integer(c_int) :: maxTexture3DAlt(3)
    integer(c_int) :: maxTextureCubemap
    integer(c_int) :: maxTexture1DLayered(2)
    integer(c_int) :: maxTexture2DLayered(3)
    integer(c_int) :: maxTextureCubemapLayered(2)
    integer(c_int) :: maxSurface1D
    integer(c_int) :: maxSurface2D(2)
    integer(c_int) :: maxSurface3D(3)
    integer(c_int) :: maxSurface1DLayered(2)
    integer(c_int) :: maxSurface2DLayered(3)
    integer(c_int) :: maxSurfaceCubemap
    integer(c_int) :: maxSurfaceCubemapLayered(2)
    integer(c_size_t) :: surfaceAlignment
    integer(c_int) :: concurrentKernels
    integer(c_int) :: ECCEnabled
    integer(c_int) :: pciBusID
    integer(c_int) :: pciDeviceID
    integer(c_int) :: pciDomainID
    integer(c_int) :: tccDriver
    integer(c_int) :: asyncEngineCount
    integer(c_int) :: unifiedAddressing
    integer(c_int) :: memoryClockRate
    integer(c_int) :: memoryBusWidth
    integer(c_int) :: l2CacheSize
    integer(c_int) :: persistingL2CacheMaxSize
    integer(c_int) :: maxThreadsPerMultiProcessor
    integer(c_int) :: streamPrioritiesSupported
    integer(c_int) :: globalL1CacheSupported
    integer(c_int) :: localL1CacheSupported
    integer(c_size_t) :: sharedMemPerMultiprocessor
    integer(c_int) :: regsPerMultiprocessor
    integer(c_int) :: managedMemory
    integer(c_int) :: isMultiGpuBoard
    integer(c_int) :: multiGpuBoardGroupID
    integer(c_int) :: hostNativeAtomicSupported
    integer(c_int) :: singleToDoublePrecisionPerfRatio
    integer(c_int) :: pageableMemoryAccess
    integer(c_int) :: concurrentManagedAccess
    integer(c_int) :: computePreemptionSupported
    integer(c_int) :: canUseHostPointerForRegisteredMem
    integer(c_int) :: cooperativeLaunch
    integer(c_int) :: cooperativeMultiDeviceLaunch
    integer(c_size_t) :: sharedMemPerBlockOptin
    integer(c_int) :: pageableMemoryAccessUsesHostPageTables
    integer(c_int) :: directManagedMemAccessFromHost
    integer(c_int) :: maxBlocksPerMultiProcessor
    integer(c_int) :: accessPolicyMaxWindowSize
    integer(c_size_t) :: reservedSharedMemPerBlock
    integer(c_int) :: hostRegisterSupported
    integer(c_int) :: sparseHipArraySupported
    integer(c_int) :: hostRegisterReadOnlySupported
    integer(c_int) :: timelineSemaphoreInteropSupported
    integer(c_int) :: memoryPoolsSupported
    integer(c_int) :: gpuDirectRDMASupported
    integer(c_int) :: gpuDirectRDMAFlushWritesOptions
    integer(c_int) :: gpuDirectRDMAWritesOrdering
    integer(c_int) :: memoryPoolSupportedHandleTypes
    integer(c_int) :: deferredMappingHipArraySupported
    integer(c_int) :: ipcEventSupported
    integer(c_int) :: clusterLaunch
    integer(c_int) :: unifiedFunctionPointers
    integer(c_int) :: reserved(63)
    integer(c_int) :: hipReserved(32)
    character(c_char) :: gcnArchName(256)
    integer(c_size_t) :: maxSharedMemoryPerMultiProcessor
    integer(c_int) :: clockInstructionRate
    type(hipDeviceArch_t) :: arch
    type(c_ptr) :: hdpMemFlushCntl
    type(c_ptr) :: hdpRegFlushCntl
    integer(c_int) :: cooperativeMultiDeviceUnmatchedFunc
    integer(c_int) :: cooperativeMultiDeviceUnmatchedGridDim
    integer(c_int) :: cooperativeMultiDeviceUnmatchedBlockDim
    integer(c_int) :: cooperativeMultiDeviceUnmatchedSharedMem
    integer(c_int) :: isLargeBar
    integer(c_int) :: asicRevision
  end type hipDeviceProp_t
#endif

  type, bind(c) :: hipPointerAttribute_t
    integer(c_int) :: type
    integer(c_int) :: device
    type(c_ptr) :: devicePointer
    type(c_ptr) :: hostPointer
    integer(c_int) :: isManaged
    integer(c_int) :: allocationFlags
  end type hipPointerAttribute_t

  type, bind(c) :: hipChannelFormatDesc
    integer(c_int) :: x
    integer(c_int) :: y
    integer(c_int) :: z
    integer(c_int) :: w
    integer(c_int) :: f
  end type hipChannelFormatDesc

  type, bind(c) :: HIP_ARRAY_DESCRIPTOR
    integer(c_size_t) :: Width
    integer(c_size_t) :: Height
    integer(c_int) :: Format
    integer(c_int) :: NumChannels
  end type HIP_ARRAY_DESCRIPTOR

  type, bind(c) :: HIP_ARRAY3D_DESCRIPTOR
    integer(c_size_t) :: Width
    integer(c_size_t) :: Height
    integer(c_size_t) :: Depth
    integer(c_int) :: Format
    integer(c_int) :: NumChannels
    integer(c_int) :: Flags
  end type HIP_ARRAY3D_DESCRIPTOR

  type, bind(c) :: hip_Memcpy2D
    integer(c_size_t) :: srcXInBytes
    integer(c_size_t) :: srcY
    integer(c_int) :: srcMemoryType
    type(c_ptr) :: srcHost
    type(c_ptr) :: srcDevice
    type(c_ptr) :: srcArray
    integer(c_size_t) :: srcPitch
    integer(c_size_t) :: dstXInBytes
    integer(c_size_t) :: dstY
    integer(c_int) :: dstMemoryType
    type(c_ptr) :: dstHost
    type(c_ptr) :: dstDevice
    type(c_ptr) :: dstArray
    integer(c_size_t) :: dstPitch
    integer(c_size_t) :: WidthInBytes
    integer(c_size_t) :: Height
  end type hip_Memcpy2D

  type, bind(c) :: hipMipmappedArray
    type(c_ptr) :: data
    type(hipChannelFormatDesc) :: desc
    integer(c_int) :: type
    integer(c_int) :: width
    integer(c_int) :: height
    integer(c_int) :: depth
    integer(c_int) :: min_mipmap_level
    integer(c_int) :: max_mipmap_level
    integer(c_int) :: flags
    integer(c_int) :: format
    integer(c_int) :: num_channels
  end type hipMipmappedArray

  type, bind(c) :: HIP_TEXTURE_DESC
    integer(c_int) :: addressMode(3)
    integer(c_int) :: filterMode
    integer(c_int) :: flags
    integer(c_int) :: maxAnisotropy
    integer(c_int) :: mipmapFilterMode
    real(c_float) :: mipmapLevelBias
    real(c_float) :: minMipmapLevelClamp
    real(c_float) :: maxMipmapLevelClamp
    real(c_float) :: borderColor(4)
    integer(c_int) :: reserved(12)
  end type HIP_TEXTURE_DESC

  type, bind(c) :: hipResourceDesc
    integer(c_int64_t) :: opaque(8)
  end type hipResourceDesc

  type, bind(c) :: HIP_RESOURCE_DESC
    integer(c_int64_t) :: opaque(18)
  end type HIP_RESOURCE_DESC

  type, bind(c) :: hipResourceViewDesc
    integer(c_int) :: format
    integer(c_size_t) :: width
    integer(c_size_t) :: height
    integer(c_size_t) :: depth
    integer(c_int) :: firstMipmapLevel
    integer(c_int) :: lastMipmapLevel
    integer(c_int) :: firstLayer
    integer(c_int) :: lastLayer
  end type hipResourceViewDesc

  type, bind(c) :: HIP_RESOURCE_VIEW_DESC
    integer(c_int) :: format
    integer(c_size_t) :: width
    integer(c_size_t) :: height
    integer(c_size_t) :: depth
    integer(c_int) :: firstMipmapLevel
    integer(c_int) :: lastMipmapLevel
    integer(c_int) :: firstLayer
    integer(c_int) :: lastLayer
    integer(c_int) :: reserved(16)
  end type HIP_RESOURCE_VIEW_DESC

  type, bind(c) :: hipPitchedPtr
    type(c_ptr) :: ptr
    integer(c_size_t) :: pitch
    integer(c_size_t) :: xsize
    integer(c_size_t) :: ysize
  end type hipPitchedPtr

  type, bind(c) :: hipExtent
    integer(c_size_t) :: width
    integer(c_size_t) :: height
    integer(c_size_t) :: depth
  end type hipExtent

  type, bind(c) :: hipPos
    integer(c_size_t) :: x
    integer(c_size_t) :: y
    integer(c_size_t) :: z
  end type hipPos

  type, bind(c) :: hipMemcpy3DParms
    type(c_ptr) :: srcArray
    type(hipPos) :: srcPos
    type(hipPitchedPtr) :: srcPtr
    type(c_ptr) :: dstArray
    type(hipPos) :: dstPos
    type(hipPitchedPtr) :: dstPtr
    type(hipExtent) :: extent
    integer(c_int) :: kind
  end type hipMemcpy3DParms

  type, bind(c) :: HIP_MEMCPY3D
    integer(c_size_t) :: srcXInBytes
    integer(c_size_t) :: srcY
    integer(c_size_t) :: srcZ
    integer(c_size_t) :: srcLOD
    integer(c_int) :: srcMemoryType
    type(c_ptr) :: srcHost
    type(c_ptr) :: srcDevice
    type(c_ptr) :: srcArray
    integer(c_size_t) :: srcPitch
    integer(c_size_t) :: srcHeight
    integer(c_size_t) :: dstXInBytes
    integer(c_size_t) :: dstY
    integer(c_size_t) :: dstZ
    integer(c_size_t) :: dstLOD
    integer(c_int) :: dstMemoryType
    type(c_ptr) :: dstHost
    type(c_ptr) :: dstDevice
    type(c_ptr) :: dstArray
    integer(c_size_t) :: dstPitch
    integer(c_size_t) :: dstHeight
    integer(c_size_t) :: WidthInBytes
    integer(c_size_t) :: Height
    integer(c_size_t) :: Depth
  end type HIP_MEMCPY3D

  type, bind(c) :: hipMemLocation
    integer(c_int) :: type
    integer(c_int) :: id
  end type hipMemLocation

  type, bind(c) :: hipMemcpyAttributes
    integer(c_int) :: srcAccessOrder
    type(hipMemLocation) :: srcLocHint
    type(hipMemLocation) :: dstLocHint
    integer(c_int) :: flags
  end type hipMemcpyAttributes

  type, bind(c) :: hipOffset3D
    integer(c_size_t) :: x
    integer(c_size_t) :: y
    integer(c_size_t) :: z
  end type hipOffset3D

  type, bind(c) :: hipMemcpy3DOperand
    integer(c_int64_t) :: opaque(5)
  end type hipMemcpy3DOperand

  type, bind(c) :: hipMemcpy3DBatchOp
    type(hipMemcpy3DOperand) :: src
    type(hipMemcpy3DOperand) :: dst
    type(hipExtent) :: extent
    integer(c_int) :: srcAccessOrder
    integer(c_int) :: flags
  end type hipMemcpy3DBatchOp

  type, bind(c) :: hipMemcpy3DPeerParms
    type(c_ptr) :: srcArray
    type(hipPos) :: srcPos
    type(hipPitchedPtr) :: srcPtr
    integer(c_int) :: srcDevice
    type(c_ptr) :: dstArray
    type(hipPos) :: dstPos
    type(hipPitchedPtr) :: dstPtr
    integer(c_int) :: dstDevice
    type(hipExtent) :: extent
  end type hipMemcpy3DPeerParms

  type, bind(c) :: textureReference
    integer(c_int) :: normalized
    integer(c_int) :: readMode
    integer(c_int) :: filterMode
    integer(c_int) :: addressMode(3)
    type(hipChannelFormatDesc) :: channelDesc
    integer(c_int) :: sRGB
    integer(c_int) :: maxAnisotropy
    integer(c_int) :: mipmapFilterMode
    real(c_float) :: mipmapLevelBias
    real(c_float) :: minMipmapLevelClamp
    real(c_float) :: maxMipmapLevelClamp
    type(c_ptr) :: textureObject
    integer(c_int) :: numChannels
    integer(c_int) :: format
  end type textureReference

  type, bind(c) :: hipTextureDesc
    integer(c_int) :: addressMode(3)
    integer(c_int) :: filterMode
    integer(c_int) :: readMode
    integer(c_int) :: sRGB
    real(c_float) :: borderColor(4)
    integer(c_int) :: normalizedCoords
    integer(c_int) :: maxAnisotropy
    integer(c_int) :: mipmapFilterMode
    real(c_float) :: mipmapLevelBias
    real(c_float) :: minMipmapLevelClamp
    real(c_float) :: maxMipmapLevelClamp
  end type hipTextureDesc

  type, bind(c) :: surfaceReference
    type(c_ptr) :: surfaceObject
  end type surfaceReference

  type, bind(c) :: hipIpcMemHandle_t
    character(c_char) :: reserved(64)
  end type hipIpcMemHandle_t

  type, bind(c) :: hipIpcEventHandle_t
    character(c_char) :: reserved(64)
  end type hipIpcEventHandle_t

  type, bind(c) :: hipFuncAttributes
    integer(c_int) :: binaryVersion
    integer(c_int) :: cacheModeCA
    integer(c_size_t) :: constSizeBytes
    integer(c_size_t) :: localSizeBytes
    integer(c_int) :: maxDynamicSharedSizeBytes
    integer(c_int) :: maxThreadsPerBlock
    integer(c_int) :: numRegs
    integer(c_int) :: preferredShmemCarveout
    integer(c_int) :: ptxVersion
    integer(c_size_t) :: sharedSizeBytes
  end type hipFuncAttributes

  type, bind(c) :: hipBatchMemOpNodeParams
    type(c_ptr) :: ctx
    integer(c_int) :: count
    type(c_ptr) :: paramArray
    integer(c_int) :: flags
  end type hipBatchMemOpNodeParams

  type, bind(c) :: hipMemAccessDesc
    type(hipMemLocation) :: location
    integer(c_int) :: flags
  end type hipMemAccessDesc

  type, bind(c) :: hipMemPoolProps
    integer(c_int) :: allocType
    integer(c_int) :: handleTypes
    type(hipMemLocation) :: location
    type(c_ptr) :: win32SecurityAttributes
    integer(c_size_t) :: maxSize
    type(c_ptr) :: reserved(56)
  end type hipMemPoolProps

  type, bind(c) :: hipMemPoolPtrExportData
    type(c_ptr) :: reserved(64)
  end type hipMemPoolPtrExportData

  type, bind(c) :: dim3
    integer(c_int32_t) :: x = 1
    integer(c_int32_t) :: y = 1
    integer(c_int32_t) :: z = 1
  end type dim3

  type, bind(c) :: hipLaunchParams
    type(c_ptr) :: func
    type(dim3) :: gridDim
    type(dim3) :: blockDim
    type(c_ptr) :: args
    integer(c_size_t) :: sharedMem
    type(c_ptr) :: stream
  end type hipLaunchParams

  type, bind(c) :: hipFunctionLaunchParams
    type(c_ptr) :: function
    integer(c_int) :: gridDimX
    integer(c_int) :: gridDimY
    integer(c_int) :: gridDimZ
    integer(c_int) :: blockDimX
    integer(c_int) :: blockDimY
    integer(c_int) :: blockDimZ
    integer(c_int) :: sharedMemBytes
    type(c_ptr) :: hStream
    type(c_ptr) :: kernelParams
  end type hipFunctionLaunchParams

  type, bind(c) :: hipExternalMemoryHandleDesc
    integer(c_int64_t) :: opaque(13)
  end type hipExternalMemoryHandleDesc

  type, bind(c) :: hipExternalMemoryBufferDesc
    integer(c_int64_t) :: offset
    integer(c_int64_t) :: size
    integer(c_int) :: flags
    integer(c_int) :: reserved(16)
  end type hipExternalMemoryBufferDesc

  type, bind(c) :: hipExternalMemoryMipmappedArrayDesc
    integer(c_int64_t) :: offset
    type(hipChannelFormatDesc) :: formatDesc
    type(hipExtent) :: extent
    integer(c_int) :: flags
    integer(c_int) :: numLevels
  end type hipExternalMemoryMipmappedArrayDesc

  type, bind(c) :: hipExternalSemaphoreHandleDesc
    integer(c_int64_t) :: opaque(12)
  end type hipExternalSemaphoreHandleDesc

  type, bind(c) :: hipExternalSemaphoreSignalParams
    integer(c_int64_t) :: opaque(18)
  end type hipExternalSemaphoreSignalParams

  type, bind(c) :: hipExternalSemaphoreWaitParams
    integer(c_int64_t) :: opaque(18)
  end type hipExternalSemaphoreWaitParams

  type, bind(c) :: hipHostNodeParams
    type(c_funptr) :: fn
    type(c_ptr) :: userData
  end type hipHostNodeParams

  type, bind(c) :: hipKernelNodeParams
    type(dim3) :: blockDim
    type(c_ptr) :: extra
    type(c_ptr) :: func
    type(dim3) :: gridDim
    type(c_ptr) :: kernelParams
    integer(c_int) :: sharedMemBytes
  end type hipKernelNodeParams

  type, bind(c) :: hipMemsetParams
    type(c_ptr) :: dst
    integer(c_int) :: elementSize
    integer(c_size_t) :: height
    integer(c_size_t) :: pitch
    integer(c_int) :: value
    integer(c_size_t) :: width
  end type hipMemsetParams

  type, bind(c) :: hipMemAllocNodeParams
    type(hipMemPoolProps) :: poolProps
    type(c_ptr) :: accessDescs
    integer(c_size_t) :: accessDescCount
    integer(c_size_t) :: bytesize
    type(c_ptr) :: dptr
  end type hipMemAllocNodeParams

  type, bind(c) :: hipAccessPolicyWindow
    type(c_ptr) :: base_ptr
    integer(c_int) :: hitProp
    real(c_float) :: hitRatio
    integer(c_int) :: missProp
    integer(c_size_t) :: num_bytes
  end type hipAccessPolicyWindow

  type, bind(c) :: hipLaunchMemSyncDomainMap
    type(c_ptr) :: default_
    type(c_ptr) :: remote
  end type hipLaunchMemSyncDomainMap

  type, bind(c) :: hipGraphInstantiateParams
    type(c_ptr) :: errNode_out
    integer(c_int64_t) :: flags
    integer(c_int) :: result_out
    type(c_ptr) :: uploadStream
  end type hipGraphInstantiateParams

  type, bind(c) :: hipMemAllocationProp
    integer(c_int64_t) :: opaque(4)
  end type hipMemAllocationProp

  type, bind(c) :: hipExternalSemaphoreSignalNodeParams
    type(c_ptr) :: extSemArray
    type(c_ptr) :: paramsArray
    integer(c_int) :: numExtSems
  end type hipExternalSemaphoreSignalNodeParams

  type, bind(c) :: hipExternalSemaphoreWaitNodeParams
    type(c_ptr) :: extSemArray
    type(c_ptr) :: paramsArray
    integer(c_int) :: numExtSems
  end type hipExternalSemaphoreWaitNodeParams

  type, bind(c) :: hipArrayMapInfo
    integer(c_int64_t) :: opaque(19)
  end type hipArrayMapInfo

  type, bind(c) :: hipMemcpyNodeParams
    integer(c_int) :: flags
    integer(c_int) :: reserved(3)
    type(hipMemcpy3DParms) :: copyParams
  end type hipMemcpyNodeParams

  type, bind(c) :: hipChildGraphNodeParams
    type(c_ptr) :: graph
  end type hipChildGraphNodeParams

  type, bind(c) :: hipEventWaitNodeParams
    type(c_ptr) :: event
  end type hipEventWaitNodeParams

  type, bind(c) :: hipEventRecordNodeParams
    type(c_ptr) :: event
  end type hipEventRecordNodeParams

  type, bind(c) :: hipMemFreeNodeParams
    type(c_ptr) :: dptr
  end type hipMemFreeNodeParams

  type, bind(c) :: hipGraphNodeParams
    integer(c_int) :: type
    integer(c_int) :: reserved0(3)
    integer(c_int64_t) :: reserved2
  end type hipGraphNodeParams

  type, bind(c) :: hipGraphEdgeData
    type(c_ptr) :: from_port
    type(c_ptr) :: reserved(5)
    type(c_ptr) :: to_port
    type(c_ptr) :: type
  end type hipGraphEdgeData

  type, bind(c) :: hipLaunchAttribute
    integer(c_int) :: id
    character(c_char) :: pad(4)
  end type hipLaunchAttribute

  type, bind(c) :: hipLaunchConfig_t
    type(dim3) :: gridDim
    type(dim3) :: blockDim
    integer(c_size_t) :: dynamicSmemBytes
    type(c_ptr) :: stream
    type(c_ptr) :: attrs
    integer(c_int) :: numAttrs
  end type hipLaunchConfig_t

  type, bind(c) :: HIP_LAUNCH_CONFIG
    integer(c_int) :: gridDimX
    integer(c_int) :: gridDimY
    integer(c_int) :: gridDimZ
    integer(c_int) :: blockDimX
    integer(c_int) :: blockDimY
    integer(c_int) :: blockDimZ
    integer(c_int) :: sharedMemBytes
    type(c_ptr) :: hStream
    type(c_ptr) :: attrs
    integer(c_int) :: numAttrs
  end type HIP_LAUNCH_CONFIG

end module hipfort_types
