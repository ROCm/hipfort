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

module hipfort_enums
  use, intrinsic :: iso_c_binding
  implicit none

  ! hipJitOption
  enum, bind(c)
    enumerator :: hipJitOptionMaxRegisters = 0
    enumerator :: hipJitOptionThreadsPerBlock = 1
    enumerator :: hipJitOptionWallTime = 2
    enumerator :: hipJitOptionInfoLogBuffer = 3
    enumerator :: hipJitOptionInfoLogBufferSizeBytes = 4
    enumerator :: hipJitOptionErrorLogBuffer = 5
    enumerator :: hipJitOptionErrorLogBufferSizeBytes = 6
    enumerator :: hipJitOptionOptimizationLevel = 7
    enumerator :: hipJitOptionTargetFromContext = 8
    enumerator :: hipJitOptionTarget = 9
    enumerator :: hipJitOptionFallbackStrategy = 10
    enumerator :: hipJitOptionGenerateDebugInfo = 11
    enumerator :: hipJitOptionLogVerbose = 12
    enumerator :: hipJitOptionGenerateLineInfo = 13
    enumerator :: hipJitOptionCacheMode = 14
    enumerator :: hipJitOptionSm3xOpt = 15
    enumerator :: hipJitOptionFastCompile = 16
    enumerator :: hipJitOptionGlobalSymbolNames = 17
    enumerator :: hipJitOptionGlobalSymbolAddresses = 18
    enumerator :: hipJitOptionGlobalSymbolCount = 19
    enumerator :: hipJitOptionLto = 20
    enumerator :: hipJitOptionFtz = 21
    enumerator :: hipJitOptionPrecDiv = 22
    enumerator :: hipJitOptionPrecSqrt = 23
    enumerator :: hipJitOptionFma = 24
    enumerator :: hipJitOptionPositionIndependentCode = 25
    enumerator :: hipJitOptionMinCTAPerSM = 26
    enumerator :: hipJitOptionMaxThreadsPerBlock = 27
    enumerator :: hipJitOptionOverrideDirectiveValues = 28
    enumerator :: hipJitOptionNumOptions = 29
    enumerator :: hipJitOptionIRtoISAOptExt = 10000
    enumerator :: hipJitOptionIRtoISAOptCountExt = 10001
  end enum

  ! hipJitInputType
  enum, bind(c)
    enumerator :: hipJitInputCubin = 0
    enumerator :: hipJitInputPtx = 1
    enumerator :: hipJitInputFatBinary = 2
    enumerator :: hipJitInputObject = 3
    enumerator :: hipJitInputLibrary = 4
    enumerator :: hipJitInputNvvm = 5
    enumerator :: hipJitNumLegacyInputTypes = 6
    enumerator :: hipJitInputLLVMBitcode = 100
    enumerator :: hipJitInputLLVMBundledBitcode = 101
    enumerator :: hipJitInputLLVMArchivesOfBundledBitcode = 102
    enumerator :: hipJitInputSpirv = 103
    enumerator :: hipJitNumInputTypes = 10
  end enum

  ! hipJitCacheMode
  enum, bind(c)
    enumerator :: hipJitCacheOptionNone = 0
    enumerator :: hipJitCacheOptionCG = 1
    enumerator :: hipJitCacheOptionCA = 2
  end enum

  ! hipJitFallback
  enum, bind(c)
    enumerator :: hipJitPreferPTX = 0
    enumerator :: hipJitPreferBinary = 1
  end enum

  ! hipLibraryOption_e
  enum, bind(c)
    enumerator :: hipLibraryHostUniversalFunctionAndDataTable = 0
    enumerator :: hipLibraryBinaryIsPreserved = 1
  end enum

  ! enum (unnamed at /opt/rocm/include/hip/hip_runtime_api.h:49:1)
  enum, bind(c)
    enumerator :: HIP_SUCCESS = 0
    enumerator :: HIP_ERROR_INVALID_VALUE = 1
    enumerator :: HIP_ERROR_NOT_INITIALIZED = 2
    enumerator :: HIP_ERROR_LAUNCH_OUT_OF_RESOURCES = 3
  end enum

  ! hipMemoryType
  enum, bind(c)
    enumerator :: hipMemoryTypeUnregistered = 0
    enumerator :: hipMemoryTypeHost = 1
    enumerator :: hipMemoryTypeDevice = 2
    enumerator :: hipMemoryTypeManaged = 3
    enumerator :: hipMemoryTypeArray = 10
    enumerator :: hipMemoryTypeUnified = 11
  end enum

  ! hipError_t
  enum, bind(c)
    enumerator :: hipSuccess = 0
    enumerator :: hipErrorInvalidValue = 1
    enumerator :: hipErrorOutOfMemory = 2
    enumerator :: hipErrorMemoryAllocation = 2
    enumerator :: hipErrorNotInitialized = 3
    enumerator :: hipErrorInitializationError = 3
    enumerator :: hipErrorDeinitialized = 4
    enumerator :: hipErrorProfilerDisabled = 5
    enumerator :: hipErrorProfilerNotInitialized = 6
    enumerator :: hipErrorProfilerAlreadyStarted = 7
    enumerator :: hipErrorProfilerAlreadyStopped = 8
    enumerator :: hipErrorInvalidConfiguration = 9
    enumerator :: hipErrorInvalidPitchValue = 12
    enumerator :: hipErrorInvalidSymbol = 13
    enumerator :: hipErrorInvalidDevicePointer = 17
    enumerator :: hipErrorInvalidMemcpyDirection = 21
    enumerator :: hipErrorInsufficientDriver = 35
    enumerator :: hipErrorMissingConfiguration = 52
    enumerator :: hipErrorPriorLaunchFailure = 53
    enumerator :: hipErrorInvalidDeviceFunction = 98
    enumerator :: hipErrorNoDevice = 100
    enumerator :: hipErrorInvalidDevice = 101
    enumerator :: hipErrorInvalidImage = 200
    enumerator :: hipErrorInvalidContext = 201
    enumerator :: hipErrorContextAlreadyCurrent = 202
    enumerator :: hipErrorMapFailed = 205
    enumerator :: hipErrorMapBufferObjectFailed = 205
    enumerator :: hipErrorUnmapFailed = 206
    enumerator :: hipErrorArrayIsMapped = 207
    enumerator :: hipErrorAlreadyMapped = 208
    enumerator :: hipErrorNoBinaryForGpu = 209
    enumerator :: hipErrorAlreadyAcquired = 210
    enumerator :: hipErrorNotMapped = 211
    enumerator :: hipErrorNotMappedAsArray = 212
    enumerator :: hipErrorNotMappedAsPointer = 213
    enumerator :: hipErrorECCNotCorrectable = 214
    enumerator :: hipErrorUnsupportedLimit = 215
    enumerator :: hipErrorContextAlreadyInUse = 216
    enumerator :: hipErrorPeerAccessUnsupported = 217
    enumerator :: hipErrorInvalidKernelFile = 218
    enumerator :: hipErrorInvalidGraphicsContext = 219
    enumerator :: hipErrorInvalidSource = 300
    enumerator :: hipErrorFileNotFound = 301
    enumerator :: hipErrorSharedObjectSymbolNotFound = 302
    enumerator :: hipErrorSharedObjectInitFailed = 303
    enumerator :: hipErrorOperatingSystem = 304
    enumerator :: hipErrorInvalidHandle = 400
    enumerator :: hipErrorInvalidResourceHandle = 400
    enumerator :: hipErrorIllegalState = 401
    enumerator :: hipErrorNotFound = 500
    enumerator :: hipErrorNotReady = 600
    enumerator :: hipErrorIllegalAddress = 700
    enumerator :: hipErrorLaunchOutOfResources = 701
    enumerator :: hipErrorLaunchTimeOut = 702
    enumerator :: hipErrorPeerAccessAlreadyEnabled = 704
    enumerator :: hipErrorPeerAccessNotEnabled = 705
    enumerator :: hipErrorSetOnActiveProcess = 708
    enumerator :: hipErrorContextIsDestroyed = 709
    enumerator :: hipErrorAssert = 710
    enumerator :: hipErrorHostMemoryAlreadyRegistered = 712
    enumerator :: hipErrorHostMemoryNotRegistered = 713
    enumerator :: hipErrorLaunchFailure = 719
    enumerator :: hipErrorCooperativeLaunchTooLarge = 720
    enumerator :: hipErrorNotSupported = 801
    enumerator :: hipErrorStreamCaptureUnsupported = 900
    enumerator :: hipErrorStreamCaptureInvalidated = 901
    enumerator :: hipErrorStreamCaptureMerge = 902
    enumerator :: hipErrorStreamCaptureUnmatched = 903
    enumerator :: hipErrorStreamCaptureUnjoined = 904
    enumerator :: hipErrorStreamCaptureIsolation = 905
    enumerator :: hipErrorStreamCaptureImplicit = 906
    enumerator :: hipErrorCapturedEvent = 907
    enumerator :: hipErrorStreamCaptureWrongThread = 908
    enumerator :: hipErrorGraphExecUpdateFailure = 910
    enumerator :: hipErrorInvalidChannelDescriptor = 911
    enumerator :: hipErrorInvalidTexture = 912
    enumerator :: hipErrorUnknown = 999
    enumerator :: hipErrorRuntimeMemory = 1052
    enumerator :: hipErrorRuntimeOther = 1053
    enumerator :: hipErrorTbd = 1054
  end enum

  ! hipDeviceAttribute_t
  enum, bind(c)
    enumerator :: hipDeviceAttributeCudaCompatibleBegin = 0
    enumerator :: hipDeviceAttributeEccEnabled = 0
    enumerator :: hipDeviceAttributeAccessPolicyMaxWindowSize = 1
    enumerator :: hipDeviceAttributeAsyncEngineCount = 2
    enumerator :: hipDeviceAttributeCanMapHostMemory = 3
    enumerator :: hipDeviceAttributeCanUseHostPointerForRegisteredMem = 4
    enumerator :: hipDeviceAttributeClockRate = 5
    enumerator :: hipDeviceAttributeComputeMode = 6
    enumerator :: hipDeviceAttributeComputePreemptionSupported = 7
    enumerator :: hipDeviceAttributeConcurrentKernels = 8
    enumerator :: hipDeviceAttributeConcurrentManagedAccess = 9
    enumerator :: hipDeviceAttributeCooperativeLaunch = 10
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceLaunch = 11
    enumerator :: hipDeviceAttributeDeviceOverlap = 12
    enumerator :: hipDeviceAttributeDirectManagedMemAccessFromHost = 13
    enumerator :: hipDeviceAttributeGlobalL1CacheSupported = 14
    enumerator :: hipDeviceAttributeHostNativeAtomicSupported = 15
    enumerator :: hipDeviceAttributeIntegrated = 16
    enumerator :: hipDeviceAttributeIsMultiGpuBoard = 17
    enumerator :: hipDeviceAttributeKernelExecTimeout = 18
    enumerator :: hipDeviceAttributeL2CacheSize = 19
    enumerator :: hipDeviceAttributeLocalL1CacheSupported = 20
    enumerator :: hipDeviceAttributeLuid = 21
    enumerator :: hipDeviceAttributeLuidDeviceNodeMask = 22
    enumerator :: hipDeviceAttributeComputeCapabilityMajor = 23
    enumerator :: hipDeviceAttributeManagedMemory = 24
    enumerator :: hipDeviceAttributeMaxBlocksPerMultiProcessor = 25
    enumerator :: hipDeviceAttributeMaxBlockDimX = 26
    enumerator :: hipDeviceAttributeMaxBlockDimY = 27
    enumerator :: hipDeviceAttributeMaxBlockDimZ = 28
    enumerator :: hipDeviceAttributeMaxGridDimX = 29
    enumerator :: hipDeviceAttributeMaxGridDimY = 30
    enumerator :: hipDeviceAttributeMaxGridDimZ = 31
    enumerator :: hipDeviceAttributeMaxSurface1D = 32
    enumerator :: hipDeviceAttributeMaxSurface1DLayered = 33
    enumerator :: hipDeviceAttributeMaxSurface2D = 34
    enumerator :: hipDeviceAttributeMaxSurface2DLayered = 35
    enumerator :: hipDeviceAttributeMaxSurface3D = 36
    enumerator :: hipDeviceAttributeMaxSurfaceCubemap = 37
    enumerator :: hipDeviceAttributeMaxSurfaceCubemapLayered = 38
    enumerator :: hipDeviceAttributeMaxTexture1DWidth = 39
    enumerator :: hipDeviceAttributeMaxTexture1DLayered = 40
    enumerator :: hipDeviceAttributeMaxTexture1DLinear = 41
    enumerator :: hipDeviceAttributeMaxTexture1DMipmap = 42
    enumerator :: hipDeviceAttributeMaxTexture2DWidth = 43
    enumerator :: hipDeviceAttributeMaxTexture2DHeight = 44
    enumerator :: hipDeviceAttributeMaxTexture2DGather = 45
    enumerator :: hipDeviceAttributeMaxTexture2DLayered = 46
    enumerator :: hipDeviceAttributeMaxTexture2DLinear = 47
    enumerator :: hipDeviceAttributeMaxTexture2DMipmap = 48
    enumerator :: hipDeviceAttributeMaxTexture3DWidth = 49
    enumerator :: hipDeviceAttributeMaxTexture3DHeight = 50
    enumerator :: hipDeviceAttributeMaxTexture3DDepth = 51
    enumerator :: hipDeviceAttributeMaxTexture3DAlt = 52
    enumerator :: hipDeviceAttributeMaxTextureCubemap = 53
    enumerator :: hipDeviceAttributeMaxTextureCubemapLayered = 54
    enumerator :: hipDeviceAttributeMaxThreadsDim = 55
    enumerator :: hipDeviceAttributeMaxThreadsPerBlock = 56
    enumerator :: hipDeviceAttributeMaxThreadsPerMultiProcessor = 57
    enumerator :: hipDeviceAttributeMaxPitch = 58
    enumerator :: hipDeviceAttributeMemoryBusWidth = 59
    enumerator :: hipDeviceAttributeMemoryClockRate = 60
    enumerator :: hipDeviceAttributeComputeCapabilityMinor = 61
    enumerator :: hipDeviceAttributeMultiGpuBoardGroupID = 62
    enumerator :: hipDeviceAttributeMultiprocessorCount = 63
    enumerator :: hipDeviceAttributeUnused1 = 64
    enumerator :: hipDeviceAttributePageableMemoryAccess = 65
    enumerator :: hipDeviceAttributePageableMemoryAccessUsesHostPageTables = 66
    enumerator :: hipDeviceAttributePciBusId = 67
    enumerator :: hipDeviceAttributePciDeviceId = 68
    enumerator :: hipDeviceAttributePciDomainId = 69
    enumerator :: hipDeviceAttributePersistingL2CacheMaxSize = 70
    enumerator :: hipDeviceAttributeMaxRegistersPerBlock = 71
    enumerator :: hipDeviceAttributeMaxRegistersPerMultiprocessor = 72
    enumerator :: hipDeviceAttributeReservedSharedMemPerBlock = 73
    enumerator :: hipDeviceAttributeMaxSharedMemoryPerBlock = 74
    enumerator :: hipDeviceAttributeSharedMemPerBlockOptin = 75
    enumerator :: hipDeviceAttributeSharedMemPerMultiprocessor = 76
    enumerator :: hipDeviceAttributeSingleToDoublePrecisionPerfRatio = 77
    enumerator :: hipDeviceAttributeStreamPrioritiesSupported = 78
    enumerator :: hipDeviceAttributeSurfaceAlignment = 79
    enumerator :: hipDeviceAttributeTccDriver = 80
    enumerator :: hipDeviceAttributeTextureAlignment = 81
    enumerator :: hipDeviceAttributeTexturePitchAlignment = 82
    enumerator :: hipDeviceAttributeTotalConstantMemory = 83
    enumerator :: hipDeviceAttributeTotalGlobalMem = 84
    enumerator :: hipDeviceAttributeUnifiedAddressing = 85
    enumerator :: hipDeviceAttributeUnused2 = 86
    enumerator :: hipDeviceAttributeWarpSize = 87
    enumerator :: hipDeviceAttributeMemoryPoolsSupported = 88
    enumerator :: hipDeviceAttributeVirtualMemoryManagementSupported = 89
    enumerator :: hipDeviceAttributeHostRegisterSupported = 90
    enumerator :: hipDeviceAttributeMemoryPoolSupportedHandleTypes = 91
    enumerator :: hipDeviceAttributeHostNumaId = 92
    enumerator :: hipDeviceAttributeCudaCompatibleEnd = 9999
    enumerator :: hipDeviceAttributeAmdSpecificBegin = 10000
    enumerator :: hipDeviceAttributeClockInstructionRate = 10000
    enumerator :: hipDeviceAttributeUnused3 = 10001
    enumerator :: hipDeviceAttributeMaxSharedMemoryPerMultiprocessor = 10002
    enumerator :: hipDeviceAttributeUnused4 = 10003
    enumerator :: hipDeviceAttributeUnused5 = 10004
    enumerator :: hipDeviceAttributeHdpMemFlushCntl = 10005
    enumerator :: hipDeviceAttributeHdpRegFlushCntl = 10006
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceUnmatchedFunc = 10007
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceUnmatchedGridDim = 10008
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceUnmatchedBlockDim = 10009
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceUnmatchedSharedMem = 10010
    enumerator :: hipDeviceAttributeIsLargeBar = 10011
    enumerator :: hipDeviceAttributeAsicRevision = 10012
    enumerator :: hipDeviceAttributeCanUseStreamWaitValue = 10013
    enumerator :: hipDeviceAttributeImageSupport = 10014
    enumerator :: hipDeviceAttributePhysicalMultiProcessorCount = 10015
    enumerator :: hipDeviceAttributeFineGrainSupport = 10016
    enumerator :: hipDeviceAttributeWallClockRate = 10017
    enumerator :: hipDeviceAttributeNumberOfXccs = 10018
    enumerator :: hipDeviceAttributeMaxAvailableVgprsPerThread = 10019
    enumerator :: hipDeviceAttributePciChipId = 10020
    enumerator :: hipDeviceAttributeAmdSpecificEnd = 19999
    enumerator :: hipDeviceAttributeVendorSpecificBegin = 20000
  end enum

  ! hipDriverProcAddressQueryResult
  enum, bind(c)
    enumerator :: HIP_GET_PROC_ADDRESS_SUCCESS = 0
    enumerator :: HIP_GET_PROC_ADDRESS_SYMBOL_NOT_FOUND = 1
    enumerator :: HIP_GET_PROC_ADDRESS_VERSION_NOT_SUFFICIENT = 2
  end enum

  ! hipComputeMode
  enum, bind(c)
    enumerator :: hipComputeModeDefault = 0
    enumerator :: hipComputeModeExclusive = 1
    enumerator :: hipComputeModeProhibited = 2
    enumerator :: hipComputeModeExclusiveProcess = 3
  end enum

  ! hipFlushGPUDirectRDMAWritesOptions
  enum, bind(c)
    enumerator :: hipFlushGPUDirectRDMAWritesOptionHost = 1
    enumerator :: hipFlushGPUDirectRDMAWritesOptionMemOps = 2
  end enum

  ! hipGPUDirectRDMAWritesOrdering
  enum, bind(c)
    enumerator :: hipGPUDirectRDMAWritesOrderingNone = 0
    enumerator :: hipGPUDirectRDMAWritesOrderingOwner = 100
    enumerator :: hipGPUDirectRDMAWritesOrderingAllDevices = 200
  end enum

  ! hipChannelFormatKind
  enum, bind(c)
    enumerator :: hipChannelFormatKindSigned = 0
    enumerator :: hipChannelFormatKindUnsigned = 1
    enumerator :: hipChannelFormatKindFloat = 2
    enumerator :: hipChannelFormatKindNone = 3
  end enum

  ! hipArray_Format
  enum, bind(c)
    enumerator :: HIP_AD_FORMAT_UNSIGNED_INT8 = 1
    enumerator :: HIP_AD_FORMAT_UNSIGNED_INT16 = 2
    enumerator :: HIP_AD_FORMAT_UNSIGNED_INT32 = 3
    enumerator :: HIP_AD_FORMAT_SIGNED_INT8 = 8
    enumerator :: HIP_AD_FORMAT_SIGNED_INT16 = 9
    enumerator :: HIP_AD_FORMAT_SIGNED_INT32 = 10
    enumerator :: HIP_AD_FORMAT_HALF = 16
    enumerator :: HIP_AD_FORMAT_FLOAT = 32
  end enum

  ! hipResourceType
  enum, bind(c)
    enumerator :: hipResourceTypeArray = 0
    enumerator :: hipResourceTypeMipmappedArray = 1
    enumerator :: hipResourceTypeLinear = 2
    enumerator :: hipResourceTypePitch2D = 3
  end enum

  ! HIPresourcetype_enum
  enum, bind(c)
    enumerator :: HIP_RESOURCE_TYPE_ARRAY = 0
    enumerator :: HIP_RESOURCE_TYPE_MIPMAPPED_ARRAY = 1
    enumerator :: HIP_RESOURCE_TYPE_LINEAR = 2
    enumerator :: HIP_RESOURCE_TYPE_PITCH2D = 3
  end enum

  ! HIPaddress_mode_enum
  enum, bind(c)
    enumerator :: HIP_TR_ADDRESS_MODE_WRAP = 0
    enumerator :: HIP_TR_ADDRESS_MODE_CLAMP = 1
    enumerator :: HIP_TR_ADDRESS_MODE_MIRROR = 2
    enumerator :: HIP_TR_ADDRESS_MODE_BORDER = 3
  end enum

  ! HIPfilter_mode_enum
  enum, bind(c)
    enumerator :: HIP_TR_FILTER_MODE_POINT = 0
    enumerator :: HIP_TR_FILTER_MODE_LINEAR = 1
  end enum

  ! hipResourceViewFormat
  enum, bind(c)
    enumerator :: hipResViewFormatNone = 0
    enumerator :: hipResViewFormatUnsignedChar1 = 1
    enumerator :: hipResViewFormatUnsignedChar2 = 2
    enumerator :: hipResViewFormatUnsignedChar4 = 3
    enumerator :: hipResViewFormatSignedChar1 = 4
    enumerator :: hipResViewFormatSignedChar2 = 5
    enumerator :: hipResViewFormatSignedChar4 = 6
    enumerator :: hipResViewFormatUnsignedShort1 = 7
    enumerator :: hipResViewFormatUnsignedShort2 = 8
    enumerator :: hipResViewFormatUnsignedShort4 = 9
    enumerator :: hipResViewFormatSignedShort1 = 10
    enumerator :: hipResViewFormatSignedShort2 = 11
    enumerator :: hipResViewFormatSignedShort4 = 12
    enumerator :: hipResViewFormatUnsignedInt1 = 13
    enumerator :: hipResViewFormatUnsignedInt2 = 14
    enumerator :: hipResViewFormatUnsignedInt4 = 15
    enumerator :: hipResViewFormatSignedInt1 = 16
    enumerator :: hipResViewFormatSignedInt2 = 17
    enumerator :: hipResViewFormatSignedInt4 = 18
    enumerator :: hipResViewFormatHalf1 = 19
    enumerator :: hipResViewFormatHalf2 = 20
    enumerator :: hipResViewFormatHalf4 = 21
    enumerator :: hipResViewFormatFloat1 = 22
    enumerator :: hipResViewFormatFloat2 = 23
    enumerator :: hipResViewFormatFloat4 = 24
    enumerator :: hipResViewFormatUnsignedBlockCompressed1 = 25
    enumerator :: hipResViewFormatUnsignedBlockCompressed2 = 26
    enumerator :: hipResViewFormatUnsignedBlockCompressed3 = 27
    enumerator :: hipResViewFormatUnsignedBlockCompressed4 = 28
    enumerator :: hipResViewFormatSignedBlockCompressed4 = 29
    enumerator :: hipResViewFormatUnsignedBlockCompressed5 = 30
    enumerator :: hipResViewFormatSignedBlockCompressed5 = 31
    enumerator :: hipResViewFormatUnsignedBlockCompressed6H = 32
    enumerator :: hipResViewFormatSignedBlockCompressed6H = 33
    enumerator :: hipResViewFormatUnsignedBlockCompressed7 = 34
  end enum

  ! HIPresourceViewFormat_enum
  enum, bind(c)
    enumerator :: HIP_RES_VIEW_FORMAT_NONE = 0
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_1X8 = 1
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_2X8 = 2
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_4X8 = 3
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_1X8 = 4
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_2X8 = 5
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_4X8 = 6
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_1X16 = 7
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_2X16 = 8
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_4X16 = 9
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_1X16 = 10
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_2X16 = 11
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_4X16 = 12
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_1X32 = 13
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_2X32 = 14
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_4X32 = 15
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_1X32 = 16
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_2X32 = 17
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_4X32 = 18
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_1X16 = 19
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_2X16 = 20
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_4X16 = 21
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_1X32 = 22
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_2X32 = 23
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_4X32 = 24
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC1 = 25
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC2 = 26
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC3 = 27
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC4 = 28
    enumerator :: HIP_RES_VIEW_FORMAT_SIGNED_BC4 = 29
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC5 = 30
    enumerator :: HIP_RES_VIEW_FORMAT_SIGNED_BC5 = 31
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC6H = 32
    enumerator :: HIP_RES_VIEW_FORMAT_SIGNED_BC6H = 33
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC7 = 34
  end enum

  ! hipMemcpyKind
  enum, bind(c)
    enumerator :: hipMemcpyHostToHost = 0
    enumerator :: hipMemcpyHostToDevice = 1
    enumerator :: hipMemcpyDeviceToHost = 2
    enumerator :: hipMemcpyDeviceToDevice = 3
    enumerator :: hipMemcpyDefault = 4
    enumerator :: hipMemcpyDeviceToDeviceNoCU = 1024
  end enum

  ! hipMemLocationType
  enum, bind(c)
    enumerator :: hipMemLocationTypeInvalid = 0
    enumerator :: hipMemLocationTypeNone = 0
    enumerator :: hipMemLocationTypeDevice = 1
    enumerator :: hipMemLocationTypeHost = 2
    enumerator :: hipMemLocationTypeHostNuma = 3
    enumerator :: hipMemLocationTypeHostNumaCurrent = 4
  end enum

  ! hipMemcpyFlags
  enum, bind(c)
    enumerator :: hipMemcpyFlagDefault = 0
    enumerator :: hipMemcpyFlagPreferOverlapWithCompute = 1
  end enum

  ! hipMemcpySrcAccessOrder
  enum, bind(c)
    enumerator :: hipMemcpySrcAccessOrderInvalid = 0
    enumerator :: hipMemcpySrcAccessOrderStream = 1
    enumerator :: hipMemcpySrcAccessOrderDuringApiCall = 2
    enumerator :: hipMemcpySrcAccessOrderAny = 3
    enumerator :: hipMemcpySrcAccessOrderMax = 2147483647
  end enum

  ! hipMemcpy3DOperandType
  enum, bind(c)
    enumerator :: hipMemcpyOperandTypePointer = 1
    enumerator :: hipMemcpyOperandTypeArray = 2
    enumerator :: hipMemcpyOperandTypeMax = 2147483647
  end enum

  ! hipFunction_attribute
  enum, bind(c)
    enumerator :: HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK = 0
    enumerator :: HIP_FUNC_ATTRIBUTE_SHARED_SIZE_BYTES = 1
    enumerator :: HIP_FUNC_ATTRIBUTE_CONST_SIZE_BYTES = 2
    enumerator :: HIP_FUNC_ATTRIBUTE_LOCAL_SIZE_BYTES = 3
    enumerator :: HIP_FUNC_ATTRIBUTE_NUM_REGS = 4
    enumerator :: HIP_FUNC_ATTRIBUTE_PTX_VERSION = 5
    enumerator :: HIP_FUNC_ATTRIBUTE_BINARY_VERSION = 6
    enumerator :: HIP_FUNC_ATTRIBUTE_CACHE_MODE_CA = 7
    enumerator :: HIP_FUNC_ATTRIBUTE_MAX_DYNAMIC_SHARED_SIZE_BYTES = 8
    enumerator :: HIP_FUNC_ATTRIBUTE_PREFERRED_SHARED_MEMORY_CARVEOUT = 9
    enumerator :: HIP_FUNC_ATTRIBUTE_MAX = 10
  end enum

  ! hipPointer_attribute
  enum, bind(c)
    enumerator :: HIP_POINTER_ATTRIBUTE_CONTEXT = 1
    enumerator :: HIP_POINTER_ATTRIBUTE_MEMORY_TYPE = 2
    enumerator :: HIP_POINTER_ATTRIBUTE_DEVICE_POINTER = 3
    enumerator :: HIP_POINTER_ATTRIBUTE_HOST_POINTER = 4
    enumerator :: HIP_POINTER_ATTRIBUTE_P2P_TOKENS = 5
    enumerator :: HIP_POINTER_ATTRIBUTE_SYNC_MEMOPS = 6
    enumerator :: HIP_POINTER_ATTRIBUTE_BUFFER_ID = 7
    enumerator :: HIP_POINTER_ATTRIBUTE_IS_MANAGED = 8
    enumerator :: HIP_POINTER_ATTRIBUTE_DEVICE_ORDINAL = 9
    enumerator :: HIP_POINTER_ATTRIBUTE_IS_LEGACY_HIP_IPC_CAPABLE = 10
    enumerator :: HIP_POINTER_ATTRIBUTE_RANGE_START_ADDR = 11
    enumerator :: HIP_POINTER_ATTRIBUTE_RANGE_SIZE = 12
    enumerator :: HIP_POINTER_ATTRIBUTE_MAPPED = 13
    enumerator :: HIP_POINTER_ATTRIBUTE_ALLOWED_HANDLE_TYPES = 14
    enumerator :: HIP_POINTER_ATTRIBUTE_IS_GPU_DIRECT_RDMA_CAPABLE = 15
    enumerator :: HIP_POINTER_ATTRIBUTE_ACCESS_FLAGS = 16
    enumerator :: HIP_POINTER_ATTRIBUTE_MEMPOOL_HANDLE = 17
  end enum

  ! hipTextureAddressMode
  enum, bind(c)
    enumerator :: hipAddressModeWrap = 0
    enumerator :: hipAddressModeClamp = 1
    enumerator :: hipAddressModeMirror = 2
    enumerator :: hipAddressModeBorder = 3
  end enum

  ! hipTextureFilterMode
  enum, bind(c)
    enumerator :: hipFilterModePoint = 0
    enumerator :: hipFilterModeLinear = 1
  end enum

  ! hipTextureReadMode
  enum, bind(c)
    enumerator :: hipReadModeElementType = 0
    enumerator :: hipReadModeNormalizedFloat = 1
  end enum

  ! hipSurfaceBoundaryMode
  enum, bind(c)
    enumerator :: hipBoundaryModeZero = 0
    enumerator :: hipBoundaryModeTrap = 1
    enumerator :: hipBoundaryModeClamp = 2
  end enum

  ! hipDeviceP2PAttr
  enum, bind(c)
    enumerator :: hipDevP2PAttrPerformanceRank = 0
    enumerator :: hipDevP2PAttrAccessSupported = 1
    enumerator :: hipDevP2PAttrNativeAtomicSupported = 2
    enumerator :: hipDevP2PAttrHipArrayAccessSupported = 3
  end enum

  ! hipDriverEntryPointQueryResult
  enum, bind(c)
    enumerator :: hipDriverEntryPointSuccess = 0
    enumerator :: hipDriverEntryPointSymbolNotFound = 1
    enumerator :: hipDriverEntryPointVersionNotSufficent = 2
  end enum

  ! hipLimit_t
  enum, bind(c)
    enumerator :: hipLimitStackSize = 0
    enumerator :: hipLimitPrintfFifoSize = 1
    enumerator :: hipLimitMallocHeapSize = 2
    enumerator :: hipExtLimitScratchMin = 4096
    enumerator :: hipExtLimitScratchMax = 4097
    enumerator :: hipExtLimitScratchCurrent = 4098
    enumerator :: hipLimitRange = 4099
  end enum

  ! hipStreamBatchMemOpType
  enum, bind(c)
    enumerator :: hipStreamMemOpWaitValue32 = 1
    enumerator :: hipStreamMemOpWriteValue32 = 2
    enumerator :: hipStreamMemOpWaitValue64 = 4
    enumerator :: hipStreamMemOpWriteValue64 = 5
    enumerator :: hipStreamMemOpBarrier = 6
    enumerator :: hipStreamMemOpFlushRemoteWrites = 3
  end enum

  ! hipMemoryAdvise
  enum, bind(c)
    enumerator :: hipMemAdviseSetReadMostly = 1
    enumerator :: hipMemAdviseUnsetReadMostly = 2
    enumerator :: hipMemAdviseSetPreferredLocation = 3
    enumerator :: hipMemAdviseUnsetPreferredLocation = 4
    enumerator :: hipMemAdviseSetAccessedBy = 5
    enumerator :: hipMemAdviseUnsetAccessedBy = 6
    enumerator :: hipMemAdviseSetCoarseGrain = 100
    enumerator :: hipMemAdviseUnsetCoarseGrain = 101
  end enum

  ! hipMemRangeCoherencyMode
  enum, bind(c)
    enumerator :: hipMemRangeCoherencyModeFineGrain = 0
    enumerator :: hipMemRangeCoherencyModeCoarseGrain = 1
    enumerator :: hipMemRangeCoherencyModeIndeterminate = 2
  end enum

  ! hipMemRangeAttribute
  enum, bind(c)
    enumerator :: hipMemRangeAttributeReadMostly = 1
    enumerator :: hipMemRangeAttributePreferredLocation = 2
    enumerator :: hipMemRangeAttributeAccessedBy = 3
    enumerator :: hipMemRangeAttributeLastPrefetchLocation = 4
    enumerator :: hipMemRangeAttributeCoherencyMode = 100
  end enum

  ! hipMemPoolAttr
  enum, bind(c)
    enumerator :: hipMemPoolReuseFollowEventDependencies = 1
    enumerator :: hipMemPoolReuseAllowOpportunistic = 2
    enumerator :: hipMemPoolReuseAllowInternalDependencies = 3
    enumerator :: hipMemPoolAttrReleaseThreshold = 4
    enumerator :: hipMemPoolAttrReservedMemCurrent = 5
    enumerator :: hipMemPoolAttrReservedMemHigh = 6
    enumerator :: hipMemPoolAttrUsedMemCurrent = 7
    enumerator :: hipMemPoolAttrUsedMemHigh = 8
  end enum

  ! hipMemAccessFlags
  enum, bind(c)
    enumerator :: hipMemAccessFlagsProtNone = 0
    enumerator :: hipMemAccessFlagsProtRead = 1
    enumerator :: hipMemAccessFlagsProtReadWrite = 3
  end enum

  ! hipMemAllocationType
  enum, bind(c)
    enumerator :: hipMemAllocationTypeInvalid = 0
    enumerator :: hipMemAllocationTypePinned = 1
    enumerator :: hipMemAllocationTypeUncached = 1073741824
    enumerator :: hipMemAllocationTypeMax = 2147483647
  end enum

  ! hipMemAllocationHandleType
  enum, bind(c)
    enumerator :: hipMemHandleTypeNone = 0
    enumerator :: hipMemHandleTypePosixFileDescriptor = 1
    enumerator :: hipMemHandleTypeWin32 = 2
    enumerator :: hipMemHandleTypeWin32Kmt = 4
  end enum

  ! hipFuncAttribute
  enum, bind(c)
    enumerator :: hipFuncAttributeMaxDynamicSharedMemorySize = 8
    enumerator :: hipFuncAttributePreferredSharedMemoryCarveout = 9
    enumerator :: hipFuncAttributeMax = 10
  end enum

  ! hipFuncCache_t
  enum, bind(c)
    enumerator :: hipFuncCachePreferNone = 0
    enumerator :: hipFuncCachePreferShared = 1
    enumerator :: hipFuncCachePreferL1 = 2
    enumerator :: hipFuncCachePreferEqual = 3
  end enum

  ! hipSharedMemConfig
  enum, bind(c)
    enumerator :: hipSharedMemBankSizeDefault = 0
    enumerator :: hipSharedMemBankSizeFourByte = 1
    enumerator :: hipSharedMemBankSizeEightByte = 2
  end enum

  ! hipExternalMemoryHandleType_enum
  enum, bind(c)
    enumerator :: hipExternalMemoryHandleTypeOpaqueFd = 1
    enumerator :: hipExternalMemoryHandleTypeOpaqueWin32 = 2
    enumerator :: hipExternalMemoryHandleTypeOpaqueWin32Kmt = 3
    enumerator :: hipExternalMemoryHandleTypeD3D12Heap = 4
    enumerator :: hipExternalMemoryHandleTypeD3D12Resource = 5
    enumerator :: hipExternalMemoryHandleTypeD3D11Resource = 6
    enumerator :: hipExternalMemoryHandleTypeD3D11ResourceKmt = 7
    enumerator :: hipExternalMemoryHandleTypeNvSciBuf = 8
  end enum

  ! hipExternalSemaphoreHandleType_enum
  enum, bind(c)
    enumerator :: hipExternalSemaphoreHandleTypeOpaqueFd = 1
    enumerator :: hipExternalSemaphoreHandleTypeOpaqueWin32 = 2
    enumerator :: hipExternalSemaphoreHandleTypeOpaqueWin32Kmt = 3
    enumerator :: hipExternalSemaphoreHandleTypeD3D12Fence = 4
    enumerator :: hipExternalSemaphoreHandleTypeD3D11Fence = 5
    enumerator :: hipExternalSemaphoreHandleTypeNvSciSync = 6
    enumerator :: hipExternalSemaphoreHandleTypeKeyedMutex = 7
    enumerator :: hipExternalSemaphoreHandleTypeKeyedMutexKmt = 8
    enumerator :: hipExternalSemaphoreHandleTypeTimelineSemaphoreFd = 9
    enumerator :: hipExternalSemaphoreHandleTypeTimelineSemaphoreWin32 = 10
  end enum

  ! hipGraphicsRegisterFlags
  enum, bind(c)
    enumerator :: hipGraphicsRegisterFlagsNone = 0
    enumerator :: hipGraphicsRegisterFlagsReadOnly = 1
    enumerator :: hipGraphicsRegisterFlagsWriteDiscard = 2
    enumerator :: hipGraphicsRegisterFlagsSurfaceLoadStore = 4
    enumerator :: hipGraphicsRegisterFlagsTextureGather = 8
  end enum

  ! hipGraphNodeType
  enum, bind(c)
    enumerator :: hipGraphNodeTypeKernel = 0
    enumerator :: hipGraphNodeTypeMemcpy = 1
    enumerator :: hipGraphNodeTypeMemset = 2
    enumerator :: hipGraphNodeTypeHost = 3
    enumerator :: hipGraphNodeTypeGraph = 4
    enumerator :: hipGraphNodeTypeEmpty = 5
    enumerator :: hipGraphNodeTypeWaitEvent = 6
    enumerator :: hipGraphNodeTypeEventRecord = 7
    enumerator :: hipGraphNodeTypeExtSemaphoreSignal = 8
    enumerator :: hipGraphNodeTypeExtSemaphoreWait = 9
    enumerator :: hipGraphNodeTypeMemAlloc = 10
    enumerator :: hipGraphNodeTypeMemFree = 11
    enumerator :: hipGraphNodeTypeMemcpyFromSymbol = 12
    enumerator :: hipGraphNodeTypeMemcpyToSymbol = 13
    enumerator :: hipGraphNodeTypeBatchMemOp = 14
    enumerator :: hipGraphNodeTypeCount = 15
  end enum

  ! hipAccessProperty
  enum, bind(c)
    enumerator :: hipAccessPropertyNormal = 0
    enumerator :: hipAccessPropertyStreaming = 1
    enumerator :: hipAccessPropertyPersisting = 2
  end enum

  ! hipLaunchMemSyncDomain
  enum, bind(c)
    enumerator :: hipLaunchMemSyncDomainDefault = 0
    enumerator :: hipLaunchMemSyncDomainRemote = 1
  end enum

  ! hipSynchronizationPolicy
  enum, bind(c)
    enumerator :: hipSyncPolicyAuto = 1
    enumerator :: hipSyncPolicySpin = 2
    enumerator :: hipSyncPolicyYield = 3
    enumerator :: hipSyncPolicyBlockingSync = 4
  end enum

  ! hipLaunchAttributeID
  enum, bind(c)
    enumerator :: hipLaunchAttributeAccessPolicyWindow = 1
    enumerator :: hipLaunchAttributeCooperative = 2
    enumerator :: hipLaunchAttributeSynchronizationPolicy = 3
    enumerator :: hipLaunchAttributePriority = 8
    enumerator :: hipLaunchAttributeMemSyncDomainMap = 9
    enumerator :: hipLaunchAttributeMemSyncDomain = 10
    enumerator :: hipLaunchAttributeMax = 11
  end enum

  ! hipGraphExecUpdateResult
  enum, bind(c)
    enumerator :: hipGraphExecUpdateSuccess = 0
    enumerator :: hipGraphExecUpdateError = 1
    enumerator :: hipGraphExecUpdateErrorTopologyChanged = 2
    enumerator :: hipGraphExecUpdateErrorNodeTypeChanged = 3
    enumerator :: hipGraphExecUpdateErrorFunctionChanged = 4
    enumerator :: hipGraphExecUpdateErrorParametersChanged = 5
    enumerator :: hipGraphExecUpdateErrorNotSupported = 6
    enumerator :: hipGraphExecUpdateErrorUnsupportedFunctionChange = 7
  end enum

  ! hipStreamCaptureMode
  enum, bind(c)
    enumerator :: hipStreamCaptureModeGlobal = 0
    enumerator :: hipStreamCaptureModeThreadLocal = 1
    enumerator :: hipStreamCaptureModeRelaxed = 2
  end enum

  ! hipStreamCaptureStatus
  enum, bind(c)
    enumerator :: hipStreamCaptureStatusNone = 0
    enumerator :: hipStreamCaptureStatusActive = 1
    enumerator :: hipStreamCaptureStatusInvalidated = 2
  end enum

  ! hipStreamUpdateCaptureDependenciesFlags
  enum, bind(c)
    enumerator :: hipStreamAddCaptureDependencies = 0
    enumerator :: hipStreamSetCaptureDependencies = 1
  end enum

  ! hipGraphMemAttributeType
  enum, bind(c)
    enumerator :: hipGraphMemAttrUsedMemCurrent = 0
    enumerator :: hipGraphMemAttrUsedMemHigh = 1
    enumerator :: hipGraphMemAttrReservedMemCurrent = 2
    enumerator :: hipGraphMemAttrReservedMemHigh = 3
  end enum

  ! hipUserObjectFlags
  enum, bind(c)
    enumerator :: hipUserObjectNoDestructorSync = 1
  end enum

  ! hipUserObjectRetainFlags
  enum, bind(c)
    enumerator :: hipGraphUserObjectMove = 1
  end enum

  ! hipGraphInstantiateFlags
  enum, bind(c)
    enumerator :: hipGraphInstantiateFlagAutoFreeOnLaunch = 1
    enumerator :: hipGraphInstantiateFlagUpload = 2
    enumerator :: hipGraphInstantiateFlagDeviceLaunch = 4
    enumerator :: hipGraphInstantiateFlagUseNodePriority = 8
  end enum

  ! hipGraphDebugDotFlags
  enum, bind(c)
    enumerator :: hipGraphDebugDotFlagsVerbose = 1
    enumerator :: hipGraphDebugDotFlagsKernelNodeParams = 4
    enumerator :: hipGraphDebugDotFlagsMemcpyNodeParams = 8
    enumerator :: hipGraphDebugDotFlagsMemsetNodeParams = 16
    enumerator :: hipGraphDebugDotFlagsHostNodeParams = 32
    enumerator :: hipGraphDebugDotFlagsEventNodeParams = 64
    enumerator :: hipGraphDebugDotFlagsExtSemasSignalNodeParams = 128
    enumerator :: hipGraphDebugDotFlagsExtSemasWaitNodeParams = 256
    enumerator :: hipGraphDebugDotFlagsKernelNodeAttributes = 512
    enumerator :: hipGraphDebugDotFlagsHandles = 1024
  end enum

  ! hipGraphInstantiateResult
  enum, bind(c)
    enumerator :: hipGraphInstantiateSuccess = 0
    enumerator :: hipGraphInstantiateError = 1
    enumerator :: hipGraphInstantiateInvalidStructure = 2
    enumerator :: hipGraphInstantiateNodeOperationNotSupported = 3
    enumerator :: hipGraphInstantiateMultipleDevicesNotSupported = 4
  end enum

  ! hipMemAllocationGranularity_flags
  enum, bind(c)
    enumerator :: hipMemAllocationGranularityMinimum = 0
    enumerator :: hipMemAllocationGranularityRecommended = 1
  end enum

  ! hipMemHandleType
  enum, bind(c)
    enumerator :: hipMemHandleTypeGeneric = 0
  end enum

  ! hipMemOperationType
  enum, bind(c)
    enumerator :: hipMemOperationTypeMap = 1
    enumerator :: hipMemOperationTypeUnmap = 2
  end enum

  ! hipArraySparseSubresourceType
  enum, bind(c)
    enumerator :: hipArraySparseSubresourceTypeSparseLevel = 0
    enumerator :: hipArraySparseSubresourceTypeMiptail = 1
  end enum

  ! hipGraphDependencyType
  enum, bind(c)
    enumerator :: hipGraphDependencyTypeDefault = 0
    enumerator :: hipGraphDependencyTypeProgrammatic = 1
  end enum

  ! hipMemRangeHandleType
  enum, bind(c)
    enumerator :: hipMemRangeHandleTypeDmaBufFd = 1
    enumerator :: hipMemRangeHandleTypeMax = 2147483647
  end enum

  ! hipMemRangeFlags
  enum, bind(c)
    enumerator :: hipMemRangeFlagDmaBufMappingTypePcie = 1
    enumerator :: hipMemRangeFlagsMax = 2147483647
  end enum

  integer(c_int), parameter :: HIP_VERSION_MAJOR = 7
  integer(c_int), parameter :: HIP_VERSION_MINOR = 2
  integer(c_int), parameter :: HIP_VERSION_PATCH = 53211
  integer(c_int), parameter :: HIP_VERSION_BUILD_ID = 0
  integer(c_int), parameter :: GENERIC_GRID_LAUNCH = 1
  integer(c_int), parameter :: HIP_TRSA_OVERRIDE_FORMAT = 1
  integer(c_int), parameter :: HIP_TRSF_READ_AS_INTEGER = 1
  integer(c_int), parameter :: HIP_TRSF_NORMALIZED_COORDINATES = 2
  integer(c_int), parameter :: HIP_TRSF_SRGB = 16
  integer(c_int), parameter :: hipTextureType1D = 1
  integer(c_int), parameter :: hipTextureType2D = 2
  integer(c_int), parameter :: hipTextureType3D = 3
  integer(c_int), parameter :: hipTextureTypeCubemap = 12
  integer(c_int), parameter :: hipTextureType1DLayered = 241
  integer(c_int), parameter :: hipTextureType2DLayered = 242
  integer(c_int), parameter :: hipTextureTypeCubemapLayered = 252
  integer(c_int), parameter :: HIP_IMAGE_OBJECT_SIZE_DWORD = 12
  integer(c_int), parameter :: HIP_SAMPLER_OBJECT_SIZE_DWORD = 8
  integer(c_int), parameter :: hipIpcMemLazyEnablePeerAccess = 1
  integer(c_int), parameter :: HIP_IPC_HANDLE_SIZE = 64
  integer(c_int), parameter :: hipStreamDefault = 0
  integer(c_int), parameter :: hipStreamNonBlocking = 1
  integer(c_int), parameter :: hipEventDefault = 0
  integer(c_int), parameter :: hipEventBlockingSync = 1
  integer(c_int), parameter :: hipEventDisableTiming = 2
  integer(c_int), parameter :: hipEventInterprocess = 4
  integer(c_int), parameter :: hipEventRecordDefault = 0
  integer(c_int), parameter :: hipEventRecordExternal = 1
  integer(c_int), parameter :: hipEventWaitDefault = 0
  integer(c_int), parameter :: hipEventWaitExternal = 1
  integer(c_int), parameter :: hipEventDisableSystemFence = 536870912
  integer(c_int), parameter :: hipEventReleaseToDevice = 1073741824
  integer(c_int64_t), parameter :: hipEventReleaseToSystem = 2147483648_c_int64_t
  integer(c_int), parameter :: hipEnableDefault = 0
  integer(c_int), parameter :: hipEnableLegacyStream = 1
  integer(c_int), parameter :: hipEnablePerThreadDefaultStream = 2
  integer(c_int), parameter :: hipHostAllocDefault = 0
  integer(c_int), parameter :: hipHostMallocDefault = 0
  integer(c_int), parameter :: hipHostAllocPortable = 1
  integer(c_int), parameter :: hipHostMallocPortable = 1
  integer(c_int), parameter :: hipHostAllocMapped = 2
  integer(c_int), parameter :: hipHostMallocMapped = 2
  integer(c_int), parameter :: hipHostAllocWriteCombined = 4
  integer(c_int), parameter :: hipHostMallocWriteCombined = 4
  integer(c_int), parameter :: hipHostMallocUncached = 268435456
  integer(c_int), parameter :: hipHostMallocNumaUser = 536870912
  integer(c_int), parameter :: hipHostMallocCoherent = 1073741824
  integer(c_int64_t), parameter :: hipHostMallocNonCoherent = 2147483648_c_int64_t
  integer(c_int), parameter :: hipMemAttachGlobal = 1
  integer(c_int), parameter :: hipMemAttachHost = 2
  integer(c_int), parameter :: hipMemAttachSingle = 4
  integer(c_int), parameter :: hipDeviceMallocDefault = 0
  integer(c_int), parameter :: hipDeviceMallocFinegrained = 1
  integer(c_int), parameter :: hipMallocSignalMemory = 2
  integer(c_int), parameter :: hipDeviceMallocUncached = 3
  integer(c_int), parameter :: hipDeviceMallocContiguous = 4
  integer(c_int), parameter :: hipHostRegisterDefault = 0
  integer(c_int), parameter :: hipHostRegisterPortable = 1
  integer(c_int), parameter :: hipHostRegisterMapped = 2
  integer(c_int), parameter :: hipHostRegisterIoMemory = 4
  integer(c_int), parameter :: hipHostRegisterReadOnly = 8
  integer(c_int), parameter :: hipExtHostRegisterCoarseGrained = 8
  integer(c_int64_t), parameter :: hipExtHostRegisterUncached = 2147483648_c_int64_t
  integer(c_int), parameter :: hipDeviceScheduleAuto = 0
  integer(c_int), parameter :: hipDeviceScheduleSpin = 1
  integer(c_int), parameter :: hipDeviceScheduleYield = 2
  integer(c_int), parameter :: hipDeviceScheduleBlockingSync = 4
  integer(c_int), parameter :: hipDeviceScheduleMask = 7
  integer(c_int), parameter :: hipDeviceMapHost = 8
  integer(c_int), parameter :: hipDeviceLmemResizeToMax = 16
  integer(c_int), parameter :: hipArrayDefault = 0
  integer(c_int), parameter :: hipArrayLayered = 1
  integer(c_int), parameter :: hipArraySurfaceLoadStore = 2
  integer(c_int), parameter :: hipArrayCubemap = 4
  integer(c_int), parameter :: hipArrayTextureGather = 8
  integer(c_int), parameter :: hipOccupancyDefault = 0
  integer(c_int), parameter :: hipOccupancyDisableCachingOverride = 1
  integer(c_int), parameter :: hipCooperativeLaunchMultiDeviceNoPreSync = 1
  integer(c_int), parameter :: hipCooperativeLaunchMultiDeviceNoPostSync = 2
  integer(c_int), parameter :: hipExtAnyOrderLaunch = 1
  integer(c_int), parameter :: hipStreamWaitValueGte = 0
  integer(c_int), parameter :: hipStreamWaitValueEq = 1
  integer(c_int), parameter :: hipStreamWaitValueAnd = 2
  integer(c_int), parameter :: hipStreamWaitValueNor = 3
  integer(c_int), parameter :: hipExternalMemoryDedicated = 1
  integer(c_int), parameter :: hipGraphKernelNodePortDefault = 0
  integer(c_int), parameter :: hipGraphKernelNodePortLaunchCompletion = 2
  integer(c_int), parameter :: hipGraphKernelNodePortProgrammatic = 1

end module hipfort_enums
