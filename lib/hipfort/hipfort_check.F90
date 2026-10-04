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

module hipfort_check
  implicit none
contains
  subroutine hipCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_cuda_errors, only: cudaSuccess
    implicit none
    integer(kind(cudaSuccess)) :: status
    if (status /= cudaSuccess) then
      write (*, *) "HIP ERROR: code = ", status
#else
    use hipfort_enums, only: hipSuccess, hipErrorInvalidValue, hipErrorOutOfMemory, &
      hipErrorNotInitialized, hipErrorDeinitialized, hipErrorProfilerDisabled, &
      hipErrorProfilerNotInitialized, hipErrorProfilerAlreadyStarted, &
      hipErrorProfilerAlreadyStopped, hipErrorInvalidConfiguration, hipErrorInvalidPitchValue, &
      hipErrorInvalidSymbol, hipErrorInvalidDevicePointer, hipErrorInvalidMemcpyDirection, &
      hipErrorInsufficientDriver, hipErrorMissingConfiguration, hipErrorPriorLaunchFailure, &
      hipErrorInvalidDeviceFunction, hipErrorNoDevice, hipErrorInvalidDevice, &
      hipErrorInvalidImage, hipErrorInvalidContext, hipErrorContextAlreadyCurrent, &
      hipErrorMapFailed, hipErrorUnmapFailed, hipErrorArrayIsMapped, hipErrorAlreadyMapped, &
      hipErrorNoBinaryForGpu, hipErrorAlreadyAcquired, hipErrorNotMapped, &
      hipErrorNotMappedAsArray, hipErrorNotMappedAsPointer, hipErrorECCNotCorrectable, &
      hipErrorUnsupportedLimit, hipErrorContextAlreadyInUse, hipErrorPeerAccessUnsupported, &
      hipErrorInvalidKernelFile, hipErrorInvalidGraphicsContext, hipErrorInvalidSource, &
      hipErrorFileNotFound, hipErrorSharedObjectSymbolNotFound, hipErrorSharedObjectInitFailed, &
      hipErrorOperatingSystem, hipErrorInvalidHandle, hipErrorIllegalState, hipErrorNotFound, &
      hipErrorNotReady, hipErrorIllegalAddress, hipErrorLaunchOutOfResources, &
      hipErrorLaunchTimeOut, hipErrorPeerAccessAlreadyEnabled, hipErrorPeerAccessNotEnabled, &
      hipErrorSetOnActiveProcess, hipErrorContextIsDestroyed, hipErrorAssert, &
      hipErrorHostMemoryAlreadyRegistered, hipErrorHostMemoryNotRegistered, hipErrorLaunchFailure, &
      hipErrorCooperativeLaunchTooLarge, hipErrorNotSupported, hipErrorStreamCaptureUnsupported, &
      hipErrorStreamCaptureInvalidated, hipErrorStreamCaptureMerge, &
      hipErrorStreamCaptureUnmatched, hipErrorStreamCaptureUnjoined, &
      hipErrorStreamCaptureIsolation, hipErrorStreamCaptureImplicit, hipErrorCapturedEvent, &
      hipErrorStreamCaptureWrongThread, hipErrorGraphExecUpdateFailure, &
      hipErrorInvalidChannelDescriptor, hipErrorInvalidTexture, hipErrorInvalidResourceType, &
      hipErrorInvalidResourceConfiguration, hipErrorStreamDetached, hipErrorUnknown, &
      hipErrorRuntimeMemory, hipErrorRuntimeOther, hipErrorInvalidClusterSize, hipErrorTbd
    implicit none
    integer(kind(hipSuccess)) :: status
    character(len=:), allocatable :: name
    if (status /= hipSuccess) then
      select case (status)
      case (hipErrorInvalidValue)
        name = "hipErrorInvalidValue"
      case (hipErrorOutOfMemory)
        name = "hipErrorOutOfMemory"
      case (hipErrorNotInitialized)
        name = "hipErrorNotInitialized"
      case (hipErrorDeinitialized)
        name = "hipErrorDeinitialized"
      case (hipErrorProfilerDisabled)
        name = "hipErrorProfilerDisabled"
      case (hipErrorProfilerNotInitialized)
        name = "hipErrorProfilerNotInitialized"
      case (hipErrorProfilerAlreadyStarted)
        name = "hipErrorProfilerAlreadyStarted"
      case (hipErrorProfilerAlreadyStopped)
        name = "hipErrorProfilerAlreadyStopped"
      case (hipErrorInvalidConfiguration)
        name = "hipErrorInvalidConfiguration"
      case (hipErrorInvalidPitchValue)
        name = "hipErrorInvalidPitchValue"
      case (hipErrorInvalidSymbol)
        name = "hipErrorInvalidSymbol"
      case (hipErrorInvalidDevicePointer)
        name = "hipErrorInvalidDevicePointer"
      case (hipErrorInvalidMemcpyDirection)
        name = "hipErrorInvalidMemcpyDirection"
      case (hipErrorInsufficientDriver)
        name = "hipErrorInsufficientDriver"
      case (hipErrorMissingConfiguration)
        name = "hipErrorMissingConfiguration"
      case (hipErrorPriorLaunchFailure)
        name = "hipErrorPriorLaunchFailure"
      case (hipErrorInvalidDeviceFunction)
        name = "hipErrorInvalidDeviceFunction"
      case (hipErrorNoDevice)
        name = "hipErrorNoDevice"
      case (hipErrorInvalidDevice)
        name = "hipErrorInvalidDevice"
      case (hipErrorInvalidImage)
        name = "hipErrorInvalidImage"
      case (hipErrorInvalidContext)
        name = "hipErrorInvalidContext"
      case (hipErrorContextAlreadyCurrent)
        name = "hipErrorContextAlreadyCurrent"
      case (hipErrorMapFailed)
        name = "hipErrorMapFailed"
      case (hipErrorUnmapFailed)
        name = "hipErrorUnmapFailed"
      case (hipErrorArrayIsMapped)
        name = "hipErrorArrayIsMapped"
      case (hipErrorAlreadyMapped)
        name = "hipErrorAlreadyMapped"
      case (hipErrorNoBinaryForGpu)
        name = "hipErrorNoBinaryForGpu"
      case (hipErrorAlreadyAcquired)
        name = "hipErrorAlreadyAcquired"
      case (hipErrorNotMapped)
        name = "hipErrorNotMapped"
      case (hipErrorNotMappedAsArray)
        name = "hipErrorNotMappedAsArray"
      case (hipErrorNotMappedAsPointer)
        name = "hipErrorNotMappedAsPointer"
      case (hipErrorECCNotCorrectable)
        name = "hipErrorECCNotCorrectable"
      case (hipErrorUnsupportedLimit)
        name = "hipErrorUnsupportedLimit"
      case (hipErrorContextAlreadyInUse)
        name = "hipErrorContextAlreadyInUse"
      case (hipErrorPeerAccessUnsupported)
        name = "hipErrorPeerAccessUnsupported"
      case (hipErrorInvalidKernelFile)
        name = "hipErrorInvalidKernelFile"
      case (hipErrorInvalidGraphicsContext)
        name = "hipErrorInvalidGraphicsContext"
      case (hipErrorInvalidSource)
        name = "hipErrorInvalidSource"
      case (hipErrorFileNotFound)
        name = "hipErrorFileNotFound"
      case (hipErrorSharedObjectSymbolNotFound)
        name = "hipErrorSharedObjectSymbolNotFound"
      case (hipErrorSharedObjectInitFailed)
        name = "hipErrorSharedObjectInitFailed"
      case (hipErrorOperatingSystem)
        name = "hipErrorOperatingSystem"
      case (hipErrorInvalidHandle)
        name = "hipErrorInvalidHandle"
      case (hipErrorIllegalState)
        name = "hipErrorIllegalState"
      case (hipErrorNotFound)
        name = "hipErrorNotFound"
      case (hipErrorNotReady)
        name = "hipErrorNotReady"
      case (hipErrorIllegalAddress)
        name = "hipErrorIllegalAddress"
      case (hipErrorLaunchOutOfResources)
        name = "hipErrorLaunchOutOfResources"
      case (hipErrorLaunchTimeOut)
        name = "hipErrorLaunchTimeOut"
      case (hipErrorPeerAccessAlreadyEnabled)
        name = "hipErrorPeerAccessAlreadyEnabled"
      case (hipErrorPeerAccessNotEnabled)
        name = "hipErrorPeerAccessNotEnabled"
      case (hipErrorSetOnActiveProcess)
        name = "hipErrorSetOnActiveProcess"
      case (hipErrorContextIsDestroyed)
        name = "hipErrorContextIsDestroyed"
      case (hipErrorAssert)
        name = "hipErrorAssert"
      case (hipErrorHostMemoryAlreadyRegistered)
        name = "hipErrorHostMemoryAlreadyRegistered"
      case (hipErrorHostMemoryNotRegistered)
        name = "hipErrorHostMemoryNotRegistered"
      case (hipErrorLaunchFailure)
        name = "hipErrorLaunchFailure"
      case (hipErrorCooperativeLaunchTooLarge)
        name = "hipErrorCooperativeLaunchTooLarge"
      case (hipErrorNotSupported)
        name = "hipErrorNotSupported"
      case (hipErrorStreamCaptureUnsupported)
        name = "hipErrorStreamCaptureUnsupported"
      case (hipErrorStreamCaptureInvalidated)
        name = "hipErrorStreamCaptureInvalidated"
      case (hipErrorStreamCaptureMerge)
        name = "hipErrorStreamCaptureMerge"
      case (hipErrorStreamCaptureUnmatched)
        name = "hipErrorStreamCaptureUnmatched"
      case (hipErrorStreamCaptureUnjoined)
        name = "hipErrorStreamCaptureUnjoined"
      case (hipErrorStreamCaptureIsolation)
        name = "hipErrorStreamCaptureIsolation"
      case (hipErrorStreamCaptureImplicit)
        name = "hipErrorStreamCaptureImplicit"
      case (hipErrorCapturedEvent)
        name = "hipErrorCapturedEvent"
      case (hipErrorStreamCaptureWrongThread)
        name = "hipErrorStreamCaptureWrongThread"
      case (hipErrorGraphExecUpdateFailure)
        name = "hipErrorGraphExecUpdateFailure"
      case (hipErrorInvalidChannelDescriptor)
        name = "hipErrorInvalidChannelDescriptor"
      case (hipErrorInvalidTexture)
        name = "hipErrorInvalidTexture"
      case (hipErrorInvalidResourceType)
        name = "hipErrorInvalidResourceType"
      case (hipErrorInvalidResourceConfiguration)
        name = "hipErrorInvalidResourceConfiguration"
      case (hipErrorStreamDetached)
        name = "hipErrorStreamDetached"
      case (hipErrorUnknown)
        name = "hipErrorUnknown"
      case (hipErrorRuntimeMemory)
        name = "hipErrorRuntimeMemory"
      case (hipErrorRuntimeOther)
        name = "hipErrorRuntimeOther"
      case (hipErrorInvalidClusterSize)
        name = "hipErrorInvalidClusterSize"
      case (hipErrorTbd)
        name = "hipErrorTbd"
      case default
        name = "unknown status"
      end select
      write (*, "(a,i0,a)") "HIP ERROR: " // name // " (code ", status, ")"
