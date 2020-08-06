!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (c) 2020 Advanced Micro Devices, Inc.
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
          
           
module hip
#ifdef USE_CUDA_NAMES
  use cuda_errors
#endif
  use hip_enums
  use hip_types
  implicit none

 
  interface
  ! 
  !   @brief Waits on all active streams on current device
  !  
  !   When this command is invoked, the host thread gets blocked until all the commands associated
  !   with streams associated with the device. HIP does not support multiple blocking modes (yet!).
  !  
  !   @returns #hipSuccess
  !  
  !   @see hipSetDevice, hipDeviceReset
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceSynchronize() bind(c, name="cudaDeviceSynchronize")
#else
  function hipDeviceSynchronize() bind(c, name="hipDeviceSynchronize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceSynchronize
#else
      integer(kind(hipSuccess)) :: hipDeviceSynchronize
#endif
    end function

  ! 
  !   @brief The state of current device is discarded and updated to a fresh state.
  !  
  !   Calling this function deletes all streams created, memory allocated, kernels running, events
  !   created. Make sure that no other thread is using the device or streams, memory, kernels, events
  !   associated with the current device.
  !  
  !   @returns #hipSuccess
  !  
  !   @see hipDeviceSynchronize
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceReset() bind(c, name="cudaDeviceReset")
#else
  function hipDeviceReset() bind(c, name="hipDeviceReset")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceReset
#else
      integer(kind(hipSuccess)) :: hipDeviceReset
#endif
    end function

  ! 
  !   @brief Set default device to be used for subsequent hip API calls from this thread.
  !  
  !   @param[in] deviceId Valid device in range 0...hipGetDeviceCount().
  !  
  !   Sets @p device as the default device for the calling host thread.  Valid device id's are 0...
  !   (hipGetDeviceCount()-1).
  !  
  !   Many HIP APIs implicitly use the "default device" :
  !  
  !   - Any device memory subsequently allocated from this host thread (using hipMalloc) will be
  !   allocated on device.
  !   - Any streams or events created from this host thread will be associated with device.
  !   - Any kernels launched from this host thread (using hipLaunchKernel) will be executed on device
  !   (unless a specific stream is specified, in which case the device associated with that stream will
  !   be used).
  !  
  !   This function may be called from any host thread.  Multiple host threads may use the same device.
  !   This function does no synchronization with the previous or new device, and has very little
  !   runtime overhead. Applications can use hipSetDevice to quickly switch the default device before
  !   making a HIP runtime call which uses the default device.
  !  
  !   The default device is stored in thread-local-storage for each thread.
  !   Thread-pool implementations may inherit the default device of the previous thread.  A good
  !   practice is to always call hipSetDevice at the start of HIP coding sequency to establish a known
  !   standard device.
  !  
  !   @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorDeviceAlreadyInUse
  !  
  !   @see hipGetDevice, hipGetDeviceCount
  !  
#ifdef USE_CUDA_NAMES
  function hipSetDevice(deviceId) bind(c, name="cudaSetDevice")
#else
  function hipSetDevice(deviceId) bind(c, name="hipSetDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipSetDevice
#else
      integer(kind(hipSuccess)) :: hipSetDevice
#endif
      integer(c_int),value :: deviceId
    end function

  ! 
  !   @brief Return the default device id for the calling host thread.
  !  
  !   @param [out] device device is written with the default device
  !  
  !   HIP maintains an default device for each thread using thread-local-storage.
  !   This device is used implicitly for HIP runtime APIs called by this thread.
  !   hipGetDevice returns in  @p device the default device for the calling host thread.
  !  
  !   @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
  !  
  !   @see hipSetDevice, hipGetDevicesizeBytes
  !  
#ifdef USE_CUDA_NAMES
  function hipGetDevice(deviceId) bind(c, name="cudaGetDevice")
#else
  function hipGetDevice(deviceId) bind(c, name="hipGetDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetDevice
#else
      integer(kind(hipSuccess)) :: hipGetDevice
#endif
      type(c_ptr),value :: deviceId
    end function

  ! 
  !   @brief Return number of compute-capable devices.
  !  
  !   @param [output] count Returns number of compute-capable devices.
  !  
  !   @returns #hipSuccess, #hipErrorNoDevice
  !  
  !  
  !   Returns in @p count the number of devices that have ability to run compute commands.  If there
  !   are no such devices, then @ref hipGetDeviceCount will return #hipErrorNoDevice. If 1 or more
  !   devices can be found, then hipGetDeviceCount returns #hipSuccess.
  !  
#ifdef USE_CUDA_NAMES
  function hipGetDeviceCount(count) bind(c, name="cudaGetDeviceCount")
#else
  function hipGetDeviceCount(count) bind(c, name="hipGetDeviceCount")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetDeviceCount
#else
      integer(kind(hipSuccess)) :: hipGetDeviceCount
#endif
      type(c_ptr),value :: count
    end function

  ! 
  !   @brief Query for a specific device attribute.
  !  
  !   @param [out] pi pointer to value to return
  !   @param [in] attr attribute to query
  !   @param [in] deviceId which device to query for information
  !  
  !   @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceGetAttribute(pi,attr,deviceId) bind(c, name="cudaDeviceGetAttribute")
#else
  function hipDeviceGetAttribute(pi,attr,deviceId) bind(c, name="hipDeviceGetAttribute")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetAttribute
#else
      integer(kind(hipSuccess)) :: hipDeviceGetAttribute
#endif
      type(c_ptr),value :: pi
      integer(kind(hipDeviceAttributeMaxThreadsPerBlock)),value :: attr
      integer(c_int),value :: deviceId
    end function

  ! 
  !   @brief Returns device properties.
  !  
  !   @param [out] prop written with device properties
  !   @param [in]  deviceId which device to query for information
  !  
  !   @return #hipSuccess, #hipErrorInvalidDevice
  !   @bug HCC always returns 0 for maxThreadsPerMultiProcessor
  !   @bug HCC always returns 0 for regsPerBlock
  !   @bug HCC always returns 0 for l2CacheSize
  !  
  !   Populates hipGetDeviceProperties with information for the specified device.
  !  
#ifdef USE_CUDA_NAMES
  function hipGetDeviceProperties(prop,deviceId) bind(c, name="cudaGetDeviceProperties")
#else
  function hipGetDeviceProperties(prop,deviceId) bind(c, name="hipGetDeviceProperties")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetDeviceProperties
#else
      integer(kind(hipSuccess)) :: hipGetDeviceProperties
#endif
      type(c_ptr),intent(INOUT) :: prop
      integer(c_int),value :: deviceId
    end function

  ! 
  !   @brief Set L1Shared cache partition.
  !  
  !   @param [in] cacheConfig
  !  
  !   @returns #hipSuccess, #hipErrorNotInitialized
  !   Note: AMD devices and some Nvidia GPUS do not support reconfigurable cache.  This hint is ignored
  !   on those architectures.
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceSetCacheConfig(cacheConfig) bind(c, name="cudaDeviceSetCacheConfig")
#else
  function hipDeviceSetCacheConfig(cacheConfig) bind(c, name="hipDeviceSetCacheConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceSetCacheConfig
#else
      integer(kind(hipSuccess)) :: hipDeviceSetCacheConfig
#endif
      integer(kind(hipFuncCachePreferNone)),value :: cacheConfig
    end function

  ! 
  !   @brief Set Cache configuration for a specific function
  !  
  !   @param [in] cacheConfig
  !  
  !   @returns #hipSuccess, #hipErrorNotInitialized
  !   Note: AMD devices and some Nvidia GPUS do not support reconfigurable cache.  This hint is ignored
  !   on those architectures.
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceGetCacheConfig(cacheConfig) bind(c, name="cudaDeviceGetCacheConfig")
#else
  function hipDeviceGetCacheConfig(cacheConfig) bind(c, name="hipDeviceGetCacheConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetCacheConfig
#else
      integer(kind(hipSuccess)) :: hipDeviceGetCacheConfig
#endif
      type(c_ptr),value :: cacheConfig
    end function

  ! 
  !   @brief Get Resource limits of current device
  !  
  !   @param [out] pValue
  !   @param [in]  limit
  !  
  !   @returns #hipSuccess, #hipErrorUnsupportedLimit, #hipErrorInvalidValue
  !   Note: Currently, only hipLimitMallocHeapSize is available
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceGetLimit(pValue,limit) bind(c, name="cudaDeviceGetLimit")
#else
  function hipDeviceGetLimit(pValue,limit) bind(c, name="hipDeviceGetLimit")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetLimit
#else
      integer(kind(hipSuccess)) :: hipDeviceGetLimit
#endif
      integer(c_size_t),intent(IN) :: pValue
      integer(kind(hipLimitMallocHeapSize)),value :: limit
    end function

  ! 
  !   @brief Set Cache configuration for a specific function
  !  
  !   @param [in] config;
  !  
  !   @returns #hipSuccess, #hipErrorNotInitialized
  !   Note: AMD devices and some Nvidia GPUS do not support reconfigurable cache.  This hint is ignored
  !   on those architectures.
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipFuncSetCacheConfig(func,config) bind(c, name="cudaFuncSetCacheConfig")
#else
  function hipFuncSetCacheConfig(func,config) bind(c, name="hipFuncSetCacheConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFuncSetCacheConfig
#else
      integer(kind(hipSuccess)) :: hipFuncSetCacheConfig
#endif
      type(c_ptr),value :: func
      integer(kind(hipFuncCachePreferNone)),value :: config
    end function

  ! 
  !   @brief Returns bank width of shared memory for current device
  !  
  !   @param [out] pConfig
  !  
  !   @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !  
  !   Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !   ignored on those architectures.
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceGetSharedMemConfig(pConfig) bind(c, name="cudaDeviceGetSharedMemConfig")
#else
  function hipDeviceGetSharedMemConfig(pConfig) bind(c, name="hipDeviceGetSharedMemConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetSharedMemConfig
#else
      integer(kind(hipSuccess)) :: hipDeviceGetSharedMemConfig
#endif
      type(c_ptr),value :: pConfig
    end function

  ! 
  !   @brief The bank width of shared memory on current device is set
  !  
  !   @param [in] config
  !  
  !   @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !  
  !   Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !   ignored on those architectures.
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceSetSharedMemConfig(config) bind(c, name="cudaDeviceSetSharedMemConfig")
#else
  function hipDeviceSetSharedMemConfig(config) bind(c, name="hipDeviceSetSharedMemConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceSetSharedMemConfig
#else
      integer(kind(hipSuccess)) :: hipDeviceSetSharedMemConfig
#endif
      integer(kind(hipSharedMemBankSizeDefault)),value :: config
    end function

  ! 
  !   @brief The current device behavior is changed according the flags passed.
  !  
  !   @param [in] flags
  !  
  !   The schedule flags impact how HIP waits for the completion of a command running on a device.
  !   hipDeviceScheduleSpin         : HIP runtime will actively spin in the thread which submitted the
  !   work until the command completes.  This offers the lowest latency, but will consume a CPU core
  !   and may increase power. hipDeviceScheduleYield        : The HIP runtime will yield the CPU to
  !   system so that other tasks can use it.  This may increase latency to detect the completion but
  !   will consume less power and is friendlier to other tasks in the system.
  !   hipDeviceScheduleBlockingSync : On ROCm platform, this is a synonym for hipDeviceScheduleYield.
  !   hipDeviceScheduleAuto         : Use a hueristic to select between Spin and Yield modes.  If the
  !   number of HIP contexts is greater than the number of logical processors in the system, use Spin
  !   scheduling.  Else use Yield scheduling.
  !  
  !  
  !   hipDeviceMapHost              : Allow mapping host memory.  On ROCM, this is always allowed and
  !   the flag is ignored. hipDeviceLmemResizeToMax      : @warning ROCm silently ignores this flag.
  !  
  !   @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorSetOnActiveProcess
  !  
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipSetDeviceFlags(flags) bind(c, name="cudaSetDeviceFlags")
#else
  function hipSetDeviceFlags(flags) bind(c, name="hipSetDeviceFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipSetDeviceFlags
#else
      integer(kind(hipSuccess)) :: hipSetDeviceFlags
#endif
      integer(kind=4),value :: flags
    end function

  ! 
  !   @brief Device which matches hipDeviceProp_t is returned
  !  
  !   @param [out] device ID
  !   @param [in]  device properties pointer
  !  
  !   @returns #hipSuccess, #hipErrorInvalidValue
  !  
#ifdef USE_CUDA_NAMES
  function hipChooseDevice(device,prop) bind(c, name="cudaChooseDevice")
#else
  function hipChooseDevice(device,prop) bind(c, name="hipChooseDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipChooseDevice
#else
      integer(kind(hipSuccess)) :: hipChooseDevice
#endif
      type(c_ptr),value :: device
      type(c_ptr),intent(INOUT) :: prop
    end function

  ! 
  !   @brief Returns the link type and hop count between two devices
  !  
  !   @param [in] device1 Ordinal for device1
  !   @param [in] device2 Ordinal for device2
  !   @param [out] linktype Returns the link type (See hsa_amd_link_info_type_t) between the two devices
  !   @param [out] hopcount Returns the hop count between the two devices
  !  
  !   Queries and returns the HSA link type and the hop count between the two specified devices.
  !  
  !   @returns #hipSuccess, #hipInvalidDevice, #hipErrorRuntimeOther
  !  
#ifdef USE_CUDA_NAMES
  function hipExtGetLinkTypeAndHopCount(device1,device2,linktype,hopcount) bind(c, name="cudaExtGetLinkTypeAndHopCount")
#else
  function hipExtGetLinkTypeAndHopCount(device1,device2,linktype,hopcount) bind(c, name="hipExtGetLinkTypeAndHopCount")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipExtGetLinkTypeAndHopCount
#else
      integer(kind(hipSuccess)) :: hipExtGetLinkTypeAndHopCount
#endif
      integer(c_int),value :: device1
      integer(c_int),value :: device2
      type(c_ptr),value :: linktype
      type(c_ptr),value :: hopcount
    end function

  ! 
  !   @brief Return last error returned by any HIP runtime API call and resets the stored error code to
  !   #hipSuccess
  !  
  !   @returns return code from last HIP called from the active host thread
  !  
  !   Returns the last error that has been returned by any of the runtime calls in the same host
  !   thread, and then resets the saved error to #hipSuccess.
  !  
  !   @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
  !  
#ifdef USE_CUDA_NAMES
  function hipGetLastError() bind(c, name="cudaGetLastError")
#else
  function hipGetLastError() bind(c, name="hipGetLastError")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetLastError
#else
      integer(kind(hipSuccess)) :: hipGetLastError
#endif
    end function

  ! 
  !   @brief Return last error returned by any HIP runtime API call.
  !  
  !   @return #hipSuccess
  !  
  !   Returns the last error that has been returned by any of the runtime calls in the same host
  !   thread. Unlike hipGetLastError, this function does not reset the saved error code.
  !  
  !   @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
  !  
#ifdef USE_CUDA_NAMES
  function hipPeekAtLastError() bind(c, name="cudaPeekAtLastError")
#else
  function hipPeekAtLastError() bind(c, name="hipPeekAtLastError")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipPeekAtLastError
#else
      integer(kind(hipSuccess)) :: hipPeekAtLastError
#endif
    end function

  ! 
  !   @brief Create an asynchronous stream.
  !  
  !   @param[in, out] stream Valid pointer to hipStream_t.  This function writes the memory with the
  !   newly created stream.
  !   @return #hipSuccess, #hipErrorInvalidValue
  !  
  !   Create a new asynchronous stream.  @p stream returns an opaque handle that can be used to
  !   reference the newly created stream in subsequent hipStream commands.  The stream is allocated on
  !   the heap and will remain allocated even if the handle goes out-of-scope.  To release the memory
  !   used by the stream, applicaiton must call hipStreamDestroy.
  !  
  !   @return #hipSuccess, #hipErrorInvalidValue
  !  
  !   @see hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
  !  
#ifdef USE_CUDA_NAMES
  function hipStreamCreate(stream) bind(c, name="cudaStreamCreate")
#else
  function hipStreamCreate(stream) bind(c, name="hipStreamCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamCreate
#else
      integer(kind(hipSuccess)) :: hipStreamCreate
#endif
      type(c_ptr),intent(INOUT) :: stream
    end function

  ! 
  !   @brief Create an asynchronous stream.
  !  
  !   @param[in, out] stream Pointer to new stream
  !   @param[in ] flags to control stream creation.
  !   @return #hipSuccess, #hipErrorInvalidValue
  !  
  !   Create a new asynchronous stream.  @p stream returns an opaque handle that can be used to
  !   reference the newly created stream in subsequent hipStream commands.  The stream is allocated on
  !   the heap and will remain allocated even if the handle goes out-of-scope.  To release the memory
  !   used by the stream, applicaiton must call hipStreamDestroy. Flags controls behavior of the
  !   stream.  See #hipStreamDefault, #hipStreamNonBlocking.
  !  
  !  
  !   @see hipStreamCreate, hipStreamCreateWithPriority, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
  !  
#ifdef USE_CUDA_NAMES
  function hipStreamCreateWithFlags(stream,flags) bind(c, name="cudaStreamCreateWithFlags")
#else
  function hipStreamCreateWithFlags(stream,flags) bind(c, name="hipStreamCreateWithFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamCreateWithFlags
#else
      integer(kind(hipSuccess)) :: hipStreamCreateWithFlags
#endif
      type(c_ptr),intent(INOUT) :: stream
      integer(kind=4),value :: flags
    end function

  ! 
  !   @brief Create an asynchronous stream with the specified priority.
  !  
  !   @param[in, out] stream Pointer to new stream
  !   @param[in ] flags to control stream creation.
  !   @param[in ] priority of the stream. Lower numbers represent higher priorities.
  !   @return #hipSuccess, #hipErrorInvalidValue
  !  
  !   Create a new asynchronous stream with the specified priority.  @p stream returns an opaque handle
  !   that can be used to reference the newly created stream in subsequent hipStream commands.  The
  !   stream is allocated on the heap and will remain allocated even if the handle goes out-of-scope.
  !   To release the memory used by the stream, applicaiton must call hipStreamDestroy. Flags controls
  !   behavior of the stream.  See #hipStreamDefault, #hipStreamNonBlocking.
  !  
  !  
  !   @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
  !  
#ifdef USE_CUDA_NAMES
  function hipStreamCreateWithPriority(stream,flags,priority) bind(c, name="cudaStreamCreateWithPriority")
#else
  function hipStreamCreateWithPriority(stream,flags,priority) bind(c, name="hipStreamCreateWithPriority")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamCreateWithPriority
#else
      integer(kind(hipSuccess)) :: hipStreamCreateWithPriority
#endif
      type(c_ptr),intent(INOUT) :: stream
      integer(kind=4),value :: flags
      integer(c_int),value :: priority
    end function

  ! 
  !   @brief Returns numerical values that correspond to the least and greatest stream priority.
  !  
  !   @param[in, out] leastPriority pointer in which value corresponding to least priority is returned.
  !   @param[in, out] greatestPriority pointer in which value corresponding to greatest priority is returned.
  !  
  !   Returns in leastPriority and greatestPriority the numerical values that correspond to the least
  !   and greatest stream priority respectively. Stream priorities follow a convention where lower numbers
  !   imply greater priorities. The range of meaningful stream priorities is given by
  !   [greatestPriority, leastPriority]. If the user attempts to create a stream with a priority value
  !   that is outside the the meaningful range as specified by this API, the priority is automatically
  !   clamped to within the valid range.
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceGetStreamPriorityRange(leastPriority,greatestPriority) bind(c, name="cudaDeviceGetStreamPriorityRange")
#else
  function hipDeviceGetStreamPriorityRange(leastPriority,greatestPriority) bind(c, name="hipDeviceGetStreamPriorityRange")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetStreamPriorityRange
#else
      integer(kind(hipSuccess)) :: hipDeviceGetStreamPriorityRange
#endif
      type(c_ptr),value :: leastPriority
      type(c_ptr),value :: greatestPriority
    end function

  ! 
  !   @brief Destroys the specified stream.
  !  
  !   @param[in, out] stream Valid pointer to hipStream_t.  This function writes the memory with the
  !   newly created stream.
  !   @return #hipSuccess #hipErrorInvalidHandle
  !  
  !   Destroys the specified stream.
  !  
  !   If commands are still executing on the specified stream, some may complete execution before the
  !   queue is deleted.
  !  
  !   The queue may be destroyed while some commands are still inflight, or may wait for all commands
  !   queued to the stream before destroying it.
  !  
  !   @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamQuery, hipStreamWaitEvent,
  !   hipStreamSynchronize
  !  
#ifdef USE_CUDA_NAMES
  function hipStreamDestroy(stream) bind(c, name="cudaStreamDestroy")
#else
  function hipStreamDestroy(stream) bind(c, name="hipStreamDestroy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamDestroy
#else
      integer(kind(hipSuccess)) :: hipStreamDestroy
#endif
      type(c_ptr),value :: stream
    end function

  ! 
  !   @brief Return #hipSuccess if all of the operations in the specified @p stream have completed, or
  !   #hipErrorNotReady if not.
  !  
  !   @param[in] stream stream to query
  !  
  !   @return #hipSuccess, #hipErrorNotReady, #hipErrorInvalidHandle
  !  
  !   This is thread-safe and returns a snapshot of the current state of the queue.  However, if other
  !   host threads are sending work to the stream, the status may change immediately after the function
  !   is called.  It is typically used for debug.
  !  
  !   @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamWaitEvent, hipStreamSynchronize,
  !   hipStreamDestroy
  !  
#ifdef USE_CUDA_NAMES
  function hipStreamQuery(stream) bind(c, name="cudaStreamQuery")
#else
  function hipStreamQuery(stream) bind(c, name="hipStreamQuery")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamQuery
#else
      integer(kind(hipSuccess)) :: hipStreamQuery
#endif
      type(c_ptr),value :: stream
    end function

  ! 
  !   @brief Wait for all commands in stream to complete.
  !  
  !   @param[in] stream stream identifier.
  !  
  !   @return #hipSuccess, #hipErrorInvalidHandle
  !  
  !   This command is host-synchronous : the host will block until the specified stream is empty.
  !  
  !   This command follows standard null-stream semantics.  Specifically, specifying the null stream
  !   will cause the command to wait for other streams on the same device to complete all pending
  !   operations.
  !  
  !   This command honors the hipDeviceLaunchBlocking flag, which controls whether the wait is active
  !   or blocking.
  !  
  !   @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamWaitEvent, hipStreamDestroy
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipStreamSynchronize(stream) bind(c, name="cudaStreamSynchronize")
#else
  function hipStreamSynchronize(stream) bind(c, name="hipStreamSynchronize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamSynchronize
#else
      integer(kind(hipSuccess)) :: hipStreamSynchronize
#endif
      type(c_ptr),value :: stream
    end function

  ! 
  !   @brief Make the specified compute stream wait for an event
  !  
  !   @param[in] stream stream to make wait.
  !   @param[in] event event to wait on
  !   @param[in] flags control operation [must be 0]
  !  
  !   @return #hipSuccess, #hipErrorInvalidHandle
  !  
  !   This function inserts a wait operation into the specified stream.
  !   All future work submitted to @p stream will wait until @p event reports completion before
  !   beginning execution.
  !  
  !   This function only waits for commands in the current stream to complete.  Notably,, this function
  !   does not impliciy wait for commands in the default stream to complete, even if the specified
  !   stream is created with hipStreamNonBlocking = 0.
  !  
  !   @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamSynchronize, hipStreamDestroy
  !  
#ifdef USE_CUDA_NAMES
  function hipStreamWaitEvent(stream,event,flags) bind(c, name="cudaStreamWaitEvent")
#else
  function hipStreamWaitEvent(stream,event,flags) bind(c, name="hipStreamWaitEvent")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamWaitEvent
#else
      integer(kind(hipSuccess)) :: hipStreamWaitEvent
#endif
      type(c_ptr),value :: stream
      type(c_ptr),intent(INOUT) :: event
      integer(kind=4),value :: flags
    end function

  ! 
  !   @brief Return flags associated with this stream.
  !  
  !   @param[in] stream stream to be queried
  !   @param[in,out] flags Pointer to an unsigned integer in which the stream's flags are returned
  !   @return #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidHandle
  !  
  !   @returns #hipSuccess #hipErrorInvalidValue #hipErrorInvalidHandle
  !  
  !   Return flags associated with this stream in @p flags.
  !  
  !   @see hipStreamCreateWithFlags
  !  
#ifdef USE_CUDA_NAMES
  function hipStreamGetFlags(stream,flags) bind(c, name="cudaStreamGetFlags")
#else
  function hipStreamGetFlags(stream,flags) bind(c, name="hipStreamGetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamGetFlags
#else
      integer(kind(hipSuccess)) :: hipStreamGetFlags
#endif
      type(c_ptr),value :: stream
      type(c_ptr),value :: flags
    end function

  ! 
  !   @brief Query the priority of a stream.
  !  
  !   @param[in] stream stream to be queried
  !   @param[in,out] priority Pointer to an unsigned integer in which the stream's priority is returned
  !   @return #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidHandle
  !  
  !   @returns #hipSuccess #hipErrorInvalidValue #hipErrorInvalidHandle
  !  
  !   Query the priority of a stream. The priority is returned in in priority.
  !  
  !   @see hipStreamCreateWithFlags
  !  
#ifdef USE_CUDA_NAMES
  function hipStreamGetPriority(stream,priority) bind(c, name="cudaStreamGetPriority")
#else
  function hipStreamGetPriority(stream,priority) bind(c, name="hipStreamGetPriority")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamGetPriority
#else
      integer(kind(hipSuccess)) :: hipStreamGetPriority
#endif
      type(c_ptr),value :: stream
      type(c_ptr),value :: priority
    end function

  ! 
  !   @brief Adds a callback to be called on the host after all currently enqueued
  !   items in the stream have completed.  For each
  !   cudaStreamAddCallback call, a callback will be executed exactly once.
  !   The callback will block later work in the stream until it is finished.
  !   @param[in] stream   - Stream to add callback to
  !   @param[in] callback - The function to call once preceding stream operations are complete
  !   @param[in] userData - User specified data to be passed to the callback function
  !   @param[in] flags    - Reserved for future use, must be 0
  !   @return #hipSuccess, #hipErrorInvalidHandle, #hipErrorNotSupported
  !  
  !   @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamQuery, hipStreamSynchronize,
  !   hipStreamWaitEvent, hipStreamDestroy, hipStreamCreateWithPriority
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipStreamAddCallback(stream,callback,userData,flags) bind(c, name="cudaStreamAddCallback")
#else
  function hipStreamAddCallback(stream,callback,userData,flags) bind(c, name="hipStreamAddCallback")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamAddCallback
#else
      integer(kind(hipSuccess)) :: hipStreamAddCallback
#endif
      type(c_ptr),value :: stream
      type(c_funptr),value :: callback
      type(c_ptr),value :: userData
      integer(kind=4),value :: flags
    end function

  ! 
  !   @brief Create an event with the specified flags
  !  
  !   @param[in,out] event Returns the newly created event.
  !   @param[in] flags     Flags to control event behavior.  Valid values are #hipEventDefault,
  !  #hipEventBlockingSync, #hipEventDisableTiming, #hipEventInterprocess
  ! 
  !   #hipEventDefault : Default flag.  The event will use active synchronization and will support
  !  timing.  Blocking synchronization provides lowest possible latency at the expense of dedicating a
  !  CPU to poll on the event.
  !   #hipEventBlockingSync : The event will use blocking synchronization : if hipEventSynchronize is
  !  called on this event, the thread will block until the event completes.  This can increase latency
  !  for the synchroniation but can result in lower power and more resources for other CPU threads.
  !   #hipEventDisableTiming : Disable recording of timing information.  On ROCM platform, timing
  !  information is always recorded and this flag has no performance benefit.
  ! 
  !   @warning On HCC platform, hipEventInterprocess support is under development.  Use of this flag
  !  will return an error.
  !  
  !   @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue,
  !  #hipErrorLaunchFailure, #hipErrorOutOfMemory
  !  
  !   @see hipEventCreate, hipEventSynchronize, hipEventDestroy, hipEventElapsedTime
  !  
#ifdef USE_CUDA_NAMES
  function hipEventCreateWithFlags(event,flags) bind(c, name="cudaEventCreateWithFlags")
#else
  function hipEventCreateWithFlags(event,flags) bind(c, name="hipEventCreateWithFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventCreateWithFlags
#else
      integer(kind(hipSuccess)) :: hipEventCreateWithFlags
#endif
      type(c_ptr),intent(INOUT) :: event
      integer(kind=4),value :: flags
    end function

  ! 
  !    Create an event
  !  
  !   @param[in,out] event Returns the newly created event.
  !  
  !   @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue,
  !   #hipErrorLaunchFailure, #hipErrorOutOfMemory
  !  
  !   @see hipEventCreateWithFlags, hipEventRecord, hipEventQuery, hipEventSynchronize,
  !   hipEventDestroy, hipEventElapsedTime
  !  
#ifdef USE_CUDA_NAMES
  function hipEventCreate(event) bind(c, name="cudaEventCreate")
#else
  function hipEventCreate(event) bind(c, name="hipEventCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventCreate
#else
      integer(kind(hipSuccess)) :: hipEventCreate
#endif
      type(c_ptr),intent(INOUT) :: event
    end function

  ! 
  !   @brief Record an event in the specified stream.
  !  
  !   @param[in] event event to record.
  !   @param[in] stream stream in which to record event.
  !   @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized,
  !   #hipErrorInvalidHandle, #hipErrorLaunchFailure
  !  
  !   hipEventQuery() or hipEventSynchronize() must be used to determine when the event
  !   transitions from "recording" (after hipEventRecord() is called) to "recorded"
  !   (when timestamps are set, if requested).
  !  
  !   Events which are recorded in a non-NULL stream will transition to
  !   from recording to "recorded" state when they reach the head of
  !   the specified stream, after all previous
  !   commands in that stream have completed executing.
  !  
  !   If hipEventRecord() has been previously called on this event, then this call will overwrite any
  !   existing state in event.
  !  
  !   If this function is called on an event that is currently being recorded, results are undefined
  !   - either outstanding recording may save state into the event, and the order is not guaranteed.
  !  
  !   @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventSynchronize,
  !   hipEventDestroy, hipEventElapsedTime
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipEventRecord(event,stream) bind(c, name="cudaEventRecord")
#else
  function hipEventRecord(event,stream) bind(c, name="hipEventRecord")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventRecord
#else
      integer(kind(hipSuccess)) :: hipEventRecord
#endif
      type(c_ptr),intent(INOUT) :: event
      type(c_ptr),value :: stream
    end function

  ! 
  !    @brief Destroy the specified event.
  !  
  !    @param[in] event Event to destroy.
  !    @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue,
  !   #hipErrorLaunchFailure
  !  
  !    Releases memory associated with the event.  If the event is recording but has not completed
  !   recording when hipEventDestroy() is called, the function will return immediately and the
  !   completion_future resources will be released later, when the hipDevice is synchronized.
  !  
  !   @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventSynchronize, hipEventRecord,
  !   hipEventElapsedTime
  !  
  !   @returns #hipSuccess
  !  
#ifdef USE_CUDA_NAMES
  function hipEventDestroy(event) bind(c, name="cudaEventDestroy")
#else
  function hipEventDestroy(event) bind(c, name="hipEventDestroy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventDestroy
#else
      integer(kind(hipSuccess)) :: hipEventDestroy
#endif
      type(c_ptr),intent(INOUT) :: event
    end function

  ! 
  !    @brief Wait for an event to complete.
  !  
  !    This function will block until the event is ready, waiting for all previous work in the stream
  !   specified when event was recorded with hipEventRecord().
  !  
  !    If hipEventRecord() has not been called on @p event, this function returns immediately.
  !  
  !    TODO-hcc - This function needs to support hipEventBlockingSync parameter.
  !  
  !    @param[in] event Event on which to wait.
  !    @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized,
  !   #hipErrorInvalidHandle, #hipErrorLaunchFailure
  !  
  !    @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventDestroy, hipEventRecord,
  !   hipEventElapsedTime
  !  
#ifdef USE_CUDA_NAMES
  function hipEventSynchronize(event) bind(c, name="cudaEventSynchronize")
#else
  function hipEventSynchronize(event) bind(c, name="hipEventSynchronize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventSynchronize
#else
      integer(kind(hipSuccess)) :: hipEventSynchronize
#endif
      type(c_ptr),intent(INOUT) :: event
    end function

  ! 
  !   @brief Return the elapsed time between two events.
  !  
  !   @param[out] ms : Return time between start and stop in ms.
  !   @param[in]   start : Start event.
  !   @param[in]   stop  : Stop event.
  !   @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotReady, #hipErrorInvalidHandle,
  !   #hipErrorNotInitialized, #hipErrorLaunchFailure
  !  
  !   Computes the elapsed time between two events. Time is computed in ms, with
  !   a resolution of approximately 1 us.
  !  
  !   Events which are recorded in a NULL stream will block until all commands
  !   on all other streams complete execution, and then record the timestamp.
  !  
  !   Events which are recorded in a non-NULL stream will record their timestamp
  !   when they reach the head of the specified stream, after all previous
  !   commands in that stream have completed executing.  Thus the time that
  !   the event recorded may be significantly after the host calls hipEventRecord().
  !  
  !   If hipEventRecord() has not been called on either event, then #hipErrorInvalidHandle is
  !   returned. If hipEventRecord() has been called on both events, but the timestamp has not yet been
  !   recorded on one or both events (that is, hipEventQuery() would return #hipErrorNotReady on at
  !   least one of the events), then #hipErrorNotReady is returned.
  !  
  !   @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventDestroy, hipEventRecord,
  !   hipEventSynchronize
  !  
#ifdef USE_CUDA_NAMES
  function hipEventElapsedTime(ms,start,stop) bind(c, name="cudaEventElapsedTime")
#else
  function hipEventElapsedTime(ms,start,stop) bind(c, name="hipEventElapsedTime")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventElapsedTime
#else
      integer(kind(hipSuccess)) :: hipEventElapsedTime
#endif
      type(c_ptr),value :: ms
      type(c_ptr),intent(INOUT) :: start
      type(c_ptr),intent(INOUT) :: stop
    end function

  ! 
  !   @brief Query event status
  !  
  !   @param[in] event Event to query.
  !   @returns #hipSuccess, #hipErrorNotReady, #hipErrorInvalidHandle, #hipErrorInvalidValue,
  !   #hipErrorNotInitialized, #hipErrorLaunchFailure
  !  
  !   Query the status of the specified event.  This function will return #hipErrorNotReady if all
  !   commands in the appropriate stream (specified to hipEventRecord()) have completed.  If that work
  !   has not completed, or if hipEventRecord() was not called on the event, then #hipSuccess is
  !   returned.
  !  
  !   @see hipEventCreate, hipEventCreateWithFlags, hipEventRecord, hipEventDestroy,
  !   hipEventSynchronize, hipEventElapsedTime
  !  
#ifdef USE_CUDA_NAMES
  function hipEventQuery(event) bind(c, name="cudaEventQuery")
#else
  function hipEventQuery(event) bind(c, name="hipEventQuery")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventQuery
#else
      integer(kind(hipSuccess)) :: hipEventQuery
#endif
      type(c_ptr),intent(INOUT) :: event
    end function

  ! 
  !    @brief Return attributes for the specified pointer
  !  
  !    @param[out] attributes for the specified pointer
  !    @param[in]  pointer to get attributes for
  !  
  !    @return #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
  !  
  !    @see hipGetDeviceCount, hipGetDevice, hipSetDevice, hipChooseDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipPointerGetAttributes(attributes,ptr) bind(c, name="cudaPointerGetAttributes")
#else
  function hipPointerGetAttributes(attributes,ptr) bind(c, name="hipPointerGetAttributes")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipPointerGetAttributes
#else
      integer(kind(hipSuccess)) :: hipPointerGetAttributes
#endif
      type(c_ptr),intent(INOUT) :: attributes
      type(c_ptr),value :: ptr
    end function

  ! 
  !    @brief Allocate memory on the default accelerator
  !  
  !    @param[out] ptr Pointer to the allocated memory
  !    @param[in]  size Requested memory size
  !  
  !    If size is 0, no memory is allocated, ptr returns nullptr, and hipSuccess is returned.
  !  
  !    @return #hipSuccess, #hipErrorOutOfMemory, #hipErrorInvalidValue (bad context, null ptr)
  !  
  !    @see hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D, hipMalloc3DArray,
  !   hipHostFree, hipHostMalloc
  !  
#ifdef USE_CUDA_NAMES
  function hipMalloc(ptr,mySize) bind(c, name="cudaMalloc")
#else
  function hipMalloc(ptr,mySize) bind(c, name="hipMalloc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc
#else
      integer(kind(hipSuccess)) :: hipMalloc
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
    end function

  ! 
  !    @brief Allocate memory on the default accelerator
  !  
  !    @param[out] ptr Pointer to the allocated memory
  !    @param[in]  size Requested memory size
  !    @param[in]  flags Type of memory allocation
  !  
  !    If size is 0, no memory is allocated, ptr returns nullptr, and hipSuccess is returned.
  !  
  !    @return #hipSuccess, #hipErrorOutOfMemory, #hipErrorInvalidValue (bad context, null ptr)
  !  
  !    @see hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D, hipMalloc3DArray,
  !   hipHostFree, hipHostMalloc
  !  
#ifdef USE_CUDA_NAMES
  function hipExtMallocWithFlags(ptr,sizeBytes,flags) bind(c, name="cudaExtMallocWithFlags")
#else
  function hipExtMallocWithFlags(ptr,sizeBytes,flags) bind(c, name="hipExtMallocWithFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipExtMallocWithFlags
#else
      integer(kind(hipSuccess)) :: hipExtMallocWithFlags
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: sizeBytes
      integer(kind=4),value :: flags
    end function

  
#ifdef USE_CUDA_NAMES
  function hipMallocHost(ptr,mySize) bind(c, name="cudaMallocHost")
#else
  function hipMallocHost(ptr,mySize) bind(c, name="hipMallocHost")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMallocHost
#else
      integer(kind(hipSuccess)) :: hipMallocHost
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
    end function

  
#ifdef USE_CUDA_NAMES
  function hipMemAllocHost(ptr,mySize) bind(c, name="cudaMemAllocHost")
#else
  function hipMemAllocHost(ptr,mySize) bind(c, name="hipMemAllocHost")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemAllocHost
#else
      integer(kind(hipSuccess)) :: hipMemAllocHost
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
    end function

  ! 
  !    @brief Allocate device accessible page locked host memory
  !  
  !    @param[out] ptr Pointer to the allocated host pinned memory
  !    @param[in]  size Requested memory size
  !    @param[in]  flags Type of host memory allocation
  !  
  !    If size is 0, no memory is allocated, ptr returns nullptr, and hipSuccess is returned.
  !  
  !    @return #hipSuccess, #hipErrorOutOfMemory
  !  
  !    @see hipSetDeviceFlags, hipHostFree
  !  
#ifdef USE_CUDA_NAMES
  function hipHostMalloc(ptr,mySize,flags) bind(c, name="cudaHostMalloc")
#else
  function hipHostMalloc(ptr,mySize,flags) bind(c, name="hipHostMalloc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc
#else
      integer(kind(hipSuccess)) :: hipHostMalloc
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
      integer(kind=4),value :: flags
    end function

  
#ifdef USE_CUDA_NAMES
  function hipHostAlloc(ptr,mySize,flags) bind(c, name="cudaHostAlloc")
#else
  function hipHostAlloc(ptr,mySize,flags) bind(c, name="hipHostAlloc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostAlloc
#else
      integer(kind(hipSuccess)) :: hipHostAlloc
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
      integer(kind=4),value :: flags
    end function

  ! 
  !    @brief Get Device pointer from Host Pointer allocated through hipHostMalloc
  !  
  !    @param[out] dstPtr Device Pointer mapped to passed host pointer
  !    @param[in]  hstPtr Host Pointer allocated through hipHostMalloc
  !    @param[in]  flags Flags to be passed for extension
  !  
  !    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorOutOfMemory
  !  
  !    @see hipSetDeviceFlags, hipHostMalloc
  !  
#ifdef USE_CUDA_NAMES
  function hipHostGetDevicePointer(devPtr,hstPtr,flags) bind(c, name="cudaHostGetDevicePointer")
#else
  function hipHostGetDevicePointer(devPtr,hstPtr,flags) bind(c, name="hipHostGetDevicePointer")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer
#endif
      type(c_ptr) :: devPtr
      type(c_ptr),value :: hstPtr
      integer(kind=4),value :: flags
    end function

  ! 
  !    @brief Return flags associated with host pointer
  !  
  !    @param[out] flagsPtr Memory location to store flags
  !    @param[in]  hostPtr Host Pointer allocated through hipHostMalloc
  !    @return #hipSuccess, #hipErrorInvalidValue
  !  
  !    @see hipHostMalloc
  !  
#ifdef USE_CUDA_NAMES
  function hipHostGetFlags(flagsPtr,hostPtr) bind(c, name="cudaHostGetFlags")
#else
  function hipHostGetFlags(flagsPtr,hostPtr) bind(c, name="hipHostGetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetFlags
#else
      integer(kind(hipSuccess)) :: hipHostGetFlags
#endif
      type(c_ptr),value :: flagsPtr
      type(c_ptr),value :: hostPtr
    end function

  ! 
  !    @brief Register host memory so it can be accessed from the current device.
  !  
  !    @param[out] hostPtr Pointer to host memory to be registered.
  !    @param[in] sizeBytes size of the host memory
  !    @param[in] flags.  See below.
  !  
  !    Flags:
  !    - #hipHostRegisterDefault   Memory is Mapped and Portable
  !    - #hipHostRegisterPortable  Memory is considered registered by all contexts.  HIP only supports
  !   one context so this is always assumed true.
  !    - #hipHostRegisterMapped    Map the allocation into the address space for the current device.
  !   The device pointer can be obtained with #hipHostGetDevicePointer.
  !  
  !  
  !    After registering the memory, use #hipHostGetDevicePointer to obtain the mapped device pointer.
  !    On many systems, the mapped device pointer will have a different value than the mapped host
  !   pointer.  Applications must use the device pointer in device code, and the host pointer in device
  !   code.
  !  
  !    On some systems, registered memory is pinned.  On some systems, registered memory may not be
  !   actually be pinned but uses OS or hardware facilities to all GPU access to the host memory.
  !  
  !    Developers are strongly encouraged to register memory blocks which are aligned to the host
  !   cache-line size. (typically 64-bytes but can be obtains from the CPUID instruction).
  !  
  !    If registering non-aligned pointers, the application must take care when register pointers from
  !   the same cache line on different devices.  HIP's coarse-grained synchronization model does not
  !   guarantee correct results if different devices write to different parts of the same cache block -
  !   typically one of the writes will "win" and overwrite data from the other registered memory
  !   region.
  !  
  !    @return #hipSuccess, #hipErrorOutOfMemory
  !  
  !    @see hipHostUnregister, hipHostGetFlags, hipHostGetDevicePointer
  !  
#ifdef USE_CUDA_NAMES
  function hipHostRegister(hostPtr,sizeBytes,flags) bind(c, name="cudaHostRegister")
#else
  function hipHostRegister(hostPtr,sizeBytes,flags) bind(c, name="hipHostRegister")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister
#else
      integer(kind(hipSuccess)) :: hipHostRegister
#endif
      type(c_ptr),value :: hostPtr
      integer(c_size_t),value :: sizeBytes
      integer(kind=4),value :: flags
    end function

  ! 
  !    @brief Un-register host pointer
  !  
  !    @param[in] hostPtr Host pointer previously registered with #hipHostRegister
  !    @return Error code
  !  
  !    @see hipHostRegister
  !  
#ifdef USE_CUDA_NAMES
  function hipHostUnregister(hostPtr) bind(c, name="cudaHostUnregister")
#else
  function hipHostUnregister(hostPtr) bind(c, name="hipHostUnregister")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister
#else
      integer(kind(hipSuccess)) :: hipHostUnregister
#endif
      type(c_ptr),value :: hostPtr
    end function

  ! 
  !    Allocates at least width (in bytes)  height bytes of linear memory
  !    Padding may occur to ensure alighnment requirements are met for the given row
  !    The change in width size due to padding will be returned in pitch.
  !    Currently the alignment is set to 128 bytes
  !  
  !    @param[out] ptr Pointer to the allocated device memory
  !    @param[out] pitch Pitch for allocation (in bytes)
  !    @param[in]  width Requested pitched allocation width (in bytes)
  !    @param[in]  height Requested pitched allocation height
  !  
  !    If size is 0, no memory is allocated, ptr returns nullptr, and hipSuccess is returned.
  !  
  !    @return Error code
  !  
  !    @see hipMalloc, hipFree, hipMallocArray, hipFreeArray, hipHostFree, hipMalloc3D,
  !   hipMalloc3DArray, hipHostMalloc
  !  
#ifdef USE_CUDA_NAMES
  function hipMallocPitch(ptr,pitch,width,height) bind(c, name="cudaMallocPitch")
#else
  function hipMallocPitch(ptr,pitch,width,height) bind(c, name="hipMallocPitch")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMallocPitch
#else
      integer(kind(hipSuccess)) :: hipMallocPitch
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),intent(IN) :: pitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
    end function

  ! 
  !    Allocates at least width (in bytes)  height bytes of linear memory
  !    Padding may occur to ensure alighnment requirements are met for the given row
  !    The change in width size due to padding will be returned in pitch.
  !    Currently the alignment is set to 128 bytes
  !  
  !    @param[out] dptr Pointer to the allocated device memory
  !    @param[out] pitch Pitch for allocation (in bytes)
  !    @param[in]  width Requested pitched allocation width (in bytes)
  !    @param[in]  height Requested pitched allocation height
  !  
  !    If size is 0, no memory is allocated, ptr returns nullptr, and hipSuccess is returned.
  !    The intended usage of pitch is as a separate parameter of the allocation, used to compute addresses within the 2D array. 
  !    Given the row and column of an array element of type T, the address is computed as:
  !    T pElement = (T)((char)BaseAddress + Row  Pitch) + Column;
  !  
  !    @return Error code
  !  
  !    @see hipMalloc, hipFree, hipMallocArray, hipFreeArray, hipHostFree, hipMalloc3D,
  !   hipMalloc3DArray, hipHostMalloc
  !  
#ifdef USE_CUDA_NAMES
  function hipMemAllocPitch(dptr,pitch,widthInBytes,height,elementSizeBytes) bind(c, name="cudaMemAllocPitch")
#else
  function hipMemAllocPitch(dptr,pitch,widthInBytes,height,elementSizeBytes) bind(c, name="hipMemAllocPitch")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemAllocPitch
#else
      integer(kind(hipSuccess)) :: hipMemAllocPitch
#endif
      type(c_ptr),intent(INOUT) :: dptr
      integer(c_size_t),intent(IN) :: pitch
      integer(c_size_t),value :: widthInBytes
      integer(c_size_t),value :: height
      integer(kind=4),value :: elementSizeBytes
    end function

  ! 
  !    @brief Free memory allocated by the hcc hip memory allocation API.
  !    This API performs an implicit hipDeviceSynchronize() call.
  !    If pointer is NULL, the hip runtime is initialized and hipSuccess is returned.
  !  
  !    @param[in] ptr Pointer to memory to be freed
  !    @return #hipSuccess
  !    @return #hipErrorInvalidDevicePointer (if pointer is invalid, including host pointers allocated
  !   with hipHostMalloc)
  !  
  !    @see hipMalloc, hipMallocPitch, hipMallocArray, hipFreeArray, hipHostFree, hipMalloc3D,
  !   hipMalloc3DArray, hipHostMalloc
  !  
#ifdef USE_CUDA_NAMES
  function hipFree(ptr) bind(c, name="cudaFree")
#else
  function hipFree(ptr) bind(c, name="hipFree")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree
#else
      integer(kind(hipSuccess)) :: hipFree
#endif
      type(c_ptr),value :: ptr
    end function

  
#ifdef USE_CUDA_NAMES
  function hipFreeHost(ptr) bind(c, name="cudaFreeHost")
#else
  function hipFreeHost(ptr) bind(c, name="hipFreeHost")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFreeHost
#else
      integer(kind(hipSuccess)) :: hipFreeHost
#endif
      type(c_ptr),value :: ptr
    end function

  ! 
  !    @brief Free memory allocated by the hcc hip host memory allocation API
  !    This API performs an implicit hipDeviceSynchronize() call.
  !    If pointer is NULL, the hip runtime is initialized and hipSuccess is returned.
  !  
  !    @param[in] ptr Pointer to memory to be freed
  !    @return #hipSuccess,
  !            #hipErrorInvalidValue (if pointer is invalid, including device pointers allocated with
  !   hipMalloc)
  !  
  !    @see hipMalloc, hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D,
  !   hipMalloc3DArray, hipHostMalloc
  !  
#ifdef USE_CUDA_NAMES
  function hipHostFree(ptr) bind(c, name="cudaHostFree")
#else
  function hipHostFree(ptr) bind(c, name="hipHostFree")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree
#else
      integer(kind(hipSuccess)) :: hipHostFree
#endif
      type(c_ptr),value :: ptr
    end function

  ! 
  !    @brief Copy data from src to dst.
  !  
  !    It supports memory from host to device,
  !    device to host, device to device and host to host
  !    The src and dst must not overlap.
  !  
  !    For hipMemcpy, the copy is always performed by the current device (set by hipSetDevice).
  !    For multi-gpu or peer-to-peer configurations, it is recommended to set the current device to the
  !   device where the src data is physically located. For optimal peer-to-peer copies, the copy device
  !   must be able to access the src and dst pointers (by calling hipDeviceEnablePeerAccess with copy
  !   agent as the current device and srcdest as the peerDevice argument.  if this is not done, the
  !   hipMemcpy will still work, but will perform the copy using a staging buffer on the host.
  !  
  !    @param[out]  dst Data being copy to
  !    @param[in]  src Data being copy from
  !    @param[in]  sizeBytes Data size in bytes
  !    @param[in]  copyType Memory copy type
  !    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryFree, #hipErrorUnknowni
  !  
  !    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !   hipMemHostAlloc, hipMemHostGetDevicePointer
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpy(dst,src,sizeBytes,myKind) bind(c, name="cudaMemcpy")
#else
  function hipMemcpy(dst,src,sizeBytes,myKind) bind(c, name="hipMemcpy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpy
#else
      integer(kind(hipSuccess)) :: hipMemcpy
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function

  
#ifdef USE_CUDA_NAMES
  function hipMemcpyWithStream(dst,src,sizeBytes,myKind,stream) bind(c, name="cudaMemcpyWithStream")
#else
  function hipMemcpyWithStream(dst,src,sizeBytes,myKind,stream) bind(c, name="hipMemcpyWithStream")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyWithStream
#else
      integer(kind(hipSuccess)) :: hipMemcpyWithStream
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function

  ! 
  !    @brief Copy data from Host to Device
  !  
  !    @param[out]  dst Data being copy to
  !    @param[in]   src Data being copy from
  !    @param[in]   sizeBytes Data size in bytes
  !  
  !    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !   #hipErrorInvalidValue
  !  
  !    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !   hipMemHostAlloc, hipMemHostGetDevicePointer
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpyHtoD(dst,src,sizeBytes) bind(c, name="cudaMemcpyHtoD")
#else
  function hipMemcpyHtoD(dst,src,sizeBytes) bind(c, name="hipMemcpyHtoD")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyHtoD
#else
      integer(kind(hipSuccess)) :: hipMemcpyHtoD
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
    end function

  ! 
  !    @brief Copy data from Device to Host
  !  
  !    @param[out]  dst Data being copy to
  !    @param[in]   src Data being copy from
  !    @param[in]   sizeBytes Data size in bytes
  !  
  !    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !   #hipErrorInvalidValue
  !  
  !    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !   hipMemHostAlloc, hipMemHostGetDevicePointer
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpyDtoH(dst,src,sizeBytes) bind(c, name="cudaMemcpyDtoH")
#else
  function hipMemcpyDtoH(dst,src,sizeBytes) bind(c, name="hipMemcpyDtoH")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyDtoH
#else
      integer(kind(hipSuccess)) :: hipMemcpyDtoH
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
    end function

  ! 
  !    @brief Copy data from Device to Device
  !  
  !    @param[out]  dst Data being copy to
  !    @param[in]   src Data being copy from
  !    @param[in]   sizeBytes Data size in bytes
  !  
  !    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !   #hipErrorInvalidValue
  !  
  !    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !   hipMemHostAlloc, hipMemHostGetDevicePointer
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpyDtoD(dst,src,sizeBytes) bind(c, name="cudaMemcpyDtoD")
#else
  function hipMemcpyDtoD(dst,src,sizeBytes) bind(c, name="hipMemcpyDtoD")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyDtoD
#else
      integer(kind(hipSuccess)) :: hipMemcpyDtoD
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
    end function

  ! 
  !    @brief Copy data from Host to Device asynchronously
  !  
  !    @param[out]  dst Data being copy to
  !    @param[in]   src Data being copy from
  !    @param[in]   sizeBytes Data size in bytes
  !  
  !    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !   #hipErrorInvalidValue
  !  
  !    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !   hipMemHostAlloc, hipMemHostGetDevicePointer
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpyHtoDAsync(dst,src,sizeBytes,stream) bind(c, name="cudaMemcpyHtoDAsync")
#else
  function hipMemcpyHtoDAsync(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyHtoDAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyHtoDAsync
#else
      integer(kind(hipSuccess)) :: hipMemcpyHtoDAsync
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function

  ! 
  !    @brief Copy data from Device to Host asynchronously
  !  
  !    @param[out]  dst Data being copy to
  !    @param[in]   src Data being copy from
  !    @param[in]   sizeBytes Data size in bytes
  !  
  !    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !   #hipErrorInvalidValue
  !  
  !    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !   hipMemHostAlloc, hipMemHostGetDevicePointer
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpyDtoHAsync(dst,src,sizeBytes,stream) bind(c, name="cudaMemcpyDtoHAsync")
#else
  function hipMemcpyDtoHAsync(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyDtoHAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyDtoHAsync
#else
      integer(kind(hipSuccess)) :: hipMemcpyDtoHAsync
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function

  ! 
  !    @brief Copy data from Device to Device asynchronously
  !  
  !    @param[out]  dst Data being copy to
  !    @param[in]   src Data being copy from
  !    @param[in]   sizeBytes Data size in bytes
  !  
  !    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !   #hipErrorInvalidValue
  !  
  !    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !   hipMemHostAlloc, hipMemHostGetDevicePointer
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpyDtoDAsync(dst,src,sizeBytes,stream) bind(c, name="cudaMemcpyDtoDAsync")
#else
  function hipMemcpyDtoDAsync(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyDtoDAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyDtoDAsync
#else
      integer(kind(hipSuccess)) :: hipMemcpyDtoDAsync
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function

  
#ifdef USE_CUDA_NAMES
  function hipModuleGetGlobal(dptr,bytes,hmod,name) bind(c, name="cudaModuleGetGlobal")
#else
  function hipModuleGetGlobal(dptr,bytes,hmod,name) bind(c, name="hipModuleGetGlobal")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleGetGlobal
#else
      integer(kind(hipSuccess)) :: hipModuleGetGlobal
#endif
      type(c_ptr),intent(INOUT) :: dptr
      integer(c_size_t),intent(IN) :: bytes
      type(c_ptr),intent(INOUT) :: hmod
      type(c_ptr),value :: name
    end function

  
#ifdef USE_CUDA_NAMES
  function hipGetSymbolAddress(devPtr,symbol) bind(c, name="cudaGetSymbolAddress")
#else
  function hipGetSymbolAddress(devPtr,symbol) bind(c, name="hipGetSymbolAddress")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetSymbolAddress
#else
      integer(kind(hipSuccess)) :: hipGetSymbolAddress
#endif
      type(c_ptr) :: devPtr
      type(c_ptr),value :: symbol
    end function

  
#ifdef USE_CUDA_NAMES
  function hipGetSymbolSize(mySize,symbol) bind(c, name="cudaGetSymbolSize")
#else
  function hipGetSymbolSize(mySize,symbol) bind(c, name="hipGetSymbolSize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetSymbolSize
#else
      integer(kind(hipSuccess)) :: hipGetSymbolSize
#endif
      integer(c_size_t),intent(IN) :: mySize
      type(c_ptr),value :: symbol
    end function

  ! 
  !    @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the ant
  !   byte value value.
  !  
  !    @param[out] dst Data being filled
  !    @param[in]  ant value to be set
  !    @param[in]  sizeBytes Data size in bytes
  !    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !  
#ifdef USE_CUDA_NAMES
  function hipMemset(dst,myValue,sizeBytes) bind(c, name="cudaMemset")
#else
  function hipMemset(dst,myValue,sizeBytes) bind(c, name="hipMemset")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemset
#else
      integer(kind(hipSuccess)) :: hipMemset
#endif
      type(c_ptr),value :: dst
      integer(c_int),value :: myValue
      integer(c_size_t),value :: sizeBytes
    end function

  ! 
  !    @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the ant
  !   byte value value.
  !  
  !    @param[out] dst Data ptr to be filled
  !    @param[in]  ant value to be set
  !    @param[in]  number of values to be set
  !    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !  
#ifdef USE_CUDA_NAMES
  function hipMemsetD8(dest,myValue,count) bind(c, name="cudaMemsetD8")
#else
  function hipMemsetD8(dest,myValue,count) bind(c, name="hipMemsetD8")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemsetD8
#else
      integer(kind(hipSuccess)) :: hipMemsetD8
#endif
      type(c_ptr),value :: dest
      integer(kind=1),value :: myValue
      integer(c_size_t),value :: count
    end function

  ! 
  !    @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the ant
  !   short value value.
  !  
  !    @param[out] dst Data ptr to be filled
  !    @param[in]  ant value to be set
  !    @param[in]  number of values to be set
  !    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !  
#ifdef USE_CUDA_NAMES
  function hipMemsetD16(dest,myValue,count) bind(c, name="cudaMemsetD16")
#else
  function hipMemsetD16(dest,myValue,count) bind(c, name="hipMemsetD16")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemsetD16
#else
      integer(kind(hipSuccess)) :: hipMemsetD16
#endif
      type(c_ptr),value :: dest
      integer(kind=2),value :: myValue
      integer(c_size_t),value :: count
    end function

  ! 
  !    @brief Fills the memory area pointed to by dest with the ant integer
  !   value for specified number of times.
  !  
  !    @param[out] dst Data being filled
  !    @param[in]  ant value to be set
  !    @param[in]  number of values to be set
  !    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !  
#ifdef USE_CUDA_NAMES
  function hipMemsetD32(dest,myValue,count) bind(c, name="cudaMemsetD32")
#else
  function hipMemsetD32(dest,myValue,count) bind(c, name="hipMemsetD32")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemsetD32
#else
      integer(kind(hipSuccess)) :: hipMemsetD32
#endif
      type(c_ptr),value :: dest
      integer(c_int),value :: myValue
      integer(c_size_t),value :: count
    end function

  ! 
  !    @brief Fills the memory area pointed to by dst with the ant value.
  !  
  !    @param[out] dst Pointer to device memory
  !    @param[in]  pitch - data size in bytes
  !    @param[in]  value - ant value to be set
  !    @param[in]  width
  !    @param[in]  height
  !    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryFree
  !  
#ifdef USE_CUDA_NAMES
  function hipMemset2D(dst,pitch,myValue,width,height) bind(c, name="cudaMemset2D")
#else
  function hipMemset2D(dst,pitch,myValue,width,height) bind(c, name="hipMemset2D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemset2D
#else
      integer(kind(hipSuccess)) :: hipMemset2D
#endif
      type(c_ptr),value :: dst
      integer(c_size_t),value :: pitch
      integer(c_int),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
    end function

  ! 
  !    @brief Fills synchronously the memory area pointed to by pitchedDevPtr with the ant value.
  !  
  !    @param[in] pitchedDevPtr
  !    @param[in]  value - ant value to be set
  !    @param[in]  extent
  !    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryFree
  !  
#ifdef USE_CUDA_NAMES
  function hipMemset3D(pitchedDevPtr,myValue,extent) bind(c, name="cudaMemset3D")
#else
  function hipMemset3D(pitchedDevPtr,myValue,extent) bind(c, name="hipMemset3D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemset3D
#else
      integer(kind(hipSuccess)) :: hipMemset3D
#endif
      type(c_ptr),value :: pitchedDevPtr
      integer(c_int),value :: myValue
      type(c_ptr),value :: extent
    end function

  ! 
  !   @brief Query memory info.
  !   Return snapshot of free memory, and total allocatable memory on the device.
  !  
  !   Returns in free a snapshot of the current free memory.
  !   @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
  !   @warning On HCC, the free memory only accounts for memory allocated by this process and may be
  !  optimistic.
  !  
#ifdef USE_CUDA_NAMES
  function hipMemGetInfo(free,total) bind(c, name="cudaMemGetInfo")
#else
  function hipMemGetInfo(free,total) bind(c, name="hipMemGetInfo")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemGetInfo
#else
      integer(kind(hipSuccess)) :: hipMemGetInfo
#endif
      integer(c_size_t),intent(IN) :: free
      integer(c_size_t),intent(IN) :: total
    end function

  
#ifdef USE_CUDA_NAMES
  function hipMemPtrGetInfo(ptr,mySize) bind(c, name="cudaMemPtrGetInfo")
#else
  function hipMemPtrGetInfo(ptr,mySize) bind(c, name="hipMemPtrGetInfo")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemPtrGetInfo
#else
      integer(kind(hipSuccess)) :: hipMemPtrGetInfo
#endif
      type(c_ptr),value :: ptr
      integer(c_size_t),intent(IN) :: mySize
    end function

  
#ifdef USE_CUDA_NAMES
  function hipArrayCreate(pHandle,pAllocateArray) bind(c, name="cudaArrayCreate")
#else
  function hipArrayCreate(pHandle,pAllocateArray) bind(c, name="hipArrayCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipArrayCreate
#else
      integer(kind(hipSuccess)) :: hipArrayCreate
#endif
      type(c_ptr),intent(INOUT) :: pHandle
      type(c_ptr),intent(INOUT) :: pAllocateArray
    end function

  
#ifdef USE_CUDA_NAMES
  function hipArray3DCreate(array,pAllocateArray) bind(c, name="cudaArray3DCreate")
#else
  function hipArray3DCreate(array,pAllocateArray) bind(c, name="hipArray3DCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipArray3DCreate
#else
      integer(kind(hipSuccess)) :: hipArray3DCreate
#endif
      type(c_ptr),intent(INOUT) :: array
      type(c_ptr),intent(INOUT) :: pAllocateArray
    end function

  
#ifdef USE_CUDA_NAMES
  function hipMalloc3D(pitchedDevPtr,extent) bind(c, name="cudaMalloc3D")
#else
  function hipMalloc3D(pitchedDevPtr,extent) bind(c, name="hipMalloc3D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc3D
#else
      integer(kind(hipSuccess)) :: hipMalloc3D
#endif
      type(c_ptr),intent(INOUT) :: pitchedDevPtr
      type(c_ptr),value :: extent
    end function

  ! 
  !    @brief Frees an array on the device.
  !  
  !    @param[in]  array  Pointer to array to free
  !    @return     #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !  
  !    @see hipMalloc, hipMallocPitch, hipFree, hipMallocArray, hipHostMalloc, hipHostFree
  !  
#ifdef USE_CUDA_NAMES
  function hipFreeArray(array) bind(c, name="cudaFreeArray")
#else
  function hipFreeArray(array) bind(c, name="hipFreeArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFreeArray
#else
      integer(kind(hipSuccess)) :: hipFreeArray
#endif
      type(c_ptr),intent(INOUT) :: array
    end function

  ! 
  !   @brief Frees a mipmapped array on the device
  !   
  !   @param[in] mipmappedArray - Pointer to mipmapped array to free
  !   
  !   @return #hipSuccess, #hipErrorInvalidValue
  !  
#ifdef USE_CUDA_NAMES
  function hipFreeMipmappedArray(mipmappedArray) bind(c, name="cudaFreeMipmappedArray")
#else
  function hipFreeMipmappedArray(mipmappedArray) bind(c, name="hipFreeMipmappedArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFreeMipmappedArray
#else
      integer(kind(hipSuccess)) :: hipFreeMipmappedArray
#endif
      type(c_ptr),intent(INOUT) :: mipmappedArray
    end function

  ! 
  !    @brief Allocate an array on the device.
  !  
  !    @param[out]  array  Pointer to allocated array in device memory
  !    @param[in]   desc   Requested channel format
  !    @param[in]   extent Requested array allocation width, height and depth
  !    @param[in]   flags  Requested properties of allocated array
  !    @return      #hipSuccess, #hipErrorOutOfMemory
  !  
  !    @see hipMalloc, hipMallocPitch, hipFree, hipFreeArray, hipHostMalloc, hipHostFree
  !  
#ifdef USE_CUDA_NAMES
  function hipMalloc3DArray(array,desc,extent,flags) bind(c, name="cudaMalloc3DArray")
#else
  function hipMalloc3DArray(array,desc,extent,flags) bind(c, name="hipMalloc3DArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc3DArray
#else
      integer(kind(hipSuccess)) :: hipMalloc3DArray
#endif
      type(c_ptr),intent(INOUT) :: array
      type(c_ptr),intent(INOUT) :: desc
      type(c_ptr),value :: extent
      integer(kind=4),value :: flags
    end function

  ! 
  !   @brief Gets a mipmap level of a HIP mipmapped array
  !  
  !   @param[out] levelArray     - Returned mipmap level HIP array
  !   @param[in]  mipmappedArray - HIP mipmapped array
  !   @param[in]  level          - Mipmap level
  !   
  !   @return #hipSuccess, #hipErrorInvalidValue
  !  
#ifdef USE_CUDA_NAMES
  function hipGetMipmappedArrayLevel(levelArray,mipmappedArray,level) bind(c, name="cudaGetMipmappedArrayLevel")
#else
  function hipGetMipmappedArrayLevel(levelArray,mipmappedArray,level) bind(c, name="hipGetMipmappedArrayLevel")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetMipmappedArrayLevel
#else
      integer(kind(hipSuccess)) :: hipGetMipmappedArrayLevel
#endif
      type(c_ptr),intent(INOUT) :: levelArray
      type(c_ptr),intent(INOUT) :: mipmappedArray
      integer(kind=4),value :: level
    end function

  ! 
  !    @brief Copies data between host and device.
  !  
  !    @param[in]   dst    Destination memory address
  !    @param[in]   dpitch Pitch of destination memory
  !    @param[in]   src    Source memory address
  !    @param[in]   spitch Pitch of source memory
  !    @param[in]   width  Width of matrix transfer (columns in bytes)
  !    @param[in]   height Height of matrix transfer (rows)
  !    @param[in]   kind   Type of transfer
  !    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !  
  !    @see hipMemcpy, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray, hipMemcpyToSymbol,
  !   hipMemcpyAsync
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpy2D(dst,dpitch,src,spitch,width,height,myKind) bind(c, name="cudaMemcpy2D")
#else
  function hipMemcpy2D(dst,dpitch,src,spitch,width,height,myKind) bind(c, name="hipMemcpy2D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpy2D
#else
      integer(kind(hipSuccess)) :: hipMemcpy2D
#endif
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dpitch
      type(c_ptr),value :: src
      integer(c_size_t),value :: spitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function

  ! 
  !    @brief Copies memory for 2D arrays.
  !    @param[in]   pCopy Parameters for the memory copy
  !    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !    #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !  
  !    @see hipMemcpy, hipMemcpy2D, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray,
  !   hipMemcpyToSymbol, hipMemcpyAsync
  ! 
#ifdef USE_CUDA_NAMES
  function hipMemcpyParam2D(pCopy) bind(c, name="cudaMemcpyParam2D")
#else
  function hipMemcpyParam2D(pCopy) bind(c, name="hipMemcpyParam2D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyParam2D
#else
      integer(kind(hipSuccess)) :: hipMemcpyParam2D
#endif
      type(c_ptr),intent(INOUT) :: pCopy
    end function

  ! 
  !    @brief Copies data between host and device.
  !  
  !    @param[in]   dst    Destination memory address
  !    @param[in]   dpitch Pitch of destination memory
  !    @param[in]   src    Source memory address
  !    @param[in]   spitch Pitch of source memory
  !    @param[in]   width  Width of matrix transfer (columns in bytes)
  !    @param[in]   height Height of matrix transfer (rows)
  !    @param[in]   kind   Type of transfer
  !    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !  
  !    @see hipMemcpy, hipMemcpyToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !   hipMemcpyAsync
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpy2DToArray(dst,wOffset,hOffset,src,spitch,width,height,myKind) bind(c, name="cudaMemcpy2DToArray")
#else
  function hipMemcpy2DToArray(dst,wOffset,hOffset,src,spitch,width,height,myKind) bind(c, name="hipMemcpy2DToArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpy2DToArray
#else
      integer(kind(hipSuccess)) :: hipMemcpy2DToArray
#endif
      type(c_ptr),intent(INOUT) :: dst
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      type(c_ptr),value :: src
      integer(c_size_t),value :: spitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function

  ! 
  !    @brief Copies data between host and device.
  !  
  !    @param[in]   dst    Destination memory address
  !    @param[in]   dpitch Pitch of destination memory
  !    @param[in]   src    Source memory address
  !    @param[in]   spitch Pitch of source memory
  !    @param[in]   width  Width of matrix transfer (columns in bytes)
  !    @param[in]   height Height of matrix transfer (rows)
  !    @param[in]   kind   Type of transfer
  !    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !  
  !    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !   hipMemcpyAsync
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpyToArray(dst,wOffset,hOffset,src,count,myKind) bind(c, name="cudaMemcpyToArray")
#else
  function hipMemcpyToArray(dst,wOffset,hOffset,src,count,myKind) bind(c, name="hipMemcpyToArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyToArray
#else
      integer(kind(hipSuccess)) :: hipMemcpyToArray
#endif
      type(c_ptr),intent(INOUT) :: dst
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      type(c_ptr),value :: src
      integer(c_size_t),value :: count
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function

  ! 
  !    @brief Copies data between host and device.
  !  
  !    @param[in]   dst       Destination memory address
  !    @param[in]   srcArray  Source memory address
  !    @param[in]   woffset   Source starting X offset
  !    @param[in]   hOffset   Source starting Y offset
  !    @param[in]   count     Size in bytes to copy
  !    @param[in]   kind      Type of transfer
  !    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !  
  !    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !   hipMemcpyAsync
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpyFromArray(dst,srcArray,wOffset,hOffset,count,myKind) bind(c, name="cudaMemcpyFromArray")
#else
  function hipMemcpyFromArray(dst,srcArray,wOffset,hOffset,count,myKind) bind(c, name="hipMemcpyFromArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyFromArray
#else
      integer(kind(hipSuccess)) :: hipMemcpyFromArray
#endif
      type(c_ptr),value :: dst
      type(c_ptr),intent(INOUT) :: srcArray
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      integer(c_size_t),value :: count
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function

  ! 
  !    @brief Copies data between host and device.
  !  
  !    @param[in]   dst       Destination memory address
  !    @param[in]   dpitch    Pitch of destination memory
  !    @param[in]   src       Source memory address
  !    @param[in]   wOffset   Source starting X offset
  !    @param[in]   hOffset   Source starting Y offset
  !    @param[in]   width     Width of matrix transfer (columns in bytes)
  !    @param[in]   height    Height of matrix transfer (rows)
  !    @param[in]   kind      Type of transfer
  !    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !  
  !    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !   hipMemcpyAsync
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpy2DFromArray(dst,dpitch,src,wOffset,hOffset,width,height,myKind) bind(c, name="cudaMemcpy2DFromArray")
#else
  function hipMemcpy2DFromArray(dst,dpitch,src,wOffset,hOffset,width,height,myKind) bind(c, name="hipMemcpy2DFromArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpy2DFromArray
#else
      integer(kind(hipSuccess)) :: hipMemcpy2DFromArray
#endif
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dpitch
      type(c_ptr),intent(INOUT) :: src
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function

  ! 
  !    @brief Copies data between host and device.
  !  
  !    @param[in]   dst       Destination memory address
  !    @param[in]   srcArray  Source array
  !    @param[in]   srcoffset Offset in bytes of source array
  !    @param[in]   count     Size of memory copy in bytes
  !    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !  
  !    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !   hipMemcpyAsync
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpyAtoH(dst,srcArray,srcOffset,count) bind(c, name="cudaMemcpyAtoH")
#else
  function hipMemcpyAtoH(dst,srcArray,srcOffset,count) bind(c, name="hipMemcpyAtoH")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyAtoH
#else
      integer(kind(hipSuccess)) :: hipMemcpyAtoH
#endif
      type(c_ptr),value :: dst
      type(c_ptr),intent(INOUT) :: srcArray
      integer(c_size_t),value :: srcOffset
      integer(c_size_t),value :: count
    end function

  ! 
  !    @brief Copies data between host and device.
  !  
  !    @param[in]   dstArray   Destination memory address
  !    @param[in]   dstOffset  Offset in bytes of destination array
  !    @param[in]   srcHost    Source host pointer
  !    @param[in]   count      Size of memory copy in bytes
  !    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !  
  !    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !   hipMemcpyAsync
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpyHtoA(dstArray,dstOffset,srcHost,count) bind(c, name="cudaMemcpyHtoA")
#else
  function hipMemcpyHtoA(dstArray,dstOffset,srcHost,count) bind(c, name="hipMemcpyHtoA")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyHtoA
#else
      integer(kind(hipSuccess)) :: hipMemcpyHtoA
#endif
      type(c_ptr),intent(INOUT) :: dstArray
      integer(c_size_t),value :: dstOffset
      type(c_ptr),value :: srcHost
      integer(c_size_t),value :: count
    end function

  ! 
  !    @brief Copies data between host and device.
  !  
  !    @param[in]   p   3D memory copy parameters
  !    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !  
  !    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !   hipMemcpyAsync
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpy3D(p) bind(c, name="cudaMemcpy3D")
#else
  function hipMemcpy3D(p) bind(c, name="hipMemcpy3D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpy3D
#else
      integer(kind(hipSuccess)) :: hipMemcpy3D
#endif
      type(c_ptr),intent(INOUT) :: p
    end function

  ! 
  !    @brief Copies data between host and device.
  !  
  !    @param[in]   pCopy   3D memory copy parameters
  !    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !    #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !  
  !    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !   hipMemcpyAsync
  !  
#ifdef USE_CUDA_NAMES
  function hipDrvMemcpy3D(pCopy) bind(c, name="cudaDrvMemcpy3D")
#else
  function hipDrvMemcpy3D(pCopy) bind(c, name="hipDrvMemcpy3D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDrvMemcpy3D
#else
      integer(kind(hipSuccess)) :: hipDrvMemcpy3D
#endif
      type(c_ptr),intent(INOUT) :: pCopy
    end function

  ! 
  !    @brief Copies data between host and device asynchronously.
  !  
  !    @param[in]   pCopy    3D memory copy parameters
  !    @param[in]   stream   Stream to use
  !    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !    #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !  
  !    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !   hipMemcpyAsync
  !  
#ifdef USE_CUDA_NAMES
  function hipDrvMemcpy3DAsync(pCopy,stream) bind(c, name="cudaDrvMemcpy3DAsync")
#else
  function hipDrvMemcpy3DAsync(pCopy,stream) bind(c, name="hipDrvMemcpy3DAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDrvMemcpy3DAsync
#else
      integer(kind(hipSuccess)) :: hipDrvMemcpy3DAsync
#endif
      type(c_ptr),intent(INOUT) :: pCopy
      type(c_ptr),value :: stream
    end function

  ! 
  !   @brief Determine if a device can access a peer's memory.
  !  
  !   @param [out] canAccessPeer Returns the peer access capability (0 or 1)
  !   @param [in] device - device from where memory may be accessed.
  !   @param [in] peerDevice - device where memory is physically located
  !  
  !   Returns "1" in @p canAccessPeer if the specified @p device is capable
  !   of directly accessing memory physically located on peerDevice , or "0" if not.
  !  
  !   Returns "0" in @p canAccessPeer if deviceId == peerDeviceId, and both are valid devices : a
  !   device is not a peer of itself.
  !  
  !   @returns #hipSuccess,
  !   @returns #hipErrorInvalidDevice if deviceId or peerDeviceId are not valid devices
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceCanAccessPeer(canAccessPeer,deviceId,peerDeviceId) bind(c, name="cudaDeviceCanAccessPeer")
#else
  function hipDeviceCanAccessPeer(canAccessPeer,deviceId,peerDeviceId) bind(c, name="hipDeviceCanAccessPeer")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceCanAccessPeer
#else
      integer(kind(hipSuccess)) :: hipDeviceCanAccessPeer
#endif
      type(c_ptr),value :: canAccessPeer
      integer(c_int),value :: deviceId
      integer(c_int),value :: peerDeviceId
    end function

  ! 
  !   @brief Enable direct access from current device's virtual address space to memory allocations
  !   physically located on a peer device.
  !  
  !   Memory which already allocated on peer device will be mapped into the address space of the
  !   current device.  In addition, all future memory allocations on peerDeviceId will be mapped into
  !   the address space of the current device when the memory is allocated. The peer memory remains
  !   accessible from the current device until a call to hipDeviceDisablePeerAccess or hipDeviceReset.
  !  
  !  
  !   @param [in] peerDeviceId
  !   @param [in] flags
  !  
  !   Returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue,
  !   @returns #hipErrorPeerAccessAlreadyEnabled if peer access is already enabled for this device.
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceEnablePeerAccess(peerDeviceId,flags) bind(c, name="cudaDeviceEnablePeerAccess")
#else
  function hipDeviceEnablePeerAccess(peerDeviceId,flags) bind(c, name="hipDeviceEnablePeerAccess")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceEnablePeerAccess
#else
      integer(kind(hipSuccess)) :: hipDeviceEnablePeerAccess
#endif
      integer(c_int),value :: peerDeviceId
      integer(kind=4),value :: flags
    end function

  ! 
  !   @brief Disable direct access from current device's virtual address space to memory allocations
  !   physically located on a peer device.
  !  
  !   Returns hipErrorPeerAccessNotEnabled if direct access to memory on peerDevice has not yet been
  !   enabled from the current device.
  !  
  !   @param [in] peerDeviceId
  !  
  !   @returns #hipSuccess, #hipErrorPeerAccessNotEnabled
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceDisablePeerAccess(peerDeviceId) bind(c, name="cudaDeviceDisablePeerAccess")
#else
  function hipDeviceDisablePeerAccess(peerDeviceId) bind(c, name="hipDeviceDisablePeerAccess")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceDisablePeerAccess
#else
      integer(kind(hipSuccess)) :: hipDeviceDisablePeerAccess
#endif
      integer(c_int),value :: peerDeviceId
    end function

  ! 
  !   @brief Get information on memory allocations.
  !  
  !   @param [out] pbase - BAse pointer address
  !   @param [out] psize - Size of allocation
  !   @param [in]  dptr- Device Pointer
  !  
  !   @returns #hipSuccess, #hipErrorInvalidDevicePointer
  !  
  !   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipMemGetAddressRange(pbase,psize,dptr) bind(c, name="cudaMemGetAddressRange")
#else
  function hipMemGetAddressRange(pbase,psize,dptr) bind(c, name="hipMemGetAddressRange")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemGetAddressRange
#else
      integer(kind(hipSuccess)) :: hipMemGetAddressRange
#endif
      type(c_ptr),intent(INOUT) :: pbase
      integer(c_size_t),intent(IN) :: psize
      type(c_ptr),value :: dptr
    end function

  ! 
  !   @brief Copies memory from one device to memory on another device.
  !  
  !   @param [out] dst - Destination device pointer.
  !   @param [in] dstDeviceId - Destination device
  !   @param [in] src - Source device pointer
  !   @param [in] srcDeviceId - Source device
  !   @param [in] sizeBytes - Size of memory copy in bytes
  !  
  !   @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipMemcpyPeer(dst,dstDeviceId,src,srcDeviceId,sizeBytes) bind(c, name="cudaMemcpyPeer")
#else
  function hipMemcpyPeer(dst,dstDeviceId,src,srcDeviceId,sizeBytes) bind(c, name="hipMemcpyPeer")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyPeer
#else
      integer(kind(hipSuccess)) :: hipMemcpyPeer
#endif
      type(c_ptr),value :: dst
      integer(c_int),value :: dstDeviceId
      type(c_ptr),value :: src
      integer(c_int),value :: srcDeviceId
      integer(c_size_t),value :: sizeBytes
    end function

  
#ifdef USE_CUDA_NAMES
  function hipInit(flags) bind(c, name="cudaInit")
#else
  function hipInit(flags) bind(c, name="hipInit")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipInit
#else
      integer(kind(hipSuccess)) :: hipInit
#endif
      integer(kind=4),value :: flags
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxCreate(ctx,flags,device) bind(c, name="cudaCtxCreate")
#else
  function hipCtxCreate(ctx,flags,device) bind(c, name="hipCtxCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxCreate
#else
      integer(kind(hipSuccess)) :: hipCtxCreate
#endif
      type(c_ptr),intent(INOUT) :: ctx
      integer(kind=4),value :: flags
      integer(c_int),value :: device
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxDestroy(ctx) bind(c, name="cudaCtxDestroy")
#else
  function hipCtxDestroy(ctx) bind(c, name="hipCtxDestroy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxDestroy
#else
      integer(kind(hipSuccess)) :: hipCtxDestroy
#endif
      type(c_ptr),intent(INOUT) :: ctx
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxPopCurrent(ctx) bind(c, name="cudaCtxPopCurrent")
#else
  function hipCtxPopCurrent(ctx) bind(c, name="hipCtxPopCurrent")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxPopCurrent
#else
      integer(kind(hipSuccess)) :: hipCtxPopCurrent
#endif
      type(c_ptr),intent(INOUT) :: ctx
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxPushCurrent(ctx) bind(c, name="cudaCtxPushCurrent")
#else
  function hipCtxPushCurrent(ctx) bind(c, name="hipCtxPushCurrent")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxPushCurrent
#else
      integer(kind(hipSuccess)) :: hipCtxPushCurrent
#endif
      type(c_ptr),intent(INOUT) :: ctx
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxSetCurrent(ctx) bind(c, name="cudaCtxSetCurrent")
#else
  function hipCtxSetCurrent(ctx) bind(c, name="hipCtxSetCurrent")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxSetCurrent
#else
      integer(kind(hipSuccess)) :: hipCtxSetCurrent
#endif
      type(c_ptr),intent(INOUT) :: ctx
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxGetCurrent(ctx) bind(c, name="cudaCtxGetCurrent")
#else
  function hipCtxGetCurrent(ctx) bind(c, name="hipCtxGetCurrent")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetCurrent
#else
      integer(kind(hipSuccess)) :: hipCtxGetCurrent
#endif
      type(c_ptr),intent(INOUT) :: ctx
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxGetDevice(device) bind(c, name="cudaCtxGetDevice")
#else
  function hipCtxGetDevice(device) bind(c, name="hipCtxGetDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetDevice
#else
      integer(kind(hipSuccess)) :: hipCtxGetDevice
#endif
      type(c_ptr),value :: device
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxGetApiVersion(ctx,apiVersion) bind(c, name="cudaCtxGetApiVersion")
#else
  function hipCtxGetApiVersion(ctx,apiVersion) bind(c, name="hipCtxGetApiVersion")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetApiVersion
#else
      integer(kind(hipSuccess)) :: hipCtxGetApiVersion
#endif
      type(c_ptr),intent(INOUT) :: ctx
      type(c_ptr),value :: apiVersion
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxGetCacheConfig(cacheConfig) bind(c, name="cudaCtxGetCacheConfig")
#else
  function hipCtxGetCacheConfig(cacheConfig) bind(c, name="hipCtxGetCacheConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetCacheConfig
#else
      integer(kind(hipSuccess)) :: hipCtxGetCacheConfig
#endif
      type(c_ptr),value :: cacheConfig
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxSetCacheConfig(cacheConfig) bind(c, name="cudaCtxSetCacheConfig")
#else
  function hipCtxSetCacheConfig(cacheConfig) bind(c, name="hipCtxSetCacheConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxSetCacheConfig
#else
      integer(kind(hipSuccess)) :: hipCtxSetCacheConfig
#endif
      integer(kind(hipFuncCachePreferNone)),value :: cacheConfig
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxSetSharedMemConfig(config) bind(c, name="cudaCtxSetSharedMemConfig")
#else
  function hipCtxSetSharedMemConfig(config) bind(c, name="hipCtxSetSharedMemConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxSetSharedMemConfig
#else
      integer(kind(hipSuccess)) :: hipCtxSetSharedMemConfig
#endif
      integer(kind(hipSharedMemBankSizeDefault)),value :: config
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxGetSharedMemConfig(pConfig) bind(c, name="cudaCtxGetSharedMemConfig")
#else
  function hipCtxGetSharedMemConfig(pConfig) bind(c, name="hipCtxGetSharedMemConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetSharedMemConfig
#else
      integer(kind(hipSuccess)) :: hipCtxGetSharedMemConfig
#endif
      type(c_ptr),value :: pConfig
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxSynchronize() bind(c, name="cudaCtxSynchronize")
#else
  function hipCtxSynchronize() bind(c, name="hipCtxSynchronize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxSynchronize
#else
      integer(kind(hipSuccess)) :: hipCtxSynchronize
#endif
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxGetFlags(flags) bind(c, name="cudaCtxGetFlags")
#else
  function hipCtxGetFlags(flags) bind(c, name="hipCtxGetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetFlags
#else
      integer(kind(hipSuccess)) :: hipCtxGetFlags
#endif
      type(c_ptr),value :: flags
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxEnablePeerAccess(peerCtx,flags) bind(c, name="cudaCtxEnablePeerAccess")
#else
  function hipCtxEnablePeerAccess(peerCtx,flags) bind(c, name="hipCtxEnablePeerAccess")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxEnablePeerAccess
#else
      integer(kind(hipSuccess)) :: hipCtxEnablePeerAccess
#endif
      type(c_ptr),intent(INOUT) :: peerCtx
      integer(kind=4),value :: flags
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCtxDisablePeerAccess(peerCtx) bind(c, name="cudaCtxDisablePeerAccess")
#else
  function hipCtxDisablePeerAccess(peerCtx) bind(c, name="hipCtxDisablePeerAccess")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxDisablePeerAccess
#else
      integer(kind(hipSuccess)) :: hipCtxDisablePeerAccess
#endif
      type(c_ptr),intent(INOUT) :: peerCtx
    end function

  ! 
  !   @brief Get the state of the primary context.
  !  
  !   @param [in] Device to get primary context flags for
  !   @param [out] Pointer to store flags
  !   @param [out] Pointer to store context state; 0 = inactive, 1 = active
  !  
  !   @returns #hipSuccess
  !  
  !   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipDevicePrimaryCtxGetState(dev,flags,active) bind(c, name="cudaDevicePrimaryCtxGetState")
#else
  function hipDevicePrimaryCtxGetState(dev,flags,active) bind(c, name="hipDevicePrimaryCtxGetState")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDevicePrimaryCtxGetState
#else
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxGetState
#endif
      integer(c_int),value :: dev
      type(c_ptr),value :: flags
      type(c_ptr),value :: active
    end function

  ! 
  !   @brief Release the primary context on the GPU.
  !  
  !   @param [in] Device which primary context is released
  !  
  !   @returns #hipSuccess
  !  
  !   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !   @warning This function return #hipSuccess though doesn't release the primaryCtx by design on
  !   HIPHCC path.
  !  
#ifdef USE_CUDA_NAMES
  function hipDevicePrimaryCtxRelease(dev) bind(c, name="cudaDevicePrimaryCtxRelease")
#else
  function hipDevicePrimaryCtxRelease(dev) bind(c, name="hipDevicePrimaryCtxRelease")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDevicePrimaryCtxRelease
#else
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxRelease
#endif
      integer(c_int),value :: dev
    end function

  ! 
  !   @brief Retain the primary context on the GPU.
  !  
  !   @param [out] Returned context handle of the new context
  !   @param [in] Device which primary context is released
  !  
  !   @returns #hipSuccess
  !  
  !   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipDevicePrimaryCtxRetain(pctx,dev) bind(c, name="cudaDevicePrimaryCtxRetain")
#else
  function hipDevicePrimaryCtxRetain(pctx,dev) bind(c, name="hipDevicePrimaryCtxRetain")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDevicePrimaryCtxRetain
#else
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxRetain
#endif
      type(c_ptr),intent(INOUT) :: pctx
      integer(c_int),value :: dev
    end function

  ! 
  !   @brief Resets the primary context on the GPU.
  !  
  !   @param [in] Device which primary context is reset
  !  
  !   @returns #hipSuccess
  !  
  !   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipDevicePrimaryCtxReset(dev) bind(c, name="cudaDevicePrimaryCtxReset")
#else
  function hipDevicePrimaryCtxReset(dev) bind(c, name="hipDevicePrimaryCtxReset")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDevicePrimaryCtxReset
#else
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxReset
#endif
      integer(c_int),value :: dev
    end function

  ! 
  !   @brief Set flags for the primary context.
  !  
  !   @param [in] Device for which the primary context flags are set
  !   @param [in] New flags for the device
  !  
  !   @returns #hipSuccess, #hipErrorContextAlreadyInUse
  !  
  !   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipDevicePrimaryCtxSetFlags(dev,flags) bind(c, name="cudaDevicePrimaryCtxSetFlags")
#else
  function hipDevicePrimaryCtxSetFlags(dev,flags) bind(c, name="hipDevicePrimaryCtxSetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDevicePrimaryCtxSetFlags
#else
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxSetFlags
#endif
      integer(c_int),value :: dev
      integer(kind=4),value :: flags
    end function

  ! 
  !   @brief Returns a handle to a compute device
  !   @param [out] device
  !   @param [in] ordinal
  !  
  !   @returns #hipSuccess, #hipErrorInavlidDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceGet(device,ordinal) bind(c, name="cudaDeviceGet")
#else
  function hipDeviceGet(device,ordinal) bind(c, name="hipDeviceGet")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGet
#else
      integer(kind(hipSuccess)) :: hipDeviceGet
#endif
      type(c_ptr),value :: device
      integer(c_int),value :: ordinal
    end function

  ! 
  !   @brief Returns the compute capability of the device
  !   @param [out] major
  !   @param [out] minor
  !   @param [in] device
  !  
  !   @returns #hipSuccess, #hipErrorInavlidDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceComputeCapability(major,minor,device) bind(c, name="cudaDeviceComputeCapability")
#else
  function hipDeviceComputeCapability(major,minor,device) bind(c, name="hipDeviceComputeCapability")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceComputeCapability
#else
      integer(kind(hipSuccess)) :: hipDeviceComputeCapability
#endif
      type(c_ptr),value :: major
      type(c_ptr),value :: minor
      integer(c_int),value :: device
    end function

  ! 
  !   @brief Returns an identifer string for the device.
  !   @param [out] name
  !   @param [in] len
  !   @param [in] device
  !  
  !   @returns #hipSuccess, #hipErrorInavlidDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceGetName(name,len,device) bind(c, name="cudaDeviceGetName")
#else
  function hipDeviceGetName(name,len,device) bind(c, name="hipDeviceGetName")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetName
#else
      integer(kind(hipSuccess)) :: hipDeviceGetName
#endif
      type(c_ptr),value :: name
      integer(c_int),value :: len
      integer(c_int),value :: device
    end function

  ! 
  !   @brief Returns a PCI Bus Id string for the device, overloaded to take int device ID.
  !   @param [out] pciBusId
  !   @param [in] len
  !   @param [in] device
  !  
  !   @returns #hipSuccess, #hipErrorInavlidDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceGetPCIBusId(pciBusId,len,device) bind(c, name="cudaDeviceGetPCIBusId")
#else
  function hipDeviceGetPCIBusId(pciBusId,len,device) bind(c, name="hipDeviceGetPCIBusId")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetPCIBusId
#else
      integer(kind(hipSuccess)) :: hipDeviceGetPCIBusId
#endif
      type(c_ptr),value :: pciBusId
      integer(c_int),value :: len
      integer(c_int),value :: device
    end function

  ! 
  !   @brief Returns a handle to a compute device.
  !   @param [out] device handle
  !   @param [in] PCI Bus ID
  !  
  !   @returns #hipSuccess, #hipErrorInavlidDevice, #hipErrorInvalidValue
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceGetByPCIBusId(device,pciBusId) bind(c, name="cudaDeviceGetByPCIBusId")
#else
  function hipDeviceGetByPCIBusId(device,pciBusId) bind(c, name="hipDeviceGetByPCIBusId")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetByPCIBusId
#else
      integer(kind(hipSuccess)) :: hipDeviceGetByPCIBusId
#endif
      type(c_ptr),value :: device
      type(c_ptr),value :: pciBusId
    end function

  ! 
  !   @brief Returns the total amount of memory on the device.
  !   @param [out] bytes
  !   @param [in] device
  !  
  !   @returns #hipSuccess, #hipErrorInavlidDevice
  !  
#ifdef USE_CUDA_NAMES
  function hipDeviceTotalMem(bytes,device) bind(c, name="cudaDeviceTotalMem")
#else
  function hipDeviceTotalMem(bytes,device) bind(c, name="hipDeviceTotalMem")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceTotalMem
#else
      integer(kind(hipSuccess)) :: hipDeviceTotalMem
#endif
      integer(c_size_t),intent(IN) :: bytes
      integer(c_int),value :: device
    end function

  ! 
  !   @brief Returns the approximate HIP driver version.
  !  
  !   @param [out] driverVersion
  !  
  !   @returns #hipSuccess, #hipErrorInavlidValue
  !  
  !   @warning The HIP feature set does not correspond to an exact CUDA SDK driver revision.
  !   This function always set driverVersion to 4 as an approximation though HIP supports
  !   some features which were introduced in later CUDA SDK revisions.
  !   HIP apps code should not rely on the driver revision number here and should
  !   use arch feature flags to test device capabilities or conditional compilation.
  !  
  !   @see hipRuntimeGetVersion
  !  
#ifdef USE_CUDA_NAMES
  function hipDriverGetVersion(driverVersion) bind(c, name="cudaDriverGetVersion")
#else
  function hipDriverGetVersion(driverVersion) bind(c, name="hipDriverGetVersion")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDriverGetVersion
#else
      integer(kind(hipSuccess)) :: hipDriverGetVersion
#endif
      type(c_ptr),value :: driverVersion
    end function

  ! 
  !   @brief Returns the approximate HIP Runtime version.
  !  
  !   @param [out] runtimeVersion
  !  
  !   @returns #hipSuccess, #hipErrorInavlidValue
  !  
  !   @warning On HIPHCC path this function returns HIP runtime patch version however on
  !   HIPNVCC path this function return CUDA runtime version.
  !  
  !   @see hipDriverGetVersion
  !  
#ifdef USE_CUDA_NAMES
  function hipRuntimeGetVersion(runtimeVersion) bind(c, name="cudaRuntimeGetVersion")
#else
  function hipRuntimeGetVersion(runtimeVersion) bind(c, name="hipRuntimeGetVersion")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipRuntimeGetVersion
#else
      integer(kind(hipSuccess)) :: hipRuntimeGetVersion
#endif
      type(c_ptr),value :: runtimeVersion
    end function

  ! 
  !   @brief Loads code object from file into a hipModule_t
  !  
  !   @param [in] fname
  !   @param [out] module
  !  
  !   @returns hipSuccess, hipErrorInvalidValue, hipErrorInvalidContext, hipErrorFileNotFound,
  !   hipErrorOutOfMemory, hipErrorSharedObjectInitFailed, hipErrorNotInitialized
  !  
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipModuleLoad(module,fname) bind(c, name="cudaModuleLoad")
#else
  function hipModuleLoad(module,fname) bind(c, name="hipModuleLoad")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleLoad
#else
      integer(kind(hipSuccess)) :: hipModuleLoad
#endif
      type(c_ptr),intent(INOUT) :: module
      type(c_ptr),value :: fname
    end function

  ! 
  !   @brief Frees the module
  !  
  !   @param [in] module
  !  
  !   @returns hipSuccess, hipInvalidValue
  !   module is freed and the code objects associated with it are destroyed
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipModuleUnload(module) bind(c, name="cudaModuleUnload")
#else
  function hipModuleUnload(module) bind(c, name="hipModuleUnload")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleUnload
#else
      integer(kind(hipSuccess)) :: hipModuleUnload
#endif
      type(c_ptr),intent(INOUT) :: module
    end function

  ! 
  !   @brief Function with kname will be extracted if present in module
  !  
  !   @param [in] module
  !   @param [in] kname
  !   @param [out] function
  !  
  !   @returns hipSuccess, hipErrorInvalidValue, hipErrorInvalidContext, hipErrorNotInitialized,
  !   hipErrorNotFound,
  !  
#ifdef USE_CUDA_NAMES
  function hipModuleGetFunction(function,module,kname) bind(c, name="cudaModuleGetFunction")
#else
  function hipModuleGetFunction(function,module,kname) bind(c, name="hipModuleGetFunction")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleGetFunction
#else
      integer(kind(hipSuccess)) :: hipModuleGetFunction
#endif
      type(c_ptr),intent(INOUT) :: function
      type(c_ptr),intent(INOUT) :: module
      type(c_ptr),value :: kname
    end function

  ! 
  !   @brief Find out attributes for a given function.
  !  
  !   @param [out] attr
  !   @param [in] func
  !  
  !   @returns hipSuccess, hipErrorInvalidValue, hipErrorInvalidDeviceFunction
  !  
#ifdef USE_CUDA_NAMES
  function hipFuncGetAttributes(attr,func) bind(c, name="cudaFuncGetAttributes")
#else
  function hipFuncGetAttributes(attr,func) bind(c, name="hipFuncGetAttributes")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFuncGetAttributes
#else
      integer(kind(hipSuccess)) :: hipFuncGetAttributes
#endif
      type(c_ptr),intent(INOUT) :: attr
      type(c_ptr),value :: func
    end function

  ! 
  !   @brief Find out a specific attribute for a given function.
  !  
  !   @param [out] value
  !   @param [in]  attrib
  !   @param [in]  hfunc
  !  
  !   @returns hipSuccess, hipErrorInvalidValue, hipErrorInvalidDeviceFunction
  !  
#ifdef USE_CUDA_NAMES
  function hipFuncGetAttribute(myValue,attrib,hfunc) bind(c, name="cudaFuncGetAttribute")
#else
  function hipFuncGetAttribute(myValue,attrib,hfunc) bind(c, name="hipFuncGetAttribute")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFuncGetAttribute
#else
      integer(kind(hipSuccess)) :: hipFuncGetAttribute
#endif
      type(c_ptr),value :: myValue
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)),value :: attrib
      type(c_ptr),intent(INOUT) :: hfunc
    end function

  
#ifdef USE_CUDA_NAMES
  function hipModuleGetTexRef(texRef,hmod,name) bind(c, name="cudaModuleGetTexRef")
#else
  function hipModuleGetTexRef(texRef,hmod,name) bind(c, name="hipModuleGetTexRef")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleGetTexRef
#else
      integer(kind(hipSuccess)) :: hipModuleGetTexRef
#endif
      type(c_ptr),intent(INOUT) :: texRef
      type(c_ptr),intent(INOUT) :: hmod
      type(c_ptr),value :: name
    end function

  ! 
  !   @brief builds module from code object which resides in host memory. Image is pointer to that
  !   location.
  !  
  !   @param [in] image
  !   @param [out] module
  !  
  !   @returns hipSuccess, hipErrorNotInitialized, hipErrorOutOfMemory, hipErrorNotInitialized
  !  
#ifdef USE_CUDA_NAMES
  function hipModuleLoadData(module,image) bind(c, name="cudaModuleLoadData")
#else
  function hipModuleLoadData(module,image) bind(c, name="hipModuleLoadData")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleLoadData
#else
      integer(kind(hipSuccess)) :: hipModuleLoadData
#endif
      type(c_ptr),intent(INOUT) :: module
      type(c_ptr),value :: image
    end function

  ! 
  !   @brief builds module from code object which resides in host memory. Image is pointer to that
  !   location. Options are not used. hipModuleLoadData is called.
  !  
  !   @param [in] image
  !   @param [out] module
  !   @param [in] number of options
  !   @param [in] options for JIT
  !   @param [in] option values for JIT
  !  
  !   @returns hipSuccess, hipErrorNotInitialized, hipErrorOutOfMemory, hipErrorNotInitialized
  !  
#ifdef USE_CUDA_NAMES
  function hipModuleLoadDataEx(module,image,numOptions,options,optionValues) bind(c, name="cudaModuleLoadDataEx")
#else
  function hipModuleLoadDataEx(module,image,numOptions,options,optionValues) bind(c, name="hipModuleLoadDataEx")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleLoadDataEx
#else
      integer(kind(hipSuccess)) :: hipModuleLoadDataEx
#endif
      type(c_ptr),intent(INOUT) :: module
      type(c_ptr),value :: image
      integer(kind=4),value :: numOptions
      type(c_ptr),value :: options
      type(c_ptr) :: optionValues
    end function

  ! 
  !   @brief launches kernel f with launch parameters and shared memory on stream with arguments passed
  !   to kernelparams or extra
  !  
  !   @param [in] f         Kernel to launch.
  !   @param [in] gridDimX  X grid dimension specified as multiple of blockDimX.
  !   @param [in] gridDimY  Y grid dimension specified as multiple of blockDimY.
  !   @param [in] gridDimZ  Z grid dimension specified as multiple of blockDimZ.
  !   @param [in] blockDimX X block dimensions specified in work-items
  !   @param [in] blockDimY Y grid dimension specified in work-items
  !   @param [in] blockDimZ Z grid dimension specified in work-items
  !   @param [in] sharedMemBytes Amount of dynamic shared memory to allocate for this kernel.  The
  !   kernel can access this with HIP_DYNAMIC_SHARED.
  !   @param [in] stream    Stream where the kernel should be dispatched.  May be 0, in which case th
  !   default stream is used with associated synchronization rules.
  !   @param [in] kernelParams
  !   @param [in] extra     Pointer to kernel arguments.   These are passed directly to the kernel and
  !   must be in the memory layout and alignment expected by the kernel.
  !  
  !   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue
  !  
  !   @warning kernellParams argument is not yet implemented in HIP. Please use extra instead. Please
  !   refer to hip_porting_driver_api.md for sample usage.
  !  
#ifdef USE_CUDA_NAMES
  function hipModuleLaunchKernel(f,gridDimX,gridDimY,gridDimZ,blockDimX,blockDimY,blockDimZ,sharedMemBytes,stream,kernelParams,extra) bind(c, name="cudaModuleLaunchKernel")
#else
  function hipModuleLaunchKernel(f,gridDimX,gridDimY,gridDimZ,blockDimX,blockDimY,blockDimZ,sharedMemBytes,stream,kernelParams,extra) bind(c, name="hipModuleLaunchKernel")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleLaunchKernel
#else
      integer(kind(hipSuccess)) :: hipModuleLaunchKernel
#endif
      type(c_ptr),intent(INOUT) :: f
      integer(kind=4),value :: gridDimX
      integer(kind=4),value :: gridDimY
      integer(kind=4),value :: gridDimZ
      integer(kind=4),value :: blockDimX
      integer(kind=4),value :: blockDimY
      integer(kind=4),value :: blockDimZ
      integer(kind=4),value :: sharedMemBytes
      type(c_ptr),value :: stream
      type(c_ptr) :: kernelParams
      type(c_ptr) :: extra
    end function

  ! 
  !   @brief launches kernel f with launch parameters and shared memory on stream with arguments passed
  !   to kernelparams or extra, where thread blocks can cooperate and synchronize as they execute
  !  
  !   @param [in] f         Kernel to launch.
  !   @param [in] gridDim   Grid dimensions specified as multiple of blockDim.
  !   @param [in] blockDim  Block dimensions specified in work-items
  !   @param [in] kernelParams A list of kernel arguments
  !   @param [in] sharedMemBytes Amount of dynamic shared memory to allocate for this kernel.  The
  !   kernel can access this with HIP_DYNAMIC_SHARED.
  !   @param [in] stream    Stream where the kernel should be dispatched.  May be 0, in which case th
  !   default stream is used with associated synchronization rules.
  !  
  !   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue, hipErrorCooperativeLaunchTooLarge
  !  
#ifdef USE_CUDA_NAMES
  function hipLaunchCooperativeKernel(f,gridDim,blockDimX,kernelParams,sharedMemBytes,stream) bind(c, name="cudaLaunchCooperativeKernel")
#else
  function hipLaunchCooperativeKernel(f,gridDim,blockDimX,kernelParams,sharedMemBytes,stream) bind(c, name="hipLaunchCooperativeKernel")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipLaunchCooperativeKernel
#else
      integer(kind(hipSuccess)) :: hipLaunchCooperativeKernel
#endif
      type(c_ptr),value :: f
      type(dim3),value :: gridDim
      type(dim3),value :: blockDimX
      type(c_ptr) :: kernelParams
      integer(kind=4),value :: sharedMemBytes
      type(c_ptr),value :: stream
    end function

  ! 
  !   @brief Launches kernels on multiple devices where thread blocks can cooperate and
  !   synchronize as they execute.
  !  
  !   @param [in] hipLaunchParams          List of launch parameters, one per device.
  !   @param [in] numDevices               Size of the launchParamsList array.
  !   @param [in] flags                    Flags to control launch behavior.
  !  
  !   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue, hipErrorCooperativeLaunchTooLarge
  !  
#ifdef USE_CUDA_NAMES
  function hipLaunchCooperativeKernelMultiDevice(launchParamsList,numDevices,flags) bind(c, name="cudaLaunchCooperativeKernelMultiDevice")
#else
  function hipLaunchCooperativeKernelMultiDevice(launchParamsList,numDevices,flags) bind(c, name="hipLaunchCooperativeKernelMultiDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipLaunchCooperativeKernelMultiDevice
#else
      integer(kind(hipSuccess)) :: hipLaunchCooperativeKernelMultiDevice
#endif
      type(c_ptr),value :: launchParamsList
      integer(c_int),value :: numDevices
      integer(kind=4),value :: flags
    end function

  
#ifdef USE_CUDA_NAMES
  function hipModuleOccupancyMaxPotentialBlockSize(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit) bind(c, name="cudaModuleOccupancyMaxPotentialBlockSize")
#else
  function hipModuleOccupancyMaxPotentialBlockSize(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit) bind(c, name="hipModuleOccupancyMaxPotentialBlockSize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleOccupancyMaxPotentialBlockSize
#else
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxPotentialBlockSize
#endif
      type(c_ptr),value :: gridSize
      type(c_ptr),value :: blockSize
      type(c_ptr),intent(INOUT) :: f
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: blockSizeLimit
    end function

  
#ifdef USE_CUDA_NAMES
  function hipModuleOccupancyMaxPotentialBlockSizeWithFlags(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit,flags) bind(c, name="cudaModuleOccupancyMaxPotentialBlockSizeWithFlags")
#else
  function hipModuleOccupancyMaxPotentialBlockSizeWithFlags(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit,flags) bind(c, name="hipModuleOccupancyMaxPotentialBlockSizeWithFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleOccupancyMaxPotentialBlockSizeWithFlags
#else
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxPotentialBlockSizeWithFlags
#endif
      type(c_ptr),value :: gridSize
      type(c_ptr),value :: blockSize
      type(c_ptr),intent(INOUT) :: f
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: blockSizeLimit
      integer(kind=4),value :: flags
    end function

  ! 
  !   @brief Returns occupancy for a device function.
  !  
  !   @param [out] numBlocks        Returned occupancy
  !   @param [in]  func             Kernel function (hipFunction) for which occupancy is calulated
  !   @param [in]  blockSize        Block size the kernel is intended to be launched with
  !   @param [in]  dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
  !  
#ifdef USE_CUDA_NAMES
  function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor(numBlocks,f,blockSize,dynSharedMemPerBlk) bind(c, name="cudaModuleOccupancyMaxActiveBlocksPerMultiprocessor")
#else
  function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor(numBlocks,f,blockSize,dynSharedMemPerBlk) bind(c, name="hipModuleOccupancyMaxActiveBlocksPerMultiprocessor")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleOccupancyMaxActiveBlocksPerMultiprocessor
#else
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxActiveBlocksPerMultiprocessor
#endif
      type(c_ptr),value :: numBlocks
      type(c_ptr),intent(INOUT) :: f
      integer(c_int),value :: blockSize
      integer(c_size_t),value :: dynSharedMemPerBlk
    end function

  ! 
  !   @brief Returns occupancy for a device function.
  !  
  !   @param [out] numBlocks        Returned occupancy
  !   @param [in]  f                Kernel function(hipFunction_t) for which occupancy is calulated
  !   @param [in]  blockSize        Block size the kernel is intended to be launched with
  !   @param [in]  dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
  !   @param [in]  flags            Extra flags for occupancy calculation (only default supported)
  !  
#ifdef USE_CUDA_NAMES
  function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags(numBlocks,f,blockSize,dynSharedMemPerBlk,flags) bind(c, name="cudaModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
#else
  function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags(numBlocks,f,blockSize,dynSharedMemPerBlk,flags) bind(c, name="hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
#else
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
#endif
      type(c_ptr),value :: numBlocks
      type(c_ptr),intent(INOUT) :: f
      integer(c_int),value :: blockSize
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(kind=4),value :: flags
    end function

  ! 
  !   @brief Returns occupancy for a device function.
  !  
  !   @param [out] numBlocks        Returned occupancy
  !   @param [in]  func             Kernel function for which occupancy is calulated
  !   @param [in]  blockSize        Block size the kernel is intended to be launched with
  !   @param [in]  dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
  !  
#ifdef USE_CUDA_NAMES
  function hipOccupancyMaxActiveBlocksPerMultiprocessor(numBlocks,f,blockSize,dynSharedMemPerBlk) bind(c, name="cudaOccupancyMaxActiveBlocksPerMultiprocessor")
#else
  function hipOccupancyMaxActiveBlocksPerMultiprocessor(numBlocks,f,blockSize,dynSharedMemPerBlk) bind(c, name="hipOccupancyMaxActiveBlocksPerMultiprocessor")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessor
#else
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessor
#endif
      type(c_ptr),value :: numBlocks
      type(c_ptr),value :: f
      integer(c_int),value :: blockSize
      integer(c_size_t),value :: dynSharedMemPerBlk
    end function

  ! 
  !   @brief determine the grid and block sizes to achieves maximum occupancy for a kernel
  !  
  !   @param [out] gridSize           minimum grid size for maximum potential occupancy
  !   @param [out] blockSize          block size for maximum potential occupancy
  !   @param [in]  f                  kernel function for which occupancy is calulated
  !   @param [in]  dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
  !   @param [in]  blockSizeLimit     the maximum block size for the kernel, use 0 for no limit
  !  
  !   @returns hipSuccess, hipInvalidDevice, hipErrorInvalidValue
  !  
#ifdef USE_CUDA_NAMES
  function hipOccupancyMaxPotentialBlockSize(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit) bind(c, name="cudaOccupancyMaxPotentialBlockSize")
#else
  function hipOccupancyMaxPotentialBlockSize(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit) bind(c, name="hipOccupancyMaxPotentialBlockSize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipOccupancyMaxPotentialBlockSize
#else
      integer(kind(hipSuccess)) :: hipOccupancyMaxPotentialBlockSize
#endif
      type(c_ptr),value :: gridSize
      type(c_ptr),value :: blockSize
      type(c_ptr),value :: f
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: blockSizeLimit
    end function

  ! 
  !   @brief Launches kernels on multiple devices and guarantees all specified kernels are dispatched
  !   on respective streams before enqueuing any other work on the specified streams from any other threads
  !  
  !  
  !   @param [in] hipLaunchParams          List of launch parameters, one per device.
  !   @param [in] numDevices               Size of the launchParamsList array.
  !   @param [in] flags                    Flags to control launch behavior.
  !  
  !   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue
  !  
#ifdef USE_CUDA_NAMES
  function hipExtLaunchMultiKernelMultiDevice(launchParamsList,numDevices,flags) bind(c, name="cudaExtLaunchMultiKernelMultiDevice")
#else
  function hipExtLaunchMultiKernelMultiDevice(launchParamsList,numDevices,flags) bind(c, name="hipExtLaunchMultiKernelMultiDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipExtLaunchMultiKernelMultiDevice
#else
      integer(kind(hipSuccess)) :: hipExtLaunchMultiKernelMultiDevice
#endif
      type(c_ptr),value :: launchParamsList
      integer(c_int),value :: numDevices
      integer(kind=4),value :: flags
    end function

  
#ifdef USE_CUDA_NAMES
  function hipProfilerStart() bind(c, name="cudaProfilerStart")
#else
  function hipProfilerStart() bind(c, name="hipProfilerStart")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipProfilerStart
#else
      integer(kind(hipSuccess)) :: hipProfilerStart
#endif
    end function

  
#ifdef USE_CUDA_NAMES
  function hipProfilerStop() bind(c, name="cudaProfilerStop")
#else
  function hipProfilerStop() bind(c, name="hipProfilerStop")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipProfilerStop
#else
      integer(kind(hipSuccess)) :: hipProfilerStop
#endif
    end function

  ! 
  !   @brief Gets an interprocess memory handle for an existing device memory
  !            allocation
  !  
  !   Takes a pointer to the base of an existing device memory allocation created
  !   with hipMalloc and exports it for use in another process. This is a
  !   lightweight operation and may be called multiple times on an allocation
  !   without adverse effects.
  !  
  !   If a region of memory is freed with hipFree and a subsequent call
  !   to hipMalloc returns memory with the same device address,
  !   hipIpcGetMemHandle will return a unique handle for the
  !   new memory.
  !  
  !   @param handle - Pointer to user allocated hipIpcMemHandle to return
  !                      the handle in.
  !   @param devPtr - Base pointer to previously allocated device memory
  !  
  !   @returns
  !   hipSuccess,
  !   hipErrorInvalidHandle,
  !   hipErrorOutOfMemory,
  !   hipErrorMapFailed,
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipIpcGetMemHandle(handle,devPtr) bind(c, name="cudaIpcGetMemHandle")
#else
  function hipIpcGetMemHandle(handle,devPtr) bind(c, name="hipIpcGetMemHandle")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipIpcGetMemHandle
#else
      integer(kind(hipSuccess)) :: hipIpcGetMemHandle
#endif
      type(c_ptr),intent(INOUT) :: handle
      type(c_ptr),value :: devPtr
    end function

  ! 
  !   @brief Opens an interprocess memory handle exported from another process
  !            and returns a device pointer usable in the local process.
  !  
  !   Maps memory exported from another process with hipIpcGetMemHandle into
  !   the current device address space. For contexts on different devices
  !   hipIpcOpenMemHandle can attempt to enable peer access between the
  !   devices as if the user called hipDeviceEnablePeerAccess. This behavior is
  !   controlled by the hipIpcMemLazyEnablePeerAccess flag.
  !   hipDeviceCanAccessPeer can determine if a mapping is possible.
  !  
  !   Contexts that may open hipIpcMemHandles are restricted in the following way.
  !   hipIpcMemHandles from each device in a given process may only be opened
  !   by one context per device per other process.
  !  
  !   Memory returned from hipIpcOpenMemHandle must be freed with
  !   hipIpcCloseMemHandle.
  !  
  !   Calling hipFree on an exported memory region before calling
  !   hipIpcCloseMemHandle in the importing context will result in undefined
  !   behavior.
  !  
  !   @param devPtr - Returned device pointer
  !   @param handle - hipIpcMemHandle to open
  !   @param flags  - Flags for this operation. Must be specified as hipIpcMemLazyEnablePeerAccess
  !  
  !   @returns
  !   hipSuccess,
  !   hipErrorMapFailed,
  !   hipErrorInvalidHandle,
  !   hipErrorTooManyPeers
  !  
  !   @note No guarantees are made about the address returned in @p devPtr.
  !   In particular, multiple processes may not receive the same address for the same @p handle.
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipIpcOpenMemHandle(devPtr,handle,flags) bind(c, name="cudaIpcOpenMemHandle")
#else
  function hipIpcOpenMemHandle(devPtr,handle,flags) bind(c, name="hipIpcOpenMemHandle")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipIpcOpenMemHandle
#else
      integer(kind(hipSuccess)) :: hipIpcOpenMemHandle
#endif
      type(c_ptr) :: devPtr
      type(c_ptr),value :: handle
      integer(kind=4),value :: flags
    end function

  ! 
  !   @brief Close memory mapped with hipIpcOpenMemHandle
  !  
  !   Unmaps memory returnd by hipIpcOpenMemHandle. The original allocation
  !   in the exporting process as well as imported mappings in other processes
  !   will be unaffected.
  !  
  !   Any resources used to enable peer access will be freed if this is the
  !   last mapping using them.
  !  
  !   @param devPtr - Device pointer returned by hipIpcOpenMemHandle
  !  
  !   @returns
  !   hipSuccess,
  !   hipErrorMapFailed,
  !   hipErrorInvalidHandle,
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipIpcCloseMemHandle(devPtr) bind(c, name="cudaIpcCloseMemHandle")
#else
  function hipIpcCloseMemHandle(devPtr) bind(c, name="hipIpcCloseMemHandle")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipIpcCloseMemHandle
#else
      integer(kind(hipSuccess)) :: hipIpcCloseMemHandle
#endif
      type(c_ptr),value :: devPtr
    end function

  
#ifdef USE_CUDA_NAMES
  function hipIpcGetEventHandle(handle,event) bind(c, name="cudaIpcGetEventHandle")
#else
  function hipIpcGetEventHandle(handle,event) bind(c, name="hipIpcGetEventHandle")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipIpcGetEventHandle
#else
      integer(kind(hipSuccess)) :: hipIpcGetEventHandle
#endif
      type(c_ptr),intent(INOUT) :: handle
      type(c_ptr),intent(INOUT) :: event
    end function

  
#ifdef USE_CUDA_NAMES
  function hipIpcOpenEventHandle(event,handle) bind(c, name="cudaIpcOpenEventHandle")
#else
  function hipIpcOpenEventHandle(event,handle) bind(c, name="hipIpcOpenEventHandle")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipIpcOpenEventHandle
#else
      integer(kind(hipSuccess)) :: hipIpcOpenEventHandle
#endif
      type(c_ptr),intent(INOUT) :: event
      type(c_ptr),value :: handle
    end function

  ! 
  !   @brief Set a kernel argument.
  !  
  !   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue
  !  
  !   @param [in] arg    Pointer the argument in host memory.
  !   @param [in] size   Size of the argument.
  !   @param [in] offset Offset of the argument on the argument stack.
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipSetupArgument(arg,mySize,offset) bind(c, name="cudaSetupArgument")
#else
  function hipSetupArgument(arg,mySize,offset) bind(c, name="hipSetupArgument")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipSetupArgument
#else
      integer(kind(hipSuccess)) :: hipSetupArgument
#endif
      type(c_ptr),value :: arg
      integer(c_size_t),value :: mySize
      integer(c_size_t),value :: offset
    end function

  ! 
  !   @brief Launch a kernel.
  !  
  !   @param [in] func Kernel to launch.
  !  
  !   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue
  !  
  !  
#ifdef USE_CUDA_NAMES
  function hipLaunchByPtr(func) bind(c, name="cudaLaunchByPtr")
#else
  function hipLaunchByPtr(func) bind(c, name="hipLaunchByPtr")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipLaunchByPtr
#else
      integer(kind(hipSuccess)) :: hipLaunchByPtr
#endif
      type(c_ptr),value :: func
    end function

  
#ifdef USE_CUDA_NAMES
  function hipBindTexture2D(offset,tex,devPtr,desc,width,height,pitch) bind(c, name="cudaBindTexture2D")
#else
  function hipBindTexture2D(offset,tex,devPtr,desc,width,height,pitch) bind(c, name="hipBindTexture2D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipBindTexture2D
#else
      integer(kind(hipSuccess)) :: hipBindTexture2D
#endif
      integer(c_size_t),intent(IN) :: offset
      type(c_ptr),intent(INOUT) :: tex
      type(c_ptr),value :: devPtr
      type(c_ptr),intent(INOUT) :: desc
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(c_size_t),value :: pitch
    end function

  
#ifdef USE_CUDA_NAMES
  function hipBindTextureToArray(tex,array,desc) bind(c, name="cudaBindTextureToArray")
#else
  function hipBindTextureToArray(tex,array,desc) bind(c, name="hipBindTextureToArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipBindTextureToArray
#else
      integer(kind(hipSuccess)) :: hipBindTextureToArray
#endif
      type(c_ptr),intent(INOUT) :: tex
      type(c_ptr),intent(INOUT) :: array
      type(c_ptr),intent(INOUT) :: desc
    end function

  
#ifdef USE_CUDA_NAMES
  function hipBindTextureToMipmappedArray(tex,mipmappedArray,desc) bind(c, name="cudaBindTextureToMipmappedArray")
#else
  function hipBindTextureToMipmappedArray(tex,mipmappedArray,desc) bind(c, name="hipBindTextureToMipmappedArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipBindTextureToMipmappedArray
#else
      integer(kind(hipSuccess)) :: hipBindTextureToMipmappedArray
#endif
      type(c_ptr),intent(INOUT) :: tex
      type(c_ptr),intent(INOUT) :: mipmappedArray
      type(c_ptr),intent(INOUT) :: desc
    end function

  
#ifdef USE_CUDA_NAMES
  function hipGetTextureAlignmentOffset(offset,texref) bind(c, name="cudaGetTextureAlignmentOffset")
#else
  function hipGetTextureAlignmentOffset(offset,texref) bind(c, name="hipGetTextureAlignmentOffset")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetTextureAlignmentOffset
#else
      integer(kind(hipSuccess)) :: hipGetTextureAlignmentOffset
#endif
      integer(c_size_t),intent(IN) :: offset
      type(c_ptr),intent(INOUT) :: texref
    end function

  
#ifdef USE_CUDA_NAMES
  function hipGetTextureReference(texref,symbol) bind(c, name="cudaGetTextureReference")
#else
  function hipGetTextureReference(texref,symbol) bind(c, name="hipGetTextureReference")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetTextureReference
#else
      integer(kind(hipSuccess)) :: hipGetTextureReference
#endif
      type(c_ptr),intent(INOUT) :: texref
      type(c_ptr),value :: symbol
    end function

  
#ifdef USE_CUDA_NAMES
  function hipUnbindTexture(tex) bind(c, name="cudaUnbindTexture")
#else
  function hipUnbindTexture(tex) bind(c, name="hipUnbindTexture")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipUnbindTexture
#else
      integer(kind(hipSuccess)) :: hipUnbindTexture
#endif
      type(c_ptr),intent(INOUT) :: tex
    end function

  
#ifdef USE_CUDA_NAMES
  function hipCreateTextureObject(pTexObject,pResDesc,pTexDesc,pResViewDesc) bind(c, name="cudaCreateTextureObject")
#else
  function hipCreateTextureObject(pTexObject,pResDesc,pTexDesc,pResViewDesc) bind(c, name="hipCreateTextureObject")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCreateTextureObject
#else
      integer(kind(hipSuccess)) :: hipCreateTextureObject
#endif
      type(c_ptr),intent(INOUT) :: pTexObject
      type(c_ptr),intent(INOUT) :: pResDesc
      type(c_ptr),intent(INOUT) :: pTexDesc
      type(c_ptr),value :: pResViewDesc
    end function

  
#ifdef USE_CUDA_NAMES
  function hipDestroyTextureObject(textureObject) bind(c, name="cudaDestroyTextureObject")
#else
  function hipDestroyTextureObject(textureObject) bind(c, name="hipDestroyTextureObject")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDestroyTextureObject
#else
      integer(kind(hipSuccess)) :: hipDestroyTextureObject
#endif
      type(c_ptr),intent(INOUT) :: textureObject
    end function

  
#ifdef USE_CUDA_NAMES
  function hipGetChannelDesc(desc,array) bind(c, name="cudaGetChannelDesc")
#else
  function hipGetChannelDesc(desc,array) bind(c, name="hipGetChannelDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetChannelDesc
#else
      integer(kind(hipSuccess)) :: hipGetChannelDesc
#endif
      type(c_ptr),intent(INOUT) :: desc
      type(c_ptr),intent(INOUT) :: array
    end function

  
#ifdef USE_CUDA_NAMES
  function hipGetTextureObjectResourceDesc(pResDesc,textureObject) bind(c, name="cudaGetTextureObjectResourceDesc")
#else
  function hipGetTextureObjectResourceDesc(pResDesc,textureObject) bind(c, name="hipGetTextureObjectResourceDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetTextureObjectResourceDesc
#else
      integer(kind(hipSuccess)) :: hipGetTextureObjectResourceDesc
#endif
      type(c_ptr),intent(INOUT) :: pResDesc
      type(c_ptr),intent(INOUT) :: textureObject
    end function

  
#ifdef USE_CUDA_NAMES
  function hipGetTextureObjectResourceViewDesc(pResViewDesc,textureObject) bind(c, name="cudaGetTextureObjectResourceViewDesc")
#else
  function hipGetTextureObjectResourceViewDesc(pResViewDesc,textureObject) bind(c, name="hipGetTextureObjectResourceViewDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetTextureObjectResourceViewDesc
#else
      integer(kind(hipSuccess)) :: hipGetTextureObjectResourceViewDesc
#endif
      type(c_ptr),value :: pResViewDesc
      type(c_ptr),intent(INOUT) :: textureObject
    end function

  
#ifdef USE_CUDA_NAMES
  function hipGetTextureObjectTextureDesc(pTexDesc,textureObject) bind(c, name="cudaGetTextureObjectTextureDesc")
#else
  function hipGetTextureObjectTextureDesc(pTexDesc,textureObject) bind(c, name="hipGetTextureObjectTextureDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetTextureObjectTextureDesc
#else
      integer(kind(hipSuccess)) :: hipGetTextureObjectTextureDesc
#endif
      type(c_ptr),intent(INOUT) :: pTexDesc
      type(c_ptr),intent(INOUT) :: textureObject
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefGetAddress(dev_ptr,texRef) bind(c, name="cudaTexRefGetAddress")
#else
  function hipTexRefGetAddress(dev_ptr,texRef) bind(c, name="hipTexRefGetAddress")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetAddress
#else
      integer(kind(hipSuccess)) :: hipTexRefGetAddress
#endif
      type(c_ptr),intent(INOUT) :: dev_ptr
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefGetAddressMode(pam,texRef,dim) bind(c, name="cudaTexRefGetAddressMode")
#else
  function hipTexRefGetAddressMode(pam,texRef,dim) bind(c, name="hipTexRefGetAddressMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetAddressMode
#else
      integer(kind(hipSuccess)) :: hipTexRefGetAddressMode
#endif
      type(c_ptr),value :: pam
      type(c_ptr),intent(INOUT) :: texRef
      integer(c_int),value :: dim
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefGetFilterMode(pfm,texRef) bind(c, name="cudaTexRefGetFilterMode")
#else
  function hipTexRefGetFilterMode(pfm,texRef) bind(c, name="hipTexRefGetFilterMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetFilterMode
#else
      integer(kind(hipSuccess)) :: hipTexRefGetFilterMode
#endif
      type(c_ptr),value :: pfm
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefGetFlags(pFlags,texRef) bind(c, name="cudaTexRefGetFlags")
#else
  function hipTexRefGetFlags(pFlags,texRef) bind(c, name="hipTexRefGetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetFlags
#else
      integer(kind(hipSuccess)) :: hipTexRefGetFlags
#endif
      type(c_ptr),value :: pFlags
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefGetFormat(pFormat,pNumChannels,texRef) bind(c, name="cudaTexRefGetFormat")
#else
  function hipTexRefGetFormat(pFormat,pNumChannels,texRef) bind(c, name="hipTexRefGetFormat")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetFormat
#else
      integer(kind(hipSuccess)) :: hipTexRefGetFormat
#endif
      type(c_ptr),value :: pFormat
      type(c_ptr),value :: pNumChannels
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefGetMaxAnisotropy(pmaxAnsio,texRef) bind(c, name="cudaTexRefGetMaxAnisotropy")
#else
  function hipTexRefGetMaxAnisotropy(pmaxAnsio,texRef) bind(c, name="hipTexRefGetMaxAnisotropy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetMaxAnisotropy
#else
      integer(kind(hipSuccess)) :: hipTexRefGetMaxAnisotropy
#endif
      type(c_ptr),value :: pmaxAnsio
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefGetMipmapFilterMode(pfm,texRef) bind(c, name="cudaTexRefGetMipmapFilterMode")
#else
  function hipTexRefGetMipmapFilterMode(pfm,texRef) bind(c, name="hipTexRefGetMipmapFilterMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetMipmapFilterMode
#else
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapFilterMode
#endif
      type(c_ptr),value :: pfm
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefGetMipmapLevelBias(pbias,texRef) bind(c, name="cudaTexRefGetMipmapLevelBias")
#else
  function hipTexRefGetMipmapLevelBias(pbias,texRef) bind(c, name="hipTexRefGetMipmapLevelBias")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetMipmapLevelBias
#else
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelBias
#endif
      type(c_ptr),value :: pbias
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefGetMipmapLevelClamp(pminMipmapLevelClamp,pmaxMipmapLevelClamp,texRef) bind(c, name="cudaTexRefGetMipmapLevelClamp")
#else
  function hipTexRefGetMipmapLevelClamp(pminMipmapLevelClamp,pmaxMipmapLevelClamp,texRef) bind(c, name="hipTexRefGetMipmapLevelClamp")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetMipmapLevelClamp
#else
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelClamp
#endif
      type(c_ptr),value :: pminMipmapLevelClamp
      type(c_ptr),value :: pmaxMipmapLevelClamp
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefGetMipMappedArray(pArray,texRef) bind(c, name="cudaTexRefGetMipMappedArray")
#else
  function hipTexRefGetMipMappedArray(pArray,texRef) bind(c, name="hipTexRefGetMipMappedArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetMipMappedArray
#else
      integer(kind(hipSuccess)) :: hipTexRefGetMipMappedArray
#endif
      type(c_ptr),intent(INOUT) :: pArray
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetAddress(ByteOffset,texRef,dptr,bytes) bind(c, name="cudaTexRefSetAddress")
#else
  function hipTexRefSetAddress(ByteOffset,texRef,dptr,bytes) bind(c, name="hipTexRefSetAddress")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetAddress
#else
      integer(kind(hipSuccess)) :: hipTexRefSetAddress
#endif
      integer(c_size_t),intent(IN) :: ByteOffset
      type(c_ptr),intent(INOUT) :: texRef
      type(c_ptr),value :: dptr
      integer(c_size_t),value :: bytes
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetAddress2D(texRef,desc,dptr,Pitch) bind(c, name="cudaTexRefSetAddress2D")
#else
  function hipTexRefSetAddress2D(texRef,desc,dptr,Pitch) bind(c, name="hipTexRefSetAddress2D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetAddress2D
#else
      integer(kind(hipSuccess)) :: hipTexRefSetAddress2D
#endif
      type(c_ptr),intent(INOUT) :: texRef
      type(c_ptr),intent(INOUT) :: desc
      type(c_ptr),value :: dptr
      integer(c_size_t),value :: Pitch
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetAddressMode(texRef,dim,am) bind(c, name="cudaTexRefSetAddressMode")
#else
  function hipTexRefSetAddressMode(texRef,dim,am) bind(c, name="hipTexRefSetAddressMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetAddressMode
#else
      integer(kind(hipSuccess)) :: hipTexRefSetAddressMode
#endif
      type(c_ptr),intent(INOUT) :: texRef
      integer(c_int),value :: dim
      integer(kind(hipAddressModeWrap)),value :: am
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetArray(tex,array,flags) bind(c, name="cudaTexRefSetArray")
#else
  function hipTexRefSetArray(tex,array,flags) bind(c, name="hipTexRefSetArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetArray
#else
      integer(kind(hipSuccess)) :: hipTexRefSetArray
#endif
      type(c_ptr),intent(INOUT) :: tex
      type(c_ptr),intent(INOUT) :: array
      integer(kind=4),value :: flags
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetBorderColor(texRef,pBorderColor) bind(c, name="cudaTexRefSetBorderColor")
#else
  function hipTexRefSetBorderColor(texRef,pBorderColor) bind(c, name="hipTexRefSetBorderColor")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetBorderColor
#else
      integer(kind(hipSuccess)) :: hipTexRefSetBorderColor
#endif
      type(c_ptr),intent(INOUT) :: texRef
      type(c_ptr),value :: pBorderColor
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetFilterMode(texRef,fm) bind(c, name="cudaTexRefSetFilterMode")
#else
  function hipTexRefSetFilterMode(texRef,fm) bind(c, name="hipTexRefSetFilterMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetFilterMode
#else
      integer(kind(hipSuccess)) :: hipTexRefSetFilterMode
#endif
      type(c_ptr),intent(INOUT) :: texRef
      integer(kind(hipFilterModePoint)),value :: fm
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetFlags(texRef,Flags) bind(c, name="cudaTexRefSetFlags")
#else
  function hipTexRefSetFlags(texRef,Flags) bind(c, name="hipTexRefSetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetFlags
#else
      integer(kind(hipSuccess)) :: hipTexRefSetFlags
#endif
      type(c_ptr),intent(INOUT) :: texRef
      integer(kind=4),value :: Flags
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetFormat(texRef,fmt,NumPackedComponents) bind(c, name="cudaTexRefSetFormat")
#else
  function hipTexRefSetFormat(texRef,fmt,NumPackedComponents) bind(c, name="hipTexRefSetFormat")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetFormat
#else
      integer(kind(hipSuccess)) :: hipTexRefSetFormat
#endif
      type(c_ptr),intent(INOUT) :: texRef
      integer(kind(HIP_AD_FORMAT_UNSIGNED_INT8)),value :: fmt
      integer(c_int),value :: NumPackedComponents
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetMaxAnisotropy(texRef,maxAniso) bind(c, name="cudaTexRefSetMaxAnisotropy")
#else
  function hipTexRefSetMaxAnisotropy(texRef,maxAniso) bind(c, name="hipTexRefSetMaxAnisotropy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetMaxAnisotropy
#else
      integer(kind(hipSuccess)) :: hipTexRefSetMaxAnisotropy
#endif
      type(c_ptr),intent(INOUT) :: texRef
      integer(kind=4),value :: maxAniso
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetMipmapFilterMode(texRef,fm) bind(c, name="cudaTexRefSetMipmapFilterMode")
#else
  function hipTexRefSetMipmapFilterMode(texRef,fm) bind(c, name="hipTexRefSetMipmapFilterMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetMipmapFilterMode
#else
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapFilterMode
#endif
      type(c_ptr),intent(INOUT) :: texRef
      integer(kind(hipFilterModePoint)),value :: fm
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetMipmapLevelBias(texRef,bias) bind(c, name="cudaTexRefSetMipmapLevelBias")
#else
  function hipTexRefSetMipmapLevelBias(texRef,bias) bind(c, name="hipTexRefSetMipmapLevelBias")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetMipmapLevelBias
#else
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapLevelBias
#endif
      type(c_ptr),intent(INOUT) :: texRef
      real(c_float),value :: bias
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetMipmapLevelClamp(texRef,minMipMapLevelClamp,maxMipMapLevelClamp) bind(c, name="cudaTexRefSetMipmapLevelClamp")
#else
  function hipTexRefSetMipmapLevelClamp(texRef,minMipMapLevelClamp,maxMipMapLevelClamp) bind(c, name="hipTexRefSetMipmapLevelClamp")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetMipmapLevelClamp
#else
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapLevelClamp
#endif
      type(c_ptr),intent(INOUT) :: texRef
      real(c_float),value :: minMipMapLevelClamp
      real(c_float),value :: maxMipMapLevelClamp
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexRefSetMipmappedArray(texRef,mipmappedArray,Flags) bind(c, name="cudaTexRefSetMipmappedArray")
#else
  function hipTexRefSetMipmappedArray(texRef,mipmappedArray,Flags) bind(c, name="hipTexRefSetMipmappedArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetMipmappedArray
#else
      integer(kind(hipSuccess)) :: hipTexRefSetMipmappedArray
#endif
      type(c_ptr),intent(INOUT) :: texRef
      type(c_ptr),value :: mipmappedArray
      integer(kind=4),value :: Flags
    end function

  
#ifdef USE_CUDA_NAMES
  function hipMipmappedArrayCreate(pHandle,pMipmappedArrayDesc,numMipmapLevels) bind(c, name="cudaMipmappedArrayCreate")
#else
  function hipMipmappedArrayCreate(pHandle,pMipmappedArrayDesc,numMipmapLevels) bind(c, name="hipMipmappedArrayCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMipmappedArrayCreate
#else
      integer(kind(hipSuccess)) :: hipMipmappedArrayCreate
#endif
      type(c_ptr),intent(INOUT) :: pHandle
      type(c_ptr),intent(INOUT) :: pMipmappedArrayDesc
      integer(kind=4),value :: numMipmapLevels
    end function

  
#ifdef USE_CUDA_NAMES
  function hipMipmappedArrayDestroy(hMipmappedArray) bind(c, name="cudaMipmappedArrayDestroy")
#else
  function hipMipmappedArrayDestroy(hMipmappedArray) bind(c, name="hipMipmappedArrayDestroy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMipmappedArrayDestroy
#else
      integer(kind(hipSuccess)) :: hipMipmappedArrayDestroy
#endif
      type(c_ptr),intent(INOUT) :: hMipmappedArray
    end function

  
#ifdef USE_CUDA_NAMES
  function hipMipmappedArrayGetLevel(pLevelArray,hMipMappedArray,level) bind(c, name="cudaMipmappedArrayGetLevel")
#else
  function hipMipmappedArrayGetLevel(pLevelArray,hMipMappedArray,level) bind(c, name="hipMipmappedArrayGetLevel")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMipmappedArrayGetLevel
#else
      integer(kind(hipSuccess)) :: hipMipmappedArrayGetLevel
#endif
      type(c_ptr),intent(INOUT) :: pLevelArray
      type(c_ptr),intent(INOUT) :: hMipMappedArray
      integer(kind=4),value :: level
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexObjectCreate(pTexObject,pResDesc,pTexDesc,pResViewDesc) bind(c, name="cudaTexObjectCreate")
#else
  function hipTexObjectCreate(pTexObject,pResDesc,pTexDesc,pResViewDesc) bind(c, name="hipTexObjectCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexObjectCreate
#else
      integer(kind(hipSuccess)) :: hipTexObjectCreate
#endif
      type(c_ptr),intent(INOUT) :: pTexObject
      type(c_ptr),value :: pResDesc
      type(c_ptr),value :: pTexDesc
      type(c_ptr),value :: pResViewDesc
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexObjectDestroy(texObject) bind(c, name="cudaTexObjectDestroy")
#else
  function hipTexObjectDestroy(texObject) bind(c, name="hipTexObjectDestroy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexObjectDestroy
#else
      integer(kind(hipSuccess)) :: hipTexObjectDestroy
#endif
      type(c_ptr),intent(INOUT) :: texObject
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexObjectGetResourceDesc(pResDesc,texObject) bind(c, name="cudaTexObjectGetResourceDesc")
#else
  function hipTexObjectGetResourceDesc(pResDesc,texObject) bind(c, name="hipTexObjectGetResourceDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexObjectGetResourceDesc
#else
      integer(kind(hipSuccess)) :: hipTexObjectGetResourceDesc
#endif
      type(c_ptr),value :: pResDesc
      type(c_ptr),intent(INOUT) :: texObject
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexObjectGetResourceViewDesc(pResViewDesc,texObject) bind(c, name="cudaTexObjectGetResourceViewDesc")
#else
  function hipTexObjectGetResourceViewDesc(pResViewDesc,texObject) bind(c, name="hipTexObjectGetResourceViewDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexObjectGetResourceViewDesc
#else
      integer(kind(hipSuccess)) :: hipTexObjectGetResourceViewDesc
#endif
      type(c_ptr),value :: pResViewDesc
      type(c_ptr),intent(INOUT) :: texObject
    end function

  
#ifdef USE_CUDA_NAMES
  function hipTexObjectGetTextureDesc(pTexDesc,texObject) bind(c, name="cudaTexObjectGetTextureDesc")
#else
  function hipTexObjectGetTextureDesc(pTexDesc,texObject) bind(c, name="hipTexObjectGetTextureDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexObjectGetTextureDesc
#else
      integer(kind(hipSuccess)) :: hipTexObjectGetTextureDesc
#endif
      type(c_ptr),value :: pTexDesc
      type(c_ptr),intent(INOUT) :: texObject
    end function

  ! 
  !   CallbackActivity API
  !  
#ifdef USE_CUDA_NAMES
  function hipRegisterApiCallback(id,fun,arg) bind(c, name="cudaRegisterApiCallback")
#else
  function hipRegisterApiCallback(id,fun,arg) bind(c, name="hipRegisterApiCallback")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipRegisterApiCallback
#else
      integer(kind(hipSuccess)) :: hipRegisterApiCallback
#endif
      integer(kind=4),value :: id
      type(c_ptr),value :: fun
      type(c_ptr),value :: arg
    end function

  
#ifdef USE_CUDA_NAMES
  function hipRemoveApiCallback(id) bind(c, name="cudaRemoveApiCallback")
#else
  function hipRemoveApiCallback(id) bind(c, name="hipRemoveApiCallback")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipRemoveApiCallback
#else
      integer(kind(hipSuccess)) :: hipRemoveApiCallback
#endif
      integer(kind=4),value :: id
    end function

  
#ifdef USE_CUDA_NAMES
  function hipRegisterActivityCallback(id,fun,arg) bind(c, name="cudaRegisterActivityCallback")
#else
  function hipRegisterActivityCallback(id,fun,arg) bind(c, name="hipRegisterActivityCallback")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipRegisterActivityCallback
#else
      integer(kind(hipSuccess)) :: hipRegisterActivityCallback
#endif
      integer(kind=4),value :: id
      type(c_ptr),value :: fun
      type(c_ptr),value :: arg
    end function

  
#ifdef USE_CUDA_NAMES
  function hipRemoveActivityCallback(id) bind(c, name="cudaRemoveActivityCallback")
#else
  function hipRemoveActivityCallback(id) bind(c, name="hipRemoveActivityCallback")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use cuda_errors
#endif
      use hip_enums
      use hip_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipRemoveActivityCallback
#else
      integer(kind(hipSuccess)) :: hipRemoveActivityCallback
#endif
      integer(kind=4),value :: id
    end function

  end interface
  
end module hip