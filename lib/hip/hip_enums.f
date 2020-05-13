module hip_enums

  enum, bind(c)
     enumerator :: hipMemcpyHostToHost = 0, hipMemcpyHostToDevice = 1
     enumerator :: hipMemcpyDeviceToHost = 2, hipMemcpyDeviceToDevice =3
     enumerator :: hipMemcpyDefault = 4
  end enum

  enum, bind(c)
     enumerator :: hipSuccess = 0, hipErrorOutOfMemory = 2
     enumerator :: hipErrorNotInitialized = 3, hipErrorDeinitialized = 4
     enumerator :: hipErrorProfilerDisabled = 5, hipErrorProfilerNotInitialized = 6
     enumerator :: hipErrorProfilerAlreadyStarted = 7, hipErrorProfilerAlreadyStopped = 8
     enumerator :: hipErrorInvalidImage = 200
     enumerator :: hipErrorInvalidContext = 201, hipErrorContextAlreadyCurrent = 202
     enumerator :: hipErrorMapFailed = 205, hipErrorUnmapFailed = 206
     enumerator :: hipErrorArrayIsMapped = 207, hipErrorAlreadyMapped = 208
     enumerator :: hipErrorNoBinaryForGpu = 209, hipErrorAlreadyAcquired = 210
     enumerator :: hipErrorNotMapped = 211, hipErrorNotMappedAsArray = 212
     enumerator :: hipErrorNotMappedAsPointer = 213, hipErrorECCNotCorrectable = 214
     enumerator :: hipErrorUnsupportedLimit = 215, hipErrorContextAlreadyInUse = 216
     enumerator :: hipErrorPeerAccessUnsupported = 217, hipErrorInvalidKernelFile = 218
     enumerator :: hipErrorInvalidGraphicsContext = 219, hipErrorInvalidSource = 300
     enumerator :: hipErrorFileNotFound = 301, hipErrorSharedObjectSymbolNotFound = 302
     enumerator :: hipErrorSharedObjectInitFailed = 303, hipErrorOperatingSystem = 304
     enumerator :: hipErrorSetOnActiveProcess = 305, hipErrorInvalidHandle = 400
     enumerator :: hipErrorNotFound = 500, hipErrorIllegalAddress = 700
     enumerator :: hipErrorInvalidSymbol = 701, hipErrorMissingConfiguration = 1001
     enumerator :: hipErrorMemoryAllocation = 1002, hipErrorInitializationError = 1003
     enumerator :: hipErrorLaunchFailure = 1004, hipErrorPriorLaunchFailure = 1005
     enumerator :: hipErrorLaunchTimeOut = 1006, hipErrorLaunchOutOfResources = 1007
     enumerator :: hipErrorInvalidDeviceFunction = 1008, hipErrorInvalidConfiguration = 1009
     enumerator :: hipErrorInvalidDevice = 1010, hipErrorInvalidValue = 1011
     enumerator :: hipErrorInvalidDevicePointer = 1017, hipErrorInvalidMemcpyDirection = 1021
     enumerator :: hipErrorUnknown = 1030, hipErrorInvalidResourceHandle = 1033
     enumerator :: hipErrorNotReady = 1034, hipErrorNoDevice = 1038
     enumerator :: hipErrorPeerAccessAlreadyEnabled = 1050, hipErrorPeerAccessNotEnabled = 1051
     enumerator :: hipErrorRuntimeMemory = 1052, hipErrorRuntimeOther = 1053
     enumerator :: hipErrorHostMemoryAlreadyRegistered = 1061
     enumerator :: hipErrorHostMemoryNotRegistered = 1062, hipErrorMapBufferObjectFailed = 1071
     enumerator :: hipErrorTbd
  end enum

end module hip_enums