#endif
      stop 1
    end if
  end subroutine hipCheck
  subroutine hipblasCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_hipblas_enums, only: HIPBLAS_STATUS_SUCCESS
    implicit none
    integer(kind(HIPBLAS_STATUS_SUCCESS)) :: status
    if (status /= HIPBLAS_STATUS_SUCCESS) then
      write (*, *) "HIPBLAS ERROR: code = ", status
#else
    use hipfort_hipblas_enums, only: HIPBLAS_STATUS_SUCCESS, HIPBLAS_STATUS_NOT_INITIALIZED, &
      HIPBLAS_STATUS_ALLOC_FAILED, HIPBLAS_STATUS_INVALID_VALUE, HIPBLAS_STATUS_MAPPING_ERROR, &
      HIPBLAS_STATUS_EXECUTION_FAILED, HIPBLAS_STATUS_INTERNAL_ERROR, &
      HIPBLAS_STATUS_NOT_SUPPORTED, HIPBLAS_STATUS_ARCH_MISMATCH, &
      HIPBLAS_STATUS_HANDLE_IS_NULLPTR, HIPBLAS_STATUS_INVALID_ENUM, HIPBLAS_STATUS_UNKNOWN
    implicit none
    integer(kind(HIPBLAS_STATUS_SUCCESS)) :: status
    character(len=:), allocatable :: name
    if (status /= HIPBLAS_STATUS_SUCCESS) then
      select case (status)
      case (HIPBLAS_STATUS_NOT_INITIALIZED)
        name = "HIPBLAS_STATUS_NOT_INITIALIZED"
      case (HIPBLAS_STATUS_ALLOC_FAILED)
        name = "HIPBLAS_STATUS_ALLOC_FAILED"
      case (HIPBLAS_STATUS_INVALID_VALUE)
        name = "HIPBLAS_STATUS_INVALID_VALUE"
      case (HIPBLAS_STATUS_MAPPING_ERROR)
        name = "HIPBLAS_STATUS_MAPPING_ERROR"
      case (HIPBLAS_STATUS_EXECUTION_FAILED)
        name = "HIPBLAS_STATUS_EXECUTION_FAILED"
      case (HIPBLAS_STATUS_INTERNAL_ERROR)
        name = "HIPBLAS_STATUS_INTERNAL_ERROR"
      case (HIPBLAS_STATUS_NOT_SUPPORTED)
        name = "HIPBLAS_STATUS_NOT_SUPPORTED"
      case (HIPBLAS_STATUS_ARCH_MISMATCH)
        name = "HIPBLAS_STATUS_ARCH_MISMATCH"
      case (HIPBLAS_STATUS_HANDLE_IS_NULLPTR)
        name = "HIPBLAS_STATUS_HANDLE_IS_NULLPTR"
      case (HIPBLAS_STATUS_INVALID_ENUM)
        name = "HIPBLAS_STATUS_INVALID_ENUM"
      case (HIPBLAS_STATUS_UNKNOWN)
        name = "HIPBLAS_STATUS_UNKNOWN"
      case default
        name = "unknown status"
      end select
      write (*, "(a,i0,a)") "HIPBLAS ERROR: " // name // " (code ", status, ")"
