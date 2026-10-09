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

module hipfort_enums
  use, intrinsic :: iso_c_binding
  implicit none

  ! hipDataType
  enum, bind(c)
    enumerator :: HIP_R_32F = 0
    enumerator :: HIP_R_64F = 1
    enumerator :: HIP_R_16F = 2
    enumerator :: HIP_R_8I = 3
    enumerator :: HIP_C_32F = 4
    enumerator :: HIP_C_64F = 5
    enumerator :: HIP_C_16F = 6
    enumerator :: HIP_C_8I = 7
    enumerator :: HIP_R_8U = 8
    enumerator :: HIP_C_8U = 9
    enumerator :: HIP_R_32I = 10
    enumerator :: HIP_C_32I = 11
    enumerator :: HIP_R_32U = 12
    enumerator :: HIP_C_32U = 13
    enumerator :: HIP_R_16BF = 14
    enumerator :: HIP_C_16BF = 15
    enumerator :: HIP_R_4I = 16
    enumerator :: HIP_C_4I = 17
    enumerator :: HIP_R_4U = 18
    enumerator :: HIP_C_4U = 19
    enumerator :: HIP_R_16I = 20
    enumerator :: HIP_C_16I = 21
    enumerator :: HIP_R_16U = 22
    enumerator :: HIP_C_16U = 23
    enumerator :: HIP_R_64I = 24
    enumerator :: HIP_C_64I = 25
    enumerator :: HIP_R_64U = 26
    enumerator :: HIP_C_64U = 27
    enumerator :: HIP_R_8F_E4M3 = 28
    enumerator :: HIP_R_8F_E5M2 = 29
    enumerator :: HIP_R_8F_UE8M0 = 30
    enumerator :: HIP_R_6F_E2M3 = 31
    enumerator :: HIP_R_6F_E3M2 = 32
    enumerator :: HIP_R_4F_E2M1 = 33
    enumerator :: HIP_R_8F_E4M3_FNUZ = 1000
    enumerator :: HIP_R_8F_E5M2_FNUZ = 1001
  end enum

  ! hipLibraryPropertyType
  enum, bind(c)
    enumerator :: HIP_LIBRARY_MAJOR_VERSION = 0
    enumerator :: HIP_LIBRARY_MINOR_VERSION = 1
    enumerator :: HIP_LIBRARY_PATCH_LEVEL = 2
  end enum

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
#ifdef USE_CUDA_NAMES
    enumerator :: hipJitOptionPositionIndependentCode = 30
#else
    enumerator :: hipJitOptionPositionIndependentCode = 25
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipJitOptionMinCTAPerSM = 31
#else
    enumerator :: hipJitOptionMinCTAPerSM = 26
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipJitOptionMaxThreadsPerBlock = 32
#else
    enumerator :: hipJitOptionMaxThreadsPerBlock = 27
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipJitOptionOverrideDirectiveValues = 33
#else
    enumerator :: hipJitOptionOverrideDirectiveValues = 28
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipJitOptionNumOptions = 36
#else
    enumerator :: hipJitOptionNumOptions = 29
#endif
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
#ifdef USE_CUDA_NAMES
    enumerator :: hipJitNumLegacyInputTypes = -1
#else
    enumerator :: hipJitNumLegacyInputTypes = 6
#endif
    enumerator :: hipJitInputLLVMBitcode = 100
    enumerator :: hipJitInputLLVMBundledBitcode = 101
    enumerator :: hipJitInputLLVMArchivesOfBundledBitcode = 102
    enumerator :: hipJitInputSpirv = 103
#ifdef USE_CUDA_NAMES
    enumerator :: hipJitNumInputTypes = 6
#else
    enumerator :: hipJitNumInputTypes = 10
#endif
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

  ! enum (unnamed at hip/hip_runtime_api.h:33:1)
  enum, bind(c)
    enumerator :: HIP_SUCCESS = 0
    enumerator :: HIP_ERROR_INVALID_VALUE = 1
#ifdef USE_CUDA_NAMES
    enumerator :: HIP_ERROR_NOT_INITIALIZED = 3
#else
    enumerator :: HIP_ERROR_NOT_INITIALIZED = 2
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: HIP_ERROR_LAUNCH_OUT_OF_RESOURCES = 701
#else
    enumerator :: HIP_ERROR_LAUNCH_OUT_OF_RESOURCES = 3
