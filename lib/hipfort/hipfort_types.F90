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
    character(c_char) :: name(256) !< Device name.
    type(hipUUID) :: uuid !< UUID of a device
    character(c_char) :: luid(8) !< 8-byte unique identifier. Only valid on windows
    integer(c_int) :: luidDeviceNodeMask !< LUID node mask
    integer(c_size_t) :: totalGlobalMem !< Size of global memory region (in bytes).
    integer(c_size_t) :: sharedMemPerBlock !< Size of shared memory per block (in bytes).
    integer(c_int) :: regsPerBlock !< Registers per block.
    integer(c_int) :: warpSize !< Warp size.
    integer(c_size_t) :: memPitch !< Maximum pitch in bytes allowed by memory copies pitched memory
    integer(c_int) :: maxThreadsPerBlock !< Max work items per work group or workgroup max size.
    integer(c_int) :: maxThreadsDim(3) !< Max number of threads in each dimension (XYZ) of a block.
    integer(c_int) :: maxGridSize(3) !< Max grid dimensions (XYZ).
    integer(c_int) :: clockRate !< Max clock frequency of the multiProcessors in khz.
    integer(c_size_t) :: totalConstMem !< Size of shared constant memory region on the device (in bytes).
    integer(c_int) :: major !< Major compute capability version. This indicates the core instruction set of the GPU architect...
    integer(c_int) :: minor !< Minor compute capability version. This indicates a particular configuration, feature set, or v...
    integer(c_size_t) :: textureAlignment !< Alignment requirement for textures
    integer(c_size_t) :: texturePitchAlignment !< Pitch alignment requirement for texture references bound to
    integer(c_int) :: deviceOverlap !< Deprecated. Use asyncEngineCount instead
    integer(c_int) :: multiProcessorCount !< Number of multi-processors. When the GPU works in Compute Unit (CU) mode, this v...
    integer(c_int) :: kernelExecTimeoutEnabled !< Run time limit for kernels executed on the device
    integer(c_int) :: integrated !< APU vs dGPU
    integer(c_int) :: canMapHostMemory !< Check whether HIP can map host memory
    integer(c_int) :: computeMode !< Compute mode.
    integer(c_int) :: maxTexture1D !< Maximum number of elements in 1D images
    integer(c_int) :: maxTexture1DMipmap !< Maximum 1D mipmap texture size
    integer(c_int) :: maxTexture1DLinear !< Maximum size for 1D textures bound to linear memory
    integer(c_int) :: maxTexture2D(2) !< Maximum dimensions (width, height) of 2D images, in image elements
    integer(c_int) :: maxTexture2DMipmap(2) !< Maximum number of elements in 2D array mipmap of images
    integer(c_int) :: maxTexture2DLinear(3) !< Maximum 2D tex dimensions if tex are bound to pitched memory
    integer(c_int) :: maxTexture2DGather(2) !< Maximum 2D tex dimensions if gather has to be performed
    integer(c_int) :: maxTexture3D(3) !< Maximum dimensions (width, height, depth) of 3D images, in image elements
    integer(c_int) :: maxTexture3DAlt(3) !< Maximum alternate 3D texture dims
    integer(c_int) :: maxTextureCubemap !< Maximum cubemap texture dims
    integer(c_int) :: maxTexture1DLayered(2) !< Maximum number of elements in 1D array images
    integer(c_int) :: maxTexture2DLayered(3) !< Maximum number of elements in 2D array images
    integer(c_int) :: maxTextureCubemapLayered(2) !< Maximum cubemaps layered texture dims
    integer(c_int) :: maxSurface1D !< Maximum 1D surface size
    integer(c_int) :: maxSurface2D(2) !< Maximum 2D surface size
    integer(c_int) :: maxSurface3D(3) !< Maximum 3D surface size
    integer(c_int) :: maxSurface1DLayered(2) !< Maximum 1D layered surface size
    integer(c_int) :: maxSurface2DLayered(3) !< Maximum 2D layared surface size
    integer(c_int) :: maxSurfaceCubemap !< Maximum cubemap surface size
    integer(c_int) :: maxSurfaceCubemapLayered(2) !< Maximum cubemap layered surface size
    integer(c_size_t) :: surfaceAlignment !< Alignment requirement for surface
    integer(c_int) :: concurrentKernels !< Device can possibly execute multiple kernels concurrently.
    integer(c_int) :: ECCEnabled !< Device has ECC support enabled
    integer(c_int) :: pciBusID !< PCI Bus ID.
    integer(c_int) :: pciDeviceID !< PCI Device ID
    integer(c_int) :: pciDomainID !< PCI Domain ID
    integer(c_int) :: tccDriver !< 1:If device is Tesla device using TCC driver, else 0
    integer(c_int) :: asyncEngineCount !< Number of async engines
    integer(c_int) :: unifiedAddressing !< Does device and host share unified address space
    integer(c_int) :: memoryClockRate !< Max global memory clock frequency in khz.
    integer(c_int) :: memoryBusWidth !< Global memory bus width in bits.
    integer(c_int) :: l2CacheSize !< L2 cache size.
    integer(c_int) :: persistingL2CacheMaxSize !< Device's max L2 persisting lines in bytes
    integer(c_int) :: maxThreadsPerMultiProcessor !< Maximum resident threads per multi-processor.
    integer(c_int) :: streamPrioritiesSupported !< Device supports stream priority
    integer(c_int) :: globalL1CacheSupported !< Indicates globals are cached in L1
    integer(c_int) :: localL1CacheSupported !< Locals are cahced in L1
    integer(c_size_t) :: sharedMemPerMultiprocessor !< Amount of shared memory available per multiprocessor.
    integer(c_int) :: regsPerMultiprocessor !< registers available per multiprocessor
    integer(c_int) :: managedMemory !< Device supports allocating managed memory on this system
    integer(c_int) :: isMultiGpuBoard !< 1 if device is on a multi-GPU board, 0 if not.
    integer(c_int) :: multiGpuBoardGroupID !< Unique identifier for a group of devices on same multiboard GPU
    integer(c_int) :: hostNativeAtomicSupported !< Link between host and device supports native atomics
    integer(c_int) :: singleToDoublePrecisionPerfRatio !< Deprecated. CUDA only.
    integer(c_int) :: pageableMemoryAccess !< Device supports coherently accessing pageable memory without calling hipHostReg...
    integer(c_int) :: concurrentManagedAccess !< Device can coherently access managed memory concurrently with the CPU
    integer(c_int) :: computePreemptionSupported !< Is compute preemption supported on the device
    integer(c_int) :: canUseHostPointerForRegisteredMem !< Device can access host registered memory with same address as the ...
    integer(c_int) :: cooperativeLaunch !< HIP device supports cooperative launch
    integer(c_int) :: cooperativeMultiDeviceLaunch !< HIP device supports cooperative launch on multiple devices
    integer(c_size_t) :: sharedMemPerBlockOptin !< Per device m ax shared mem per block usable by special opt in
    integer(c_int) :: pageableMemoryAccessUsesHostPageTables !< Device accesses pageable memory via the host's page tables
    integer(c_int) :: directManagedMemAccessFromHost !< Host can directly access managed memory on the device without migration
    integer(c_int) :: maxBlocksPerMultiProcessor !< Max number of blocks on CU
    integer(c_int) :: accessPolicyMaxWindowSize !< Max value of access policy window
    integer(c_size_t) :: reservedSharedMemPerBlock !< Shared memory reserved by driver per block
    integer(c_int) :: hostRegisterSupported !< Device supports hipHostRegister
    integer(c_int) :: sparseHipArraySupported !< Indicates if device supports sparse hip arrays
    integer(c_int) :: hostRegisterReadOnlySupported !< Device supports using the hipHostRegisterReadOnly flag with hipHostReg...
    integer(c_int) :: timelineSemaphoreInteropSupported !< Indicates external timeline semaphore support
    integer(c_int) :: memoryPoolsSupported !< Indicates if device supports hipMallocAsync and hipMemPool APIs
    integer(c_int) :: gpuDirectRDMASupported !< Indicates device support of RDMA APIs
    integer(c_int) :: gpuDirectRDMAFlushWritesOptions !< Bitmask to be interpreted according to hipFlushGPUDirectRDMAWritesOp...
    integer(c_int) :: gpuDirectRDMAWritesOrdering !< value of hipGPUDirectRDMAWritesOrdering
    integer(c_int) :: memoryPoolSupportedHandleTypes !< Bitmask of handle types support with mempool based IPC
    integer(c_int) :: deferredMappingHipArraySupported !< Device supports deferred mapping HIP arrays and HIP mipmapped arrays
    integer(c_int) :: ipcEventSupported !< Device supports IPC events
    integer(c_int) :: clusterLaunch !< Device supports cluster launch
    integer(c_int) :: unifiedFunctionPointers !< Indicates device supports unified function pointers
    integer(c_int) :: reserved(63) !< CUDA Reserved.
    integer(c_int) :: hipReserved(32) !< Reserved for adding new entries for HIP/CUDA.
    character(c_char) :: gcnArchName(256) !< AMD GCN Arch Name. HIP Only.
    integer(c_size_t) :: maxSharedMemoryPerMultiProcessor !< Maximum Shared Memory Per CU. HIP Only.
    integer(c_int) :: clockInstructionRate !< Frequency in khz of the timer used by the device-side "clock*" instructions. Ne...
    type(hipDeviceArch_t) :: arch !< Architectural feature flags. New for HIP.
    type(c_ptr) :: hdpMemFlushCntl !< Addres of HDP_MEM_COHERENCY_FLUSH_CNTL register
    type(c_ptr) :: hdpRegFlushCntl !< Addres of HDP_REG_COHERENCY_FLUSH_CNTL register
    integer(c_int) :: cooperativeMultiDeviceUnmatchedFunc !< HIP device supports cooperative launch on multiple
    integer(c_int) :: cooperativeMultiDeviceUnmatchedGridDim !< HIP device supports cooperative launch on multiple
    integer(c_int) :: cooperativeMultiDeviceUnmatchedBlockDim !< HIP device supports cooperative launch on multiple
    integer(c_int) :: cooperativeMultiDeviceUnmatchedSharedMem !< HIP device supports cooperative launch on multiple
    integer(c_int) :: isLargeBar !< 1: if it is a large PCI bar device, else 0
    integer(c_int) :: asicRevision !< Revision of the GPU in this device
  end type hipDeviceProp_t