#endif
      stop 1
    end if
  end subroutine hipblasCheck
  subroutine hipfftCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_hipfft_enums, only: HIPFFT_SUCCESS
    implicit none
    integer(kind(HIPFFT_SUCCESS)) :: status
    if (status /= HIPFFT_SUCCESS) then
      write (*, *) "HIPFFT ERROR: code = ", status
#else
    use hipfort_hipfft_enums, only: HIPFFT_SUCCESS, HIPFFT_INVALID_PLAN, HIPFFT_ALLOC_FAILED, &
      HIPFFT_INVALID_TYPE, HIPFFT_INVALID_VALUE, HIPFFT_INTERNAL_ERROR, HIPFFT_EXEC_FAILED, &
      HIPFFT_SETUP_FAILED, HIPFFT_INVALID_SIZE, HIPFFT_UNALIGNED_DATA, &
      HIPFFT_INCOMPLETE_PARAMETER_LIST, HIPFFT_INVALID_DEVICE, HIPFFT_PARSE_ERROR, &
      HIPFFT_NO_WORKSPACE, HIPFFT_NOT_IMPLEMENTED, HIPFFT_NOT_SUPPORTED
    implicit none
    integer(kind(HIPFFT_SUCCESS)) :: status
    character(len=:), allocatable :: name
    if (status /= HIPFFT_SUCCESS) then
      select case (status)
      case (HIPFFT_INVALID_PLAN)
        name = "HIPFFT_INVALID_PLAN"
      case (HIPFFT_ALLOC_FAILED)
        name = "HIPFFT_ALLOC_FAILED"
      case (HIPFFT_INVALID_TYPE)
        name = "HIPFFT_INVALID_TYPE"
      case (HIPFFT_INVALID_VALUE)
        name = "HIPFFT_INVALID_VALUE"
      case (HIPFFT_INTERNAL_ERROR)
        name = "HIPFFT_INTERNAL_ERROR"
      case (HIPFFT_EXEC_FAILED)
        name = "HIPFFT_EXEC_FAILED"
      case (HIPFFT_SETUP_FAILED)
        name = "HIPFFT_SETUP_FAILED"
      case (HIPFFT_INVALID_SIZE)
        name = "HIPFFT_INVALID_SIZE"
      case (HIPFFT_UNALIGNED_DATA)
        name = "HIPFFT_UNALIGNED_DATA"
      case (HIPFFT_INCOMPLETE_PARAMETER_LIST)
        name = "HIPFFT_INCOMPLETE_PARAMETER_LIST"
      case (HIPFFT_INVALID_DEVICE)
        name = "HIPFFT_INVALID_DEVICE"
      case (HIPFFT_PARSE_ERROR)
        name = "HIPFFT_PARSE_ERROR"
      case (HIPFFT_NO_WORKSPACE)
        name = "HIPFFT_NO_WORKSPACE"
      case (HIPFFT_NOT_IMPLEMENTED)
        name = "HIPFFT_NOT_IMPLEMENTED"
      case (HIPFFT_NOT_SUPPORTED)
        name = "HIPFFT_NOT_SUPPORTED"
      case default
        name = "unknown status"
      end select
      write (*, "(a,i0,a)") "HIPFFT ERROR: " // name // " (code ", status, ")"