#endif
  end enum

  ! hipMemoryType
  enum, bind(c)
    enumerator :: hipMemoryTypeUnregistered = 0
    enumerator :: hipMemoryTypeHost = 1
    enumerator :: hipMemoryTypeDevice = 2
    enumerator :: hipMemoryTypeManaged = 3
#ifdef USE_CUDA_NAMES
    enumerator :: hipMemoryTypeArray = 3
#else
    enumerator :: hipMemoryTypeArray = 10
#endif
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
#ifdef USE_CUDA_NAMES
    enumerator :: hipErrorInvalidChannelDescriptor = 20
#else
    enumerator :: hipErrorInvalidChannelDescriptor = 911
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipErrorInvalidTexture = 18
#else
    enumerator :: hipErrorInvalidTexture = 912
#endif
    enumerator :: hipErrorInvalidResourceType = 914
    enumerator :: hipErrorInvalidResourceConfiguration = 915
#ifdef USE_CUDA_NAMES
    enumerator :: hipErrorStreamDetached = 917
#else
    enumerator :: hipErrorStreamDetached = 916
#endif
    enumerator :: hipErrorUnknown = 999
    enumerator :: hipErrorRuntimeMemory = 1052
    enumerator :: hipErrorRuntimeOther = 1053
#ifdef USE_CUDA_NAMES
    enumerator :: hipErrorInvalidClusterSize = 912
#else
    enumerator :: hipErrorInvalidClusterSize = 1054
