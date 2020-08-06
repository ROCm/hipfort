module hip_check
   use hip_enums
   use iso_c_binding

contains

#ifdef USE_CUDA_NAMES
   subroutine hipCheck(cudaError_t)
      use cuda_errors
      use hip_enums
      implicit none
      integer(kind(cudaSuccess)) :: cudaError_t
      integer(kind(hipSuccess)) :: hipError_t

      hipError_t = hipCUDAErrorTohipError(cudaError_t)

      if (hipError_t /= hipSuccess) then
         write (*, *) "HIP ERROR: Error code = ", hipError_t, ", CUDA error code = ", cudaError_t
         call exit(hipError_t)
      end if
   end subroutine hipCheck
#else
   subroutine hipCheck(hipError_t)
      use hip_enums
      implicit none

      integer(kind(hipSuccess)) :: hipError_t

      if (hipError_t /= hipSuccess) then
         write (*, *) "HIP ERROR: Error code = ", hipError_t
         call exit(hipError_t)
      end if
   end subroutine hipCheck
#endif

#ifdef USE_CUDA_NAMES
   function hipCUDAErrorTohipError(cudaError_t)
      use hip_enums
      use cuda_errors
      implicit none
      integer(kind(hipSuccess))  :: hipCUDAErrorTohipError
      integer(kind(cudaSuccess)) :: cudaError_t

      select case (cudaError_t)
      case (cudaSuccess)
         hipCUDAErrorTohipError = hipSuccess
      case (cudaErrorProfilerDisabled)
         hipCUDAErrorTohipError = hipErrorProfilerDisabled
      case (cudaErrorProfilerNotInitialized)
         hipCUDAErrorTohipError = hipErrorProfilerNotInitialized
      case (cudaErrorProfilerAlreadyStarted)
         hipCUDAErrorTohipError = hipErrorProfilerAlreadyStarted
      case (cudaErrorProfilerAlreadyStopped)
         hipCUDAErrorTohipError = hipErrorProfilerAlreadyStopped
      case (cudaErrorInsufficientDriver)
         hipCUDAErrorTohipError = hipErrorInsufficientDriver
      case (cudaErrorUnsupportedLimit)
         hipCUDAErrorTohipError = hipErrorUnsupportedLimit
      case (cudaErrorPeerAccessUnsupported)
         hipCUDAErrorTohipError = hipErrorPeerAccessUnsupported
      case (cudaErrorInvalidGraphicsContext)
         hipCUDAErrorTohipError = hipErrorInvalidGraphicsContext
      case (cudaErrorSharedObjectSymbolNotFound)
         hipCUDAErrorTohipError = hipErrorSharedObjectSymbolNotFound
      case (cudaErrorSharedObjectInitFailed)
         hipCUDAErrorTohipError = hipErrorSharedObjectInitFailed
      case (cudaErrorOperatingSystem)
         hipCUDAErrorTohipError = hipErrorOperatingSystem
      case (cudaErrorSetOnActiveProcess)
         hipCUDAErrorTohipError = hipErrorSetOnActiveProcess
      case (cudaErrorIllegalAddress)
         hipCUDAErrorTohipError = hipErrorIllegalAddress
      case (cudaErrorInvalidSymbol)
         hipCUDAErrorTohipError = hipErrorInvalidSymbol
      case (cudaErrorMissingConfiguration)
         hipCUDAErrorTohipError = hipErrorMissingConfiguration
      case (cudaErrorMemoryAllocation)
         hipCUDAErrorTohipError = hipErrorOutOfMemory
      case (cudaErrorInitializationError)
         hipCUDAErrorTohipError = hipErrorNotInitialized
      case (cudaErrorLaunchFailure)
         hipCUDAErrorTohipError = hipErrorLaunchFailure
      case (cudaErrorCooperativeLaunchTooLarge)
         hipCUDAErrorTohipError = hipErrorCooperativeLaunchTooLarge
      case (cudaErrorPriorLaunchFailure)
         hipCUDAErrorTohipError = hipErrorPriorLaunchFailure
      case (cudaErrorLaunchOutOfResources)
         hipCUDAErrorTohipError = hipErrorLaunchOutOfResources
      case (cudaErrorInvalidDeviceFunction)
         hipCUDAErrorTohipError = hipErrorInvalidDeviceFunction
      case (cudaErrorInvalidConfiguration)
         hipCUDAErrorTohipError = hipErrorInvalidConfiguration
      case (cudaErrorInvalidDevice)
         hipCUDAErrorTohipError = hipErrorInvalidDevice
      case (cudaErrorInvalidValue)
         hipCUDAErrorTohipError = hipErrorInvalidValue
      case (cudaErrorInvalidDevicePointer)
         hipCUDAErrorTohipError = hipErrorInvalidDevicePointer
      case (cudaErrorInvalidMemcpyDirection)
         hipCUDAErrorTohipError = hipErrorInvalidMemcpyDirection
      case (cudaErrorInvalidResourceHandle)
         hipCUDAErrorTohipError = hipErrorInvalidHandle
      case (cudaErrorNotReady)
         hipCUDAErrorTohipError = hipErrorNotReady
      case (cudaErrorNoDevice)
         hipCUDAErrorTohipError = hipErrorNoDevice
      case (cudaErrorPeerAccessAlreadyEnabled)
         hipCUDAErrorTohipError = hipErrorPeerAccessAlreadyEnabled
      case (cudaErrorPeerAccessNotEnabled)
         hipCUDAErrorTohipError = hipErrorPeerAccessNotEnabled
      case (cudaErrorHostMemoryAlreadyRegistered)
         hipCUDAErrorTohipError = hipErrorHostMemoryAlreadyRegistered
      case (cudaErrorHostMemoryNotRegistered)
         hipCUDAErrorTohipError = hipErrorHostMemoryNotRegistered
      case (cudaErrorMapBufferObjectFailed)
         hipCUDAErrorTohipError = hipErrorMapFailed
      case (cudaErrorAssert)
         hipCUDAErrorTohipError = hipErrorAssert
      case (cudaErrorNotSupported)
         hipCUDAErrorTohipError = hipErrorNotSupported
      case (cudaErrorCudartUnloading)
         hipCUDAErrorTohipError = hipErrorDeinitialized
      case (cudaErrorInvalidKernelImage)
         hipCUDAErrorTohipError = hipErrorInvalidImage
      case (cudaErrorUnmapBufferObjectFailed)
         hipCUDAErrorTohipError = hipErrorUnmapFailed
      case (cudaErrorNoKernelImageForDevice)
         hipCUDAErrorTohipError = hipErrorNoBinaryForGpu
      case (cudaErrorECCUncorrectable)
         hipCUDAErrorTohipError = hipErrorECCNotCorrectable
      case (cudaErrorDeviceAlreadyInUse)
         hipCUDAErrorTohipError = hipErrorContextAlreadyInUse
      case (cudaErrorInvalidPtx)
         hipCUDAErrorTohipError = hipErrorInvalidKernelFile
      case (cudaErrorLaunchTimeout)
         hipCUDAErrorTohipError = hipErrorLaunchTimeOut