#endif
      stop 1
    end if
  end subroutine hipfftCheck
  subroutine hiprandCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_hiprand_enums, only: HIPRAND_STATUS_SUCCESS
    implicit none
    integer(kind(HIPRAND_STATUS_SUCCESS)) :: status
    if (status /= HIPRAND_STATUS_SUCCESS) then
      write (*, *) "HIPRAND ERROR: code = ", status
#else
    use hipfort_hiprand_enums, only: HIPRAND_STATUS_SUCCESS, HIPRAND_STATUS_VERSION_MISMATCH, &
      HIPRAND_STATUS_NOT_INITIALIZED, HIPRAND_STATUS_ALLOCATION_FAILED, HIPRAND_STATUS_TYPE_ERROR, &
      HIPRAND_STATUS_OUT_OF_RANGE, HIPRAND_STATUS_LENGTH_NOT_MULTIPLE, &
      HIPRAND_STATUS_DOUBLE_PRECISION_REQUIRED, HIPRAND_STATUS_LAUNCH_FAILURE, &
      HIPRAND_STATUS_PREEXISTING_FAILURE, HIPRAND_STATUS_INITIALIZATION_FAILED, &
      HIPRAND_STATUS_ARCH_MISMATCH, HIPRAND_STATUS_INTERNAL_ERROR, HIPRAND_STATUS_NOT_IMPLEMENTED
    implicit none
    integer(kind(HIPRAND_STATUS_SUCCESS)) :: status
    character(len=:), allocatable :: name
    if (status /= HIPRAND_STATUS_SUCCESS) then
      select case (status)
      case (HIPRAND_STATUS_VERSION_MISMATCH)
        name = "HIPRAND_STATUS_VERSION_MISMATCH"
      case (HIPRAND_STATUS_NOT_INITIALIZED)
        name = "HIPRAND_STATUS_NOT_INITIALIZED"
      case (HIPRAND_STATUS_ALLOCATION_FAILED)
        name = "HIPRAND_STATUS_ALLOCATION_FAILED"
      case (HIPRAND_STATUS_TYPE_ERROR)
        name = "HIPRAND_STATUS_TYPE_ERROR"
      case (HIPRAND_STATUS_OUT_OF_RANGE)
        name = "HIPRAND_STATUS_OUT_OF_RANGE"
      case (HIPRAND_STATUS_LENGTH_NOT_MULTIPLE)
        name = "HIPRAND_STATUS_LENGTH_NOT_MULTIPLE"
      case (HIPRAND_STATUS_DOUBLE_PRECISION_REQUIRED)
        name = "HIPRAND_STATUS_DOUBLE_PRECISION_REQUIRED"
      case (HIPRAND_STATUS_LAUNCH_FAILURE)
        name = "HIPRAND_STATUS_LAUNCH_FAILURE"
      case (HIPRAND_STATUS_PREEXISTING_FAILURE)
        name = "HIPRAND_STATUS_PREEXISTING_FAILURE"
      case (HIPRAND_STATUS_INITIALIZATION_FAILED)
        name = "HIPRAND_STATUS_INITIALIZATION_FAILED"
      case (HIPRAND_STATUS_ARCH_MISMATCH)
        name = "HIPRAND_STATUS_ARCH_MISMATCH"
      case (HIPRAND_STATUS_INTERNAL_ERROR)
        name = "HIPRAND_STATUS_INTERNAL_ERROR"
      case (HIPRAND_STATUS_NOT_IMPLEMENTED)
        name = "HIPRAND_STATUS_NOT_IMPLEMENTED"
      case default
        name = "unknown status"
      end select
      write (*, "(a,i0,a)") "HIPRAND ERROR: " // name // " (code ", status, ")"