#endif
    enumerator :: hipErrorTbd = 1055
  end enum

  ! hipDeviceAttribute_t
  enum, bind(c)
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeCudaCompatibleBegin = 32
#else
    enumerator :: hipDeviceAttributeCudaCompatibleBegin = 0
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeEccEnabled = 32
#else
    enumerator :: hipDeviceAttributeEccEnabled = 0
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeAccessPolicyMaxWindowSize = 109
#else
    enumerator :: hipDeviceAttributeAccessPolicyMaxWindowSize = 1
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeAsyncEngineCount = 40
#else
    enumerator :: hipDeviceAttributeAsyncEngineCount = 2
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeCanMapHostMemory = 19
#else
    enumerator :: hipDeviceAttributeCanMapHostMemory = 3
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeCanUseHostPointerForRegisteredMem = 91
#else
    enumerator :: hipDeviceAttributeCanUseHostPointerForRegisteredMem = 4
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeClockRate = 13
#else
    enumerator :: hipDeviceAttributeClockRate = 5
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeComputeMode = 20
#else
    enumerator :: hipDeviceAttributeComputeMode = 6
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeComputePreemptionSupported = 90
#else
    enumerator :: hipDeviceAttributeComputePreemptionSupported = 7
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeConcurrentKernels = 31
#else
    enumerator :: hipDeviceAttributeConcurrentKernels = 8
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeConcurrentManagedAccess = 89
#else
    enumerator :: hipDeviceAttributeConcurrentManagedAccess = 9
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeCooperativeLaunch = 95
#else
    enumerator :: hipDeviceAttributeCooperativeLaunch = 10
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceLaunch = -1
#else
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceLaunch = 11
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeDeviceOverlap = 15
#else
    enumerator :: hipDeviceAttributeDeviceOverlap = 12
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeDirectManagedMemAccessFromHost = 101
#else
    enumerator :: hipDeviceAttributeDirectManagedMemAccessFromHost = 13
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeGlobalL1CacheSupported = 79
#else
    enumerator :: hipDeviceAttributeGlobalL1CacheSupported = 14
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeHostNativeAtomicSupported = 86
#else
    enumerator :: hipDeviceAttributeHostNativeAtomicSupported = 15
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeIntegrated = 18
#else
    enumerator :: hipDeviceAttributeIntegrated = 16
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeIsMultiGpuBoard = 84
#else
    enumerator :: hipDeviceAttributeIsMultiGpuBoard = 17
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeKernelExecTimeout = 17
#else
    enumerator :: hipDeviceAttributeKernelExecTimeout = 18
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeL2CacheSize = 38
#else
    enumerator :: hipDeviceAttributeL2CacheSize = 19
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeLocalL1CacheSupported = 80
#else
    enumerator :: hipDeviceAttributeLocalL1CacheSupported = 20
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeLuid = -2
#else
    enumerator :: hipDeviceAttributeLuid = 21
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeLuidDeviceNodeMask = -3
#else
    enumerator :: hipDeviceAttributeLuidDeviceNodeMask = 22
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeComputeCapabilityMajor = 75
#else
    enumerator :: hipDeviceAttributeComputeCapabilityMajor = 23
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeManagedMemory = 83
#else
    enumerator :: hipDeviceAttributeManagedMemory = 24
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxBlocksPerMultiProcessor = 106
#else
    enumerator :: hipDeviceAttributeMaxBlocksPerMultiProcessor = 25
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxBlockDimX = 2
#else
    enumerator :: hipDeviceAttributeMaxBlockDimX = 26
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxBlockDimY = 3
#else
    enumerator :: hipDeviceAttributeMaxBlockDimY = 27
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxBlockDimZ = 4
#else
    enumerator :: hipDeviceAttributeMaxBlockDimZ = 28
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxGridDimX = 5
#else
    enumerator :: hipDeviceAttributeMaxGridDimX = 29
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxGridDimY = 6
#else
    enumerator :: hipDeviceAttributeMaxGridDimY = 30
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxGridDimZ = 7
#else
    enumerator :: hipDeviceAttributeMaxGridDimZ = 31
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxSurface1D = 55
#else
    enumerator :: hipDeviceAttributeMaxSurface1D = 32
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxSurface1DLayered = -4
#else
    enumerator :: hipDeviceAttributeMaxSurface1DLayered = 33
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxSurface2D = -5
#else
    enumerator :: hipDeviceAttributeMaxSurface2D = 34
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxSurface2DLayered = -6
#else
    enumerator :: hipDeviceAttributeMaxSurface2DLayered = 35
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxSurface3D = -7
#else
    enumerator :: hipDeviceAttributeMaxSurface3D = 36
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxSurfaceCubemap = -8
#else
    enumerator :: hipDeviceAttributeMaxSurfaceCubemap = 37
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxSurfaceCubemapLayered = -9
#else
    enumerator :: hipDeviceAttributeMaxSurfaceCubemapLayered = 38
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture1DWidth = 21
#else
    enumerator :: hipDeviceAttributeMaxTexture1DWidth = 39
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture1DLayered = -10
#else
    enumerator :: hipDeviceAttributeMaxTexture1DLayered = 40
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture1DLinear = 69
#else
    enumerator :: hipDeviceAttributeMaxTexture1DLinear = 41
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture1DMipmap = 77
#else
    enumerator :: hipDeviceAttributeMaxTexture1DMipmap = 42
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture2DWidth = 22
#else
    enumerator :: hipDeviceAttributeMaxTexture2DWidth = 43
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture2DHeight = 23
#else
    enumerator :: hipDeviceAttributeMaxTexture2DHeight = 44
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture2DGather = -11
#else
    enumerator :: hipDeviceAttributeMaxTexture2DGather = 45
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture2DLayered = -12
#else
    enumerator :: hipDeviceAttributeMaxTexture2DLayered = 46
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture2DLinear = -13
#else
    enumerator :: hipDeviceAttributeMaxTexture2DLinear = 47
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture2DMipmap = -14
#else
    enumerator :: hipDeviceAttributeMaxTexture2DMipmap = 48
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture3DWidth = 24
#else
    enumerator :: hipDeviceAttributeMaxTexture3DWidth = 49
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture3DHeight = 25
#else
    enumerator :: hipDeviceAttributeMaxTexture3DHeight = 50
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture3DDepth = 26
#else
    enumerator :: hipDeviceAttributeMaxTexture3DDepth = 51
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTexture3DAlt = -15
#else
    enumerator :: hipDeviceAttributeMaxTexture3DAlt = 52
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTextureCubemap = 52
#else
    enumerator :: hipDeviceAttributeMaxTextureCubemap = 53
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxTextureCubemapLayered = -16
#else
    enumerator :: hipDeviceAttributeMaxTextureCubemapLayered = 54
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxThreadsDim = -17
#else
    enumerator :: hipDeviceAttributeMaxThreadsDim = 55
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxThreadsPerBlock = 1
#else
    enumerator :: hipDeviceAttributeMaxThreadsPerBlock = 56
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxThreadsPerMultiProcessor = 39
#else
    enumerator :: hipDeviceAttributeMaxThreadsPerMultiProcessor = 57
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxPitch = 11
#else
    enumerator :: hipDeviceAttributeMaxPitch = 58
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMemoryBusWidth = 37
#else
    enumerator :: hipDeviceAttributeMemoryBusWidth = 59
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMemoryClockRate = 36
#else
    enumerator :: hipDeviceAttributeMemoryClockRate = 60
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeComputeCapabilityMinor = 76
#else
    enumerator :: hipDeviceAttributeComputeCapabilityMinor = 61
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMultiGpuBoardGroupID = 85
#else
    enumerator :: hipDeviceAttributeMultiGpuBoardGroupID = 62
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMultiprocessorCount = 16
#else
    enumerator :: hipDeviceAttributeMultiprocessorCount = 63
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeUnused1 = -18
#else
    enumerator :: hipDeviceAttributeUnused1 = 64
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributePageableMemoryAccess = 88
#else
    enumerator :: hipDeviceAttributePageableMemoryAccess = 65
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributePageableMemoryAccessUsesHostPageTables = 100
#else
    enumerator :: hipDeviceAttributePageableMemoryAccessUsesHostPageTables = 66
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributePciBusId = 33
#else
    enumerator :: hipDeviceAttributePciBusId = 67
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributePciDeviceId = 34
#else
    enumerator :: hipDeviceAttributePciDeviceId = 68
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributePciDomainId = 50
#else
    enumerator :: hipDeviceAttributePciDomainId = 69
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributePersistingL2CacheMaxSize = 108
#else
    enumerator :: hipDeviceAttributePersistingL2CacheMaxSize = 70
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxRegistersPerBlock = 12
#else
    enumerator :: hipDeviceAttributeMaxRegistersPerBlock = 71
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxRegistersPerMultiprocessor = 82
#else
    enumerator :: hipDeviceAttributeMaxRegistersPerMultiprocessor = 72
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeReservedSharedMemPerBlock = 111
#else
    enumerator :: hipDeviceAttributeReservedSharedMemPerBlock = 73
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxSharedMemoryPerBlock = 8
#else
    enumerator :: hipDeviceAttributeMaxSharedMemoryPerBlock = 74
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeSharedMemPerBlockOptin = 97
#else
    enumerator :: hipDeviceAttributeSharedMemPerBlockOptin = 75
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeSharedMemPerMultiprocessor = 81
#else
    enumerator :: hipDeviceAttributeSharedMemPerMultiprocessor = 76
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeSingleToDoublePrecisionPerfRatio = 87
#else
    enumerator :: hipDeviceAttributeSingleToDoublePrecisionPerfRatio = 77