#if CUDA_VERSION >= 10010
      case (cudaErrorInvalidSource)
         hipCUDAErrorTohipError = hipErrorInvalidSource
      case (cudaErrorFileNotFound)
         hipCUDAErrorTohipError = hipErrorFileNotFound
      case (cudaErrorSymbolNotFound)
         hipCUDAErrorTohipError = hipErrorNotFound
      case (cudaErrorArrayIsMapped)
         hipCUDAErrorTohipError = hipErrorArrayIsMapped
      case (cudaErrorNotMappedAsPointer)
         hipCUDAErrorTohipError = hipErrorNotMappedAsPointer
      case (cudaErrorNotMappedAsArray)
         hipCUDAErrorTohipError = hipErrorNotMappedAsArray
      case (cudaErrorNotMapped)
         hipCUDAErrorTohipError = hipErrorNotMapped
      case (cudaErrorAlreadyAcquired)
         hipCUDAErrorTohipError = hipErrorAlreadyAcquired
      case (cudaErrorAlreadyMapped)
         hipCUDAErrorTohipError = hipErrorAlreadyMapped
#endif
#if CUDA_VERSION >= 10020
      case (cudaErrorDeviceUninitialized)
         hipCUDAErrorTohipError = hipErrorInvalidContext
#endif
      case (cudaErrorUnknown)
      case default
         hipCUDAErrorTohipError = hipErrorUnknown  ! Note - translated error.
      end select
   end function hipCUDAErrorTohipError

   function hipErrorToCudaError(hipError_t)
      use hip_enums
      use cuda_errors
      implicit none
      integer(kind(cudaSuccess)) :: hipErrorToCudaError
      integer(kind(hipSuccess))  :: hipError_t
      select case (hipError_t)
      case (hipSuccess)
         hipErrorToCudaError = cudaSuccess
      case (hipErrorOutOfMemory)
         hipErrorToCudaError = cudaErrorMemoryAllocation
      case (hipErrorProfilerDisabled)
         hipErrorToCudaError = cudaErrorProfilerDisabled
      case (hipErrorProfilerNotInitialized)
         hipErrorToCudaError = cudaErrorProfilerNotInitialized
      case (hipErrorProfilerAlreadyStarted)
         hipErrorToCudaError = cudaErrorProfilerAlreadyStarted
      case (hipErrorProfilerAlreadyStopped)
         hipErrorToCudaError = cudaErrorProfilerAlreadyStopped
      case (hipErrorInvalidConfiguration)
         hipErrorToCudaError = cudaErrorInvalidConfiguration
      case (hipErrorLaunchOutOfResources)
         hipErrorToCudaError = cudaErrorLaunchOutOfResources
      case (hipErrorInvalidValue)
         hipErrorToCudaError = cudaErrorInvalidValue
      case (hipErrorInvalidHandle)
         hipErrorToCudaError = cudaErrorInvalidResourceHandle
      case (hipErrorInvalidDevice)
         hipErrorToCudaError = cudaErrorInvalidDevice
      case (hipErrorInvalidMemcpyDirection)
         hipErrorToCudaError = cudaErrorInvalidMemcpyDirection
      case (hipErrorInvalidDevicePointer)
         hipErrorToCudaError = cudaErrorInvalidDevicePointer
      case (hipErrorNotInitialized)
         hipErrorToCudaError = cudaErrorInitializationError
      case (hipErrorNoDevice)
         hipErrorToCudaError = cudaErrorNoDevice
      case (hipErrorNotReady)
         hipErrorToCudaError = cudaErrorNotReady
      case (hipErrorPeerAccessNotEnabled)
         hipErrorToCudaError = cudaErrorPeerAccessNotEnabled
      case (hipErrorPeerAccessAlreadyEnabled)
         hipErrorToCudaError = cudaErrorPeerAccessAlreadyEnabled
      case (hipErrorHostMemoryAlreadyRegistered)
         hipErrorToCudaError = cudaErrorHostMemoryAlreadyRegistered
      case (hipErrorHostMemoryNotRegistered)
         hipErrorToCudaError = cudaErrorHostMemoryNotRegistered
      case (hipErrorDeinitialized)
         hipErrorToCudaError = cudaErrorCudartUnloading
      case (hipErrorInvalidSymbol)
         hipErrorToCudaError = cudaErrorInvalidSymbol
      case (hipErrorInsufficientDriver)
         hipErrorToCudaError = cudaErrorInsufficientDriver
      case (hipErrorMissingConfiguration)
         hipErrorToCudaError = cudaErrorMissingConfiguration
      case (hipErrorPriorLaunchFailure)
         hipErrorToCudaError = cudaErrorPriorLaunchFailure
      case (hipErrorInvalidDeviceFunction)
         hipErrorToCudaError = cudaErrorInvalidDeviceFunction
      case (hipErrorInvalidImage)
         hipErrorToCudaError = cudaErrorInvalidKernelImage
      case (hipErrorInvalidContext)