#endif
      stop 1
    end if
  end subroutine hiprandCheck
  subroutine hipsolverCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_hipsolver_enums, only: HIPSOLVER_STATUS_SUCCESS
    implicit none
    integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: status
    if (status /= HIPSOLVER_STATUS_SUCCESS) then
      write (*, *) "HIPSOLVER ERROR: code = ", status
#else
    use hipfort_hipsolver_enums, only: HIPSOLVER_STATUS_SUCCESS, HIPSOLVER_STATUS_NOT_INITIALIZED, &
      HIPSOLVER_STATUS_ALLOC_FAILED, HIPSOLVER_STATUS_INVALID_VALUE, &
      HIPSOLVER_STATUS_MAPPING_ERROR, HIPSOLVER_STATUS_EXECUTION_FAILED, &
      HIPSOLVER_STATUS_INTERNAL_ERROR, HIPSOLVER_STATUS_NOT_SUPPORTED, &
      HIPSOLVER_STATUS_ARCH_MISMATCH, HIPSOLVER_STATUS_HANDLE_IS_NULLPTR, &
      HIPSOLVER_STATUS_INVALID_ENUM, HIPSOLVER_STATUS_UNKNOWN, HIPSOLVER_STATUS_ZERO_PIVOT, &
      HIPSOLVER_STATUS_MATRIX_TYPE_NOT_SUPPORTED
    implicit none
    integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: status
    character(len=:), allocatable :: name
    if (status /= HIPSOLVER_STATUS_SUCCESS) then
      select case (status)
      case (HIPSOLVER_STATUS_NOT_INITIALIZED)
        name = "HIPSOLVER_STATUS_NOT_INITIALIZED"
      case (HIPSOLVER_STATUS_ALLOC_FAILED)
        name = "HIPSOLVER_STATUS_ALLOC_FAILED"
      case (HIPSOLVER_STATUS_INVALID_VALUE)
        name = "HIPSOLVER_STATUS_INVALID_VALUE"
      case (HIPSOLVER_STATUS_MAPPING_ERROR)
        name = "HIPSOLVER_STATUS_MAPPING_ERROR"
      case (HIPSOLVER_STATUS_EXECUTION_FAILED)
        name = "HIPSOLVER_STATUS_EXECUTION_FAILED"
      case (HIPSOLVER_STATUS_INTERNAL_ERROR)
        name = "HIPSOLVER_STATUS_INTERNAL_ERROR"
      case (HIPSOLVER_STATUS_NOT_SUPPORTED)
        name = "HIPSOLVER_STATUS_NOT_SUPPORTED"
      case (HIPSOLVER_STATUS_ARCH_MISMATCH)
        name = "HIPSOLVER_STATUS_ARCH_MISMATCH"
      case (HIPSOLVER_STATUS_HANDLE_IS_NULLPTR)
        name = "HIPSOLVER_STATUS_HANDLE_IS_NULLPTR"
      case (HIPSOLVER_STATUS_INVALID_ENUM)
        name = "HIPSOLVER_STATUS_INVALID_ENUM"
      case (HIPSOLVER_STATUS_UNKNOWN)
        name = "HIPSOLVER_STATUS_UNKNOWN"
      case (HIPSOLVER_STATUS_ZERO_PIVOT)
        name = "HIPSOLVER_STATUS_ZERO_PIVOT"
      case (HIPSOLVER_STATUS_MATRIX_TYPE_NOT_SUPPORTED)
        name = "HIPSOLVER_STATUS_MATRIX_TYPE_NOT_SUPPORTED"
      case default
        name = "unknown status"
      end select
      write (*, "(a,i0,a)") "HIPSOLVER ERROR: " // name // " (code ", status, ")"
#endif
      stop 1
    end if
  end subroutine hipsolverCheck
  subroutine hipsparseCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_hipsparse_enums, only: HIPSPARSE_STATUS_SUCCESS
    implicit none
    integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: status
    if (status /= HIPSPARSE_STATUS_SUCCESS) then
      write (*, *) "HIPSPARSE ERROR: code = ", status