#endif
    enumerator :: hipDeviceAttributeStreamPrioritiesSupported = 78
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeSurfaceAlignment = 30
#else
    enumerator :: hipDeviceAttributeSurfaceAlignment = 79
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeTccDriver = 35
#else
    enumerator :: hipDeviceAttributeTccDriver = 80
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeTextureAlignment = 14
#else
    enumerator :: hipDeviceAttributeTextureAlignment = 81
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeTexturePitchAlignment = 51
#else
    enumerator :: hipDeviceAttributeTexturePitchAlignment = 82
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeTotalConstantMemory = 9
#else
    enumerator :: hipDeviceAttributeTotalConstantMemory = 83
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeTotalGlobalMem = -19
#else
    enumerator :: hipDeviceAttributeTotalGlobalMem = 84
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeUnifiedAddressing = 41
#else
    enumerator :: hipDeviceAttributeUnifiedAddressing = 85
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeUnused2 = -20
#else
    enumerator :: hipDeviceAttributeUnused2 = 86
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeWarpSize = 10
#else
    enumerator :: hipDeviceAttributeWarpSize = 87
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMemoryPoolsSupported = 115
#else
    enumerator :: hipDeviceAttributeMemoryPoolsSupported = 88
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeVirtualMemoryManagementSupported = -21
#else
    enumerator :: hipDeviceAttributeVirtualMemoryManagementSupported = 89
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeHostRegisterSupported = 99
#else
    enumerator :: hipDeviceAttributeHostRegisterSupported = 90
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMemoryPoolSupportedHandleTypes = 119
#else
    enumerator :: hipDeviceAttributeMemoryPoolSupportedHandleTypes = 91
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeHostNumaId = 134
#else
    enumerator :: hipDeviceAttributeHostNumaId = 92
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeDmaBufSupported = -22
#else
    enumerator :: hipDeviceAttributeDmaBufSupported = 93
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeGPUDirectRDMAWithHipVMMSupported = -23
#else
    enumerator :: hipDeviceAttributeGPUDirectRDMAWithHipVMMSupported = 94
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeHandleTypeFabricSupported = -24
#else
    enumerator :: hipDeviceAttributeHandleTypeFabricSupported = 95
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeHostAllocDmaBufSupported = -25
#else
    enumerator :: hipDeviceAttributeHostAllocDmaBufSupported = 96