#endif

#ifdef USE_CUDA_NAMES
  type,bind(c) :: hipPointerAttribute_t  ! cudaPointerAttributes as of cuda 13.3
    integer(c_int) :: type
    integer(c_int) :: device
    type(c_ptr) :: devicePointer
    type(c_ptr) :: hostPointer
    integer(c_long) :: reserved(8)
  end type hipPointerAttribute_t
#else
  type, bind(c) :: hipPointerAttribute_t
    integer(c_int) :: type
    integer(c_int) :: device
    type(c_ptr) :: devicePointer
    type(c_ptr) :: hostPointer
    integer(c_int) :: isManaged
    integer(c_int) :: allocationFlags
  end type hipPointerAttribute_t
#endif

  type, bind(c) :: hipChannelFormatDesc
    integer(c_int) :: x
    integer(c_int) :: y
    integer(c_int) :: z
    integer(c_int) :: w
    integer(c_int) :: f !< Channel format kind
  end type hipChannelFormatDesc

  type, bind(c) :: HIP_ARRAY_DESCRIPTOR
    integer(c_size_t) :: Width !< Width of the array
    integer(c_size_t) :: Height !< Height of the array
    integer(c_int) :: Format !< Format of the array
    integer(c_int) :: NumChannels !< Number of channels of the array
  end type HIP_ARRAY_DESCRIPTOR

  type, bind(c) :: HIP_ARRAY3D_DESCRIPTOR
    integer(c_size_t) :: Width !< Width of the array
    integer(c_size_t) :: Height !< Height of the array
    integer(c_size_t) :: Depth !< Depth of the array
    integer(c_int) :: Format !< Format of the array
    integer(c_int) :: NumChannels !< Number of channels of the array
    integer(c_int) :: Flags !< Flags of the array
  end type HIP_ARRAY3D_DESCRIPTOR

  type, bind(c) :: hip_Memcpy2D
    integer(c_size_t) :: srcXInBytes !< Source width in bytes
    integer(c_size_t) :: srcY !< Source height
    integer(c_int) :: srcMemoryType !< Source memory type
    type(c_ptr) :: srcHost !< Source pointer
    type(c_ptr) :: srcDevice !< Source device
    type(c_ptr) :: srcArray !< Source array
    integer(c_size_t) :: srcPitch !< Source pitch
    integer(c_size_t) :: dstXInBytes !< Destination width in bytes
    integer(c_size_t) :: dstY !< Destination height
    integer(c_int) :: dstMemoryType !< Destination memory type
    type(c_ptr) :: dstHost !< Destination pointer
    type(c_ptr) :: dstDevice !< Destination device
    type(c_ptr) :: dstArray !< Destination array
    integer(c_size_t) :: dstPitch !< Destination pitch
    integer(c_size_t) :: WidthInBytes !< Width in bytes of the 2D memory copy
    integer(c_size_t) :: Height !< Height of the 2D memory copy
  end type hip_Memcpy2D

  type, bind(c) :: hipMipmappedArray
    type(c_ptr) :: data !< Data pointer of the mipmapped array
    type(hipChannelFormatDesc) :: desc !< Description of the mipmapped array
    integer(c_int) :: type !< Type of the mipmapped array
    integer(c_int) :: width !< Width of the mipmapped array
    integer(c_int) :: height !< Height of the mipmapped array
    integer(c_int) :: depth !< Depth of the mipmapped array
    integer(c_int) :: min_mipmap_level !< Minimum level of the mipmapped array
    integer(c_int) :: max_mipmap_level !< Maximum level of the mipmapped array
    integer(c_int) :: flags !< Flags of the mipmapped array
    integer(c_int) :: format !< Format of the mipmapped array
    integer(c_int) :: num_channels !< Number of channels of the mipmapped array
  end type hipMipmappedArray

  type, bind(c) :: HIP_TEXTURE_DESC
    integer(c_int) :: addressMode(3) !< Address modes
    integer(c_int) :: filterMode !< Filter mode
    integer(c_int) :: flags !< Flags
    integer(c_int) :: maxAnisotropy !< Maximum anisotropy ratio
    integer(c_int) :: mipmapFilterMode !< Mipmap filter mode
    real(c_float) :: mipmapLevelBias !< Mipmap level bias
    real(c_float) :: minMipmapLevelClamp !< Mipmap minimum level clamp
    real(c_float) :: maxMipmapLevelClamp !< Mipmap maximum level clamp
    real(c_float) :: borderColor(4) !< Border Color
    integer(c_int) :: reserved(12)
  end type HIP_TEXTURE_DESC

  type, bind(c) :: hipResourceDesc
    integer(c_int64_t) :: opaque(8)
  end type hipResourceDesc

  type, bind(c) :: HIP_RESOURCE_DESC
    integer(c_int64_t) :: opaque(18)
  end type HIP_RESOURCE_DESC

  type, bind(c) :: hipResourceViewDesc
    integer(c_int) :: format !< Resource view format
    integer(c_size_t) :: width !< Width of the resource view
    integer(c_size_t) :: height !< Height of the resource view
    integer(c_size_t) :: depth !< Depth of the resource view
    integer(c_int) :: firstMipmapLevel !< First defined mipmap level
    integer(c_int) :: lastMipmapLevel !< Last defined mipmap level
    integer(c_int) :: firstLayer !< First layer index
    integer(c_int) :: lastLayer !< Last layer index
  end type hipResourceViewDesc

  type, bind(c) :: HIP_RESOURCE_VIEW_DESC
    integer(c_int) :: format !< Resource view format
    integer(c_size_t) :: width !< Width of the resource view
    integer(c_size_t) :: height !< Height of the resource view
    integer(c_size_t) :: depth !< Depth of the resource view
    integer(c_int) :: firstMipmapLevel !< First defined mipmap level
    integer(c_int) :: lastMipmapLevel !< Last defined mipmap level
    integer(c_int) :: firstLayer !< First layer index
    integer(c_int) :: lastLayer !< Last layer index
    integer(c_int) :: reserved(16)
  end type HIP_RESOURCE_VIEW_DESC

  type, bind(c) :: hipPitchedPtr
    type(c_ptr) :: ptr !< Pointer to the allocated memory
    integer(c_size_t) :: pitch !< Pitch in bytes
    integer(c_size_t) :: xsize !< Logical size of the first dimension of allocation in elements
    integer(c_size_t) :: ysize !< Logical size of the second dimension of allocation in elements
  end type hipPitchedPtr

  type, bind(c) :: hipExtent
    integer(c_size_t) :: width
    integer(c_size_t) :: height
    integer(c_size_t) :: depth
  end type hipExtent

  type, bind(c) :: hipPos
    integer(c_size_t) :: x !< X coordinate
    integer(c_size_t) :: y !< Y coordinate
    integer(c_size_t) :: z !< Z coordinate
  end type hipPos

  type, bind(c) :: hipMemcpy3DParms
    type(c_ptr) :: srcArray !< Source array
    type(hipPos) :: srcPos !< Source position
    type(hipPitchedPtr) :: srcPtr !< Source pointer
    type(c_ptr) :: dstArray !< Destination array
    type(hipPos) :: dstPos !< Destination position
    type(hipPitchedPtr) :: dstPtr !< Destination pointer
    type(hipExtent) :: extent !< Extent of 3D memory copy
    integer(c_int) :: kind !< Kind of 3D memory copy
  end type hipMemcpy3DParms

  type, bind(c) :: HIP_MEMCPY3D
    integer(c_size_t) :: srcXInBytes !< Source X in bytes
    integer(c_size_t) :: srcY !< Source Y
    integer(c_size_t) :: srcZ !< Source Z
    integer(c_size_t) :: srcLOD !< Source LOD
    integer(c_int) :: srcMemoryType !< Source memory type
    type(c_ptr) :: srcHost !< Source host pointer
    type(c_ptr) :: srcDevice !< Source device
    type(c_ptr) :: srcArray !< Source array
    integer(c_size_t) :: srcPitch !< Source pitch
    integer(c_size_t) :: srcHeight !< Source height
    integer(c_size_t) :: dstXInBytes !< Destination X in bytes
    integer(c_size_t) :: dstY !< Destination Y
    integer(c_size_t) :: dstZ !< Destination Z
    integer(c_size_t) :: dstLOD !< Destination LOD
    integer(c_int) :: dstMemoryType !< Destination memory type
    type(c_ptr) :: dstHost !< Destination host pointer
    type(c_ptr) :: dstDevice !< Destination device
    type(c_ptr) :: dstArray !< Destination array
    integer(c_size_t) :: dstPitch !< Destination pitch
    integer(c_size_t) :: dstHeight !< Destination height
    integer(c_size_t) :: WidthInBytes !< Width in bytes of 3D memory copy
    integer(c_size_t) :: Height !< Height in bytes of 3D memory copy
    integer(c_size_t) :: Depth !< Depth in bytes of 3D memory copy
  end type HIP_MEMCPY3D

  type, bind(c) :: hipMemLocation
    integer(c_int) :: type !< Specifies the location type, which describes the meaning of id
    integer(c_int) :: id !< Identifier for the provided location type @p hipMemLocationType
  end type hipMemLocation

  type, bind(c) :: hipMemcpyAttributes
    integer(c_int) :: srcAccessOrder !< Source access ordering to be observed for copies with this attribute.
    type(hipMemLocation) :: srcLocHint !< Location hint for src operand.
    type(hipMemLocation) :: dstLocHint !< Location hint for destination operand.
    integer(c_int) :: flags !< Additional Flags for copies. See hipMemcpyFlags.
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
    type(c_ptr) :: srcArray !< Source memory address
    type(hipPos) :: srcPos !< Source position offset
    type(hipPitchedPtr) :: srcPtr !< Pitched source memory address
    integer(c_int) :: srcDevice !< Source device
    type(c_ptr) :: dstArray !< Destination memory address
    type(hipPos) :: dstPos !< Destination position offset
    type(hipPitchedPtr) :: dstPtr !< Pitched destination memory address
    integer(c_int) :: dstDevice !< Destination device
    type(hipExtent) :: extent !< Requested memory copy size
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
    type(hipMemLocation) :: location !< Location on which the accessibility has to change
    integer(c_int) :: flags !< Accessibility flags to set
  end type hipMemAccessDesc

  type, bind(c) :: hipMemPoolProps
    integer(c_int) :: allocType !< Allocation type. Currently must be specified as @p hipMemAllocationTypePinned
    integer(c_int) :: handleTypes !< Handle types that will be supported by allocations from the pool
    type(hipMemLocation) :: location !< Location where allocations should reside
    type(c_ptr) :: win32SecurityAttributes !< Windows-specific LPSECURITYATTRIBUTES required when @p hipMemHandleTypeWin32 is...
    integer(c_size_t) :: maxSize !< Maximum pool size. When set to 0, defaults to a system dependent value
    character(c_char) :: reserved(56) !< Reserved for future use, must be 0
  end type hipMemPoolProps

  type, bind(c) :: hipMemPoolPtrExportData
    character(c_char) :: reserved(64)
  end type hipMemPoolPtrExportData

  type, bind(c) :: dim3
    integer(c_int32_t) :: x = 1 !< x
    integer(c_int32_t) :: y = 1 !< y
    integer(c_int32_t) :: z = 1 !< z
  end type dim3

  type, bind(c) :: hipLaunchParams
    type(c_ptr) :: func !< Device function symbol
    type(dim3) :: gridDim !< Grid dimensions
    type(dim3) :: blockDim !< Block dimensions
    type(c_ptr) :: args !< Arguments
    integer(c_size_t) :: sharedMem !< Shared memory
    type(c_ptr) :: stream !< Stream identifier
  end type hipLaunchParams

  type, bind(c) :: hipFunctionLaunchParams
    type(c_ptr) :: function !< Kernel to launch
    integer(c_int) :: gridDimX !< Width(X) of grid in blocks
    integer(c_int) :: gridDimY !< Height(Y) of grid in blocks
    integer(c_int) :: gridDimZ !< Depth(Z) of grid in blocks
    integer(c_int) :: blockDimX !< X dimension of each thread block
    integer(c_int) :: blockDimY !< Y dimension of each thread block
    integer(c_int) :: blockDimZ !< Z dimension of each thread block
    integer(c_int) :: sharedMemBytes !< Shared memory
    type(c_ptr) :: hStream !< Stream identifier
    type(c_ptr) :: kernelParams !< Kernel parameters
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
    type(hipMemPoolProps) :: poolProps !< Pool properties, which contain where the location should reside
    type(c_ptr) :: accessDescs !< The number of memory access descriptors.
    integer(c_size_t) :: accessDescCount !< The number of access descriptors. Must not be bigger than the number of GPUs
    integer(c_size_t) :: bytesize !< The size of the requested allocation in bytes
    type(c_ptr) :: dptr !< Returned device address of the allocation
  end type hipMemAllocNodeParams

  type, bind(c) :: hipAccessPolicyWindow
    type(c_ptr) :: base_ptr !< Starting address of the access policy window
    integer(c_int) :: hitProp !< hipAccessProperty set for hit
    real(c_float) :: hitRatio !< hitRatio specifies percentage of lines assigned hitProp
    integer(c_int) :: missProp !< hipAccessProperty set for miss
    integer(c_size_t) :: num_bytes !< Size in bytes of the window policy.
  end type hipAccessPolicyWindow

  type, bind(c) :: hipLaunchMemSyncDomainMap
    character(c_char) :: default_ !< The default domain ID to use for designated kernels
    character(c_char) :: remote !< The remote domain ID to use for designated kernels
  end type hipLaunchMemSyncDomainMap

  type, bind(c) :: hipGraphInstantiateParams
    type(c_ptr) :: errNode_out !< The node which caused instantiation to fail, if any
    integer(c_int64_t) :: flags !< Instantiation flags
    integer(c_int) :: result_out !< Whether instantiation was successful. If it failed, the reason why
    type(c_ptr) :: uploadStream !< Upload stream
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
    integer(c_int) :: flags !< Must be zero.
    integer(c_int) :: reserved(3) !< Must be zero.
    type(hipMemcpy3DParms) :: copyParams !< Params set for the memory copy.
  end type hipMemcpyNodeParams

  type, bind(c) :: hipChildGraphNodeParams
    type(c_ptr) :: graph !< Either the child graph to clone into the node, or a handle to the graph possesed by the node used...
  end type hipChildGraphNodeParams

  type, bind(c) :: hipEventWaitNodeParams
    type(c_ptr) :: event !< Event to wait on
  end type hipEventWaitNodeParams

  type, bind(c) :: hipEventRecordNodeParams
    type(c_ptr) :: event !< The event to be recorded when node executes
  end type hipEventRecordNodeParams

  type, bind(c) :: hipMemFreeNodeParams
    type(c_ptr) :: dptr !< the pointer to be freed
  end type hipMemFreeNodeParams

  type, bind(c) :: hipGraphNodeParams
    integer(c_int) :: type
    integer(c_int) :: reserved0(3)
    integer(c_int64_t) :: reserved2
  end type hipGraphNodeParams

  type, bind(c) :: hipGraphEdgeData
    character(c_char) :: from_port !< This indicates when the dependency is triggered from the upstream node on the edge. The...
    character(c_char) :: reserved(5) !< These bytes are unused and must be zeroed
    character(c_char) :: to_port !< Currently no node types define non-zero ports. This field must be set to zero.
    character(c_char) :: type !< This should be populated with a value from hipGraphDependencyType
  end type hipGraphEdgeData

  type, bind(c) :: hipLaunchAttribute
    integer(c_int) :: id !< Identifier of the launch attribute
    character(c_char) :: pad(4) !< Padding to align the structure to 8 bytes
  end type hipLaunchAttribute

  type, bind(c) :: hipLaunchConfig_t
    type(dim3) :: gridDim !< Grid dimensions
    type(dim3) :: blockDim !< Block dimensions
    integer(c_size_t) :: dynamicSmemBytes !< Dynamic shared-memory size per thread block
    type(c_ptr) :: stream !< Stream identifier
    type(c_ptr) :: attrs !< Attributes list
    integer(c_int) :: numAttrs !< Number of attributes
  end type hipLaunchConfig_t

  type, bind(c) :: HIP_LAUNCH_CONFIG
    integer(c_int) :: gridDimX !< Grid width in blocks
    integer(c_int) :: gridDimY !< Grid height in blocks
    integer(c_int) :: gridDimZ !< Grid depth in blocks
    integer(c_int) :: blockDimX !< Thread block dimension in X
    integer(c_int) :: blockDimY !< Thread block dimension in Y
    integer(c_int) :: blockDimZ !< Thread block dimension in Z
    integer(c_int) :: sharedMemBytes !< Dynamic shared-memory size in bytes per block
    type(c_ptr) :: hStream !< HIP stream identifier
    type(c_ptr) :: attrs !< Attribute list
    integer(c_int) :: numAttrs !< Number of attributes
  end type HIP_LAUNCH_CONFIG

end module hipfort_types