#if CUDA_VERSION >= 10020
         hipErrorToCudaError = cudaErrorDeviceUninitialized
#else
         hipErrorToCudaError = cudaErrorUnknown
#endif
      case (hipErrorMapFailed)
         hipErrorToCudaError = cudaErrorMapBufferObjectFailed
      case (hipErrorUnmapFailed)
         hipErrorToCudaError = cudaErrorUnmapBufferObjectFailed
      case (hipErrorArrayIsMapped)
#if CUDA_VERSION >= 10010
         hipErrorToCudaError = cudaErrorArrayIsMapped
#else
         hipErrorToCudaError = cudaErrorUnknown
#endif
      case (hipErrorAlreadyMapped)
#if CUDA_VERSION >= 10010
         hipErrorToCudaError = cudaErrorAlreadyMapped
#else
         hipErrorToCudaError = cudaErrorUnknown
#endif
      case (hipErrorNoBinaryForGpu)
         hipErrorToCudaError = cudaErrorNoKernelImageForDevice
      case (hipErrorAlreadyAcquired)
#if CUDA_VERSION >= 10010
         hipErrorToCudaError = cudaErrorAlreadyAcquired
#else
         hipErrorToCudaError = cudaErrorUnknown
#endif
      case (hipErrorNotMapped)