#else
    use hipfort_hipsparse_enums, only: HIPSPARSE_STATUS_SUCCESS, HIPSPARSE_STATUS_NOT_INITIALIZED, &
      HIPSPARSE_STATUS_ALLOC_FAILED, HIPSPARSE_STATUS_INVALID_VALUE, &
      HIPSPARSE_STATUS_ARCH_MISMATCH, HIPSPARSE_STATUS_MAPPING_ERROR, &
      HIPSPARSE_STATUS_EXECUTION_FAILED, HIPSPARSE_STATUS_INTERNAL_ERROR, &
      HIPSPARSE_STATUS_MATRIX_TYPE_NOT_SUPPORTED, HIPSPARSE_STATUS_ZERO_PIVOT, &
      HIPSPARSE_STATUS_NOT_SUPPORTED, HIPSPARSE_STATUS_INSUFFICIENT_RESOURCES
    implicit none
    integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: status
    character(len=:), allocatable :: name
    if (status /= HIPSPARSE_STATUS_SUCCESS) then
      select case (status)
      case (HIPSPARSE_STATUS_NOT_INITIALIZED)
        name = "HIPSPARSE_STATUS_NOT_INITIALIZED"
      case (HIPSPARSE_STATUS_ALLOC_FAILED)
        name = "HIPSPARSE_STATUS_ALLOC_FAILED"
      case (HIPSPARSE_STATUS_INVALID_VALUE)
        name = "HIPSPARSE_STATUS_INVALID_VALUE"
      case (HIPSPARSE_STATUS_ARCH_MISMATCH)
        name = "HIPSPARSE_STATUS_ARCH_MISMATCH"
      case (HIPSPARSE_STATUS_MAPPING_ERROR)
        name = "HIPSPARSE_STATUS_MAPPING_ERROR"
      case (HIPSPARSE_STATUS_EXECUTION_FAILED)
        name = "HIPSPARSE_STATUS_EXECUTION_FAILED"
      case (HIPSPARSE_STATUS_INTERNAL_ERROR)
        name = "HIPSPARSE_STATUS_INTERNAL_ERROR"
      case (HIPSPARSE_STATUS_MATRIX_TYPE_NOT_SUPPORTED)
        name = "HIPSPARSE_STATUS_MATRIX_TYPE_NOT_SUPPORTED"
      case (HIPSPARSE_STATUS_ZERO_PIVOT)
        name = "HIPSPARSE_STATUS_ZERO_PIVOT"
      case (HIPSPARSE_STATUS_NOT_SUPPORTED)
        name = "HIPSPARSE_STATUS_NOT_SUPPORTED"
      case (HIPSPARSE_STATUS_INSUFFICIENT_RESOURCES)
        name = "HIPSPARSE_STATUS_INSUFFICIENT_RESOURCES"
      case default
        name = "unknown status"
      end select
      write (*, "(a,i0,a)") "HIPSPARSE ERROR: " // name // " (code ", status, ")"
#endif
      stop 1
    end if
  end subroutine hipsparseCheck
  subroutine rocblasCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_rocblas_enums, only: rocblas_status_success
    implicit none
    integer(kind(rocblas_status_success)) :: status
    if (status /= rocblas_status_success) then
      write (*, *) "ROCBLAS ERROR: code = ", status
#else
    use hipfort_rocblas_enums, only: rocblas_status_success, rocblas_status_invalid_handle, &
      rocblas_status_not_implemented, rocblas_status_invalid_pointer, rocblas_status_invalid_size, &
      rocblas_status_memory_error, rocblas_status_internal_error, rocblas_status_perf_degraded, &
      rocblas_status_size_query_mismatch, rocblas_status_size_increased, &
      rocblas_status_size_unchanged, rocblas_status_invalid_value, rocblas_status_continue, &
      rocblas_status_check_numerics_fail, rocblas_status_excluded_from_build, &
      rocblas_status_arch_mismatch
    implicit none
    integer(kind(rocblas_status_success)) :: status
    character(len=:), allocatable :: name
    if (status /= rocblas_status_success) then
      select case (status)
      case (rocblas_status_invalid_handle)
        name = "rocblas_status_invalid_handle"
      case (rocblas_status_not_implemented)
        name = "rocblas_status_not_implemented"
      case (rocblas_status_invalid_pointer)
        name = "rocblas_status_invalid_pointer"
      case (rocblas_status_invalid_size)
        name = "rocblas_status_invalid_size"
      case (rocblas_status_memory_error)
        name = "rocblas_status_memory_error"
      case (rocblas_status_internal_error)
        name = "rocblas_status_internal_error"
      case (rocblas_status_perf_degraded)
        name = "rocblas_status_perf_degraded"
      case (rocblas_status_size_query_mismatch)
        name = "rocblas_status_size_query_mismatch"
      case (rocblas_status_size_increased)
        name = "rocblas_status_size_increased"
      case (rocblas_status_size_unchanged)
        name = "rocblas_status_size_unchanged"
      case (rocblas_status_invalid_value)
        name = "rocblas_status_invalid_value"
      case (rocblas_status_continue)
        name = "rocblas_status_continue"
      case (rocblas_status_check_numerics_fail)
        name = "rocblas_status_check_numerics_fail"
      case (rocblas_status_excluded_from_build)
        name = "rocblas_status_excluded_from_build"
      case (rocblas_status_arch_mismatch)
        name = "rocblas_status_arch_mismatch"
      case default
        name = "unknown status"
      end select
      write (*, "(a,i0,a)") "ROCBLAS ERROR: " // name // " (code ", status, ")"
