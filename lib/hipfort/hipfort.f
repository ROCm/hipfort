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
          
           
module hipfort
  use hipfort_enums
  use hipfort_types
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
    function hipDeviceSynchronize() bind(c, name="hipDeviceSynchronize")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceSynchronize
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
    function hipDeviceReset() bind(c, name="hipDeviceReset")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceReset
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
    function hipSetDevice(deviceId) bind(c, name="hipSetDevice")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipSetDevice
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
    function hipGetDevice(deviceId) bind(c, name="hipGetDevice")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetDevice
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
    function hipGetDeviceCount(count) bind(c, name="hipGetDeviceCount")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetDeviceCount
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
    function hipDeviceGetAttribute(pi,attr,deviceId) bind(c, name="hipDeviceGetAttribute")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetAttribute
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
    function hipGetDeviceProperties(prop,deviceId) bind(c, name="hipGetDeviceProperties")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetDeviceProperties
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
    function hipDeviceSetCacheConfig(cacheConfig) bind(c, name="hipDeviceSetCacheConfig")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceSetCacheConfig
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
    function hipDeviceGetCacheConfig(cacheConfig) bind(c, name="hipDeviceGetCacheConfig")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetCacheConfig
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
    function hipDeviceGetLimit(pValue,limit) bind(c, name="hipDeviceGetLimit")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetLimit
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
    function hipFuncSetCacheConfig(func,config) bind(c, name="hipFuncSetCacheConfig")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipFuncSetCacheConfig
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
    function hipDeviceGetSharedMemConfig(pConfig) bind(c, name="hipDeviceGetSharedMemConfig")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetSharedMemConfig
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
    function hipDeviceSetSharedMemConfig(config) bind(c, name="hipDeviceSetSharedMemConfig")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceSetSharedMemConfig
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
    function hipSetDeviceFlags(flags) bind(c, name="hipSetDeviceFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipSetDeviceFlags
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
    function hipChooseDevice(device,prop) bind(c, name="hipChooseDevice")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipChooseDevice
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
    function hipExtGetLinkTypeAndHopCount(device1,device2,linktype,hopcount) bind(c, name="hipExtGetLinkTypeAndHopCount")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipExtGetLinkTypeAndHopCount
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
    function hipGetLastError() bind(c, name="hipGetLastError")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetLastError
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
    function hipPeekAtLastError() bind(c, name="hipPeekAtLastError")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipPeekAtLastError
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
    function hipStreamCreate(stream) bind(c, name="hipStreamCreate")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipStreamCreate
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
    function hipStreamCreateWithFlags(stream,flags) bind(c, name="hipStreamCreateWithFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipStreamCreateWithFlags
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
    function hipStreamCreateWithPriority(stream,flags,priority) bind(c, name="hipStreamCreateWithPriority")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipStreamCreateWithPriority
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
    function hipDeviceGetStreamPriorityRange(leastPriority,greatestPriority) bind(c, name="hipDeviceGetStreamPriorityRange")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetStreamPriorityRange
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
    function hipStreamDestroy(stream) bind(c, name="hipStreamDestroy")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipStreamDestroy
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
    function hipStreamQuery(stream) bind(c, name="hipStreamQuery")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipStreamQuery
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
    function hipStreamSynchronize(stream) bind(c, name="hipStreamSynchronize")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipStreamSynchronize
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
    function hipStreamWaitEvent(stream,event,flags) bind(c, name="hipStreamWaitEvent")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipStreamWaitEvent
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
    function hipStreamGetFlags(stream,flags) bind(c, name="hipStreamGetFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetFlags
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
    function hipStreamGetPriority(stream,priority) bind(c, name="hipStreamGetPriority")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetPriority
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
    function hipStreamAddCallback(stream,callback,userData,flags) bind(c, name="hipStreamAddCallback")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipStreamAddCallback
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
    function hipEventCreateWithFlags(event,flags) bind(c, name="hipEventCreateWithFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipEventCreateWithFlags
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
    function hipEventCreate(event) bind(c, name="hipEventCreate")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipEventCreate
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
    function hipEventRecord(event,stream) bind(c, name="hipEventRecord")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipEventRecord
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
    function hipEventDestroy(event) bind(c, name="hipEventDestroy")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipEventDestroy
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
    function hipEventSynchronize(event) bind(c, name="hipEventSynchronize")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipEventSynchronize
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
    function hipEventElapsedTime(ms,start,myStop) bind(c, name="hipEventElapsedTime")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipEventElapsedTime
      type(c_ptr),value :: ms
      type(c_ptr),intent(INOUT) :: start
      type(c_ptr),intent(INOUT) :: myStop
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
    function hipEventQuery(event) bind(c, name="hipEventQuery")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipEventQuery
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
    function hipPointerGetAttributes(attributes,ptr) bind(c, name="hipPointerGetAttributes")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipPointerGetAttributes
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
    function hipMalloc(ptr,mySize) bind(c, name="hipMalloc")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMalloc
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
    function hipExtMallocWithFlags(ptr,sizeBytes,flags) bind(c, name="hipExtMallocWithFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipExtMallocWithFlags
      type(c_ptr) :: ptr
      integer(c_size_t),value :: sizeBytes
      integer(kind=4),value :: flags
    end function

  
    function hipMallocHost(ptr,mySize) bind(c, name="hipMallocHost")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMallocHost
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
    end function

  
    function hipMemAllocHost(ptr,mySize) bind(c, name="hipMemAllocHost")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemAllocHost
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
    function hipHostMalloc(ptr,mySize,flags) bind(c, name="hipHostMalloc")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipHostMalloc
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
      integer(kind=4),value :: flags
    end function

  
    function hipHostAlloc(ptr,mySize,flags) bind(c, name="hipHostAlloc")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipHostAlloc
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
    function hipHostGetDevicePointer(devPtr,hstPtr,flags) bind(c, name="hipHostGetDevicePointer")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer
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
    function hipHostGetFlags(flagsPtr,hostPtr) bind(c, name="hipHostGetFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipHostGetFlags
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
    function hipHostRegister(hostPtr,sizeBytes,flags) bind(c, name="hipHostRegister")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipHostRegister
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
    function hipHostUnregister(hostPtr) bind(c, name="hipHostUnregister")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipHostUnregister
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
    function hipMallocPitch(ptr,pitch,width,height) bind(c, name="hipMallocPitch")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMallocPitch
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
    function hipMemAllocPitch(dptr,pitch,widthInBytes,height,elementSizeBytes) bind(c, name="hipMemAllocPitch")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemAllocPitch
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
    function hipFree(ptr) bind(c, name="hipFree")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipFree
      type(c_ptr),value :: ptr
    end function

  
    function hipFreeHost(ptr) bind(c, name="hipFreeHost")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipFreeHost
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
    function hipHostFree(ptr) bind(c, name="hipHostFree")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipHostFree
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
    function hipMemcpy(dst,src,sizeBytes,myKind) bind(c, name="hipMemcpy")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function

  
    function hipMemcpyWithStream(dst,src,sizeBytes,myKind,stream) bind(c, name="hipMemcpyWithStream")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyWithStream
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
    function hipMemcpyHtoD(dst,src,sizeBytes) bind(c, name="hipMemcpyHtoD")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyHtoD
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
    function hipMemcpyDtoH(dst,src,sizeBytes) bind(c, name="hipMemcpyDtoH")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyDtoH
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
    function hipMemcpyDtoD(dst,src,sizeBytes) bind(c, name="hipMemcpyDtoD")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyDtoD
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
    function hipMemcpyHtoDAsync(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyHtoDAsync")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyHtoDAsync
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
    function hipMemcpyDtoHAsync(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyDtoHAsync")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyDtoHAsync
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
    function hipMemcpyDtoDAsync(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyDtoDAsync")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyDtoDAsync
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function

  
    function hipModuleGetGlobal(dptr,bytes,hmod,name) bind(c, name="hipModuleGetGlobal")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleGetGlobal
      type(c_ptr),intent(INOUT) :: dptr
      integer(c_size_t),intent(IN) :: bytes
      type(c_ptr),intent(INOUT) :: hmod
      type(c_ptr),value :: name
    end function

  
    function hipGetSymbolAddress(devPtr,symbol) bind(c, name="hipGetSymbolAddress")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetSymbolAddress
      type(c_ptr) :: devPtr
      type(c_ptr),value :: symbol
    end function

  
    function hipGetSymbolSize(mySize,symbol) bind(c, name="hipGetSymbolSize")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetSymbolSize
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
    function hipMemset(dst,myValue,sizeBytes) bind(c, name="hipMemset")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemset
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
    function hipMemsetD8(dest,myValue,count) bind(c, name="hipMemsetD8")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD8
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
    function hipMemsetD16(dest,myValue,count) bind(c, name="hipMemsetD16")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD16
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
    function hipMemsetD32(dest,myValue,count) bind(c, name="hipMemsetD32")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD32
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
    function hipMemset2D(dst,pitch,myValue,width,height) bind(c, name="hipMemset2D")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemset2D
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
    function hipMemset3D(pitchedDevPtr,myValue,extent) bind(c, name="hipMemset3D")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemset3D
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
    function hipMemGetInfo(free,total) bind(c, name="hipMemGetInfo")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetInfo
      integer(c_size_t),intent(IN) :: free
      integer(c_size_t),intent(IN) :: total
    end function

  
    function hipMemPtrGetInfo(ptr,mySize) bind(c, name="hipMemPtrGetInfo")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemPtrGetInfo
      type(c_ptr),value :: ptr
      integer(c_size_t),intent(IN) :: mySize
    end function

  
    function hipArrayCreate(pHandle,pAllocateArray) bind(c, name="hipArrayCreate")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipArrayCreate
      type(c_ptr),intent(INOUT) :: pHandle
      type(c_ptr),intent(INOUT) :: pAllocateArray
    end function

  
    function hipArray3DCreate(array,pAllocateArray) bind(c, name="hipArray3DCreate")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipArray3DCreate
      type(c_ptr),intent(INOUT) :: array
      type(c_ptr),intent(INOUT) :: pAllocateArray
    end function

  
    function hipMalloc3D(pitchedDevPtr,extent) bind(c, name="hipMalloc3D")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMalloc3D
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
    function hipFreeArray(array) bind(c, name="hipFreeArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipFreeArray
      type(c_ptr),intent(INOUT) :: array
    end function

  ! 
  !   @brief Frees a mipmapped array on the device
  !   
  !   @param[in] mipmappedArray - Pointer to mipmapped array to free
  !   
  !   @return #hipSuccess, #hipErrorInvalidValue
  !  
    function hipFreeMipmappedArray(mipmappedArray) bind(c, name="hipFreeMipmappedArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipFreeMipmappedArray
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
    function hipMalloc3DArray(array,desc,extent,flags) bind(c, name="hipMalloc3DArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMalloc3DArray
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
    function hipGetMipmappedArrayLevel(levelArray,mipmappedArray,level) bind(c, name="hipGetMipmappedArrayLevel")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetMipmappedArrayLevel
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
    function hipMemcpy2D(dst,dpitch,src,spitch,width,height,myKind) bind(c, name="hipMemcpy2D")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2D
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
    function hipMemcpyParam2D(pCopy) bind(c, name="hipMemcpyParam2D")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyParam2D
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
    function hipMemcpy2DToArray(dst,wOffset,hOffset,src,spitch,width,height,myKind) bind(c, name="hipMemcpy2DToArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DToArray
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
    function hipMemcpyToArray(dst,wOffset,hOffset,src,count,myKind) bind(c, name="hipMemcpyToArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyToArray
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
    function hipMemcpyFromArray(dst,srcArray,wOffset,hOffset,count,myKind) bind(c, name="hipMemcpyFromArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyFromArray
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
    function hipMemcpy2DFromArray(dst,dpitch,src,wOffset,hOffset,width,height,myKind) bind(c, name="hipMemcpy2DFromArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DFromArray
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
    function hipMemcpyAtoH(dst,srcArray,srcOffset,count) bind(c, name="hipMemcpyAtoH")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyAtoH
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
    function hipMemcpyHtoA(dstArray,dstOffset,srcHost,count) bind(c, name="hipMemcpyHtoA")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyHtoA
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
    function hipMemcpy3D(p) bind(c, name="hipMemcpy3D")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3D
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
    function hipDrvMemcpy3D(pCopy) bind(c, name="hipDrvMemcpy3D")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemcpy3D
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
    function hipDrvMemcpy3DAsync(pCopy,stream) bind(c, name="hipDrvMemcpy3DAsync")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemcpy3DAsync
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
    function hipDeviceCanAccessPeer(canAccessPeer,deviceId,peerDeviceId) bind(c, name="hipDeviceCanAccessPeer")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceCanAccessPeer
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
    function hipDeviceEnablePeerAccess(peerDeviceId,flags) bind(c, name="hipDeviceEnablePeerAccess")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceEnablePeerAccess
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
    function hipDeviceDisablePeerAccess(peerDeviceId) bind(c, name="hipDeviceDisablePeerAccess")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceDisablePeerAccess
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
    function hipMemGetAddressRange(pbase,psize,dptr) bind(c, name="hipMemGetAddressRange")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetAddressRange
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
    function hipMemcpyPeer(dst,dstDeviceId,src,srcDeviceId,sizeBytes) bind(c, name="hipMemcpyPeer")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyPeer
      type(c_ptr),value :: dst
      integer(c_int),value :: dstDeviceId
      type(c_ptr),value :: src
      integer(c_int),value :: srcDeviceId
      integer(c_size_t),value :: sizeBytes
    end function

  
    function hipInit(flags) bind(c, name="hipInit")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipInit
      integer(kind=4),value :: flags
    end function

  
    function hipCtxCreate(ctx,flags,device) bind(c, name="hipCtxCreate")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxCreate
      type(c_ptr),intent(INOUT) :: ctx
      integer(kind=4),value :: flags
      integer(c_int),value :: device
    end function

  
    function hipCtxDestroy(ctx) bind(c, name="hipCtxDestroy")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxDestroy
      type(c_ptr),intent(INOUT) :: ctx
    end function

  
    function hipCtxPopCurrent(ctx) bind(c, name="hipCtxPopCurrent")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxPopCurrent
      type(c_ptr),intent(INOUT) :: ctx
    end function

  
    function hipCtxPushCurrent(ctx) bind(c, name="hipCtxPushCurrent")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxPushCurrent
      type(c_ptr),intent(INOUT) :: ctx
    end function

  
    function hipCtxSetCurrent(ctx) bind(c, name="hipCtxSetCurrent")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxSetCurrent
      type(c_ptr),intent(INOUT) :: ctx
    end function

  
    function hipCtxGetCurrent(ctx) bind(c, name="hipCtxGetCurrent")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetCurrent
      type(c_ptr),intent(INOUT) :: ctx
    end function

  
    function hipCtxGetDevice(device) bind(c, name="hipCtxGetDevice")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetDevice
      type(c_ptr),value :: device
    end function

  
    function hipCtxGetApiVersion(ctx,apiVersion) bind(c, name="hipCtxGetApiVersion")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetApiVersion
      type(c_ptr),intent(INOUT) :: ctx
      type(c_ptr),value :: apiVersion
    end function

  
    function hipCtxGetCacheConfig(cacheConfig) bind(c, name="hipCtxGetCacheConfig")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetCacheConfig
      type(c_ptr),value :: cacheConfig
    end function

  
    function hipCtxSetCacheConfig(cacheConfig) bind(c, name="hipCtxSetCacheConfig")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxSetCacheConfig
      integer(kind(hipFuncCachePreferNone)),value :: cacheConfig
    end function

  
    function hipCtxSetSharedMemConfig(config) bind(c, name="hipCtxSetSharedMemConfig")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxSetSharedMemConfig
      integer(kind(hipSharedMemBankSizeDefault)),value :: config
    end function

  
    function hipCtxGetSharedMemConfig(pConfig) bind(c, name="hipCtxGetSharedMemConfig")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetSharedMemConfig
      type(c_ptr),value :: pConfig
    end function

  
    function hipCtxSynchronize() bind(c, name="hipCtxSynchronize")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxSynchronize
    end function

  
    function hipCtxGetFlags(flags) bind(c, name="hipCtxGetFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetFlags
      type(c_ptr),value :: flags
    end function

  
    function hipCtxEnablePeerAccess(peerCtx,flags) bind(c, name="hipCtxEnablePeerAccess")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxEnablePeerAccess
      type(c_ptr),intent(INOUT) :: peerCtx
      integer(kind=4),value :: flags
    end function

  
    function hipCtxDisablePeerAccess(peerCtx) bind(c, name="hipCtxDisablePeerAccess")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCtxDisablePeerAccess
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
    function hipDevicePrimaryCtxGetState(dev,flags,active) bind(c, name="hipDevicePrimaryCtxGetState")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxGetState
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
    function hipDevicePrimaryCtxRelease(dev) bind(c, name="hipDevicePrimaryCtxRelease")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxRelease
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
    function hipDevicePrimaryCtxRetain(pctx,dev) bind(c, name="hipDevicePrimaryCtxRetain")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxRetain
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
    function hipDevicePrimaryCtxReset(dev) bind(c, name="hipDevicePrimaryCtxReset")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxReset
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
    function hipDevicePrimaryCtxSetFlags(dev,flags) bind(c, name="hipDevicePrimaryCtxSetFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxSetFlags
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
    function hipDeviceGet(device,ordinal) bind(c, name="hipDeviceGet")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGet
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
    function hipDeviceComputeCapability(major,minor,device) bind(c, name="hipDeviceComputeCapability")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceComputeCapability
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
    function hipDeviceGetName(name,len,device) bind(c, name="hipDeviceGetName")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetName
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
    function hipDeviceGetPCIBusId(pciBusId,len,device) bind(c, name="hipDeviceGetPCIBusId")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetPCIBusId
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
    function hipDeviceGetByPCIBusId(device,pciBusId) bind(c, name="hipDeviceGetByPCIBusId")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetByPCIBusId
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
    function hipDeviceTotalMem(bytes,device) bind(c, name="hipDeviceTotalMem")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceTotalMem
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
    function hipDriverGetVersion(driverVersion) bind(c, name="hipDriverGetVersion")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDriverGetVersion
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
    function hipRuntimeGetVersion(runtimeVersion) bind(c, name="hipRuntimeGetVersion")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipRuntimeGetVersion
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
    function hipModuleLoad(myModule,fname) bind(c, name="hipModuleLoad")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoad
      type(c_ptr),intent(INOUT) :: myModule
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
    function hipModuleUnload(myModule) bind(c, name="hipModuleUnload")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleUnload
      type(c_ptr),intent(INOUT) :: myModule
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
    function hipModuleGetFunction(myFunction,myModule,kname) bind(c, name="hipModuleGetFunction")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleGetFunction
      type(c_ptr),intent(INOUT) :: myFunction
      type(c_ptr),intent(INOUT) :: myModule
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
    function hipFuncGetAttributes(attr,func) bind(c, name="hipFuncGetAttributes")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipFuncGetAttributes
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
    function hipFuncGetAttribute(myValue,attrib,hfunc) bind(c, name="hipFuncGetAttribute")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipFuncGetAttribute
      type(c_ptr),value :: myValue
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)),value :: attrib
      type(c_ptr),intent(INOUT) :: hfunc
    end function

  
    function hipModuleGetTexRef(texRef,hmod,name) bind(c, name="hipModuleGetTexRef")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleGetTexRef
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
    function hipModuleLoadData(myModule,image) bind(c, name="hipModuleLoadData")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoadData
      type(c_ptr),intent(INOUT) :: myModule
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
    function hipModuleLoadDataEx(myModule,image,numOptions,options,optionValues) bind(c, name="hipModuleLoadDataEx")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoadDataEx
      type(c_ptr),intent(INOUT) :: myModule
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
    function hipModuleLaunchKernel(f,gridDimX,gridDimY,gridDimZ,blockDimX,blockDimY,blockDimZ,sharedMemBytes,stream,kernelParams,extra) bind(c, name="hipModuleLaunchKernel")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLaunchKernel
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
    function hipLaunchCooperativeKernel(f,gridDim,blockDimX,kernelParams,sharedMemBytes,stream) bind(c, name="hipLaunchCooperativeKernel")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchCooperativeKernel
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
    function hipLaunchCooperativeKernelMultiDevice(launchParamsList,numDevices,flags) bind(c, name="hipLaunchCooperativeKernelMultiDevice")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchCooperativeKernelMultiDevice
      type(c_ptr),value :: launchParamsList
      integer(c_int),value :: numDevices
      integer(kind=4),value :: flags
    end function

  
    function hipModuleOccupancyMaxPotentialBlockSize(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit) bind(c, name="hipModuleOccupancyMaxPotentialBlockSize")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxPotentialBlockSize
      type(c_ptr),value :: gridSize
      type(c_ptr),value :: blockSize
      type(c_ptr),intent(INOUT) :: f
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: blockSizeLimit
    end function

  
    function hipModuleOccupancyMaxPotentialBlockSizeWithFlags(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit,flags) bind(c, name="hipModuleOccupancyMaxPotentialBlockSizeWithFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxPotentialBlockSizeWithFlags
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
    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor(numBlocks,f,blockSize,dynSharedMemPerBlk) bind(c, name="hipModuleOccupancyMaxActiveBlocksPerMultiprocessor")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxActiveBlocksPerMultiprocessor
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
    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags(numBlocks,f,blockSize,dynSharedMemPerBlk,flags) bind(c, name="hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
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
    function hipOccupancyMaxActiveBlocksPerMultiprocessor(numBlocks,f,blockSize,dynSharedMemPerBlk) bind(c, name="hipOccupancyMaxActiveBlocksPerMultiprocessor")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessor
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
    function hipOccupancyMaxPotentialBlockSize(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit) bind(c, name="hipOccupancyMaxPotentialBlockSize")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxPotentialBlockSize
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
    function hipExtLaunchMultiKernelMultiDevice(launchParamsList,numDevices,flags) bind(c, name="hipExtLaunchMultiKernelMultiDevice")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipExtLaunchMultiKernelMultiDevice
      type(c_ptr),value :: launchParamsList
      integer(c_int),value :: numDevices
      integer(kind=4),value :: flags
    end function

  
    function hipProfilerStart() bind(c, name="hipProfilerStart")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipProfilerStart
    end function

  
    function hipProfilerStop() bind(c, name="hipProfilerStop")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipProfilerStop
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
    function hipIpcGetMemHandle(handle,devPtr) bind(c, name="hipIpcGetMemHandle")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipIpcGetMemHandle
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
    function hipIpcOpenMemHandle(devPtr,handle,flags) bind(c, name="hipIpcOpenMemHandle")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipIpcOpenMemHandle
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
    function hipIpcCloseMemHandle(devPtr) bind(c, name="hipIpcCloseMemHandle")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipIpcCloseMemHandle
      type(c_ptr),value :: devPtr
    end function

  
    function hipIpcGetEventHandle(handle,event) bind(c, name="hipIpcGetEventHandle")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipIpcGetEventHandle
      type(c_ptr),intent(INOUT) :: handle
      type(c_ptr),intent(INOUT) :: event
    end function

  
    function hipIpcOpenEventHandle(event,handle) bind(c, name="hipIpcOpenEventHandle")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipIpcOpenEventHandle
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
    function hipSetupArgument(arg,mySize,offset) bind(c, name="hipSetupArgument")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipSetupArgument
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
    function hipLaunchByPtr(func) bind(c, name="hipLaunchByPtr")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchByPtr
      type(c_ptr),value :: func
    end function

  
    function hipBindTexture2D(offset,tex,devPtr,desc,width,height,pitch) bind(c, name="hipBindTexture2D")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipBindTexture2D
      integer(c_size_t),intent(IN) :: offset
      type(c_ptr),intent(INOUT) :: tex
      type(c_ptr),value :: devPtr
      type(c_ptr),intent(INOUT) :: desc
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(c_size_t),value :: pitch
    end function

  
    function hipBindTextureToArray(tex,array,desc) bind(c, name="hipBindTextureToArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipBindTextureToArray
      type(c_ptr),intent(INOUT) :: tex
      type(c_ptr),intent(INOUT) :: array
      type(c_ptr),intent(INOUT) :: desc
    end function

  
    function hipBindTextureToMipmappedArray(tex,mipmappedArray,desc) bind(c, name="hipBindTextureToMipmappedArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipBindTextureToMipmappedArray
      type(c_ptr),intent(INOUT) :: tex
      type(c_ptr),intent(INOUT) :: mipmappedArray
      type(c_ptr),intent(INOUT) :: desc
    end function

  
    function hipGetTextureAlignmentOffset(offset,texref) bind(c, name="hipGetTextureAlignmentOffset")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetTextureAlignmentOffset
      integer(c_size_t),intent(IN) :: offset
      type(c_ptr),intent(INOUT) :: texref
    end function

  
    function hipGetTextureReference(texref,symbol) bind(c, name="hipGetTextureReference")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetTextureReference
      type(c_ptr),intent(INOUT) :: texref
      type(c_ptr),value :: symbol
    end function

  
    function hipUnbindTexture(tex) bind(c, name="hipUnbindTexture")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipUnbindTexture
      type(c_ptr),intent(INOUT) :: tex
    end function

  
    function hipCreateTextureObject(pTexObject,pResDesc,pTexDesc,pResViewDesc) bind(c, name="hipCreateTextureObject")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCreateTextureObject
      type(c_ptr),intent(INOUT) :: pTexObject
      type(c_ptr),intent(INOUT) :: pResDesc
      type(c_ptr),intent(INOUT) :: pTexDesc
      type(c_ptr),value :: pResViewDesc
    end function

  
    function hipDestroyTextureObject(textureObject) bind(c, name="hipDestroyTextureObject")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDestroyTextureObject
      type(c_ptr),intent(INOUT) :: textureObject
    end function

  
    function hipGetChannelDesc(desc,array) bind(c, name="hipGetChannelDesc")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetChannelDesc
      type(c_ptr),intent(INOUT) :: desc
      type(c_ptr),intent(INOUT) :: array
    end function

  
    function hipGetTextureObjectResourceDesc(pResDesc,textureObject) bind(c, name="hipGetTextureObjectResourceDesc")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetTextureObjectResourceDesc
      type(c_ptr),intent(INOUT) :: pResDesc
      type(c_ptr),intent(INOUT) :: textureObject
    end function

  
    function hipGetTextureObjectResourceViewDesc(pResViewDesc,textureObject) bind(c, name="hipGetTextureObjectResourceViewDesc")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetTextureObjectResourceViewDesc
      type(c_ptr),value :: pResViewDesc
      type(c_ptr),intent(INOUT) :: textureObject
    end function

  
    function hipGetTextureObjectTextureDesc(pTexDesc,textureObject) bind(c, name="hipGetTextureObjectTextureDesc")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetTextureObjectTextureDesc
      type(c_ptr),intent(INOUT) :: pTexDesc
      type(c_ptr),intent(INOUT) :: textureObject
    end function

  
    function hipTexRefGetAddress(dev_ptr,texRef) bind(c, name="hipTexRefGetAddress")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetAddress
      type(c_ptr),intent(INOUT) :: dev_ptr
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
    function hipTexRefGetAddressMode(pam,texRef,dim) bind(c, name="hipTexRefGetAddressMode")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetAddressMode
      type(c_ptr),value :: pam
      type(c_ptr),intent(INOUT) :: texRef
      integer(c_int),value :: dim
    end function

  
    function hipTexRefGetFilterMode(pfm,texRef) bind(c, name="hipTexRefGetFilterMode")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFilterMode
      type(c_ptr),value :: pfm
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
    function hipTexRefGetFlags(pFlags,texRef) bind(c, name="hipTexRefGetFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFlags
      type(c_ptr),value :: pFlags
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
    function hipTexRefGetFormat(pFormat,pNumChannels,texRef) bind(c, name="hipTexRefGetFormat")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFormat
      type(c_ptr),value :: pFormat
      type(c_ptr),value :: pNumChannels
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
    function hipTexRefGetMaxAnisotropy(pmaxAnsio,texRef) bind(c, name="hipTexRefGetMaxAnisotropy")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMaxAnisotropy
      type(c_ptr),value :: pmaxAnsio
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
    function hipTexRefGetMipmapFilterMode(pfm,texRef) bind(c, name="hipTexRefGetMipmapFilterMode")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapFilterMode
      type(c_ptr),value :: pfm
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
    function hipTexRefGetMipmapLevelBias(pbias,texRef) bind(c, name="hipTexRefGetMipmapLevelBias")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelBias
      type(c_ptr),value :: pbias
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
    function hipTexRefGetMipmapLevelClamp(pminMipmapLevelClamp,pmaxMipmapLevelClamp,texRef) bind(c, name="hipTexRefGetMipmapLevelClamp")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelClamp
      type(c_ptr),value :: pminMipmapLevelClamp
      type(c_ptr),value :: pmaxMipmapLevelClamp
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
    function hipTexRefGetMipMappedArray(pArray,texRef) bind(c, name="hipTexRefGetMipMappedArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipMappedArray
      type(c_ptr),intent(INOUT) :: pArray
      type(c_ptr),intent(INOUT) :: texRef
    end function

  
    function hipTexRefSetAddress(ByteOffset,texRef,dptr,bytes) bind(c, name="hipTexRefSetAddress")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetAddress
      integer(c_size_t),intent(IN) :: ByteOffset
      type(c_ptr),intent(INOUT) :: texRef
      type(c_ptr),value :: dptr
      integer(c_size_t),value :: bytes
    end function

  
    function hipTexRefSetAddress2D(texRef,desc,dptr,Pitch) bind(c, name="hipTexRefSetAddress2D")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetAddress2D
      type(c_ptr),intent(INOUT) :: texRef
      type(c_ptr),intent(INOUT) :: desc
      type(c_ptr),value :: dptr
      integer(c_size_t),value :: Pitch
    end function

  
    function hipTexRefSetAddressMode(texRef,dim,am) bind(c, name="hipTexRefSetAddressMode")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetAddressMode
      type(c_ptr),intent(INOUT) :: texRef
      integer(c_int),value :: dim
      integer(kind(hipAddressModeWrap)),value :: am
    end function

  
    function hipTexRefSetArray(tex,array,flags) bind(c, name="hipTexRefSetArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetArray
      type(c_ptr),intent(INOUT) :: tex
      type(c_ptr),intent(INOUT) :: array
      integer(kind=4),value :: flags
    end function

  
    function hipTexRefSetBorderColor(texRef,pBorderColor) bind(c, name="hipTexRefSetBorderColor")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetBorderColor
      type(c_ptr),intent(INOUT) :: texRef
      type(c_ptr),value :: pBorderColor
    end function

  
    function hipTexRefSetFilterMode(texRef,fm) bind(c, name="hipTexRefSetFilterMode")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetFilterMode
      type(c_ptr),intent(INOUT) :: texRef
      integer(kind(hipFilterModePoint)),value :: fm
    end function

  
    function hipTexRefSetFlags(texRef,Flags) bind(c, name="hipTexRefSetFlags")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetFlags
      type(c_ptr),intent(INOUT) :: texRef
      integer(kind=4),value :: Flags
    end function

  
    function hipTexRefSetFormat(texRef,fmt,NumPackedComponents) bind(c, name="hipTexRefSetFormat")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetFormat
      type(c_ptr),intent(INOUT) :: texRef
      integer(kind(HIP_AD_FORMAT_UNSIGNED_INT8)),value :: fmt
      integer(c_int),value :: NumPackedComponents
    end function

  
    function hipTexRefSetMaxAnisotropy(texRef,maxAniso) bind(c, name="hipTexRefSetMaxAnisotropy")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetMaxAnisotropy
      type(c_ptr),intent(INOUT) :: texRef
      integer(kind=4),value :: maxAniso
    end function

  
    function hipTexRefSetMipmapFilterMode(texRef,fm) bind(c, name="hipTexRefSetMipmapFilterMode")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapFilterMode
      type(c_ptr),intent(INOUT) :: texRef
      integer(kind(hipFilterModePoint)),value :: fm
    end function

  
    function hipTexRefSetMipmapLevelBias(texRef,bias) bind(c, name="hipTexRefSetMipmapLevelBias")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapLevelBias
      type(c_ptr),intent(INOUT) :: texRef
      real(c_float),value :: bias
    end function

  
    function hipTexRefSetMipmapLevelClamp(texRef,minMipMapLevelClamp,maxMipMapLevelClamp) bind(c, name="hipTexRefSetMipmapLevelClamp")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapLevelClamp
      type(c_ptr),intent(INOUT) :: texRef
      real(c_float),value :: minMipMapLevelClamp
      real(c_float),value :: maxMipMapLevelClamp
    end function

  
    function hipTexRefSetMipmappedArray(texRef,mipmappedArray,Flags) bind(c, name="hipTexRefSetMipmappedArray")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetMipmappedArray
      type(c_ptr),intent(INOUT) :: texRef
      type(c_ptr),value :: mipmappedArray
      integer(kind=4),value :: Flags
    end function

  
    function hipMipmappedArrayCreate(pHandle,pMipmappedArrayDesc,numMipmapLevels) bind(c, name="hipMipmappedArrayCreate")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMipmappedArrayCreate
      type(c_ptr),intent(INOUT) :: pHandle
      type(c_ptr),intent(INOUT) :: pMipmappedArrayDesc
      integer(kind=4),value :: numMipmapLevels
    end function

  
    function hipMipmappedArrayDestroy(hMipmappedArray) bind(c, name="hipMipmappedArrayDestroy")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMipmappedArrayDestroy
      type(c_ptr),intent(INOUT) :: hMipmappedArray
    end function

  
    function hipMipmappedArrayGetLevel(pLevelArray,hMipMappedArray,level) bind(c, name="hipMipmappedArrayGetLevel")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMipmappedArrayGetLevel
      type(c_ptr),intent(INOUT) :: pLevelArray
      type(c_ptr),intent(INOUT) :: hMipMappedArray
      integer(kind=4),value :: level
    end function

  
    function hipTexObjectCreate(pTexObject,pResDesc,pTexDesc,pResViewDesc) bind(c, name="hipTexObjectCreate")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexObjectCreate
      type(c_ptr),intent(INOUT) :: pTexObject
      type(c_ptr),value :: pResDesc
      type(c_ptr),value :: pTexDesc
      type(c_ptr),value :: pResViewDesc
    end function

  
    function hipTexObjectDestroy(texObject) bind(c, name="hipTexObjectDestroy")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexObjectDestroy
      type(c_ptr),intent(INOUT) :: texObject
    end function

  
    function hipTexObjectGetResourceDesc(pResDesc,texObject) bind(c, name="hipTexObjectGetResourceDesc")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexObjectGetResourceDesc
      type(c_ptr),value :: pResDesc
      type(c_ptr),intent(INOUT) :: texObject
    end function

  
    function hipTexObjectGetResourceViewDesc(pResViewDesc,texObject) bind(c, name="hipTexObjectGetResourceViewDesc")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexObjectGetResourceViewDesc
      type(c_ptr),value :: pResViewDesc
      type(c_ptr),intent(INOUT) :: texObject
    end function

  
    function hipTexObjectGetTextureDesc(pTexDesc,texObject) bind(c, name="hipTexObjectGetTextureDesc")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexObjectGetTextureDesc
      type(c_ptr),value :: pTexDesc
      type(c_ptr),intent(INOUT) :: texObject
    end function

  ! 
  !   CallbackActivity API
  !  
    function hipRegisterApiCallback(id,fun,arg) bind(c, name="hipRegisterApiCallback")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipRegisterApiCallback
      integer(kind=4),value :: id
      type(c_ptr),value :: fun
      type(c_ptr),value :: arg
    end function

  
    function hipRemoveApiCallback(id) bind(c, name="hipRemoveApiCallback")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipRemoveApiCallback
      integer(kind=4),value :: id
    end function

  
    function hipRegisterActivityCallback(id,fun,arg) bind(c, name="hipRegisterActivityCallback")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipRegisterActivityCallback
      integer(kind=4),value :: id
      type(c_ptr),value :: fun
      type(c_ptr),value :: arg
    end function

  
    function hipRemoveActivityCallback(id) bind(c, name="hipRemoveActivityCallback")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipRemoveActivityCallback
      integer(kind=4),value :: id
    end function

  end interface
  
end module hipfort