#endif
    enumerator :: hipDeviceAttributeCudaCompatibleEnd = 9999
    enumerator :: hipDeviceAttributeAmdSpecificBegin = 10000
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeClockInstructionRate = -26
#else
    enumerator :: hipDeviceAttributeClockInstructionRate = 10000
#endif
    enumerator :: hipDeviceAttributeUnused3 = 10001
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeMaxSharedMemoryPerMultiprocessor = 81
#else
    enumerator :: hipDeviceAttributeMaxSharedMemoryPerMultiprocessor = 10002
#endif
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
#ifdef USE_CUDA_NAMES
    enumerator :: hipDeviceAttributeCanUseStreamWaitValue = 92
#else
    enumerator :: hipDeviceAttributeCanUseStreamWaitValue = 10013
#endif
    enumerator :: hipDeviceAttributeImageSupport = 10014
    enumerator :: hipDeviceAttributePhysicalMultiProcessorCount = 10015
    enumerator :: hipDeviceAttributeFineGrainSupport = 10016
    enumerator :: hipDeviceAttributeWallClockRate = 10017
    enumerator :: hipDeviceAttributeNumberOfXccs = 10018
    enumerator :: hipDeviceAttributeMaxAvailableVgprsPerThread = 10019
    enumerator :: hipDeviceAttributePciChipId = 10020
    enumerator :: hipDeviceAttributeExpertSchedMode = 10021
    enumerator :: hipDeviceAttributeMaxDynDataPrefetchRegions = 10022
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
#ifdef USE_CUDA_NAMES
    enumerator :: hipMemcpyDeviceToDeviceNoCU = 3
#else
    enumerator :: hipMemcpyDeviceToDeviceNoCU = 1024
#endif
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
    enumerator :: hipMemcpyFlagExtPreferCE = 256
    enumerator :: hipMemcpyFlagExtOpSwap = 512
    enumerator :: hipMemcpyFlagExtOpIndirectSrc = 1024
    enumerator :: hipMemcpyFlagExtOpIndirectDst = 2048
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
#ifdef USE_CUDA_NAMES
    enumerator :: HIP_FUNC_ATTRIBUTE_CLUSTER_DIM_MUST_BE_SET = -1
#else
    enumerator :: HIP_FUNC_ATTRIBUTE_CLUSTER_DIM_MUST_BE_SET = 10
#endif
    enumerator :: HIP_FUNC_ATTRIBUTE_REQUIRED_CLUSTER_WIDTH = 11
    enumerator :: HIP_FUNC_ATTRIBUTE_REQUIRED_CLUSTER_HEIGHT = 12
    enumerator :: HIP_FUNC_ATTRIBUTE_REQUIRED_CLUSTER_DEPTH = 13
    enumerator :: HIP_FUNC_ATTRIBUTE_NON_PORTABLE_CLUSTER_SIZE_ALLOWED = 14
    enumerator :: HIP_FUNC_ATTRIBUTE_CLUSTER_SCHEDULING_POLICY_PREFERENCE = 15
#ifdef USE_CUDA_NAMES
    enumerator :: HIP_FUNC_ATTRIBUTE_MAX = 17
#else
    enumerator :: HIP_FUNC_ATTRIBUTE_MAX = 16
#endif
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
#ifdef USE_CUDA_NAMES
    enumerator :: HIP_POINTER_ATTRIBUTE_IS_LEGACY_HIP_IPC_CAPABLE = -1
#else
    enumerator :: HIP_POINTER_ATTRIBUTE_IS_LEGACY_HIP_IPC_CAPABLE = 10
#endif
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
#ifdef USE_CUDA_NAMES
    enumerator :: hipBoundaryModeTrap = 2
#else
    enumerator :: hipBoundaryModeTrap = 1
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipBoundaryModeClamp = 1
#else
    enumerator :: hipBoundaryModeClamp = 2