#endif
      stop 1
    end if
  end subroutine rocblasCheck
  subroutine rocfftCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_rocfft_enums, only: rocfft_status_success
    implicit none
    integer(kind(rocfft_status_success)) :: status
    if (status /= rocfft_status_success) then
      write (*, *) "ROCFFT ERROR: code = ", status
#else
    use hipfort_rocfft_enums, only: rocfft_status_success, rocfft_status_failure, &
      rocfft_status_invalid_arg_value, rocfft_status_invalid_dimensions, &
      rocfft_status_invalid_array_type, rocfft_status_invalid_strides, &
      rocfft_status_invalid_distance, rocfft_status_invalid_offset, &
      rocfft_status_invalid_work_buffer
    implicit none
    integer(kind(rocfft_status_success)) :: status
    character(len=:), allocatable :: name
    if (status /= rocfft_status_success) then
      select case (status)
      case (rocfft_status_failure)
        name = "rocfft_status_failure"
      case (rocfft_status_invalid_arg_value)
        name = "rocfft_status_invalid_arg_value"
      case (rocfft_status_invalid_dimensions)
        name = "rocfft_status_invalid_dimensions"
      case (rocfft_status_invalid_array_type)
        name = "rocfft_status_invalid_array_type"
      case (rocfft_status_invalid_strides)
        name = "rocfft_status_invalid_strides"
      case (rocfft_status_invalid_distance)
        name = "rocfft_status_invalid_distance"
      case (rocfft_status_invalid_offset)
        name = "rocfft_status_invalid_offset"
      case (rocfft_status_invalid_work_buffer)
        name = "rocfft_status_invalid_work_buffer"
      case default
        name = "unknown status"
      end select
      write (*, "(a,i0,a)") "ROCFFT ERROR: " // name // " (code ", status, ")"
#endif
      stop 1
    end if
  end subroutine rocfftCheck
  subroutine rocrandCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_rocrand_enums, only: ROCRAND_STATUS_SUCCESS
    implicit none
    integer(kind(ROCRAND_STATUS_SUCCESS)) :: status
    if (status /= ROCRAND_STATUS_SUCCESS) then
      write (*, *) "ROCRAND ERROR: code = ", status
#else
    use hipfort_rocrand_enums, only: ROCRAND_STATUS_SUCCESS, ROCRAND_STATUS_VERSION_MISMATCH, &
      ROCRAND_STATUS_NOT_CREATED, ROCRAND_STATUS_ALLOCATION_FAILED, ROCRAND_STATUS_TYPE_ERROR, &
      ROCRAND_STATUS_OUT_OF_RANGE, ROCRAND_STATUS_LENGTH_NOT_MULTIPLE, &
      ROCRAND_STATUS_DOUBLE_PRECISION_REQUIRED, ROCRAND_STATUS_LAUNCH_FAILURE, &
      ROCRAND_STATUS_INTERNAL_ERROR
    implicit none
    integer(kind(ROCRAND_STATUS_SUCCESS)) :: status
    character(len=:), allocatable :: name
    if (status /= ROCRAND_STATUS_SUCCESS) then
      select case (status)
      case (ROCRAND_STATUS_VERSION_MISMATCH)
        name = "ROCRAND_STATUS_VERSION_MISMATCH"
      case (ROCRAND_STATUS_NOT_CREATED)
        name = "ROCRAND_STATUS_NOT_CREATED"
      case (ROCRAND_STATUS_ALLOCATION_FAILED)
        name = "ROCRAND_STATUS_ALLOCATION_FAILED"
      case (ROCRAND_STATUS_TYPE_ERROR)
        name = "ROCRAND_STATUS_TYPE_ERROR"
      case (ROCRAND_STATUS_OUT_OF_RANGE)
        name = "ROCRAND_STATUS_OUT_OF_RANGE"
      case (ROCRAND_STATUS_LENGTH_NOT_MULTIPLE)
        name = "ROCRAND_STATUS_LENGTH_NOT_MULTIPLE"
      case (ROCRAND_STATUS_DOUBLE_PRECISION_REQUIRED)
        name = "ROCRAND_STATUS_DOUBLE_PRECISION_REQUIRED"
      case (ROCRAND_STATUS_LAUNCH_FAILURE)
        name = "ROCRAND_STATUS_LAUNCH_FAILURE"
      case (ROCRAND_STATUS_INTERNAL_ERROR)
        name = "ROCRAND_STATUS_INTERNAL_ERROR"
      case default
        name = "unknown status"
      end select
      write (*, "(a,i0,a)") "ROCRAND ERROR: " // name // " (code ", status, ")"
#endif
      stop 1
    end if
  end subroutine rocrandCheck
  subroutine rocsolverCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_rocblas_enums, only: ROCBLAS_STATUS_SUCCESS
    implicit none
    integer(kind(ROCBLAS_STATUS_SUCCESS)) :: status
    if (status /= ROCBLAS_STATUS_SUCCESS) then
      write (*, *) "ROCSOLVER ERROR: code = ", status