#if CUDA_VERSION >= 10010
         hipErrorToCudaError = cudaErrorNotMapped
#else
         hipErrorToCudaError = cudaErrorUnknown
#endif
      case (hipErrorNotMappedAsArray)
#if CUDA_VERSION >= 10010
         hipErrorToCudaError = cudaErrorNotMappedAsArray
#else
         hipErrorToCudaError = cudaErrorUnknown
#endif
      case (hipErrorNotMappedAsPointer)
#if CUDA_VERSION >= 10010
         hipErrorToCudaError = cudaErrorNotMappedAsPointer
#else
         hipErrorToCudaError = cudaErrorUnknown
#endif
      case (hipErrorECCNotCorrectable)
         hipErrorToCudaError = cudaErrorECCUncorrectable
      case (hipErrorUnsupportedLimit)
         hipErrorToCudaError = cudaErrorUnsupportedLimit
      case (hipErrorContextAlreadyInUse)
         hipErrorToCudaError = cudaErrorDeviceAlreadyInUse
      case (hipErrorPeerAccessUnsupported)
         hipErrorToCudaError = cudaErrorPeerAccessUnsupported
      case (hipErrorInvalidKernelFile)
         hipErrorToCudaError = cudaErrorInvalidPtx
      case (hipErrorInvalidGraphicsContext)
         hipErrorToCudaError = cudaErrorInvalidGraphicsContext
      case (hipErrorInvalidSource)
#if CUDA_VERSION >= 10010
         hipErrorToCudaError = cudaErrorInvalidSource
#else
         hipErrorToCudaError = cudaErrorUnknown
#endif
      case (hipErrorFileNotFound)
#if CUDA_VERSION >= 10010
         hipErrorToCudaError = cudaErrorFileNotFound
#else
         hipErrorToCudaError = cudaErrorUnknown
#endif
      case (hipErrorSharedObjectSymbolNotFound)
         hipErrorToCudaError = cudaErrorSharedObjectSymbolNotFound
      case (hipErrorSharedObjectInitFailed)
         hipErrorToCudaError = cudaErrorSharedObjectInitFailed
      case (hipErrorOperatingSystem)
         hipErrorToCudaError = cudaErrorOperatingSystem
      case (hipErrorNotFound)
#if CUDA_VERSION >= 10010
         hipErrorToCudaError = cudaErrorSymbolNotFound
#else
         hipErrorToCudaError = cudaErrorUnknown
#endif
      case (hipErrorIllegalAddress)
         hipErrorToCudaError = cudaErrorIllegalAddress
      case (hipErrorLaunchTimeOut)
         hipErrorToCudaError = cudaErrorLaunchTimeout
      case (hipErrorSetOnActiveProcess)
         hipErrorToCudaError = cudaErrorSetOnActiveProcess
      case (hipErrorLaunchFailure)
         hipErrorToCudaError = cudaErrorLaunchFailure
      case (hipErrorCooperativeLaunchTooLarge)
         hipErrorToCudaError = cudaErrorCooperativeLaunchTooLarge
      case (hipErrorNotSupported)
         hipErrorToCudaError = cudaErrorNotSupported
         ! HSA:does not exist in CUDA
      case (hipErrorRuntimeMemory)
         ! HSA:does not exist in CUDA
      case (hipErrorRuntimeOther)
      case (hipErrorUnknown)
      case (hipErrorTbd)
      case default
         hipErrorToCudaError = cudaErrorUnknown  ! Note - translated error.
      end select
   end function hipErrorToCudaError
#endif

end module hip_check