#endif
  end enum

  ! hipDevResourceType
  enum, bind(c)
    enumerator :: hipDevResourceTypeInvalid = 0
    enumerator :: hipDevResourceTypeSm = 1
    enumerator :: hipDevResourceTypeWorkqueueConfig = 1000
    enumerator :: hipDevResourceTypeWorkqueue = 10000
  end enum

  ! hipDevSmResourceGroup_flags
  enum, bind(c)
    enumerator :: hipDevSmResourceGroupDefault = 0
    enumerator :: hipDevSmResourceGroupBackfill = 1
  end enum

  ! hipDevSmResourceSplitByCount_flags
  enum, bind(c)
    enumerator :: hipDevSmResourceSplitIgnoreSmCoscheduling = 1
    enumerator :: hipDevSmResourceSplitMaxPotentialClusterSize = 2
  end enum

  ! hipDevWorkqueueConfigScope
  enum, bind(c)
    enumerator :: hipDevWorkqueueConfigScopeDeviceCtx = 0
    enumerator :: hipDevWorkqueueConfigScopeGreenCtxBalanced = 1
  end enum

  ! hipDeviceP2PAttr
  enum, bind(c)
#ifdef USE_CUDA_NAMES
    enumerator :: hipDevP2PAttrPerformanceRank = 1
#else
    enumerator :: hipDevP2PAttrPerformanceRank = 0
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDevP2PAttrAccessSupported = 2
#else
    enumerator :: hipDevP2PAttrAccessSupported = 1
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDevP2PAttrNativeAtomicSupported = 3
#else
    enumerator :: hipDevP2PAttrNativeAtomicSupported = 2
#endif
#ifdef USE_CUDA_NAMES
    enumerator :: hipDevP2PAttrHipArrayAccessSupported = 4
#else
    enumerator :: hipDevP2PAttrHipArrayAccessSupported = 3
#endif
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
    enumerator :: hipMemAllocationTypeManaged = 2
    enumerator :: hipMemAllocationTypeUncached = 1073741824
    enumerator :: hipMemAllocationTypeMax = 2147483647
  end enum

  ! hipMemAllocationHandleType
  enum, bind(c)
    enumerator :: hipMemHandleTypeNone = 0
    enumerator :: hipMemHandleTypePosixFileDescriptor = 1
    enumerator :: hipMemHandleTypeWin32 = 2
    enumerator :: hipMemHandleTypeWin32Kmt = 4
    enumerator :: hipMemHandleTypeFabric = 8
  end enum

  ! hipFuncAttribute
  enum, bind(c)
    enumerator :: hipFuncAttributeMaxDynamicSharedMemorySize = 8
    enumerator :: hipFuncAttributePreferredSharedMemoryCarveout = 9
    enumerator :: hipFuncAttributeClusterDimMustBeSet = 10
    enumerator :: hipFuncAttributeRequiredClusterWidth = 11
    enumerator :: hipFuncAttributeRequiredClusterHeight = 12
    enumerator :: hipFuncAttributeRequiredClusterDepth = 13
    enumerator :: hipFuncAttributeNonPortableClusterSizeAllowed = 14
    enumerator :: hipFuncAttributeClusterSchedulingPolicyPreference = 15
    enumerator :: hipFuncAttributeMax = 16
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
#ifdef USE_CUDA_NAMES
    enumerator :: hipGraphNodeTypeMemcpyToSymbol = -1
#else
    enumerator :: hipGraphNodeTypeMemcpyToSymbol = 13
#endif
    enumerator :: hipGraphNodeTypeBatchMemOp = 14
#ifdef USE_CUDA_NAMES
    enumerator :: hipGraphNodeTypeCount = 17
#else
    enumerator :: hipGraphNodeTypeCount = 15