#else
    use hipfort_rocblas_enums, only: ROCBLAS_STATUS_SUCCESS, rocblas_status_invalid_handle, &
      rocblas_status_not_implemented, rocblas_status_invalid_pointer, rocblas_status_invalid_size, &
      rocblas_status_memory_error, rocblas_status_internal_error, rocblas_status_perf_degraded, &
      rocblas_status_size_query_mismatch, rocblas_status_size_increased, &
      rocblas_status_size_unchanged, rocblas_status_invalid_value, rocblas_status_continue, &
      rocblas_status_check_numerics_fail, rocblas_status_excluded_from_build, &
      rocblas_status_arch_mismatch
    implicit none
    integer(kind(ROCBLAS_STATUS_SUCCESS)) :: status
    character(len=:), allocatable :: name
    if (status /= ROCBLAS_STATUS_SUCCESS) then
      select case (status)
      case (rocblas_status_invalid_handle)
        name = "rocblas_status_invalid_handle"
      case (rocblas_status_not_implemented)
        name = "rocblas_status_not_implemented"
      case (rocblas_status_invalid_pointer)
        name = "rocblas_status_invalid_pointer"
      case (rocblas_status_invalid_size)
        name = "rocblas_status_invalid_size"
      case (rocblas_status_memory_error)
        name = "rocblas_status_memory_error"
      case (rocblas_status_internal_error)
        name = "rocblas_status_internal_error"
      case (rocblas_status_perf_degraded)
        name = "rocblas_status_perf_degraded"
      case (rocblas_status_size_query_mismatch)
        name = "rocblas_status_size_query_mismatch"
      case (rocblas_status_size_increased)
        name = "rocblas_status_size_increased"
      case (rocblas_status_size_unchanged)
        name = "rocblas_status_size_unchanged"
      case (rocblas_status_invalid_value)
        name = "rocblas_status_invalid_value"
      case (rocblas_status_continue)
        name = "rocblas_status_continue"
      case (rocblas_status_check_numerics_fail)
        name = "rocblas_status_check_numerics_fail"
      case (rocblas_status_excluded_from_build)
        name = "rocblas_status_excluded_from_build"
      case (rocblas_status_arch_mismatch)
        name = "rocblas_status_arch_mismatch"
      case default
        name = "unknown status"
      end select
      write (*, "(a,i0,a)") "ROCSOLVER ERROR: " // name // " (code ", status, ")"
#endif
      stop 1
    end if
  end subroutine rocsolverCheck
  subroutine rocsparseCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_rocsparse_enums, only: rocsparse_status_success
    implicit none
    integer(kind(rocsparse_status_success)) :: status
    if (status /= rocsparse_status_success) then
      write (*, *) "ROCSPARSE ERROR: code = ", status
#else
    use hipfort_rocsparse_enums, only: rocsparse_status_success, rocsparse_status_invalid_handle, &
      rocsparse_status_not_implemented, rocsparse_status_invalid_pointer, &
      rocsparse_status_invalid_size, rocsparse_status_memory_error, &
      rocsparse_status_internal_error, rocsparse_status_invalid_value, &
      rocsparse_status_arch_mismatch, rocsparse_status_zero_pivot, &
      rocsparse_status_not_initialized, rocsparse_status_type_mismatch, &
      rocsparse_status_requires_sorted_storage, rocsparse_status_thrown_exception, &
      rocsparse_status_continue
    implicit none
    integer(kind(rocsparse_status_success)) :: status
    character(len=:), allocatable :: name
    if (status /= rocsparse_status_success) then
      select case (status)
      case (rocsparse_status_invalid_handle)
        name = "rocsparse_status_invalid_handle"
      case (rocsparse_status_not_implemented)
        name = "rocsparse_status_not_implemented"
      case (rocsparse_status_invalid_pointer)
        name = "rocsparse_status_invalid_pointer"
      case (rocsparse_status_invalid_size)
        name = "rocsparse_status_invalid_size"
      case (rocsparse_status_memory_error)
        name = "rocsparse_status_memory_error"
      case (rocsparse_status_internal_error)
        name = "rocsparse_status_internal_error"
      case (rocsparse_status_invalid_value)
        name = "rocsparse_status_invalid_value"
      case (rocsparse_status_arch_mismatch)
        name = "rocsparse_status_arch_mismatch"
      case (rocsparse_status_zero_pivot)
        name = "rocsparse_status_zero_pivot"
      case (rocsparse_status_not_initialized)
        name = "rocsparse_status_not_initialized"
      case (rocsparse_status_type_mismatch)
        name = "rocsparse_status_type_mismatch"
      case (rocsparse_status_requires_sorted_storage)
        name = "rocsparse_status_requires_sorted_storage"
      case (rocsparse_status_thrown_exception)
        name = "rocsparse_status_thrown_exception"
      case (rocsparse_status_continue)
        name = "rocsparse_status_continue"
      case default
        name = "unknown status"
      end select
      write (*, "(a,i0,a)") "ROCSPARSE ERROR: " // name // " (code ", status, ")"
#endif
      stop 1
    end if
  end subroutine rocsparseCheck
end module hipfort_check