#endif
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

  ! hipClusterSchedulingPolicy
  enum, bind(c)
    enumerator :: hipClusterSchedulingPolicyDefault = 0
    enumerator :: hipClusterSchedulingPolicySpread = 1
    enumerator :: hipClusterSchedulingPolicyLoadBalancing = 2
  end enum

  ! hipExtDynDataPrefetchTemporal
  enum, bind(c)
    enumerator :: hipExtDynDataPrefetchTemporalRegular = 0
    enumerator :: hipExtDynDataPrefetchTemporalHigh = 1
  end enum

  ! hipLaunchAttributeID
  enum, bind(c)
    enumerator :: hipLaunchAttributeIgnore = 0
    enumerator :: hipLaunchAttributeAccessPolicyWindow = 1
    enumerator :: hipLaunchAttributeCooperative = 2
    enumerator :: hipLaunchAttributeSynchronizationPolicy = 3
    enumerator :: hipLaunchAttributeClusterDimension = 4
    enumerator :: hipLaunchAttributeClusterSchedulingPolicyPreference = 5
    enumerator :: hipLaunchAttributePriority = 8
    enumerator :: hipLaunchAttributeMemSyncDomainMap = 9
    enumerator :: hipLaunchAttributeMemSyncDomain = 10
    enumerator :: hipLaunchAttributeExtDynDataPrefetch = 1024
    enumerator :: hipLaunchAttributeMax = 1025
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
  integer(c_int), parameter :: HIP_VERSION_MINOR = 16
  integer(c_int), parameter :: HIP_VERSION_PATCH = 26385
  integer(c_int), parameter :: HIP_VERSION_BUILD_ID = 0
  integer(c_int), parameter :: HIP_GET_PROC_ADDRESS_DEFAULT = 0
  integer(c_int), parameter :: HIP_GET_PROC_ADDRESS_LEGACY_STREAM = 1
  integer(c_int), parameter :: HIP_GET_PROC_ADDRESS_PER_THREAD_DEFAULT_STREAM = 2
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
  integer(c_int), parameter :: HIP_RESOURCE_ABI_BYTES = 40
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
  integer(c_int), parameter :: hipEventReleaseToSystem = -2147483647 - 1  ! 0x80000000
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
  integer(c_int), parameter :: hipHostMallocNonCoherent = -2147483647 - 1  ! 0x80000000
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
  integer(c_int), parameter :: hipExtHostRegisterUncached = -2147483647 - 1  ! 0x80000000
  integer(c_int), parameter :: hipDeviceScheduleAuto = 0
  integer(c_int), parameter :: hipDeviceScheduleSpin = 1
  integer(c_int), parameter :: hipDeviceScheduleYield = 2
  integer(c_int), parameter :: hipDeviceScheduleBlockingSync = 4
  integer(c_int), parameter :: hipDeviceScheduleMask = 7
  integer(c_int), parameter :: hipDeviceMapHost = 8
  integer(c_int), parameter :: hipDeviceLmemResizeToMax = 16
  integer(c_int), parameter :: hipInitDeviceFlagsAreValid = 1
  integer(c_int), parameter :: hipArrayDefault = 0
  integer(c_int), parameter :: hipArrayLayered = 1
  integer(c_int), parameter :: hipArraySurfaceLoadStore = 2
  integer(c_int), parameter :: hipArrayCubemap = 4
  integer(c_int), parameter :: hipArrayTextureGather = 8
  integer(c_int), parameter :: hipOccupancyDefault = 0
  integer(c_int), parameter :: hipOccupancyDisableCachingOverride = 1
  integer(c_int), parameter :: hipCooperativeLaunchMultiDeviceNoPreSync = 1
  integer(c_int), parameter :: hipCooperativeLaunchMultiDeviceNoPostSync = 2
  integer(c_int), parameter :: hipCpuDeviceId = -1
  integer(c_int), parameter :: hipInvalidDeviceId = -2
  integer(c_int), parameter :: hipExtAnyOrderLaunch = 1
  integer(c_int), parameter :: hipStreamWaitValueGte = 0
  integer(c_int), parameter :: hipStreamWaitValueEq = 1
  integer(c_int), parameter :: hipStreamWaitValueAnd = 2
  integer(c_int), parameter :: hipStreamWaitValueNor = 3
  integer(c_int), parameter :: hipStreamWriteValueDefault = 0
  integer(c_int), parameter :: hipExtStreamWriteValueIncrement = 4096
  integer(c_int), parameter :: hipExtStreamWriteValueDecrement = 4097
  integer(c_int), parameter :: hipExternalMemoryDedicated = 1
  integer(c_int), parameter :: HIP_EXT_DYN_DATA_PREFETCH_MAX_REGIONS = 2
  integer(c_int), parameter :: hipGraphKernelNodePortDefault = 0
  integer(c_int), parameter :: hipGraphKernelNodePortLaunchCompletion = 2
  integer(c_int), parameter :: hipGraphKernelNodePortProgrammatic = 1

end module hipfort_enums
