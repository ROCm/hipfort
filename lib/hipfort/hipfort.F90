! Auto-generated module wrapper for hipfort
! DO NOT EDIT — re-run the generator to update.

module hipfort
#ifdef USE_CUDA_NAMES
  use hipfort_cuda_errors
#endif
  use hipfort_enums
  use hipfort_types
  use hipfort_auxiliary
  use, intrinsic :: iso_c_binding
  implicit none

  !--- Opaque handles (all are typedef struct* → type(c_ptr)) ---
  !    hipCtx_t
  !    hipEvent_t
  !    hipExternalMemory_t
  !    hipExternalSemaphore_t
  !    hipFunction_t
  !    hipGraphExec_t
  !    hipGraphNode_t
  !    hipGraph_t
  !    hipMemPool_t
  !    hipModuleSymbol_t
  !    hipModule_t
  !    hipStream_t
  !    hipUserObject_t

  !--- 478 bind(C) interfaces ---
  interface

    !---------------------------------------------
    ! hipCreateChannelDesc
    !---------------------------------------------
    function hipCreateChannelDesc(x, y, z, w, f) &
       result(CreateChannelDesc) &
       bind(C, name="hipCreateChannelDesc")
       import :: c_int, c_ptr
       integer(c_int), value :: x
       integer(c_int), value :: y
       integer(c_int), value :: z
       integer(c_int), value :: w
       integer(c_int), value :: f
       type(c_ptr) :: CreateChannelDesc
    end function hipCreateChannelDesc

    !---------------------------------------------
    ! hipInit
    !---------------------------------------------
    !> @defgroup API HIP API
    !>
    !>
    !> Defines the HIP API.  See the individual sections for more information.
    !>
    !>
    !> @defgroup Driver Initialization and Version
    !>
    !> This section describes the initializtion and version functions of HIP runtime API.
    !>
    !>
    !>
    !> @brief Explicitly initializes the HIP runtime.
    !>
    !> @param [in] flags  Initialization flag, should be zero.
    !>
    !> Most HIP APIs implicitly initialize the HIP runtime.
    !> This API provides control over the timing of the initialization.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipInit(flags) &
       result(Init) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaInit")
#else
       bind(C, name="hipInit")
#endif
       import :: c_int
       integer(c_int), value :: flags
       integer(c_int) :: Init
    end function hipInit

    !---------------------------------------------
    ! hipDriverGetVersion
    !---------------------------------------------
    !> @brief Returns the approximate HIP driver version.
    !>
    !> @param [out] driverVersion driver version
    !>
    !> HIP driver version shows up in the format:
    !> HIP_VERSION_MAJOR * 10000000 + HIP_VERSION_MINOR * 100000 + HIP_VERSION_PATCH.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning The HIP driver version does not correspond to an exact CUDA driver revision.
    !> On AMD platform, the API returns the HIP driver version, while on NVIDIA platform, it calls
    !> the corresponding CUDA runtime API and returns the CUDA driver version.
    !> There is no mapping/correlation between HIP driver version and CUDA driver version.
    !>
    !> @see hipRuntimeGetVersion
    function hipDriverGetVersion(driverVersion) &
       result(DriverGetVersion) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDriverGetVersion")
#else
       bind(C, name="hipDriverGetVersion")
#endif
       import :: c_int
       integer(c_int) :: driverVersion(*)
       integer(c_int) :: DriverGetVersion
    end function hipDriverGetVersion

    !---------------------------------------------
    ! hipRuntimeGetVersion
    !---------------------------------------------
    !> @brief Returns the approximate HIP Runtime version.
    !>
    !> @param [out] runtimeVersion HIP runtime version
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning The version definition of HIP runtime is different from CUDA.
    !> On AMD platform, the function returns HIP runtime version,
    !> while on NVIDIA platform, it returns CUDA runtime version.
    !> And there is no mapping/correlation between HIP version and CUDA version.
    !>
    !> @see hipDriverGetVersion
    function hipRuntimeGetVersion(runtimeVersion) &
       result(RuntimeGetVersion) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaRuntimeGetVersion")
#else
       bind(C, name="hipRuntimeGetVersion")
#endif
       import :: c_int
       integer(c_int) :: runtimeVersion(*)
       integer(c_int) :: RuntimeGetVersion
    end function hipRuntimeGetVersion

    !---------------------------------------------
    ! hipDeviceGet
    !---------------------------------------------
    !> @brief Returns a handle to a compute device
    !> @param [out] device Handle of device
    !> @param [in] ordinal Device ordinal
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice
    function hipDeviceGet(device, ordinal) &
       result(DeviceGet) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGet")
#else
       bind(C, name="hipDeviceGet")
#endif
       import :: c_int
       integer(c_int) :: device(*)
       integer(c_int), value :: ordinal
       integer(c_int) :: DeviceGet
    end function hipDeviceGet

    !---------------------------------------------
    ! hipDeviceComputeCapability
    !---------------------------------------------
    !> @brief Returns the compute capability of the device
    !> @param [out] major Major compute capability version number
    !> @param [out] minor Minor compute capability version number
    !> @param [in] device Device ordinal
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice
    function hipDeviceComputeCapability(major, minor, device) &
       result(DeviceComputeCapability) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceComputeCapability")
#else
       bind(C, name="hipDeviceComputeCapability")
#endif
       import :: c_int
       integer(c_int) :: major(*)
       integer(c_int) :: minor(*)
       integer(c_int), value :: device
       integer(c_int) :: DeviceComputeCapability
    end function hipDeviceComputeCapability

    !---------------------------------------------
    ! hipDeviceGetUuid
    !---------------------------------------------
    !> @brief Returns an UUID for the device.[BETA]
    !> @param [out] uuid UUID for the device
    !> @param [in] device device ordinal
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue, #hipErrorNotInitialized,
    !> #hipErrorDeinitialized
    function hipDeviceGetUuid(uuid, device) &
       result(DeviceGetUuid) &
       bind(C, name="hipDeviceGetUuid")
       import :: c_ptr, c_int
       type(c_ptr), value :: uuid
       integer(c_int), value :: device
       integer(c_int) :: DeviceGetUuid
    end function hipDeviceGetUuid

    !---------------------------------------------
    ! hipDeviceGetP2PAttribute
    !---------------------------------------------
    !> @brief Returns a value for attribute of link between two devices
    !> @param [out] value Pointer of the value for the attrubute
    !> @param [in] attr enum of hipDeviceP2PAttr to query
    !> @param [in] srcDevice The source device of the link
    !> @param [in] dstDevice The destination device of the link
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice
    function hipDeviceGetP2PAttribute(value, attr, srcDevice, dstDevice) &
       result(DeviceGetP2PAttribute) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetP2PAttribute")
#else
       bind(C, name="hipDeviceGetP2PAttribute")
#endif
       import :: c_int
       integer(c_int) :: value(*)
       integer(c_int), value :: attr
       integer(c_int), value :: srcDevice
       integer(c_int), value :: dstDevice
       integer(c_int) :: DeviceGetP2PAttribute
    end function hipDeviceGetP2PAttribute

    !---------------------------------------------
    ! hipDeviceTotalMem
    !---------------------------------------------
    !> @brief Returns the total amount of memory on the device.
    !> @param [out] bytes The size of memory in bytes, on the device
    !> @param [in] device The ordinal of the device
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice
    function hipDeviceTotalMem(bytes, device) &
       result(DeviceTotalMem) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceTotalMem")
#else
       bind(C, name="hipDeviceTotalMem")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: bytes
       integer(c_int), value :: device
       integer(c_int) :: DeviceTotalMem
    end function hipDeviceTotalMem

    !---------------------------------------------
    ! hipDeviceSynchronize
    !---------------------------------------------
    !> @defgroup Device Device Management
    !>
    !> This section describes the device management functions of HIP runtime API.
    !>
    !>
    !> @brief Waits on all active streams on current device
    !>
    !> When this command is invoked, the host thread gets blocked until all the commands associated
    !> with streams associated with the device. HIP does not support multiple blocking modes (yet!).
    !>
    !> @returns #hipSuccess
    !>
    !> @see hipSetDevice, hipDeviceReset
    function hipDeviceSynchronize() &
       result(DeviceSynchronize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceSynchronize")
#else
       bind(C, name="hipDeviceSynchronize")
#endif
       import :: c_int
       integer(c_int) :: DeviceSynchronize
    end function hipDeviceSynchronize

    !---------------------------------------------
    ! hipDeviceReset
    !---------------------------------------------
    !> @brief The state of current device is discarded and updated to a fresh state.
    !>
    !> Calling this function deletes all streams created, memory allocated, kernels running, events
    !> created. Make sure that no other thread is using the device or streams, memory, kernels,
    !> events
    !> associated with the current device.
    !>
    !> @returns #hipSuccess
    !>
    !> @see hipDeviceSynchronize
    function hipDeviceReset() &
       result(DeviceReset) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceReset")
#else
       bind(C, name="hipDeviceReset")
#endif
       import :: c_int
       integer(c_int) :: DeviceReset
    end function hipDeviceReset

    !---------------------------------------------
    ! hipSetDevice
    !---------------------------------------------
    !> @brief Set default device to be used for subsequent hip API calls from this thread.
    !>
    !> @param[in] deviceId Valid device in range 0...hipGetDeviceCount().
    !>
    !> Sets @p device as the default device for the calling host thread.  Valid device id's are 0...
    !> (hipGetDeviceCount()-1).
    !>
    !> Many HIP APIs implicitly use the "default device" :
    !>
    !> - Any device memory subsequently allocated from this host thread (using hipMalloc) will be
    !> allocated on device.
    !> - Any streams or events created from this host thread will be associated with device.
    !> - Any kernels launched from this host thread (using hipLaunchKernel) will be executed on
    !> device
    !> (unless a specific stream is specified, in which case the device associated with that stream
    !> will
    !> be used).
    !>
    !> This function may be called from any host thread. Multiple host threads may use the same
    !> device.
    !> This function does no synchronization with the previous or new device, and has very little
    !> runtime overhead. Applications can use hipSetDevice to quickly switch the default device
    !> before
    !> making a HIP runtime call which uses the default device.
    !>
    !> The default device is stored in thread-local-storage for each thread.
    !> Thread-pool implementations may inherit the default device of the previous thread.  A good
    !> practice is to always call hipSetDevice at the start of HIP coding sequency to establish a
    !> known
    !> standard device.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorNoDevice
    !>
    !> @see #hipGetDevice, #hipGetDeviceCount
    function hipSetDevice(deviceId) &
       result(SetDevice) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaSetDevice")
#else
       bind(C, name="hipSetDevice")
#endif
       import :: c_int
       integer(c_int), value :: deviceId
       integer(c_int) :: SetDevice
    end function hipSetDevice

    !---------------------------------------------
    ! hipSetValidDevices
    !---------------------------------------------
    !> @brief Set a list of devices that can be used.
    !>
    !> @param[in] device_arr List of devices to try
    !> @param[in] len Number of devices in specified list
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @see #hipGetDevice, #hipGetDeviceCount. #hipSetDevice. #hipGetDeviceProperties.
    !> #hipSetDeviceFlags. #hipChooseDevice
    function hipSetValidDevices(device_arr, len) &
       result(SetValidDevices) &
       bind(C, name="hipSetValidDevices")
       import :: c_int
       integer(c_int) :: device_arr(*)
       integer(c_int), value :: len
       integer(c_int) :: SetValidDevices
    end function hipSetValidDevices

    !---------------------------------------------
    ! hipGetDevice
    !---------------------------------------------
    !> @brief Return the default device id for the calling host thread.
    !>
    !> @param [out] deviceId *device is written with the default device
    !>
    !> HIP maintains an default device for each thread using thread-local-storage.
    !> This device is used implicitly for HIP runtime APIs called by this thread.
    !> hipGetDevice returns in * @p device the default device for the calling host thread.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @see hipSetDevice, hipGetDevicesizeBytes
    function hipGetDevice(deviceId) &
       result(GetDevice) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetDevice")
#else
       bind(C, name="hipGetDevice")
#endif
       import :: c_int
       integer(c_int) :: deviceId(*)
       integer(c_int) :: GetDevice
    end function hipGetDevice

    !---------------------------------------------
    ! hipGetDeviceCount
    !---------------------------------------------
    !> @brief Return number of compute-capable devices.
    !>
    !> @param [out] count Returns number of compute-capable devices.
    !>
    !> @returns #hipSuccess, #hipErrorNoDevice
    !>
    !>
    !> Returns in @p *count the number of devices that have ability to run compute commands. If
    !> there
    !> are no such devices, then @ref hipGetDeviceCount will return #hipErrorNoDevice. If 1 or more
    !> devices can be found, then hipGetDeviceCount returns #hipSuccess.
    function hipGetDeviceCount(count) &
       result(GetDeviceCount) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetDeviceCount")
#else
       bind(C, name="hipGetDeviceCount")
#endif
       import :: c_int
       integer(c_int) :: count(*)
       integer(c_int) :: GetDeviceCount
    end function hipGetDeviceCount

    !---------------------------------------------
    ! hipDeviceGetAttribute
    !---------------------------------------------
    !> @brief Query for a specific device attribute.
    !>
    !> @param [out] pi pointer to value to return
    !> @param [in] attr attribute to query
    !> @param [in] deviceId which device to query for information
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    function hipDeviceGetAttribute(pi, attr, deviceId) &
       result(DeviceGetAttribute) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetAttribute")
#else
       bind(C, name="hipDeviceGetAttribute")
#endif
       import :: c_int
       integer(c_int) :: pi(*)
       integer(c_int), value :: attr
       integer(c_int), value :: deviceId
       integer(c_int) :: DeviceGetAttribute
    end function hipDeviceGetAttribute

    !---------------------------------------------
    ! hipDeviceGetDefaultMemPool
    !---------------------------------------------
    !> @brief Returns the default memory pool of the specified device
    !>
    !> @param [out] mem_pool Default memory pool to return
    !> @param [in] device    Device index for query the default memory pool
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @see hipDeviceGetDefaultMemPool, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    function hipDeviceGetDefaultMemPool(mem_pool, device) &
       result(DeviceGetDefaultMemPool) &
       bind(C, name="hipDeviceGetDefaultMemPool")
       import :: c_ptr, c_int
       type(c_ptr) :: mem_pool
       integer(c_int), value :: device
       integer(c_int) :: DeviceGetDefaultMemPool
    end function hipDeviceGetDefaultMemPool

    !---------------------------------------------
    ! hipDeviceSetMemPool
    !---------------------------------------------
    !> @brief Sets the current memory pool of a device
    !>
    !> The memory pool must be local to the specified device.
    !> @p hipMallocAsync allocates from the current mempool of the provided stream's device.
    !> By default, a device's current memory pool is its default memory pool.
    !>
    !> @note Use @p hipMallocFromPoolAsync for asynchronous memory allocations from a device
    !> different than the one the stream runs on.
    !>
    !> @param [in] device   Device index for the update
    !> @param [in] mem_pool Memory pool for update as the current on the specified device
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDevice, #hipErrorNotSupported
    !>
    !> @see hipDeviceGetDefaultMemPool, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    function hipDeviceSetMemPool(device, mem_pool) &
       result(DeviceSetMemPool) &
       bind(C, name="hipDeviceSetMemPool")
       import :: c_int, c_ptr
       integer(c_int), value :: device
       type(c_ptr), value :: mem_pool
       integer(c_int) :: DeviceSetMemPool
    end function hipDeviceSetMemPool

    !---------------------------------------------
    ! hipDeviceGetMemPool
    !---------------------------------------------
    !> @brief Gets the current memory pool for the specified device
    !>
    !> Returns the last pool provided to @p hipDeviceSetMemPool for this device
    !> or the device's default memory pool if @p hipDeviceSetMemPool has never been called.
    !> By default the current mempool is the default mempool for a device,
    !> otherwise the returned pool must have been set with @p hipDeviceSetMemPool.
    !>
    !> @param [out] mem_pool Current memory pool on the specified device
    !> @param [in] device    Device index to query the current memory pool
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @see hipDeviceGetDefaultMemPool, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    function hipDeviceGetMemPool(mem_pool, device) &
       result(DeviceGetMemPool) &
       bind(C, name="hipDeviceGetMemPool")
       import :: c_ptr, c_int
       type(c_ptr) :: mem_pool
       integer(c_int), value :: device
       integer(c_int) :: DeviceGetMemPool
    end function hipDeviceGetMemPool

    !---------------------------------------------
    ! hipGetDevicePropertiesR0600
    !---------------------------------------------
    !> @brief Returns device properties.
    !>
    !> @param [out] prop written with device properties
    !> @param [in]  deviceId which device to query for information
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice
    !> @bug HIP-Clang always returns 0 for maxThreadsPerMultiProcessor
    !> @bug HIP-Clang always returns 0 for regsPerBlock
    !> @bug HIP-Clang always returns 0 for l2CacheSize
    !>
    !> Populates hipGetDeviceProperties with information for the specified device.
    function hipGetDevicePropertiesR0600(prop, deviceId) &
       result(GetDevicePropertiesR0600) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetDeviceProperties")
#else
       bind(C, name="hipGetDevicePropertiesR0600")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: prop
       integer(c_int), value :: deviceId
       integer(c_int) :: GetDevicePropertiesR0600
    end function hipGetDevicePropertiesR0600

    !---------------------------------------------
    ! hipDeviceGetTexture1DLinearMaxWidth
    !---------------------------------------------
    !> @brief Gets the maximum width for 1D linear textures on the specified device
    !>
    !> This function queries the maximum width, in elements, of 1D linear textures that can be
    !> allocated
    !> on the specified device. The maximum width depends on the texture element size and the
    !> hardware
    !> limitations of the device.
    !>
    !> @param [out] max_width Maximum width, in elements, of 1D linear textures that the device can
    !> support
    !> @param [in] desc       Requested channel format
    !> @param [in] device     Device index to query for maximum 1D texture width
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDevice
    !>
    !> @see hipDeviceGetAttribute, hipMalloc, hipTexRefSetAddressMode
    function hipDeviceGetTexture1DLinearMaxWidth(max_width, desc, device) &
       result(DeviceGetTexture1DLinearMaxWidth) &
       bind(C, name="hipDeviceGetTexture1DLinearMaxWidth")
       import :: c_ptr, c_int
       type(c_ptr), value :: max_width
       type(c_ptr), value :: desc
       integer(c_int), value :: device
       integer(c_int) :: DeviceGetTexture1DLinearMaxWidth
    end function hipDeviceGetTexture1DLinearMaxWidth

    !---------------------------------------------
    ! hipDeviceSetCacheConfig
    !---------------------------------------------
    !> @brief Set L1/Shared cache partition.
    !>
    !> @param [in] cacheConfig Cache configuration
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorNotSupported
    !>
    !> Note: AMD devices do not support reconfigurable cache. This API is not implemented
    !> on AMD platform. If the function is called, it will return hipErrorNotSupported.
    function hipDeviceSetCacheConfig(cacheConfig) &
       result(DeviceSetCacheConfig) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceSetCacheConfig")
#else
       bind(C, name="hipDeviceSetCacheConfig")
#endif
       import :: c_int
       integer(c_int), value :: cacheConfig
       integer(c_int) :: DeviceSetCacheConfig
    end function hipDeviceSetCacheConfig

    !---------------------------------------------
    ! hipDeviceGetCacheConfig
    !---------------------------------------------
    !> @brief Get Cache configuration for a specific Device
    !>
    !> @param [out] cacheConfig Pointer of cache configuration
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized
    !> Note: AMD devices do not support reconfigurable cache. This hint is ignored
    !> on these architectures.
    function hipDeviceGetCacheConfig(cacheConfig) &
       result(DeviceGetCacheConfig) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetCacheConfig")
#else
       bind(C, name="hipDeviceGetCacheConfig")
#endif
       import :: c_int
       integer(c_int) :: cacheConfig(*)
       integer(c_int) :: DeviceGetCacheConfig
    end function hipDeviceGetCacheConfig

    !---------------------------------------------
    ! hipDeviceGetLimit
    !---------------------------------------------
    !> @brief Gets resource limits of current device
    !>
    !> The function queries the size of limit value, as required by the input enum value hipLimit_t,
    !> which can be either #hipLimitStackSize, or #hipLimitMallocHeapSize. Any other input as
    !> default, the function will return #hipErrorUnsupportedLimit.
    !>
    !> @param [out] pValue Returns the size of the limit in bytes
    !> @param [in]  limit The limit to query
    !>
    !> @returns #hipSuccess, #hipErrorUnsupportedLimit, #hipErrorInvalidValue
    function hipDeviceGetLimit(pValue, limit) &
       result(DeviceGetLimit) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetLimit")
#else
       bind(C, name="hipDeviceGetLimit")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pValue
       integer(c_int), value :: limit
       integer(c_int) :: DeviceGetLimit
    end function hipDeviceGetLimit

    !---------------------------------------------
    ! hipDeviceSetLimit
    !---------------------------------------------
    !> @brief Sets resource limits of current device.
    !>
    !> As the input enum limit,
    !> #hipLimitStackSize sets the limit value of the stack size on the current GPU device, per
    !> thread.
    !> The limit size can get via hipDeviceGetLimit. The size is in units of 256 dwords, up to the
    !> limit
    !> (128K - 16).
    !>
    !> #hipLimitMallocHeapSize sets the limit value of the heap used by the malloc()/free()
    !> calls. For limit size, use the #hipDeviceGetLimit API.
    !>
    !> Any other input as default, the funtion will return hipErrorUnsupportedLimit.
    !>
    !> @param [in] limit Enum of hipLimit_t to set
    !> @param [in] value The size of limit value in bytes
    !>
    !> @returns #hipSuccess, #hipErrorUnsupportedLimit, #hipErrorInvalidValue
    function hipDeviceSetLimit(limit, value) &
       result(DeviceSetLimit) &
       bind(C, name="hipDeviceSetLimit")
       import :: c_int, c_long
       integer(c_int), value :: limit
       integer(c_long), value :: value
       integer(c_int) :: DeviceSetLimit
    end function hipDeviceSetLimit

    !---------------------------------------------
    ! hipDeviceGetSharedMemConfig
    !---------------------------------------------
    !> @brief Returns bank width of shared memory for current device
    !>
    !> @param [out] pConfig The pointer of the bank width for shared memory
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
    !>
    !> Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
    !> ignored on those architectures.
    function hipDeviceGetSharedMemConfig(pConfig) &
       result(DeviceGetSharedMemConfig) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetSharedMemConfig")
#else
       bind(C, name="hipDeviceGetSharedMemConfig")
#endif
       import :: c_int
       integer(c_int) :: pConfig(*)
       integer(c_int) :: DeviceGetSharedMemConfig
    end function hipDeviceGetSharedMemConfig

    !---------------------------------------------
    ! hipGetDeviceFlags
    !---------------------------------------------
    !> @brief Gets the flags set for current device
    !>
    !> @param [out] flags Pointer of the flags
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    function hipGetDeviceFlags(flags) &
       result(GetDeviceFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetDeviceFlags")
#else
       bind(C, name="hipGetDeviceFlags")
#endif
       import :: c_int
       integer(c_int) :: flags(*)
       integer(c_int) :: GetDeviceFlags
    end function hipGetDeviceFlags

    !---------------------------------------------
    ! hipDeviceSetSharedMemConfig
    !---------------------------------------------
    !> @brief The bank width of shared memory on current device is set
    !>
    !> @param [in] config Configuration for the bank width of shared memory
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
    !>
    !> Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
    !> ignored on those architectures.
    function hipDeviceSetSharedMemConfig(config) &
       result(DeviceSetSharedMemConfig) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceSetSharedMemConfig")
#else
       bind(C, name="hipDeviceSetSharedMemConfig")
#endif
       import :: c_int
       integer(c_int), value :: config
       integer(c_int) :: DeviceSetSharedMemConfig
    end function hipDeviceSetSharedMemConfig

    !---------------------------------------------
    ! hipSetDeviceFlags
    !---------------------------------------------
    !> @brief The current device behavior is changed according to the flags passed.
    !>
    !> @param [in] flags Flag to set on the current device
    !>
    !> The schedule flags impact how HIP waits for the completion of a command running on a device.
    !>
    !> #hipDeviceScheduleSpin         : HIP runtime will actively spin in the thread which submitted
    !> the work until the command completes.  This offers the lowest latency, but will consume a CPU
    !> core and may increase power.
    !>
    !> #hipDeviceScheduleYield        : The HIP runtime will yield the CPU to system so that other
    !> tasks can use it. This may increase latency to detect the completion but will consume less
    !> power and is friendlier to other tasks in the system.
    !>
    !> #hipDeviceScheduleBlockingSync : On ROCm platform, this is a synonym for
    !> hipDeviceScheduleYield.
    !>
    !> #hipDeviceScheduleAuto         : This is the default value if the input 'flags' is zero.
    !> Uses a heuristic to select between Spin and Yield modes. If the number of HIP contexts is
    !> greater than the number of logical processors in the system, uses Spin scheduling, otherwise
    !> uses Yield scheduling.
    !>
    !> #hipDeviceMapHost : Allows mapping host memory. On ROCm, this is always allowed and
    !> the flag is ignored.
    !>
    !> #hipDeviceLmemResizeToMax      : This flag is silently ignored on ROCm.
    !>
    !> @returns #hipSuccess, #hipErrorNoDevice, #hipErrorInvalidDevice, #hipErrorSetOnActiveProcess
    function hipSetDeviceFlags(flags) &
       result(SetDeviceFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaSetDeviceFlags")
#else
       bind(C, name="hipSetDeviceFlags")
#endif
       import :: c_int
       integer(c_int), value :: flags
       integer(c_int) :: SetDeviceFlags
    end function hipSetDeviceFlags

    !---------------------------------------------
    ! hipChooseDeviceR0600
    !---------------------------------------------
    !> @brief Device which matches hipDeviceProp_t is returned
    !>
    !> @param [out] device Pointer of the device
    !> @param [in]  prop Pointer of the properties
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipChooseDeviceR0600(device, prop) &
       result(ChooseDeviceR0600) &
       bind(C, name="hipChooseDeviceR0600")
       import :: c_int, c_ptr
       integer(c_int) :: device(*)
       type(c_ptr), value :: prop
       integer(c_int) :: ChooseDeviceR0600
    end function hipChooseDeviceR0600

    !---------------------------------------------
    ! hipExtGetLinkTypeAndHopCount
    !---------------------------------------------
    !> @brief Returns the link type and hop count between two devices
    !>
    !> @param [in] device1 Ordinal for device1
    !> @param [in] device2 Ordinal for device2
    !> @param [out] linktype Returns the link type (See hsa_amd_link_info_type_t) between the two
    !> devices
    !> @param [out] hopcount Returns the hop count between the two devices
    !>
    !> Queries and returns the HSA link type and the hop count between the two specified devices.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipExtGetLinkTypeAndHopCount(device1, device2, linktype, hopcount) &
       result(ExtGetLinkTypeAndHopCount) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaExtGetLinkTypeAndHopCount")
#else
       bind(C, name="hipExtGetLinkTypeAndHopCount")
#endif
       import :: c_int
       integer(c_int), value :: device1
       integer(c_int), value :: device2
       integer(c_int) :: linktype(*)
       integer(c_int) :: hopcount(*)
       integer(c_int) :: ExtGetLinkTypeAndHopCount
    end function hipExtGetLinkTypeAndHopCount

    !---------------------------------------------
    ! hipIpcGetMemHandle
    !---------------------------------------------
    !> @brief Gets an interprocess memory handle for an existing device memory
    !> allocation
    !>
    !> Takes a pointer to the base of an existing device memory allocation created
    !> with hipMalloc and exports it for use in another process. This is a
    !> lightweight operation and may be called multiple times on an allocation
    !> without adverse effects.
    !>
    !> If a region of memory is freed with hipFree and a subsequent call
    !> to hipMalloc returns memory with the same device address,
    !> hipIpcGetMemHandle will return a unique handle for the
    !> new memory.
    !>
    !> @param handle - Pointer to user allocated hipIpcMemHandle to return
    !> the handle in.
    !> @param devPtr - Base pointer to previously allocated device memory
    !>
    !> @returns #hipSuccess, #hipErrorInvalidHandle, #hipErrorOutOfMemory, #hipErrorMapFailed
    !>
    !> @note This IPC memory related feature API on Windows may behave differently from Linux.
    function hipIpcGetMemHandle(handle, devPtr) &
       result(IpcGetMemHandle) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaIpcGetMemHandle")
#else
       bind(C, name="hipIpcGetMemHandle")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: devPtr
       integer(c_int) :: IpcGetMemHandle
    end function hipIpcGetMemHandle

    !---------------------------------------------
    ! hipIpcOpenMemHandle
    !---------------------------------------------
    !> @brief Opens an interprocess memory handle exported from another process
    !> and returns a device pointer usable in the local process.
    !>
    !> Maps memory exported from another process with hipIpcGetMemHandle into
    !> the current device address space. For contexts on different devices
    !> hipIpcOpenMemHandle can attempt to enable peer access between the
    !> devices as if the user called hipDeviceEnablePeerAccess. This behavior is
    !> controlled by the hipIpcMemLazyEnablePeerAccess flag.
    !> hipDeviceCanAccessPeer can determine if a mapping is possible.
    !>
    !> Contexts that may open hipIpcMemHandles are restricted in the following way.
    !> hipIpcMemHandles from each device in a given process may only be opened
    !> by one context per device per other process.
    !>
    !> Memory returned from hipIpcOpenMemHandle must be freed with
    !> hipIpcCloseMemHandle.
    !>
    !> Calling hipFree on an exported memory region before calling
    !> hipIpcCloseMemHandle in the importing context will result in undefined
    !> behavior.
    !>
    !> @param devPtr - Returned device pointer
    !> @param handle - hipIpcMemHandle to open
    !> @param flags  - Flags for this operation. Must be specified as hipIpcMemLazyEnablePeerAccess
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidContext,
    !> #hipErrorInvalidDevicePointer
    !>
    !> @note During multiple processes, using the same memory handle opened by the current context,
    !> there is no guarantee that the same device poiter will be returned in @p *devPtr.
    !> This is diffrent from CUDA.
    !> @note This IPC memory related feature API on Windows may behave differently from Linux.
    function hipIpcOpenMemHandle(devPtr, handle, flags) &
       result(IpcOpenMemHandle) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaIpcOpenMemHandle")
#else
       bind(C, name="hipIpcOpenMemHandle")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: devPtr
       type(c_ptr), value :: handle
       integer(c_int), value :: flags
       integer(c_int) :: IpcOpenMemHandle
    end function hipIpcOpenMemHandle

    !---------------------------------------------
    ! hipIpcCloseMemHandle
    !---------------------------------------------
    !> @brief Close memory mapped with hipIpcOpenMemHandle
    !>
    !> Unmaps memory returnd by hipIpcOpenMemHandle. The original allocation
    !> in the exporting process as well as imported mappings in other processes
    !> will be unaffected.
    !>
    !> Any resources used to enable peer access will be freed if this is the
    !> last mapping using them.
    !>
    !> @param devPtr - Device pointer returned by hipIpcOpenMemHandle
    !>
    !> @returns #hipSuccess, #hipErrorMapFailed, #hipErrorInvalidHandle
    !>
    !> @note This IPC memory related feature API on Windows may behave differently from Linux.
    function hipIpcCloseMemHandle(devPtr) &
       result(IpcCloseMemHandle) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaIpcCloseMemHandle")
#else
       bind(C, name="hipIpcCloseMemHandle")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: devPtr
       integer(c_int) :: IpcCloseMemHandle
    end function hipIpcCloseMemHandle

    !---------------------------------------------
    ! hipIpcGetEventHandle
    !---------------------------------------------
    !> @brief Gets an opaque interprocess handle for an event.
    !>
    !> This opaque handle may be copied into other processes and opened with hipIpcOpenEventHandle.
    !> Then hipEventRecord, hipEventSynchronize, hipStreamWaitEvent and hipEventQuery may be used in
    !> either process. Operations on the imported event after the exported event has been freed with
    !> hipEventDestroy will result in undefined behavior.
    !>
    !> @param[out]  handle Pointer to hipIpcEventHandle to return the opaque event handle
    !> @param[in]   event  Event allocated with hipEventInterprocess and hipEventDisableTiming flags
    !>
    !> @returns #hipSuccess, #hipErrorInvalidConfiguration, #hipErrorInvalidValue
    !>
    !> @note This IPC event related feature API is currently applicable on Linux.
    function hipIpcGetEventHandle(handle, event) &
       result(IpcGetEventHandle) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaIpcGetEventHandle")
#else
       bind(C, name="hipIpcGetEventHandle")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: event
       integer(c_int) :: IpcGetEventHandle
    end function hipIpcGetEventHandle

    !---------------------------------------------
    ! hipIpcOpenEventHandle
    !---------------------------------------------
    !> @brief Opens an interprocess event handles.
    !>
    !> Opens an interprocess event handle exported from another process with hipIpcGetEventHandle.
    !> The
    !> returned hipEvent_t behaves like a locally created event with the hipEventDisableTiming flag
    !> specified. This event need be freed with hipEventDestroy. Operations on the imported event
    !> after
    !> the exported event has been freed with hipEventDestroy will result in undefined behavior. If
    !> the
    !> function is called within the same process where handle is returned by hipIpcGetEventHandle,
    !> it
    !> will return hipErrorInvalidContext.
    !>
    !> @param[out]  event  Pointer to hipEvent_t to return the event
    !> @param[in]   handle The opaque interprocess handle to open
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidContext
    !>
    !> @note This IPC event related feature API is currently applicable on Linux.
    function hipIpcOpenEventHandle(event, handle) &
       result(IpcOpenEventHandle) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaIpcOpenEventHandle")
#else
       bind(C, name="hipIpcOpenEventHandle")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: event
       type(c_ptr), value :: handle
       integer(c_int) :: IpcOpenEventHandle
    end function hipIpcOpenEventHandle

    !---------------------------------------------
    ! hipFuncSetAttribute
    !---------------------------------------------
    !> @defgroup Execution Execution Control
    !>
    !> This section describes the execution control functions of HIP runtime API.
    !>
    !>
    !>
    !> @brief Set attribute for a specific function
    !>
    !> @param [in] func Pointer of the function
    !> @param [in] attr Attribute to set
    !> @param [in] value Value to set
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDeviceFunction, #hipErrorInvalidValue
    !>
    !> Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
    !> ignored on those architectures.
    function hipFuncSetAttribute(func, attr, value) &
       result(FuncSetAttribute) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaFuncSetAttribute")
#else
       bind(C, name="hipFuncSetAttribute")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: func
       integer(c_int), value :: attr
       integer(c_int), value :: value
       integer(c_int) :: FuncSetAttribute
    end function hipFuncSetAttribute

    !---------------------------------------------
    ! hipFuncSetCacheConfig
    !---------------------------------------------
    !> @brief Set Cache configuration for a specific function
    !>
    !> @param [in] func Pointer of the function.
    !> @param [in] config Configuration to set.
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized
    !> Note: AMD devices and some Nvidia GPUS do not support reconfigurable cache. This hint is
    !> ignored
    !> on those architectures.
    function hipFuncSetCacheConfig(func, config) &
       result(FuncSetCacheConfig) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaFuncSetCacheConfig")
#else
       bind(C, name="hipFuncSetCacheConfig")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: func
       integer(c_int), value :: config
       integer(c_int) :: FuncSetCacheConfig
    end function hipFuncSetCacheConfig

    !---------------------------------------------
    ! hipFuncSetSharedMemConfig
    !---------------------------------------------
    !> @brief Set shared memory configuation for a specific function
    !>
    !> @param [in] func Pointer of the function
    !> @param [in] config Configuration
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDeviceFunction, #hipErrorInvalidValue
    !>
    !> Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
    !> ignored on those architectures.
    function hipFuncSetSharedMemConfig(func, config) &
       result(FuncSetSharedMemConfig) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaFuncSetSharedMemConfig")
#else
       bind(C, name="hipFuncSetSharedMemConfig")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: func
       integer(c_int), value :: config
       integer(c_int) :: FuncSetSharedMemConfig
    end function hipFuncSetSharedMemConfig

    !---------------------------------------------
    ! hipGetLastError
    !---------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> @defgroup Error Error Handling
    !>
    !> This section describes the error handling functions of HIP runtime API.
    !>
    !>
    !> @brief Return last error returned by any HIP runtime API call and resets the stored error
    !> code to
    !> #hipSuccess
    !>
    !> @returns return code from last HIP called from the active host thread
    !>
    !> Returns the last error that has been returned by any of the runtime calls in the same host
    !> thread, and then resets the saved error to #hipSuccess.
    !>
    !> @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
    function hipGetLastError() &
       result(GetLastError) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetLastError")
#else
       bind(C, name="hipGetLastError")
#endif
       import :: c_int
       integer(c_int) :: GetLastError
    end function hipGetLastError

    !---------------------------------------------
    ! hipExtGetLastError
    !---------------------------------------------
    !> @brief Return last error returned by any HIP runtime API call and resets the stored error
    !> code to
    !> #hipSuccess
    !>
    !> @returns return code from last HIP called from the active host thread
    !>
    !> Returns the last error that has been returned by any of the runtime calls in the same host
    !> thread, and then resets the saved error to #hipSuccess.
    !>
    !> @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
    function hipExtGetLastError() &
       result(ExtGetLastError) &
       bind(C, name="hipExtGetLastError")
       import :: c_int
       integer(c_int) :: ExtGetLastError
    end function hipExtGetLastError

    !---------------------------------------------
    ! hipPeekAtLastError
    !---------------------------------------------
    !> @brief Return last error returned by any HIP runtime API call.
    !>
    !> @returns #hipSuccess
    !>
    !> Returns the last error that has been returned by any of the runtime calls in the same host
    !> thread. Unlike hipGetLastError, this function does not reset the saved error code.
    !>
    !> @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
    function hipPeekAtLastError() &
       result(PeekAtLastError) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaPeekAtLastError")
#else
       bind(C, name="hipPeekAtLastError")
#endif
       import :: c_int
       integer(c_int) :: PeekAtLastError
    end function hipPeekAtLastError

    !---------------------------------------------
    ! hipGetErrorName
    !---------------------------------------------
    !> @brief Return hip error as text string form.
    !>
    !> @param hip_error Error code to convert to name.
    !> @returns const char pointer to the NULL-terminated error name
    !>
    !> @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
    function hipGetErrorName(hip_error) &
       result(GetErrorName) &
       bind(C, name="hipGetErrorName")
       import :: c_int, c_char
       integer(c_int), value :: hip_error
       character(c_char) :: GetErrorName
    end function hipGetErrorName

    !---------------------------------------------
    ! hipGetErrorString
    !---------------------------------------------
    !> @brief Return handy text string message to explain the error which occurred
    !>
    !> @param hipError Error code to convert to string.
    !> @returns const char pointer to the NULL-terminated error string
    !>
    !> @see hipGetErrorName, hipGetLastError, hipPeakAtLastError, hipError_t
    function hipGetErrorString(hipError) &
       result(GetErrorString) &
       bind(C, name="hipGetErrorString")
       import :: c_int, c_char
       integer(c_int), value :: hipError
       character(c_char) :: GetErrorString
    end function hipGetErrorString

    !---------------------------------------------
    ! hipDrvGetErrorName
    !---------------------------------------------
    !> @brief Return hip error as text string form.
    !>
    !> @param [in] hipError Error code to convert to string.
    !> @param [out] errorString char pointer to the NULL-terminated error string
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipGetErrorName, hipGetLastError, hipPeakAtLastError, hipError_t
    function hipDrvGetErrorName(hipError, errorString) &
       result(DrvGetErrorName) &
       bind(C, name="hipDrvGetErrorName")
       import :: c_int, c_ptr
       integer(c_int), value :: hipError
       type(c_ptr) :: errorString
       integer(c_int) :: DrvGetErrorName
    end function hipDrvGetErrorName

    !---------------------------------------------
    ! hipDrvGetErrorString
    !---------------------------------------------
    !> @brief Return handy text string message to explain the error which occurred
    !>
    !> @param [in] hipError Error code to convert to string.
    !> @param [out] errorString char pointer to the NULL-terminated error string
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipGetErrorName, hipGetLastError, hipPeakAtLastError, hipError_t
    function hipDrvGetErrorString(hipError, errorString) &
       result(DrvGetErrorString) &
       bind(C, name="hipDrvGetErrorString")
       import :: c_int, c_ptr
       integer(c_int), value :: hipError
       type(c_ptr) :: errorString
       integer(c_int) :: DrvGetErrorString
    end function hipDrvGetErrorString

    !---------------------------------------------
    ! hipStreamCreate
    !---------------------------------------------
    !> @brief Creates an asynchronous stream.
    !>
    !> @param[in, out] stream Valid pointer to hipStream_t. This function writes the memory with the
    !> newly created stream.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> Creates a new asynchronous stream with its associated current device. The @p stream returns
    !> an
    !> opaque handle that can be used to reference the newly created stream in subsequent hipStream*
    !> commands. The stream is allocated on the heap and will remain allocated even if the handle
    !> goes
    !> out-of-scope. To release the memory used by the stream, the application must call
    !> hipStreamDestroy.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamSynchronize,
    !> hipStreamWaitEvent, hipStreamDestroy
    function hipStreamCreate(stream) &
       result(StreamCreate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamCreate")
#else
       bind(C, name="hipStreamCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: stream
       integer(c_int) :: StreamCreate
    end function hipStreamCreate

    !---------------------------------------------
    ! hipStreamCreateWithFlags
    !---------------------------------------------
    !> @brief Creates an asynchronous stream with flag.
    !>
    !> @param[in, out] stream  Pointer to new stream
    !> @param[in] flags  Parameters to control stream creation
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> Creates a new asynchronous stream with its associated current device. @p stream returns an
    !> opaque handle that can be used to reference the newly created stream in subsequent hipStream*
    !> commands. The stream is allocated on the heap and will remain allocated even if the handle
    !> goes out-of-scope. To release the memory used by the stream, application must call
    !> hipStreamDestroy.
    !>
    !> The @p flags parameter controls behavior of the stream. The valid values are
    !> #hipStreamDefault
    !> and #hipStreamNonBlocking.
    !>
    !> @see hipStreamCreate, hipStreamCreateWithPriority, hipStreamSynchronize, hipStreamWaitEvent,
    !> hipStreamDestroy.
    function hipStreamCreateWithFlags(stream, flags) &
       result(StreamCreateWithFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamCreateWithFlags")
#else
       bind(C, name="hipStreamCreateWithFlags")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: stream
       integer(c_int), value :: flags
       integer(c_int) :: StreamCreateWithFlags
    end function hipStreamCreateWithFlags

    !---------------------------------------------
    ! hipStreamCreateWithPriority
    !---------------------------------------------
    !> @brief Creates an asynchronous stream with the specified priority.
    !>
    !> @param[in, out] stream  Pointer to new stream
    !> @param[in] flags  Parameters to control stream creation
    !> @param[in] priority  Priority of the stream. Lower numbers represent higher priorities.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> Creates a new asynchronous stream with the specified priority, with its associated current
    !> device.
    !> @p stream returns an opaque handle that can be used to reference the newly created stream in
    !> subsequent hipStream* commands. The stream is allocated on the heap and will remain allocated
    !> even if the handle goes out-of-scope. To release the memory used by the stream, application
    !> must
    !> call hipStreamDestroy.
    !>
    !> The @p flags parameter controls behavior of the stream. The valid values are
    !> #hipStreamDefault
    !> and #hipStreamNonBlocking.
    !>
    !> @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
    function hipStreamCreateWithPriority(stream, flags, priority) &
       result(StreamCreateWithPriority) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamCreateWithPriority")
#else
       bind(C, name="hipStreamCreateWithPriority")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: stream
       integer(c_int), value :: flags
       integer(c_int), value :: priority
       integer(c_int) :: StreamCreateWithPriority
    end function hipStreamCreateWithPriority

    !---------------------------------------------
    ! hipDeviceGetStreamPriorityRange
    !---------------------------------------------
    !> @brief Returns numerical values that correspond to the least and greatest stream priority.
    !>
    !> @param[in, out] leastPriority  Pointer in which a value corresponding to least priority
    !> is returned.
    !> @param[in, out] greatestPriority  Pointer in which a value corresponding to greatest priority
    !> is returned.
    !> @returns #hipSuccess
    !>
    !> Returns in *leastPriority and *greatestPriority the numerical values that correspond to the
    !> least and greatest stream priority respectively. Stream priorities follow a convention where
    !> lower numbers imply greater priorities. The range of meaningful stream priorities is given by
    !> [*leastPriority,*greatestPriority]. If the user attempts to create a stream with a priority
    !> value that is outside the meaningful range as specified by this API, the priority is
    !> automatically clamped to within the valid range.
    !>
    !> @warning This API is under development on AMD GPUs and simply returns #hipSuccess.
    function hipDeviceGetStreamPriorityRange(leastPriority, greatestPriority) &
       result(DeviceGetStreamPriorityRange) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetStreamPriorityRange")
#else
       bind(C, name="hipDeviceGetStreamPriorityRange")
#endif
       import :: c_int
       integer(c_int) :: leastPriority(*)
       integer(c_int) :: greatestPriority(*)
       integer(c_int) :: DeviceGetStreamPriorityRange
    end function hipDeviceGetStreamPriorityRange

    !---------------------------------------------
    ! hipStreamDestroy
    !---------------------------------------------
    !> @brief Destroys the specified stream.
    !>
    !> @param[in] stream  Stream identifier
    !> @returns #hipSuccess #hipErrorInvalidHandle
    !>
    !> Destroys the specified stream.
    !>
    !> If commands are still executing on the specified stream, some may complete execution before
    !> the
    !> queue is deleted.
    !>
    !> The queue may be destroyed while some commands are still inflight, or may wait for all
    !> commands
    !> queued to the stream before destroying it.
    !>
    !> @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamQuery,
    !> hipStreamWaitEvent, hipStreamSynchronize
    function hipStreamDestroy(stream) &
       result(StreamDestroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamDestroy")
#else
       bind(C, name="hipStreamDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: StreamDestroy
    end function hipStreamDestroy

    !---------------------------------------------
    ! hipStreamQuery
    !---------------------------------------------
    !> @brief Returns #hipSuccess if all of the operations in the specified @p stream have
    !> completed, or
    !> #hipErrorNotReady if not.
    !>
    !> @param[in] stream  Stream to query
    !>
    !> @returns #hipSuccess, #hipErrorNotReady, #hipErrorInvalidHandle
    !>
    !> This is thread-safe and returns a snapshot of the current state of the queue. However, if
    !> other
    !> host threads are sending work to the stream, the status may change immediately after the
    !> function
    !> is called.  It is typically used for debug.
    !>
    !> @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority,
    !> hipStreamWaitEvent,
    !> hipStreamSynchronize, hipStreamDestroy
    function hipStreamQuery(stream) &
       result(StreamQuery) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamQuery")
#else
       bind(C, name="hipStreamQuery")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: StreamQuery
    end function hipStreamQuery

    !---------------------------------------------
    ! hipStreamSynchronize
    !---------------------------------------------
    !> @brief Waits for all commands in the stream to complete.
    !>
    !> @param[in] stream  Stream identifier.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidHandle
    !>
    !> This command is host-synchronous : the host will block until all operations on the specified
    !> stream with its associated device are completed. On multiple device systems, the @p stream is
    !> associated with its device, no need to call hipSetDevice before this API.
    !>
    !> This command follows standard null-stream semantics. Specifying the null stream will cause
    !> the
    !> command to wait for other streams on the same device to complete all pending operations.
    !>
    !> This command honors the #hipDeviceScheduleBlockingSync flag, which controls whether the wait
    !> is
    !> active or blocking.
    !>
    !> @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority,
    !> hipStreamWaitEvent,
    !> hipStreamDestroy
    function hipStreamSynchronize(stream) &
       result(StreamSynchronize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamSynchronize")
#else
       bind(C, name="hipStreamSynchronize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: StreamSynchronize
    end function hipStreamSynchronize

    !---------------------------------------------
    ! hipStreamWaitEvent
    !---------------------------------------------
    !> @brief Makes the specified compute stream wait for the specified event
    !>
    !> @param[in] stream  Stream to make wait
    !> @param[in] event  Event to wait on
    !> @param[in] flags  Parameters to control the operation
    !>
    !> @returns #hipSuccess, #hipErrorInvalidHandle, #hipErrorInvalidValue,
    !> #hipErrorStreamCaptureIsolation
    !>
    !> This function inserts a wait operation into the specified stream.
    !> All future work submitted to @p stream will wait until @p event reports completion before
    !> beginning execution.
    !>
    !> Flags include:
    !> hipEventWaitDefault: Default event creation flag.
    !> hipEventWaitExternal: Wait is captured in the graph as an external event node when
    !> performing stream capture
    !>
    !> This function only waits for commands in the current stream to complete. Notably, this
    !> function
    !> does not implicitly wait for commands in the default stream to complete, even if the
    !> specified
    !> stream is created with hipStreamNonBlocking = 0.
    !>
    !> @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority,
    !> hipStreamSynchronize, hipStreamDestroy
    function hipStreamWaitEvent(stream, event, flags) &
       result(StreamWaitEvent) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamWaitEvent")
#else
       bind(C, name="hipStreamWaitEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: event
       integer(c_int), value :: flags
       integer(c_int) :: StreamWaitEvent
    end function hipStreamWaitEvent

    !---------------------------------------------
    ! hipStreamGetFlags
    !---------------------------------------------
    !> @brief Returns flags associated with this stream.
    !>
    !> @param[in] stream  Stream to be queried
    !> @param[in,out] flags  Pointer to an unsigned integer in which the stream's flags are returned
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidHandle.
    !>
    !> @see hipStreamCreateWithFlags
    function hipStreamGetFlags(stream, flags) &
       result(StreamGetFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamGetFlags")
#else
       bind(C, name="hipStreamGetFlags")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: flags(*)
       integer(c_int) :: StreamGetFlags
    end function hipStreamGetFlags

    !---------------------------------------------
    ! hipStreamGetId
    !---------------------------------------------
    !> @brief Queries the Id of a stream.
    !>
    !> @param[in] stream  Stream to be queried
    !> @param[in,out] flags  Pointer to an unsigned long long in which the stream's id is returned
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidHandle.
    !>
    !> @see hipStreamCreateWithFlags, hipStreamGetFlags, hipStreamCreateWithPriority,
    !> hipStreamGetPriority
    function hipStreamGetId(stream, streamId) &
       result(StreamGetId) &
       bind(C, name="hipStreamGetId")
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr), value :: stream
       integer(c_int64_t) :: streamId(*)
       integer(c_int) :: StreamGetId
    end function hipStreamGetId

    !---------------------------------------------
    ! hipStreamGetPriority
    !---------------------------------------------
    !> @brief Queries the priority of a stream.
    !>
    !> @param[in] stream  Stream to be queried
    !> @param[in,out] priority  Pointer to an unsigned integer in which the stream's priority is
    !> returned
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidHandle.
    !>
    !> @see hipStreamCreateWithPriority
    function hipStreamGetPriority(stream, priority) &
       result(StreamGetPriority) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamGetPriority")
#else
       bind(C, name="hipStreamGetPriority")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: priority(*)
       integer(c_int) :: StreamGetPriority
    end function hipStreamGetPriority

    !---------------------------------------------
    ! hipStreamGetDevice
    !---------------------------------------------
    !> @brief Gets the device associated with the stream.
    !>
    !> @param[in] stream  Stream to be queried
    !> @param[out] device  Device associated with the stream
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorContextIsDestroyed,
    !> #hipErrorInvalidHandle,
    !> #hipErrorNotInitialized, #hipErrorDeinitialized, #hipErrorInvalidContext
    !>
    !> @see hipStreamCreate, hipStreamDestroy, hipDeviceGetStreamPriorityRange
    function hipStreamGetDevice(stream, device) &
       result(StreamGetDevice) &
       bind(C, name="hipStreamGetDevice")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: device(*)
       integer(c_int) :: StreamGetDevice
    end function hipStreamGetDevice

    !---------------------------------------------
    ! hipExtStreamCreateWithCUMask
    !---------------------------------------------
    !> @brief Creates an asynchronous stream with the specified CU mask.
    !>
    !> @param[in, out] stream  Pointer to new stream
    !> @param[in] cuMaskSize  Size of CU mask bit array passed in.
    !> @param[in] cuMask Bit-vector representing the CU mask. Each active bit represents using one
    !> CU.
    !> The first 32 bits represent the first 32 CUs, and so on. If its size is greater than physical
    !> CU number (i.e., multiProcessorCount member of hipDeviceProp_t), the extra elements are
    !> ignored.
    !> It is user's responsibility to make sure the input is meaningful.
    !> @returns #hipSuccess, #hipErrorInvalidHandle, #hipErrorInvalidValue
    !>
    !> Creates  a new asynchronous stream with the specified CU mask.  @p stream returns an opaque
    !> handle that can be used to reference the newly created stream in subsequent hipStream*
    !> commands.
    !> The stream is allocated on the heap and will remain allocated even if the handle goes
    !> out-of-scope. To release the memory used by the stream, application must call
    !> hipStreamDestroy.
    !>
    !> @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
    function hipExtStreamCreateWithCUMask(stream, cuMaskSize, cuMask) &
       result(ExtStreamCreateWithCUMask) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaExtStreamCreateWithCUMask")
#else
       bind(C, name="hipExtStreamCreateWithCUMask")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: stream
       integer(c_int), value :: cuMaskSize
       integer(c_int) :: cuMask(*)
       integer(c_int) :: ExtStreamCreateWithCUMask
    end function hipExtStreamCreateWithCUMask

    !---------------------------------------------
    ! hipExtStreamGetCUMask
    !---------------------------------------------
    !> @brief Gets CU mask associated with an asynchronous stream
    !>
    !> @param[in] stream  Stream to be queried
    !> @param[in] cuMaskSize  Number of the block of memories (uint32_t *) allocated by user
    !> @param[out] cuMask  Pointer to a pre-allocated block of memories (uint32_t *) in which
    !> the stream's CU mask is returned. The CU mask is returned in a chunck of 32 bits where
    !> each active bit represents one active CU.
    !> @returns #hipSuccess, #hipErrorInvalidHandle, #hipErrorInvalidValue
    !>
    !> @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
    function hipExtStreamGetCUMask(stream, cuMaskSize, cuMask) &
       result(ExtStreamGetCUMask) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaExtStreamGetCUMask")
#else
       bind(C, name="hipExtStreamGetCUMask")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: cuMaskSize
       integer(c_int) :: cuMask(*)
       integer(c_int) :: ExtStreamGetCUMask
    end function hipExtStreamGetCUMask

    !---------------------------------------------
    ! hipStreamAddCallback
    !---------------------------------------------
    !> @brief Adds a callback to be called on the host after all currently enqueued items in the
    !> stream
    !> have completed. For each hipStreamAddCallback call, a callback will be executed exactly once.
    !> The callback will block later work in the stream until it is finished.
    !>
    !> @param[in] stream   - Stream to add callback to
    !> @param[in] callback - The function to call once preceding stream operations are complete
    !> @param[in] userData - User specified data to be passed to the callback function
    !> @param[in] flags    - Reserved for future use, must be 0
    !> @returns #hipSuccess, #hipErrorInvalidHandle, #hipErrorNotSupported
    !>
    !> @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamQuery, hipStreamSynchronize,
    !> hipStreamWaitEvent, hipStreamDestroy, hipStreamCreateWithPriority
    function hipStreamAddCallback(stream, callback, userData, flags) &
       result(StreamAddCallback) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamAddCallback")
#else
       bind(C, name="hipStreamAddCallback")
#endif
       import :: c_ptr, c_funptr, c_int
       type(c_ptr), value :: stream
       type(c_funptr), value :: callback
       type(c_ptr), value :: userData
       integer(c_int), value :: flags
       integer(c_int) :: StreamAddCallback
    end function hipStreamAddCallback

    !---------------------------------------------
    ! hipStreamSetAttribute
    !---------------------------------------------
    !> @brief Sets stream attribute. Updated attribute is applied to work submitted to the stream.
    !> @param[in] stream - Stream to set attributes to
    !> @param[in] attr   - Attribute ID for the attribute to set
    !> @param[in] value  - Attribute value for the attribute to set
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidResourceHandle
    function hipStreamSetAttribute(stream, attr, value) &
       result(StreamSetAttribute) &
       bind(C, name="hipStreamSetAttribute")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: StreamSetAttribute
    end function hipStreamSetAttribute

    !---------------------------------------------
    ! hipStreamGetAttribute
    !---------------------------------------------
    !> @brief queries stream attribute.
    !> @param[in] stream - Stream to geet attributes from
    !> @param[in] attr   - Attribute ID for the attribute to query
    !> @param[out] value  - Attribute value output
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidResourceHandle
    function hipStreamGetAttribute(stream, attr, value_out) &
       result(StreamGetAttribute) &
       bind(C, name="hipStreamGetAttribute")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: attr
       type(c_ptr), value :: value_out
       integer(c_int) :: StreamGetAttribute
    end function hipStreamGetAttribute

    !---------------------------------------------
    ! hipStreamCopyAttributes
    !---------------------------------------------
    !> @brief Copies attributes from source stream to destination stream.
    !> @param[in] dst - Destination stream
    !> @param[in] src - Source stream
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipStreamCopyAttributes(dst, src) &
       result(StreamCopyAttributes) &
       bind(C, name="hipStreamCopyAttributes")
       import :: c_ptr, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_int) :: StreamCopyAttributes
    end function hipStreamCopyAttributes

    !---------------------------------------------
    ! hipStreamWaitValue32
    !---------------------------------------------
    !> @brief Enqueues a wait command to the stream.[BETA]
    !>
    !> @param [in] stream - Stream identifier
    !> @param [in] ptr    - Pointer to memory object allocated using #hipMallocSignalMemory flag
    !> @param [in] value  - Value to be used in compare operation
    !> @param [in] flags - Defines the compare operation, supported values are
    !> #hipStreamWaitValueGte
    !> #hipStreamWaitValueEq, #hipStreamWaitValueAnd and #hipStreamWaitValueNor
    !> @param [in] mask   - Mask to be applied on value at memory before it is compared with value,
    !> default value is set to enable every bit
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> Enqueues a wait command to the stream, all operations enqueued on this stream after this,
    !> will
    !> not execute until the defined wait condition is true.
    !>
    !> #hipStreamWaitValueGte: waits until *ptr&mask >= value
    !>
    !> #hipStreamWaitValueEq : waits until *ptr&mask == value
    !>
    !> #hipStreamWaitValueAnd: waits until ((*ptr&mask) & value) != 0
    !>
    !> #hipStreamWaitValueNor: waits until ~((*ptr&mask) | (value&mask)) != 0
    !>
    !> @note when using #hipStreamWaitValueNor, mask is applied on both 'value' and '*ptr'.
    !>
    !> @note Support for #hipStreamWaitValue32 can be queried using 'hipDeviceGetAttribute()' and
    !> 'hipDeviceAttributeCanUseStreamWaitValue' flag.
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @see hipExtMallocWithFlags, hipFree, hipStreamWaitValue64, hipStreamWriteValue64,
    !> hipStreamWriteValue32, hipDeviceGetAttribute
    function hipStreamWaitValue32(stream, ptr, value, flags, mask) &
       result(StreamWaitValue32) &
       bind(C, name="hipStreamWaitValue32")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: ptr
       integer(c_int), value :: value
       integer(c_int), value :: flags
       integer(c_int), value :: mask
       integer(c_int) :: StreamWaitValue32
    end function hipStreamWaitValue32

    !---------------------------------------------
    ! hipStreamWaitValue64
    !---------------------------------------------
    !> @brief Enqueues a wait command to the stream.[BETA]
    !>
    !> @param [in] stream - Stream identifier
    !> @param [in] ptr    - Pointer to memory object allocated using 'hipMallocSignalMemory' flag
    !> @param [in] value  - Value to be used in compare operation
    !> @param [in] flags - Defines the compare operation, supported values are
    !> #hipStreamWaitValueGte
    !> #hipStreamWaitValueEq, #hipStreamWaitValueAnd and #hipStreamWaitValueNor.
    !> @param [in] mask   - Mask to be applied on value at memory before it is compared with value
    !> default value is set to enable every bit
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> Enqueues a wait command to the stream, all operations enqueued on this stream after this,
    !> will
    !> not execute until the defined wait condition is true.
    !>
    !> #hipStreamWaitValueGte: waits until *ptr&mask >= value
    !>
    !> #hipStreamWaitValueEq : waits until *ptr&mask == value
    !>
    !> #hipStreamWaitValueAnd: waits until ((*ptr&mask) & value) != 0
    !>
    !> #hipStreamWaitValueNor: waits until ~((*ptr&mask) | (value&mask)) != 0
    !>
    !> @note when using #hipStreamWaitValueNor, mask is applied on both 'value' and '*ptr'.
    !>
    !> @note Support for hipStreamWaitValue64 can be queried using 'hipDeviceGetAttribute()' and
    !> 'hipDeviceAttributeCanUseStreamWaitValue' flag.
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @see hipExtMallocWithFlags, hipFree, hipStreamWaitValue32, hipStreamWriteValue64,
    !> hipStreamWriteValue32, hipDeviceGetAttribute
    function hipStreamWaitValue64(stream, ptr, value, flags, mask) &
       result(StreamWaitValue64) &
       bind(C, name="hipStreamWaitValue64")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: ptr
       integer(c_long), value :: value
       integer(c_int), value :: flags
       integer(c_long), value :: mask
       integer(c_int) :: StreamWaitValue64
    end function hipStreamWaitValue64

    !---------------------------------------------
    ! hipStreamWriteValue32
    !---------------------------------------------
    !> @brief Enqueues a write command to the stream.[BETA]
    !>
    !> @param [in] stream - Stream identifier
    !> @param [in] ptr    - Pointer to a GPU accessible memory object
    !> @param [in] value  - Value to be written
    !> @param [in] flags  - reserved, ignored for now, will be used in future releases
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> Enqueues a write command to the stream, write operation is performed after all earlier
    !> commands
    !> on this stream have completed the execution.
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @see hipExtMallocWithFlags, hipFree, hipStreamWriteValue32, hipStreamWaitValue32,
    !> hipStreamWaitValue64
    function hipStreamWriteValue32(stream, ptr, value, flags) &
       result(StreamWriteValue32) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamWriteValue32")
#else
       bind(C, name="hipStreamWriteValue32")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: ptr
       integer(c_int), value :: value
       integer(c_int), value :: flags
       integer(c_int) :: StreamWriteValue32
    end function hipStreamWriteValue32

    !---------------------------------------------
    ! hipStreamWriteValue64
    !---------------------------------------------
    !> @brief Enqueues a write command to the stream.[BETA]
    !>
    !> @param [in] stream - Stream identifier
    !> @param [in] ptr    - Pointer to a GPU accessible memory object
    !> @param [in] value  - Value to be written
    !> @param [in] flags  - reserved, ignored for now, will be used in future releases
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> Enqueues a write command to the stream, write operation is performed after all earlier
    !> commands
    !> on this stream have completed the execution.
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @see hipExtMallocWithFlags, hipFree, hipStreamWriteValue32, hipStreamWaitValue32,
    !> hipStreamWaitValue64
    function hipStreamWriteValue64(stream, ptr, value, flags) &
       result(StreamWriteValue64) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamWriteValue64")
#else
       bind(C, name="hipStreamWriteValue64")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: ptr
       integer(c_long), value :: value
       integer(c_int), value :: flags
       integer(c_int) :: StreamWriteValue64
    end function hipStreamWriteValue64

    !---------------------------------------------
    ! hipStreamBatchMemOp
    !---------------------------------------------
    !> @brief Enqueues an array of stream memory operations in the stream.[BETA]
    !>
    !> @param [in] stream      - Stream identifier
    !> @param [in] count       - The number of operations in the array. Must be less than 256
    !> @param [in] paramArray  - The types and parameters of the individual operations.
    !> @param [in] flags       - Reserved for future expansion; must be 0.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> Batch operations to synchronize the stream via memory operations.
    !>
    !> @warning This API is marked as beta, meaning, while this is feature complete,
    !> it is still open to changes and may have outstanding issues.
    !>
    !> @see hipStreamWriteValue32, hipStreamWaitValue32,
    !> hipStreamWaitValue64. hipStreamWriteValue64
    function hipStreamBatchMemOp(stream, count, paramArray, flags) &
       result(StreamBatchMemOp) &
       bind(C, name="hipStreamBatchMemOp")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: count
       type(c_ptr), value :: paramArray
       integer(c_int), value :: flags
       integer(c_int) :: StreamBatchMemOp
    end function hipStreamBatchMemOp

    !---------------------------------------------
    ! hipGraphAddBatchMemOpNode
    !---------------------------------------------
    !> @brief Creates a batch memory operation node and adds it to a graph.[BETA]
    !>
    !> @param [in] phGraphNode      - Returns the newly created node
    !> @param [in] hGraph           - Graph to which to add the node
    !> @param [in] dependencies     -  Dependencies of the node
    !> @param [in] numDependencies  - Number of dependencies
    !> @param [in] nodeParams       - Parameters for the node
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning This API is marked as beta, meaning, while this is feature complete,
    !> it is still open to changes and may have outstanding issues.
    !>
    !> @see hipStreamWriteValue32, hipStreamWaitValue32,
    !> hipStreamWaitValue64. hipStreamWriteValue64, hipStreamBatchMemOp
    function hipGraphAddBatchMemOpNode(phGraphNode, hGraph, dependencies, numDependencies, &
                                       nodeParams) &
       result(GraphAddBatchMemOpNode) &
       bind(C, name="hipGraphAddBatchMemOpNode")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: phGraphNode
       type(c_ptr), value :: hGraph
       type(c_ptr) :: dependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphAddBatchMemOpNode
    end function hipGraphAddBatchMemOpNode

    !---------------------------------------------
    ! hipGraphBatchMemOpNodeGetParams
    !---------------------------------------------
    !> @brief Returns a batch mem op node's parameters.[BETA]
    !>
    !> @param [in] hNode           - Node to get the parameters for
    !> @param [in] nodeParams_out  - Pointer to return the parameters
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> Returns the parameters of batch mem op node hNode in nodeParams_out.
    !> The paramArray returned in nodeParams_out is owned by the node.
    !> This memory remains valid until the node is destroyed or its parameters are modified,
    !> and should not be modified directly.
    !>
    !> @warning This API is marked as beta, meaning, while this is feature complete,
    !> it is still open to changes and may have outstanding issues.
    !>
    !> @see hipStreamWriteValue32, hipStreamWaitValue32,
    !> hipStreamWaitValue64. hipStreamWriteValue64. hipGraphBatchMemOpNodeSetParams
    function hipGraphBatchMemOpNodeGetParams(hNode, nodeParams_out) &
       result(GraphBatchMemOpNodeGetParams) &
       bind(C, name="hipGraphBatchMemOpNodeGetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       type(c_ptr), value :: nodeParams_out
       integer(c_int) :: GraphBatchMemOpNodeGetParams
    end function hipGraphBatchMemOpNodeGetParams

    !---------------------------------------------
    ! hipGraphBatchMemOpNodeSetParams
    !---------------------------------------------
    !> @brief Sets the batch mem op node's parameters.[BETA]
    !>
    !> @param [in] hNode       - Node to set the parameters for
    !> @param [in] nodeParams  - Parameters to copy
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> Sets the parameters of batch mem op node hNode to nodeParams.
    !>
    !> @warning This API is marked as beta, meaning, while this is feature complete,
    !> it is still open to changes and may have outstanding issues.
    !>
    !> @see hipStreamWriteValue32, hipStreamWaitValue32,
    !> hipStreamWaitValue64. hipStreamWriteValue64, hipGraphBatchMemOpNodeGetParams
    function hipGraphBatchMemOpNodeSetParams(hNode, nodeParams) &
       result(GraphBatchMemOpNodeSetParams) &
       bind(C, name="hipGraphBatchMemOpNodeSetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphBatchMemOpNodeSetParams
    end function hipGraphBatchMemOpNodeSetParams

    !---------------------------------------------
    ! hipGraphExecBatchMemOpNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a batch mem op node in the given graphExec.[BETA]
    !>
    !> @param [in] hGraphExec  - The executable graph in which to set the specified node
    !> @param [in] hNode - Batch mem op node from the graph from which graphExec was instantiated
    !> @param [in] nodeParams  - Updated Parameters to set
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> Sets the parameters of a batch mem op node in an executable graph hGraphExec.
    !> The node is identified by the corresponding node hNode in the non-executable graph,
    !> from which the executable graph was instantiated.
    !>
    !> @warning This API is marked as beta, meaning, while this is feature complete,
    !> it is still open to changes and may have outstanding issues.
    !>
    !> @see hipStreamWriteValue32, hipStreamWaitValue32,
    !> hipStreamWaitValue64. hipStreamWriteValue64, hipStreamBatchMemOp
    function hipGraphExecBatchMemOpNodeSetParams(hGraphExec, hNode, nodeParams) &
       result(GraphExecBatchMemOpNodeSetParams) &
       bind(C, name="hipGraphExecBatchMemOpNodeSetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphExecBatchMemOpNodeSetParams
    end function hipGraphExecBatchMemOpNodeSetParams

    !---------------------------------------------
    ! hipEventCreateWithFlags
    !---------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> @defgroup Event Event Management
    !>
    !> This section describes the event management functions of HIP runtime API.
    !>
    !>
    !> @brief Create an event with the specified flags
    !>
    !> @param[in,out] event Returns the newly created event.
    !> @param[in] flags     Flags to control event behavior.  Valid values are #hipEventDefault,
    !> #hipEventBlockingSync, #hipEventDisableTiming, #hipEventInterprocess
    !> #hipEventDefault : Default flag.  The event will use active synchronization and will support
    !> timing. Blocking synchronization provides lowest possible latency at the expense of
    !> dedicating a
    !> CPU to poll on the event.
    !> #hipEventBlockingSync : The event will use blocking synchronization : if hipEventSynchronize
    !> is
    !> called on this event, the thread will block until the event completes. This can increase
    !> latency
    !> for the synchroniation but can result in lower power and more resources for other CPU
    !> threads.
    !> #hipEventDisableTiming : Disable recording of timing information. Events created with this
    !> flag
    !> would not record profiling data and provide best performance if used for synchronization.
    !> #hipEventInterprocess : The event can be used as an interprocess event. hipEventDisableTiming
    !> flag also must be set when hipEventInterprocess flag is set.
    !> #hipEventDisableSystemFence : Disable acquire and release system scope fence. This may
    !> improve performance but device memory may not be visible to the host and other devices
    !> if this flag is set.
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue,
    !> #hipErrorLaunchFailure, #hipErrorOutOfMemory
    !>
    !> @see hipEventCreate, hipEventSynchronize, hipEventDestroy, hipEventElapsedTime
    function hipEventCreateWithFlags(event, flags) &
       result(EventCreateWithFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventCreateWithFlags")
#else
       bind(C, name="hipEventCreateWithFlags")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: event
       integer(c_int), value :: flags
       integer(c_int) :: EventCreateWithFlags
    end function hipEventCreateWithFlags

    !---------------------------------------------
    ! hipEventCreate
    !---------------------------------------------
    !> Create an event
    !>
    !> @param[in,out] event Returns the newly created event.
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue,
    !> #hipErrorLaunchFailure, #hipErrorOutOfMemory
    !>
    !> @see hipEventCreateWithFlags, hipEventRecord, hipEventQuery, hipEventSynchronize,
    !> hipEventDestroy, hipEventElapsedTime
    function hipEventCreate(event) &
       result(EventCreate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventCreate")
#else
       bind(C, name="hipEventCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: event
       integer(c_int) :: EventCreate
    end function hipEventCreate

    !---------------------------------------------
    ! hipEventRecordWithFlags
    !---------------------------------------------
    !> @brief Record an event in the specified stream.
    !>
    !> @param[in] event event to record.
    !> @param[in] stream stream in which to record event.
    !> @param[in] flags parameter for operations
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized,
    !> #hipErrorInvalidHandle, #hipErrorLaunchFailure
    !>
    !> hipEventQuery() or hipEventSynchronize() must be used to determine when the event
    !> transitions from "recording" (after hipEventRecord() is called) to "recorded"
    !> (when timestamps are set, if requested).
    !>
    !> Events which are recorded in a non-NULL stream will transition to
    !> from recording to "recorded" state when they reach the head of
    !> the specified stream, after all previous
    !> commands in that stream have completed executing.
    !>
    !> Flags include:
    !> hipEventRecordDefault: Default event creation flag.
    !> hipEventRecordExternal: Event is captured in the graph as an external event node when
    !> performing stream capture
    !>
    !> If hipEventRecord() has been previously called on this event, then this call will overwrite
    !> any
    !> existing state in event.
    !>
    !> If this function is called on an event that is currently being recorded, results are
    !> undefined
    !> - either outstanding recording may save state into the event, and the order is not
    !> guaranteed.
    !>
    !> @note: If this function is not called before use hipEventQuery() or hipEventSynchronize(),
    !> #hipSuccess is returned, meaning no pending event in the stream.
    !>
    !> @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventSynchronize,
    !> hipEventDestroy, hipEventElapsedTime
    function hipEventRecordWithFlags(event, stream, flags) &
       result(EventRecordWithFlags) &
       bind(C, name="hipEventRecordWithFlags")
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       type(c_ptr), value :: stream
       integer(c_int), value :: flags
       integer(c_int) :: EventRecordWithFlags
    end function hipEventRecordWithFlags

    !---------------------------------------------
    ! hipEventRecord
    !---------------------------------------------
    function hipEventRecord(event, stream) &
       result(EventRecord) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventRecord")
#else
       bind(C, name="hipEventRecord")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       type(c_ptr), value :: stream
       integer(c_int) :: EventRecord
    end function hipEventRecord

    !---------------------------------------------
    ! hipEventDestroy
    !---------------------------------------------
    !> @brief Destroy the specified event.
    !>
    !> @param[in] event Event to destroy.
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue,
    !> #hipErrorLaunchFailure
    !>
    !> Releases memory associated with the event.  If the event is recording but has not completed
    !> recording when hipEventDestroy() is called, the function will return immediately and the
    !> completion_future resources will be released later, when the hipDevice is synchronized.
    !>
    !> @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventSynchronize,
    !> hipEventRecord,
    !> hipEventElapsedTime
    !>
    !> @returns #hipSuccess
    function hipEventDestroy(event) &
       result(EventDestroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventDestroy")
#else
       bind(C, name="hipEventDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       integer(c_int) :: EventDestroy
    end function hipEventDestroy

    !---------------------------------------------
    ! hipEventSynchronize
    !---------------------------------------------
    !> @brief Wait for an event to complete.
    !>
    !> This function will block until the event is ready, waiting for all previous work in the
    !> stream
    !> specified when event was recorded with hipEventRecord().
    !>
    !> If hipEventRecord() has not been called on @p event, this function returns #hipSuccess when
    !> no
    !> event is captured.
    !>
    !>
    !> @param[in] event Event on which to wait.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized,
    !> #hipErrorInvalidHandle, #hipErrorLaunchFailure
    !>
    !> @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventDestroy, hipEventRecord,
    !> hipEventElapsedTime
    function hipEventSynchronize(event) &
       result(EventSynchronize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventSynchronize")
#else
       bind(C, name="hipEventSynchronize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       integer(c_int) :: EventSynchronize
    end function hipEventSynchronize

    !---------------------------------------------
    ! hipEventElapsedTime
    !---------------------------------------------
    !> @brief Return the elapsed time between two events.
    !>
    !> @param[out] ms : Return time between start and stop in ms.
    !> @param[in]   start : Start event.
    !> @param[in]   stop  : Stop event.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotReady, #hipErrorInvalidHandle,
    !> #hipErrorNotInitialized, #hipErrorLaunchFailure
    !>
    !> Computes the elapsed time between two events. Time is computed in ms, with
    !> a resolution of approximately 1 us.
    !>
    !> Events which are recorded in a NULL stream will block until all commands
    !> on all other streams complete execution, and then record the timestamp.
    !>
    !> Events which are recorded in a non-NULL stream will record their timestamp
    !> when they reach the head of the specified stream, after all previous
    !> commands in that stream have completed executing.  Thus the time that
    !> the event recorded may be significantly after the host calls hipEventRecord().
    !>
    !> If hipEventRecord() has not been called on either event, then #hipErrorInvalidHandle is
    !> returned. If hipEventRecord() has been called on both events, but the timestamp has not yet
    !> been
    !> recorded on one or both events (that is, hipEventQuery() would return #hipErrorNotReady on at
    !> least one of the events), then #hipErrorNotReady is returned.
    !>
    !> @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventDestroy, hipEventRecord,
    !> hipEventSynchronize
    function hipEventElapsedTime(ms, start, stop) &
       result(EventElapsedTime) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventElapsedTime")
#else
       bind(C, name="hipEventElapsedTime")
#endif
       import :: c_float, c_ptr, c_int
       real(c_float) :: ms(*)
       type(c_ptr), value :: start
       type(c_ptr), value :: stop
       integer(c_int) :: EventElapsedTime
    end function hipEventElapsedTime

    !---------------------------------------------
    ! hipEventQuery
    !---------------------------------------------
    !> @brief Query event status
    !>
    !> @param[in] event Event to query.
    !> @returns #hipSuccess, #hipErrorNotReady, #hipErrorInvalidHandle, #hipErrorInvalidValue,
    !> #hipErrorNotInitialized, #hipErrorLaunchFailure
    !>
    !> Query the status of the specified event.  This function will return #hipSuccess if all
    !> commands in the appropriate stream (specified to hipEventRecord()) have completed.  If any
    !> execution has not completed, then #hipErrorNotReady is returned.
    !>
    !> @note This API returns #hipSuccess, if hipEventRecord() is not called before this API.
    !>
    !> @see hipEventCreate, hipEventCreateWithFlags, hipEventRecord, hipEventDestroy,
    !> hipEventSynchronize, hipEventElapsedTime
    function hipEventQuery(event) &
       result(EventQuery) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventQuery")
#else
       bind(C, name="hipEventQuery")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       integer(c_int) :: EventQuery
    end function hipEventQuery

    !---------------------------------------------
    ! hipPointerSetAttribute
    !---------------------------------------------
    !> @brief Sets information on the specified pointer.[BETA]
    !>
    !> @param [in]      value     Sets pointer attribute value
    !> @param [in]      attribute  Attribute to set
    !> @param [in]      ptr      Pointer to set attributes for
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    function hipPointerSetAttribute(value, attribute, ptr) &
       result(PointerSetAttribute) &
       bind(C, name="hipPointerSetAttribute")
       import :: c_ptr, c_int
       type(c_ptr), value :: value
       integer(c_int), value :: attribute
       type(c_ptr), value :: ptr
       integer(c_int) :: PointerSetAttribute
    end function hipPointerSetAttribute

    !---------------------------------------------
    ! hipPointerGetAttributes
    !---------------------------------------------
    !> @brief Returns attributes for the specified pointer
    !>
    !> @param [out]  attributes  attributes for the specified pointer
    !> @param [in]   ptr         pointer to get attributes for
    !>
    !> The output parameter 'attributes' has a member named 'type' that describes what memory the
    !> pointer is associated with, such as device memory, host memory, managed memory, and others.
    !> Otherwise, the API cannot handle the pointer and returns #hipErrorInvalidValue.
    !>
    !> @note  The unrecognized memory type is unsupported to keep the HIP functionality backward
    !> compatibility due to #hipMemoryType enum values.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @note  The current behavior of this HIP API corresponds to the CUDA API before version 11.0.
    !>
    !> @see hipPointerGetAttribute
    function hipPointerGetAttributes(attributes, ptr) &
       result(PointerGetAttributes) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaPointerGetAttributes")
#else
       bind(C, name="hipPointerGetAttributes")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: attributes
       type(c_ptr), value :: ptr
       integer(c_int) :: PointerGetAttributes
    end function hipPointerGetAttributes

    !---------------------------------------------
    ! hipPointerGetAttribute
    !---------------------------------------------
    !> @brief Returns information about the specified pointer.[BETA]
    !>
    !> @param [in, out] data     Returned pointer attribute value
    !> @param [in]      attribute  Attribute to query for
    !> @param [in]      ptr      Pointer to get attributes for
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @see hipPointerGetAttributes
    function hipPointerGetAttribute(data, attribute, ptr) &
       result(PointerGetAttribute) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaPointerGetAttribute")
#else
       bind(C, name="hipPointerGetAttribute")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: data
       integer(c_int), value :: attribute
       type(c_ptr), value :: ptr
       integer(c_int) :: PointerGetAttribute
    end function hipPointerGetAttribute

    !---------------------------------------------
    ! hipDrvPointerGetAttributes
    !---------------------------------------------
    !> @brief Returns information about the specified pointer.[BETA]
    !>
    !> @param [in]  numAttributes   number of attributes to query for
    !> @param [in]  attributes      attributes to query for
    !> @param [in, out] data        a two-dimensional containing pointers to memory locations
    !> where the result of each attribute query will be written to
    !> @param [in]  ptr             pointer to get attributes for
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @see hipPointerGetAttribute
    function hipDrvPointerGetAttributes(numAttributes, attributes, data, ptr) &
       result(DrvPointerGetAttributes) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDrvPointerGetAttributes")
#else
       bind(C, name="hipDrvPointerGetAttributes")
#endif
       import :: c_int, c_ptr
       integer(c_int), value :: numAttributes
       integer(c_int) :: attributes(*)
       type(c_ptr) :: data
       type(c_ptr), value :: ptr
       integer(c_int) :: DrvPointerGetAttributes
    end function hipDrvPointerGetAttributes

    !---------------------------------------------
    ! hipImportExternalSemaphore
    !---------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> @defgroup External External Resource Interoperability
    !>
    !> @ingroup API
    !>
    !> This section describes the external resource interoperability functions of HIP runtime API.
    !>
    !>
    !>
    !> @brief Imports an external semaphore.
    !>
    !> @param[out] extSem_out  External semaphores to be waited on
    !> @param[in] semHandleDesc Semaphore import handle descriptor
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @see
    !>
    !> @note  This API is currently not supported on Linux.
    function hipImportExternalSemaphore(extSem_out, semHandleDesc) &
       result(ImportExternalSemaphore) &
       bind(C, name="hipImportExternalSemaphore")
       import :: c_ptr, c_int
       type(c_ptr) :: extSem_out
       type(c_ptr), value :: semHandleDesc
       integer(c_int) :: ImportExternalSemaphore
    end function hipImportExternalSemaphore

    !---------------------------------------------
    ! hipSignalExternalSemaphoresAsync
    !---------------------------------------------
    !> @brief Signals a set of external semaphore objects.
    !>
    !> @param[in] extSemArray  External semaphores to be waited on
    !> @param[in] paramsArray Array of semaphore parameters
    !> @param[in] numExtSems Number of semaphores to wait on
    !> @param[in] stream Stream to enqueue the wait operations in
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @see
    !>
    !> @note  This API is currently not supported on Linux.
    function hipSignalExternalSemaphoresAsync(extSemArray, paramsArray, numExtSems, stream) &
       result(SignalExternalSemaphoresAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaSignalExternalSemaphoresAsync")
#else
       bind(C, name="hipSignalExternalSemaphoresAsync")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: extSemArray
       type(c_ptr), value :: paramsArray
       integer(c_int), value :: numExtSems
       type(c_ptr), value :: stream
       integer(c_int) :: SignalExternalSemaphoresAsync
    end function hipSignalExternalSemaphoresAsync

    !---------------------------------------------
    ! hipWaitExternalSemaphoresAsync
    !---------------------------------------------
    !> @brief Waits on a set of external semaphore objects
    !>
    !> @param[in] extSemArray  External semaphores to be waited on
    !> @param[in] paramsArray Array of semaphore parameters
    !> @param[in] numExtSems Number of semaphores to wait on
    !> @param[in] stream Stream to enqueue the wait operations in
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @see
    !>
    !> @note  This API is currently not supported on Linux.
    function hipWaitExternalSemaphoresAsync(extSemArray, paramsArray, numExtSems, stream) &
       result(WaitExternalSemaphoresAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaWaitExternalSemaphoresAsync")
#else
       bind(C, name="hipWaitExternalSemaphoresAsync")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: extSemArray
       type(c_ptr), value :: paramsArray
       integer(c_int), value :: numExtSems
       type(c_ptr), value :: stream
       integer(c_int) :: WaitExternalSemaphoresAsync
    end function hipWaitExternalSemaphoresAsync

    !---------------------------------------------
    ! hipDestroyExternalSemaphore
    !---------------------------------------------
    !> @brief Destroys an external semaphore object and releases any references to the underlying
    !> resource. Any outstanding signals or waits must have completed before the semaphore is
    !> destroyed.
    !>
    !> @param[in] extSem handle to an external memory object
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @see
    !>
    !> @note  This API is currently not supported on Linux.
    function hipDestroyExternalSemaphore(extSem) &
       result(DestroyExternalSemaphore) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDestroyExternalSemaphore")
#else
       bind(C, name="hipDestroyExternalSemaphore")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: extSem
       integer(c_int) :: DestroyExternalSemaphore
    end function hipDestroyExternalSemaphore

    !---------------------------------------------
    ! hipImportExternalMemory
    !---------------------------------------------
    !> @brief Imports an external memory object.
    !>
    !> @param[out] extMem_out  Returned handle to an external memory object
    !> @param[in]  memHandleDesc Memory import handle descriptor
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @see
    function hipImportExternalMemory(extMem_out, memHandleDesc) &
       result(ImportExternalMemory) &
       bind(C, name="hipImportExternalMemory")
       import :: c_ptr, c_int
       type(c_ptr) :: extMem_out
       type(c_ptr), value :: memHandleDesc
       integer(c_int) :: ImportExternalMemory
    end function hipImportExternalMemory

    !---------------------------------------------
    ! hipExternalMemoryGetMappedBuffer
    !---------------------------------------------
    !> @brief Maps a buffer onto an imported memory object.
    !>
    !> @param[out] devPtr Returned device pointer to buffer
    !> @param[in]  extMem  Handle to external memory object
    !> @param[in]  bufferDesc  Buffer descriptor
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @see
    function hipExternalMemoryGetMappedBuffer(devPtr, extMem, bufferDesc) &
       result(ExternalMemoryGetMappedBuffer) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaExternalMemoryGetMappedBuffer")
#else
       bind(C, name="hipExternalMemoryGetMappedBuffer")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: devPtr
       type(c_ptr), value :: extMem
       type(c_ptr), value :: bufferDesc
       integer(c_int) :: ExternalMemoryGetMappedBuffer
    end function hipExternalMemoryGetMappedBuffer

    !---------------------------------------------
    ! hipDestroyExternalMemory
    !---------------------------------------------
    !> @brief Destroys an external memory object.
    !>
    !> @param[in] extMem  External memory object to be destroyed
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    !>
    !> @see
    function hipDestroyExternalMemory(extMem) &
       result(DestroyExternalMemory) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDestroyExternalMemory")
#else
       bind(C, name="hipDestroyExternalMemory")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: extMem
       integer(c_int) :: DestroyExternalMemory
    end function hipDestroyExternalMemory

    !---------------------------------------------
    ! hipExternalMemoryGetMappedMipmappedArray
    !---------------------------------------------
    !> @brief Maps a mipmapped array onto an external memory object.
    !>
    !> @param[out] mipmap mipmapped array to return
    !> @param[in]  extMem external memory object handle
    !> @param[in]  mipmapDesc external mipmapped array descriptor
    !>
    !> Returned mipmapped array must be freed using hipFreeMipmappedArray.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidResourceHandle
    !>
    !> @see hipImportExternalMemory, hipDestroyExternalMemory, hipExternalMemoryGetMappedBuffer,
    !> hipFreeMipmappedArray
    function hipExternalMemoryGetMappedMipmappedArray(mipmap, extMem, mipmapDesc) &
       result(ExternalMemoryGetMappedMipmappedArray) &
       bind(C, name="hipExternalMemoryGetMappedMipmappedArray")
       import :: c_ptr, c_int
       type(c_ptr) :: mipmap
       type(c_ptr), value :: extMem
       type(c_ptr), value :: mipmapDesc
       integer(c_int) :: ExternalMemoryGetMappedMipmappedArray
    end function hipExternalMemoryGetMappedMipmappedArray

    !---------------------------------------------
    ! hipExtMallocWithFlags
    !---------------------------------------------
    !> @brief Allocate memory on the default accelerator
    !>
    !> @param[out] ptr  Pointer to the allocated memory
    !> @param[in]  sizeBytes  Requested memory size
    !> @param[in]  flags  Type of memory allocation
    !>
    !> If requested memory size is 0, no memory is allocated, *ptr returns nullptr, and #hipSuccess
    !> is returned.
    !>
    !> The memory allocation flag should be either #hipDeviceMallocDefault,
    !> #hipDeviceMallocFinegrained, #hipDeviceMallocUncached, or #hipMallocSignalMemory.
    !> If the flag is any other value, the API returns #hipErrorInvalidValue.
    !>
    !> @returns #hipSuccess, #hipErrorOutOfMemory, #hipErrorInvalidValue (bad context, null *ptr)
    !>
    !> @see hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D, hipMalloc3DArray,
    !> hipHostFree, hiHostMalloc
    function hipExtMallocWithFlags(ptr, sizeBytes, flags) &
       result(ExtMallocWithFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaExtMallocWithFlags")
#else
       bind(C, name="hipExtMallocWithFlags")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: ptr
       integer(c_long), value :: sizeBytes
       integer(c_int), value :: flags
       integer(c_int) :: ExtMallocWithFlags
    end function hipExtMallocWithFlags

    !---------------------------------------------
    ! hipMallocHost
    !---------------------------------------------
    !> @brief Allocate pinned host memory [Deprecated]
    !>
    !> @param[out] ptr Pointer to the allocated host pinned memory
    !> @param[in]  size Requested memory size
    !>
    !> If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
    !>
    !> @returns #hipSuccess, #hipErrorOutOfMemory
    !>
    !> @warning  This API is deprecated, use hipHostMalloc() instead
    function hipMallocHost(ptr, size) &
       result(MallocHost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMallocHost")
#else
       bind(C, name="hipMallocHost")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: ptr
       integer(c_long), value :: size
       integer(c_int) :: MallocHost
    end function hipMallocHost

    !---------------------------------------------
    ! hipMemAllocHost
    !---------------------------------------------
    !> @brief Allocate pinned host memory [Deprecated]
    !>
    !> @param[out] ptr Pointer to the allocated host pinned memory
    !> @param[in]  size Requested memory size
    !>
    !> If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
    !>
    !> @returns #hipSuccess, #hipErrorOutOfMemory
    !>
    !> @warning  This API is deprecated, use hipHostMalloc() instead
    function hipMemAllocHost(ptr, size) &
       result(MemAllocHost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemAllocHost")
#else
       bind(C, name="hipMemAllocHost")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: ptr
       integer(c_long), value :: size
       integer(c_int) :: MemAllocHost
    end function hipMemAllocHost

    !---------------------------------------------
    ! hipHostMalloc
    !---------------------------------------------
    !> @brief Allocates device accessible page locked (pinned) host memory
    !>
    !> This API allocates pinned host memory which is mapped into the address space of all GPUs
    !> in the system, the memory can be accessed directly by the GPU device, and can be read or
    !> written with much higher bandwidth than pageable memory obtained with functions such as
    !> malloc().
    !>
    !> Using the pinned host memory, applications can implement faster data transfers for
    !> HostToDevice
    !> and DeviceToHost. The runtime tracks the hipHostMalloc allocations and can avoid some of the
    !> setup required for regular unpinned memory.
    !>
    !> When the memory accesses are infrequent, zero-copy memory can be a good choice, for coherent
    !> allocation. GPU can directly access the host memory over the CPU/GPU interconnect, without
    !> need
    !> to copy the data.
    !>
    !> Currently the allocation granularity is 4KB for the API.
    !>
    !> Developers need to choose proper allocation flag with consideration of synchronization.
    !>
    !> @param[out] ptr Pointer to the allocated host pinned memory
    !> @param[in]  size Requested memory size in bytes
    !> If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
    !> @param[in]  flags Type of host memory allocation. See the description of flags in
    !> hipSetDeviceFlags.
    !>
    !> If no input for flags, it will be the default pinned memory allocation on the host.
    !>
    !> @returns #hipSuccess, #hipErrorOutOfMemory
    !>
    !>
    !> @see hipSetDeviceFlags, hiptHostFree
    function hipHostMalloc(ptr, size, flags) &
       result(HostMalloc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaHostMalloc")
#else
       bind(C, name="hipHostMalloc")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: ptr
       integer(c_long), value :: size
       integer(c_int), value :: flags
       integer(c_int) :: HostMalloc
    end function hipHostMalloc

    !---------------------------------------------
    ! hipMallocManaged
    !---------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> @defgroup MemoryM Managed Memory
    !>
    !> @ingroup Memory
    !>
    !> This section describes the managed memory management functions of HIP runtime API.
    !>
    !> @note  The managed memory management APIs are implemented on Linux, under developement
    !> on Windows.
    !>
    !>
    !>
    !> @brief Allocates memory that will be automatically managed by HIP.
    !>
    !> This API is used for managed memory, allows data be shared and accessible to both CPU and
    !> GPU using a single pointer.
    !>
    !> The API returns the allocation pointer, managed by HMM, can be used further to execute
    !> kernels
    !> on device and fetch data between the host and device as needed.
    !>
    !> If HMM is not supported, the function behaves the same as @p hipMallocHost .
    !>
    !> @note   It is recommend to do the capability check before call this API.
    !>
    !> @param [out] dev_ptr - pointer to allocated device memory
    !> @param [in]  size    - requested allocation size in bytes, it should be granularity of 4KB
    !> @param [in]  flags   - must be either hipMemAttachGlobal or hipMemAttachHost
    !> (defaults to hipMemAttachGlobal)
    !>
    !> @returns #hipSuccess, #hipErrorMemoryAllocation, #hipErrorNotSupported, #hipErrorInvalidValue
    function hipMallocManaged(dev_ptr, size, flags) &
       result(MallocManaged) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMallocManaged")
#else
       bind(C, name="hipMallocManaged")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: dev_ptr
       integer(c_long), value :: size
       integer(c_int), value :: flags
       integer(c_int) :: MallocManaged
    end function hipMallocManaged

    !---------------------------------------------
    ! hipMemPrefetchAsync
    !---------------------------------------------
    !> @brief Prefetches memory to the specified destination device using HIP.
    !>
    !> @param [in] dev_ptr  pointer to be prefetched
    !> @param [in] count    size in bytes for prefetching
    !> @param [in] device   destination device to prefetch to
    !> @param [in] stream   stream to enqueue prefetch operation
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPrefetchAsync(dev_ptr, count, device, stream) &
       result(MemPrefetchAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPrefetchAsync")
#else
       bind(C, name="hipMemPrefetchAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dev_ptr
       integer(c_long), value :: count
       integer(c_int), value :: device
       type(c_ptr), value :: stream
       integer(c_int) :: MemPrefetchAsync
    end function hipMemPrefetchAsync

    !---------------------------------------------
    ! hipMemPrefetchAsync_v2
    !---------------------------------------------
    !> @brief Prefetches memory to the specified destination device using HIP.
    !>
    !> @param [in] dev_ptr    pointer to be prefetched
    !> @param [in] count      size in bytes for prefetching
    !> @param [in] location   destination location to prefetch to
    !> @param [in] flags      flags for future use, must be zero now.
    !> @param [in] stream     stream to enqueue prefetch operation
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPrefetchAsync_v2(dev_ptr, count, location, flags, stream) &
       result(MemPrefetchAsync_v2) &
       bind(C, name="hipMemPrefetchAsync_v2")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dev_ptr
       integer(c_long), value :: count
       type(c_ptr), value :: location
       integer(c_int), value :: flags
       type(c_ptr), value :: stream
       integer(c_int) :: MemPrefetchAsync_v2
    end function hipMemPrefetchAsync_v2

    !---------------------------------------------
    ! hipMemAdvise
    !---------------------------------------------
    !> @brief Advise about the usage of a given memory range to HIP.
    !>
    !> @param [in] dev_ptr  pointer to memory to set the advice for
    !> @param [in] count    size in bytes of the memory range, it should be CPU page size alligned.
    !> @param [in] advice   advice to be applied for the specified memory range
    !> @param [in] device   device to apply the advice for
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> This HIP API advises about the usage to be applied on unified memory allocation in the
    !> range starting from the pointer address devPtr, with the size of count bytes.
    !> The memory range must refer to managed memory allocated via the API hipMallocManaged, and the
    !> range will be handled with proper round down and round up respectively in the driver to
    !> be aligned to CPU page size, the same way as corresponding CUDA API behaves in CUDA version
    !> 8.0
    !> and afterwards.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemAdvise(dev_ptr, count, advice, device) &
       result(MemAdvise) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemAdvise")
#else
       bind(C, name="hipMemAdvise")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dev_ptr
       integer(c_long), value :: count
       integer(c_int), value :: advice
       integer(c_int), value :: device
       integer(c_int) :: MemAdvise
    end function hipMemAdvise

    !---------------------------------------------
    ! hipMemAdvise_v2
    !---------------------------------------------
    !> @brief Advise about the usage of a given memory range to HIP.
    !>
    !> @param [in] dev_ptr    pointer to memory to set the advice for
    !> @param [in] count size in bytes of the memory range, it should be CPU page size alligned.
    !> @param [in] advice     advice to be applied for the specified memory range
    !> @param [in] location   location to apply the advice for
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> This HIP API advises about the usage to be applied on unified memory allocation in the
    !> range starting from the pointer address devPtr, with the size of count bytes.
    !> The memory range must refer to managed memory allocated via the API hipMallocManaged, and the
    !> range will be handled with proper round down and round up respectively in the driver to
    !> be aligned to CPU page size, the same way as corresponding CUDA API behaves in CUDA version
    !> 8.0
    !> and afterwards.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemAdvise_v2(dev_ptr, count, advice, location) &
       result(MemAdvise_v2) &
       bind(C, name="hipMemAdvise_v2")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dev_ptr
       integer(c_long), value :: count
       integer(c_int), value :: advice
       type(c_ptr), value :: location
       integer(c_int) :: MemAdvise_v2
    end function hipMemAdvise_v2

    !---------------------------------------------
    ! hipMemRangeGetAttribute
    !---------------------------------------------
    !> @brief Query an attribute of a given memory range in HIP.
    !>
    !> @param [in,out] data   a pointer to a memory location where the result of each
    !> attribute query will be written to
    !> @param [in] data_size  the size of data
    !> @param [in] attribute  the attribute to query
    !> @param [in] dev_ptr    start of the range to query
    !> @param [in] count      size of the range to query
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemRangeGetAttribute(data, data_size, attribute, dev_ptr, count) &
       result(MemRangeGetAttribute) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemRangeGetAttribute")
#else
       bind(C, name="hipMemRangeGetAttribute")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: data
       integer(c_long), value :: data_size
       integer(c_int), value :: attribute
       type(c_ptr), value :: dev_ptr
       integer(c_long), value :: count
       integer(c_int) :: MemRangeGetAttribute
    end function hipMemRangeGetAttribute

    !---------------------------------------------
    ! hipMemRangeGetAttributes
    !---------------------------------------------
    !> @brief Query attributes of a given memory range in HIP.
    !>
    !> @param [in,out] data     a two-dimensional array containing pointers to memory locations
    !> where the result of each attribute query will be written to
    !> @param [in] data_sizes   an array, containing the sizes of each result
    !> @param [in] attributes   the attribute to query
    !> @param [in] num_attributes  an array of attributes to query (numAttributes and the number
    !> of attributes in this array should match)
    !> @param [in] dev_ptr      start of the range to query
    !> @param [in] count        size of the range to query
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemRangeGetAttributes(data, data_sizes, attributes, num_attributes, dev_ptr, &
                                      count) &
       result(MemRangeGetAttributes) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemRangeGetAttributes")
#else
       bind(C, name="hipMemRangeGetAttributes")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr) :: data
       type(c_ptr), value :: data_sizes
       integer(c_int) :: attributes(*)
       integer(c_long), value :: num_attributes
       type(c_ptr), value :: dev_ptr
       integer(c_long), value :: count
       integer(c_int) :: MemRangeGetAttributes
    end function hipMemRangeGetAttributes

    !---------------------------------------------
    ! hipStreamAttachMemAsync
    !---------------------------------------------
    !> @brief Attach memory to a stream asynchronously in HIP.
    !>
    !> @param [in] stream     - stream in which to enqueue the attach operation
    !> @param [in] dev_ptr    - pointer to memory (must be a pointer to managed memory or
    !> to a valid host-accessible region of system-allocated memory)
    !> @param [in] length     - length of memory (defaults to zero)
    !> @param [in] flags      - must be one of hipMemAttachGlobal, hipMemAttachHost or
    !> hipMemAttachSingle (defaults to hipMemAttachSingle)
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning This API is under development. Currently it is a no-operation (NOP)
    !> function on AMD GPUs and returns #hipSuccess.
    function hipStreamAttachMemAsync(stream, dev_ptr, length, flags) &
       result(StreamAttachMemAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamAttachMemAsync")
#else
       bind(C, name="hipStreamAttachMemAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: dev_ptr
       integer(c_long), value :: length
       integer(c_int), value :: flags
       integer(c_int) :: StreamAttachMemAsync
    end function hipStreamAttachMemAsync

    !---------------------------------------------
    ! hipMallocAsync
    !---------------------------------------------
    !> @brief Allocates memory with stream ordered semantics
    !>
    !> Inserts a memory allocation operation into @p stream.
    !> A pointer to the allocated memory is returned immediately in *dptr.
    !> The allocation must not be accessed until the allocation operation completes.
    !> The allocation comes from the memory pool associated with the stream's device.
    !>
    !> @note The default memory pool of a device contains device memory from that device.
    !> @note Basic stream ordering allows future work submitted into the same stream to use the
    !> allocation. Stream query, stream synchronize, and HIP events can be used to guarantee that
    !> the allocation operation completes before work submitted in a separate stream runs.
    !> @note During stream capture, this function results in the creation of an allocation node.
    !> In this case, the allocation is owned by the graph instead of the memory pool. The memory
    !> pool's properties are used to set the node's creation parameters.
    !>
    !> @param [out] dev_ptr  Returned device pointer of memory allocation
    !> @param [in] size      Number of bytes to allocate
    !> @param [in] stream    The stream establishing the stream ordering contract and
    !> the memory pool to allocate from
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported, #hipErrorOutOfMemory
    !>
    !> @see hipMallocFromPoolAsync, hipFreeAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMallocAsync(dev_ptr, size, stream) &
       result(MallocAsync) &
       bind(C, name="hipMallocAsync")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: dev_ptr
       integer(c_long), value :: size
       type(c_ptr), value :: stream
       integer(c_int) :: MallocAsync
    end function hipMallocAsync

    !---------------------------------------------
    ! hipFreeAsync
    !---------------------------------------------
    !> @brief Frees memory with stream ordered semantics
    !>
    !> Inserts a free operation into @p stream.
    !> The allocation must not be used after stream execution reaches the free.
    !> After this API returns, accessing the memory from any subsequent work launched on the GPU
    !> or querying its pointer attributes results in undefined behavior.
    !>
    !> @note During stream capture, this function results in the creation of a free node and
    !> must therefore be passed the address of a graph allocation.
    !>
    !> @param [in] dev_ptr Pointer to device memory to free
    !> @param [in] stream The stream, where the destruciton will occur according to the execution
    !> order
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipFreeAsync(dev_ptr, stream) &
       result(FreeAsync) &
       bind(C, name="hipFreeAsync")
       import :: c_ptr, c_int
       type(c_ptr), value :: dev_ptr
       type(c_ptr), value :: stream
       integer(c_int) :: FreeAsync
    end function hipFreeAsync

    !---------------------------------------------
    ! hipMemPoolTrimTo
    !---------------------------------------------
    !> @brief Releases freed memory back to the OS
    !>
    !> Releases memory back to the OS until the pool contains fewer than @p min_bytes_to_keep
    !> reserved bytes, or there is no more memory that the allocator can safely release.
    !> The allocator cannot release OS allocations that back outstanding asynchronous allocations.
    !> The OS allocations may happen at different granularity from the user allocations.
    !>
    !> @note Allocations that have not been freed count as outstanding.
    !> @note Allocations that have been asynchronously freed but whose completion has
    !> not been observed on the host (eg. by a synchronize) can count as outstanding.
    !>
    !> @param[in] mem_pool          The memory pool to trim allocations
    !> @param[in] min_bytes_to_hold If the pool has less than min_bytes_to_hold reserved,
    !> then the TrimTo operation is a no-op.  Otherwise the memory pool will contain
    !> at least min_bytes_to_hold bytes reserved after the operation.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolTrimTo(mem_pool, min_bytes_to_hold) &
       result(MemPoolTrimTo) &
       bind(C, name="hipMemPoolTrimTo")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: mem_pool
       integer(c_long), value :: min_bytes_to_hold
       integer(c_int) :: MemPoolTrimTo
    end function hipMemPoolTrimTo

    !---------------------------------------------
    ! hipMemPoolSetAttribute
    !---------------------------------------------
    !> @brief Sets attributes of a memory pool
    !>
    !> Supported attributes are:
    !> - @p hipMemPoolAttrReleaseThreshold: (value type = cuuint64_t)
    !> Amount of reserved memory in bytes to hold onto before trying
    !> to release memory back to the OS. When more than the release
    !> threshold bytes of memory are held by the memory pool, the
    !> allocator will try to release memory back to the OS on the
    !> next call to stream, event or context synchronize. (default 0)
    !> - @p hipMemPoolReuseFollowEventDependencies: (value type = int)
    !> Allow @p hipMallocAsync to use memory asynchronously freed
    !> in another stream as long as a stream ordering dependency
    !> of the allocating stream on the free action exists.
    !> HIP events and null stream interactions can create the required
    !> stream ordered dependencies. (default enabled)
    !> - @p hipMemPoolReuseAllowOpportunistic: (value type = int)
    !> Allow reuse of already completed frees when there is no
    !> dependency between the free and allocation. (default enabled)
    !> - @p hipMemPoolReuseAllowInternalDependencies: (value type = int)
    !> Allow @p hipMallocAsync to insert new stream dependencies
    !> in order to establish the stream ordering required to reuse
    !> a piece of memory released by @p hipFreeAsync (default enabled).
    !>
    !> @param [in] mem_pool The memory pool to modify
    !> @param [in] attr     The attribute to modify
    !> @param [in] value    Pointer to the value to assign
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolSetAttribute(mem_pool, attr, value) &
       result(MemPoolSetAttribute) &
       bind(C, name="hipMemPoolSetAttribute")
       import :: c_ptr, c_int
       type(c_ptr), value :: mem_pool
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: MemPoolSetAttribute
    end function hipMemPoolSetAttribute

    !---------------------------------------------
    ! hipMemPoolGetAttribute
    !---------------------------------------------
    !> @brief Gets attributes of a memory pool
    !>
    !> Supported attributes are:
    !> - @p hipMemPoolAttrReleaseThreshold: (value type = cuuint64_t)
    !> Amount of reserved memory in bytes to hold onto before trying
    !> to release memory back to the OS. When more than the release
    !> threshold bytes of memory are held by the memory pool, the
    !> allocator will try to release memory back to the OS on the
    !> next call to stream, event or context synchronize. (default 0)
    !> - @p hipMemPoolReuseFollowEventDependencies: (value type = int)
    !> Allow @p hipMallocAsync to use memory asynchronously freed
    !> in another stream as long as a stream ordering dependency
    !> of the allocating stream on the free action exists.
    !> HIP events and null stream interactions can create the required
    !> stream ordered dependencies. (default enabled)
    !> - @p hipMemPoolReuseAllowOpportunistic: (value type = int)
    !> Allow reuse of already completed frees when there is no
    !> dependency between the free and allocation. (default enabled)
    !> - @p hipMemPoolReuseAllowInternalDependencies: (value type = int)
    !> Allow @p hipMallocAsync to insert new stream dependencies
    !> in order to establish the stream ordering required to reuse
    !> a piece of memory released by @p hipFreeAsync (default enabled).
    !>
    !> @param [in] mem_pool The memory pool to get attributes of
    !> @param [in] attr     The attribute to get
    !> @param [in] value    Retrieved value
    !>
    !> @returns  #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync,
    !> hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess,
    !> hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolGetAttribute(mem_pool, attr, value) &
       result(MemPoolGetAttribute) &
       bind(C, name="hipMemPoolGetAttribute")
       import :: c_ptr, c_int
       type(c_ptr), value :: mem_pool
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: MemPoolGetAttribute
    end function hipMemPoolGetAttribute

    !---------------------------------------------
    ! hipMemPoolSetAccess
    !---------------------------------------------
    !> @brief Controls visibility of the specified pool between devices
    !>
    !> @param [in] mem_pool   Memory pool for acccess change
    !> @param [in] desc_list  Array of access descriptors. Each descriptor instructs the access to
    !> enable for a single gpu
    !> @param [in] count  Number of descriptors in the map array.
    !>
    !> @returns  #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolSetAccess(mem_pool, desc_list, count) &
       result(MemPoolSetAccess) &
       bind(C, name="hipMemPoolSetAccess")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: mem_pool
       type(c_ptr), value :: desc_list
       integer(c_long), value :: count
       integer(c_int) :: MemPoolSetAccess
    end function hipMemPoolSetAccess

    !---------------------------------------------
    ! hipMemPoolGetAccess
    !---------------------------------------------
    !> @brief Returns the accessibility of a pool from a device
    !>
    !> Returns the accessibility of the pool's memory from the specified location.
    !>
    !> @param [out] flags    Accessibility of the memory pool from the specified location/device
    !> @param [in] mem_pool   Memory pool being queried
    !> @param [in] location  Location/device for memory pool access
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolGetAccess(flags, mem_pool, location) &
       result(MemPoolGetAccess) &
       bind(C, name="hipMemPoolGetAccess")
       import :: c_int, c_ptr
       integer(c_int) :: flags(*)
       type(c_ptr), value :: mem_pool
       type(c_ptr), value :: location
       integer(c_int) :: MemPoolGetAccess
    end function hipMemPoolGetAccess

    !---------------------------------------------
    ! hipMemPoolCreate
    !---------------------------------------------
    !> @brief Creates a memory pool
    !>
    !> Creates a HIP memory pool and returns the handle in @p mem_pool. The @p pool_props determines
    !> the properties of the pool such as the backing device and IPC capabilities.
    !>
    !> By default, the memory pool will be accessible from the device it is allocated on.
    !>
    !> @param [out] mem_pool    Contains createed memory pool
    !> @param [in] pool_props   Memory pool properties
    !>
    !> @note Specifying hipMemHandleTypeNone creates a memory pool that will not support IPC.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipMemPoolDestroy, hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute,
    !> hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolCreate(mem_pool, pool_props) &
       result(MemPoolCreate) &
       bind(C, name="hipMemPoolCreate")
       import :: c_ptr, c_int
       type(c_ptr) :: mem_pool
       type(c_ptr), value :: pool_props
       integer(c_int) :: MemPoolCreate
    end function hipMemPoolCreate

    !---------------------------------------------
    ! hipMemPoolDestroy
    !---------------------------------------------
    !> @brief Destroys the specified memory pool
    !>
    !> If any pointers obtained from this pool haven't been freed or
    !> the pool has free operations that haven't completed
    !> when @p hipMemPoolDestroy is invoked, the function will return immediately and the
    !> resources associated with the pool will be released automatically
    !> once there are no more outstanding allocations.
    !>
    !> Destroying the current mempool of a device sets the default mempool of
    !> that device as the current mempool for that device.
    !>
    !> @param [in] mem_pool Memory pool for destruction
    !>
    !> @note A device's default memory pool cannot be destroyed.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipMemPoolCreate hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute,
    !> hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolDestroy(mem_pool) &
       result(MemPoolDestroy) &
       bind(C, name="hipMemPoolDestroy")
       import :: c_ptr, c_int
       type(c_ptr), value :: mem_pool
       integer(c_int) :: MemPoolDestroy
    end function hipMemPoolDestroy

    !---------------------------------------------
    ! hipMallocFromPoolAsync
    !---------------------------------------------
    !> @brief Allocates memory from a specified pool with stream ordered semantics.
    !>
    !> Inserts an allocation operation into @p stream.
    !> A pointer to the allocated memory is returned immediately in @p dev_ptr.
    !> The allocation must not be accessed until the allocation operation completes.
    !> The allocation comes from the specified memory pool.
    !>
    !> @note The specified memory pool may be from a device different than that of the specified @p
    !> stream.
    !>
    !> Basic stream ordering allows future work submitted into the same stream to use the
    !> allocation.
    !> Stream query, stream synchronize, and HIP events can be used to guarantee that the allocation
    !> operation completes before work submitted in a separate stream runs.
    !>
    !> @note During stream capture, this function results in the creation of an allocation node. In
    !> this
    !> case, the allocation is owned by the graph instead of the memory pool. The memory pool's
    !> properties are used to set the node's creation parameters.
    !>
    !> @param [out] dev_ptr Returned device pointer
    !> @param [in] size     Number of bytes to allocate
    !> @param [in] mem_pool The pool to allocate from
    !> @param [in] stream   The stream establishing the stream ordering semantic
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported, #hipErrorOutOfMemory
    !>
    !> @see hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute, hipMemPoolCreate
    !> hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess,
    !> hipMemPoolGetAccess,
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMallocFromPoolAsync(dev_ptr, size, mem_pool, stream) &
       result(MallocFromPoolAsync) &
       bind(C, name="hipMallocFromPoolAsync")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: dev_ptr
       integer(c_long), value :: size
       type(c_ptr), value :: mem_pool
       type(c_ptr), value :: stream
       integer(c_int) :: MallocFromPoolAsync
    end function hipMallocFromPoolAsync

    !---------------------------------------------
    ! hipMemPoolExportToShareableHandle
    !---------------------------------------------
    !> @brief Exports a memory pool to the requested handle type.
    !>
    !> Given an IPC capable mempool, create an OS handle to share the pool with another process.
    !> A recipient process can convert the shareable handle into a mempool with @p
    !> hipMemPoolImportFromShareableHandle. Individual pointers can then be shared with the @p
    !> hipMemPoolExportPointer and @p hipMemPoolImportPointer APIs. The implementation of what the
    !> shareable handle is and how it can be transferred is defined by the requested handle type.
    !>
    !> @note To create an IPC capable mempool, create a mempool with a @p hipMemAllocationHandleType
    !> other than @p hipMemHandleTypeNone.
    !>
    !> @param [out] shared_handle Pointer to the location in which to store the requested handle
    !> @param [in] mem_pool       Pool to export
    !> @param [in] handle_type    The type of handle to create
    !> @param [in] flags          Must be 0
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorOutOfMemory
    !>
    !> @see hipMemPoolImportFromShareableHandle
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolExportToShareableHandle(shared_handle, mem_pool, handle_type, flags) &
       result(MemPoolExportToShareableHandle) &
       bind(C, name="hipMemPoolExportToShareableHandle")
       import :: c_ptr, c_int
       type(c_ptr), value :: shared_handle
       type(c_ptr), value :: mem_pool
       integer(c_int), value :: handle_type
       integer(c_int), value :: flags
       integer(c_int) :: MemPoolExportToShareableHandle
    end function hipMemPoolExportToShareableHandle

    !---------------------------------------------
    ! hipMemPoolImportFromShareableHandle
    !---------------------------------------------
    !> @brief Imports a memory pool from a shared handle.
    !>
    !> Specific allocations can be imported from the imported pool with @p hipMemPoolImportPointer.
    !>
    !> @note Imported memory pools do not support creating new allocations.
    !> As such imported memory pools may not be used in @p hipDeviceSetMemPool
    !> or @p hipMallocFromPoolAsync calls.
    !>
    !> @param [out] mem_pool     Returned memory pool
    !> @param [in] shared_handle OS handle of the pool to open
    !> @param [in] handle_type   The type of handle being imported
    !> @param [in] flags         Must be 0
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorOutOfMemory
    !>
    !> @see hipMemPoolExportToShareableHandle
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolImportFromShareableHandle(mem_pool, shared_handle, handle_type, flags) &
       result(MemPoolImportFromShareableHandle) &
       bind(C, name="hipMemPoolImportFromShareableHandle")
       import :: c_ptr, c_int
       type(c_ptr) :: mem_pool
       type(c_ptr), value :: shared_handle
       integer(c_int), value :: handle_type
       integer(c_int), value :: flags
       integer(c_int) :: MemPoolImportFromShareableHandle
    end function hipMemPoolImportFromShareableHandle

    !---------------------------------------------
    ! hipMemPoolExportPointer
    !---------------------------------------------
    !> @brief Export data to share a memory pool allocation between processes.
    !>
    !> Constructs @p export_data for sharing a specific allocation from an already shared memory
    !> pool.
    !> The recipient process can import the allocation with the @p hipMemPoolImportPointer api.
    !> The data is not a handle and may be shared through any IPC mechanism.
    !>
    !> @param[out] export_data  Returned export data
    !> @param[in] dev_ptr       Pointer to memory being exported
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorOutOfMemory
    !>
    !> @see hipMemPoolImportPointer
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolExportPointer(export_data, dev_ptr) &
       result(MemPoolExportPointer) &
       bind(C, name="hipMemPoolExportPointer")
       import :: c_ptr, c_int
       type(c_ptr), value :: export_data
       type(c_ptr), value :: dev_ptr
       integer(c_int) :: MemPoolExportPointer
    end function hipMemPoolExportPointer

    !---------------------------------------------
    ! hipMemPoolImportPointer
    !---------------------------------------------
    !> @brief Import a memory pool allocation from another process.
    !>
    !> Returns in @p dev_ptr a pointer to the imported memory.
    !> The imported memory must not be accessed before the allocation operation completes
    !> in the exporting process. The imported memory must be freed from all importing processes
    !> before
    !> being freed in the exporting process. The pointer may be freed with @p hipFree
    !> or @p hipFreeAsync. If @p hipFreeAsync is used, the free must be completed
    !> on the importing process before the free operation on the exporting process.
    !>
    !> @note The @p hipFreeAsync api may be used in the exporting process before
    !> the @p hipFreeAsync operation completes in its stream as long as the
    !> @p hipFreeAsync in the exporting process specifies a stream with
    !> a stream dependency on the importing process's @p hipFreeAsync.
    !>
    !> @param [out] dev_ptr     Pointer to imported memory
    !> @param [in] mem_pool     Memory pool from which to import a pointer
    !> @param [in] export_data  Data specifying the memory to import
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized, #hipErrorOutOfMemory
    !>
    !> @see hipMemPoolExportPointer
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolImportPointer(dev_ptr, mem_pool, export_data) &
       result(MemPoolImportPointer) &
       bind(C, name="hipMemPoolImportPointer")
       import :: c_ptr, c_int
       type(c_ptr) :: dev_ptr
       type(c_ptr), value :: mem_pool
       type(c_ptr), value :: export_data
       integer(c_int) :: MemPoolImportPointer
    end function hipMemPoolImportPointer

    !---------------------------------------------
    ! hipHostAlloc
    !---------------------------------------------
    !> @brief Allocate device accessible page locked host memory
    !>
    !> @param[out] ptr Pointer to the allocated host pinned memory
    !> @param[in]  size Requested memory size in bytes
    !> @param[in]  flags Type of host memory allocation see below
    !>
    !> If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
    !>
    !> Flags:
    !> - #hipHostAllocDefault   Default pinned memory allocation on the host.
    !> - #hipHostAllocPortable  Memory is considered allocated by all contexts.
    !> - #hipHostAllocMapped    Map the allocation into the address space for the current device.
    !> - #hipHostAllocWriteCombined  Allocates the memory as write-combined.
    !> - #hipHostAllocUncached  Allocate the host memory on extended fine grained access system
    !> memory pool
    !>
    !> @return #hipSuccess, #hipErrorOutOfMemory, #hipErrorInvalidValue
    function hipHostAlloc(ptr, size, flags) &
       result(HostAlloc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaHostAlloc")
#else
       bind(C, name="hipHostAlloc")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: ptr
       integer(c_long), value :: size
       integer(c_int), value :: flags
       integer(c_int) :: HostAlloc
    end function hipHostAlloc

    !---------------------------------------------
    ! hipHostGetDevicePointer
    !---------------------------------------------
    !> @brief Get Device pointer from Host Pointer allocated through hipHostMalloc
    !>
    !> @param[out] devPtr Device Pointer mapped to passed host pointer
    !> @param[in]  hstPtr Host Pointer allocated through hipHostMalloc
    !> @param[in]  flags Flags to be passed for extension
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorOutOfMemory
    !>
    !> @see hipSetDeviceFlags, hipHostMalloc
    function hipHostGetDevicePointer(devPtr, hstPtr, flags) &
       result(HostGetDevicePointer) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaHostGetDevicePointer")
#else
       bind(C, name="hipHostGetDevicePointer")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: devPtr
       type(c_ptr), value :: hstPtr
       integer(c_int), value :: flags
       integer(c_int) :: HostGetDevicePointer
    end function hipHostGetDevicePointer

    !---------------------------------------------
    ! hipHostGetFlags
    !---------------------------------------------
    !> @brief Return flags associated with host pointer
    !>
    !> @param[out] flagsPtr Memory location to store flags
    !> @param[in]  hostPtr Host Pointer allocated through hipHostMalloc
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipHostMalloc
    function hipHostGetFlags(flagsPtr, hostPtr) &
       result(HostGetFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaHostGetFlags")
#else
       bind(C, name="hipHostGetFlags")
#endif
       import :: c_int, c_ptr
       integer(c_int) :: flagsPtr(*)
       type(c_ptr), value :: hostPtr
       integer(c_int) :: HostGetFlags
    end function hipHostGetFlags

    !---------------------------------------------
    ! hipHostRegister
    !---------------------------------------------
    !> @brief Register host memory so it can be accessed from the current device.
    !>
    !> @param[out] hostPtr Pointer to host memory to be registered.
    !> @param[in] sizeBytes Size of the host memory
    !> @param[in] flags  See below.
    !>
    !> Flags:
    !> - #hipHostRegisterDefault   Memory is Mapped and Portable
    !> - #hipHostRegisterPortable Memory is considered registered by all contexts. HIP only supports
    !> one context so this is always assumed true.
    !> - #hipHostRegisterMapped    Map the allocation into the address space for the current device.
    !> The device pointer can be obtained with #hipHostGetDevicePointer.
    !> - #hipExtHostRegisterUncached  Map the host memory onto extended fine grained access system
    !> memory pool.
    !>
    !> After registering the memory, use #hipHostGetDevicePointer to obtain the mapped device
    !> pointer.
    !> On many systems, the mapped device pointer will have a different value than the mapped host
    !> pointer. Applications must use the device pointer in device code, and the host pointer in
    !> host
    !> code.
    !>
    !> On some systems, registered memory is pinned.  On some systems, registered memory may not be
    !> actually be pinned but uses OS or hardware facilities to all GPU access to the host memory.
    !>
    !> Developers are strongly encouraged to register memory blocks which are aligned to the host
    !> cache-line size. (typically 64-bytes but can be obtains from the CPUID instruction).
    !>
    !> If registering non-aligned pointers, the application must take care when register pointers
    !> from
    !> the same cache line on different devices. HIP's coarse-grained synchronization model does not
    !> guarantee correct results if different devices write to different parts of the same cache
    !> block -
    !> typically one of the writes will "win" and overwrite data from the other registered memory
    !> region.
    !>
    !> @returns #hipSuccess, #hipErrorOutOfMemory
    !>
    !> @see hipHostUnregister, hipHostGetFlags, hipHostGetDevicePointer
    function hipHostRegister(hostPtr, sizeBytes, flags) &
       result(HostRegister) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaHostRegister")
#else
       bind(C, name="hipHostRegister")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: hostPtr
       integer(c_long), value :: sizeBytes
       integer(c_int), value :: flags
       integer(c_int) :: HostRegister
    end function hipHostRegister

    !---------------------------------------------
    ! hipHostUnregister
    !---------------------------------------------
    !> @brief Un-register host pointer
    !>
    !> @param[in] hostPtr Host pointer previously registered with #hipHostRegister
    !> @returns Error code
    !>
    !> @see hipHostRegister
    function hipHostUnregister(hostPtr) &
       result(HostUnregister) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaHostUnregister")
#else
       bind(C, name="hipHostUnregister")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hostPtr
       integer(c_int) :: HostUnregister
    end function hipHostUnregister

    !---------------------------------------------
    ! hipMallocPitch
    !---------------------------------------------
    !> Allocates at least width (in bytes) * height bytes of linear memory
    !> Padding may occur to ensure alighnment requirements are met for the given row
    !> The change in width size due to padding will be returned in *pitch.
    !> Currently the alignment is set to 128 bytes
    !>
    !> @param[out] ptr Pointer to the allocated device memory
    !> @param[out] pitch Pitch for allocation (in bytes)
    !> @param[in]  width Requested pitched allocation width (in bytes)
    !> @param[in]  height Requested pitched allocation height
    !>
    !> If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
    !>
    !> @returns Error code
    !>
    !> @see hipMalloc, hipFree, hipMallocArray, hipFreeArray, hipHostFree, hipMalloc3D,
    !> hipMalloc3DArray, hipHostMalloc
    function hipMallocPitch(ptr, pitch, width, height) &
       result(MallocPitch) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMallocPitch")
#else
       bind(C, name="hipMallocPitch")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: ptr
       type(c_ptr), value :: pitch
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int) :: MallocPitch
    end function hipMallocPitch

    !---------------------------------------------
    ! hipMemAllocPitch
    !---------------------------------------------
    !> Allocates at least width (in bytes) * height bytes of linear memory
    !> Padding may occur to ensure alighnment requirements are met for the given row
    !> The change in width size due to padding will be returned in *pitch.
    !> Currently the alignment is set to 128 bytes
    !>
    !> @param[out] dptr  Pointer to the allocated device memory
    !> @param[out] pitch  Pitch for allocation (in bytes)
    !> @param[in]  widthInBytes  Requested pitched allocation width (in bytes)
    !> @param[in]  height  Requested pitched allocation height
    !> @param[in]  elementSizeBytes  The size of element bytes, should be 4, 8 or 16
    !>
    !> If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
    !> The intended usage of pitch is as a separate parameter of the allocation, used to compute
    !> addresses within the 2D array. Given the row and column of an array element of type T, the
    !> address is computed as: T* pElement = (T*)((char*)BaseAddress + Row * Pitch) + Column;
    !>
    !> @returns Error code
    !>
    !> @see hipMalloc, hipFree, hipMallocArray, hipFreeArray, hipHostFree, hipMalloc3D,
    !> hipMalloc3DArray, hipHostMalloc
    function hipMemAllocPitch(dptr, pitch, widthInBytes, height, elementSizeBytes) &
       result(MemAllocPitch) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemAllocPitch")
#else
       bind(C, name="hipMemAllocPitch")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: dptr
       type(c_ptr), value :: pitch
       integer(c_long), value :: widthInBytes
       integer(c_long), value :: height
       integer(c_int), value :: elementSizeBytes
       integer(c_int) :: MemAllocPitch
    end function hipMemAllocPitch

    !---------------------------------------------
    ! hipFreeHost
    !---------------------------------------------
    !> @brief Frees page-locked memory
    !> This API performs an implicit hipDeviceSynchronize() call.
    !> If pointer is NULL, the hip runtime is initialized and hipSuccess is returned.
    !>
    !> @param[in] ptr Pointer to memory to be freed
    !> @returns #hipSuccess,
    !> #hipErrorInvalidValue (if pointer is invalid, including device pointers allocated
    !> with hipMalloc)
    function hipFreeHost(ptr) &
       result(FreeHost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaFreeHost")
#else
       bind(C, name="hipFreeHost")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: ptr
       integer(c_int) :: FreeHost
    end function hipFreeHost

    !---------------------------------------------
    ! hipHostFree
    !---------------------------------------------
    !> @brief Free memory allocated by the HIP-Clang hip host memory allocation API
    !> This API performs an implicit hipDeviceSynchronize() call.
    !> If pointer is NULL, the hip runtime is initialized and hipSuccess is returned.
    !>
    !> @ingroup MemoryD
    !>
    !> @param[in] ptr Pointer to memory to be freed
    !> @returns #hipSuccess,
    !> #hipErrorInvalidValue (if pointer is invalid, including device pointers allocated with
    !> hipMalloc)
    !>
    !> @see hipMalloc, hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D,
    !> hipMalloc3DArray, hipHostMalloc
    function hipHostFree(ptr) &
       result(HostFree) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaHostFree")
#else
       bind(C, name="hipHostFree")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: ptr
       integer(c_int) :: HostFree
    end function hipHostFree

    !---------------------------------------------
    ! hipMemcpyWithStream
    !---------------------------------------------
    !> @brief Memory copy on the stream.
    !> It allows single or multiple devices to do memory copy on single or multiple streams.
    !>
    !> @param[out]  dst Data being copy to
    !> @param[in]  src Data being copy from
    !> @param[in]  sizeBytes Data size in bytes
    !> @param[in]  kind Kind of transfer
    !> @param[in]  stream Valid stream
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorUnknown, #hipErrorContextIsDestroyed
    !>
    !> @see hipMemcpy, hipStreamCreate, hipStreamSynchronize, hipStreamDestroy, hipSetDevice,
    !> hipLaunchKernelGGL
    function hipMemcpyWithStream(dst, src, sizeBytes, kind, stream) &
       result(MemcpyWithStream) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyWithStream")
#else
       bind(C, name="hipMemcpyWithStream")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyWithStream
    end function hipMemcpyWithStream

    !---------------------------------------------
    ! hipMemcpyHtoD
    !---------------------------------------------
    !> @brief Copy data from Host to Device
    !>
    !> @param[out]  dst Data being copy to
    !> @param[in]   src Data being copy from
    !> @param[in]   sizeBytes Data size in bytes
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyHtoD(dst, src, sizeBytes) &
       result(MemcpyHtoD) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyHtoD")
#else
       bind(C, name="hipMemcpyHtoD")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_int) :: MemcpyHtoD
    end function hipMemcpyHtoD

    !---------------------------------------------
    ! hipMemcpyDtoH
    !---------------------------------------------
    !> @brief Copy data from Device to Host
    !>
    !> @param[out]  dst Data being copy to
    !> @param[in]   src Data being copy from
    !> @param[in]   sizeBytes Data size in bytes
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyDtoH(dst, src, sizeBytes) &
       result(MemcpyDtoH) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyDtoH")
#else
       bind(C, name="hipMemcpyDtoH")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_int) :: MemcpyDtoH
    end function hipMemcpyDtoH

    !---------------------------------------------
    ! hipMemcpyDtoD
    !---------------------------------------------
    !> @brief Copy data from Device to Device
    !>
    !> @param[out]  dst Data being copy to
    !> @param[in]   src Data being copy from
    !> @param[in]   sizeBytes Data size in bytes
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyDtoD(dst, src, sizeBytes) &
       result(MemcpyDtoD) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyDtoD")
#else
       bind(C, name="hipMemcpyDtoD")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_int) :: MemcpyDtoD
    end function hipMemcpyDtoD

    !---------------------------------------------
    ! hipMemcpyAtoD
    !---------------------------------------------
    !> @brief Copies from one 1D array to device memory.
    !>
    !> @param[out]  dstDevice Destination device pointer
    !> @param[in]   srcArray Source array
    !> @param[in]   srcOffset Offset in bytes of source array
    !> @param[in]   ByteCount Size of memory copy in bytes
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyAtoD(dstDevice, srcArray, srcOffset, ByteCount) &
       result(MemcpyAtoD) &
       bind(C, name="hipMemcpyAtoD")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dstDevice
       type(c_ptr), value :: srcArray
       integer(c_long), value :: srcOffset
       integer(c_long), value :: ByteCount
       integer(c_int) :: MemcpyAtoD
    end function hipMemcpyAtoD

    !---------------------------------------------
    ! hipMemcpyDtoA
    !---------------------------------------------
    !> @brief Copies from device memory to a 1D array.
    !>
    !> @param[out]  dstArray Destination array
    !> @param[in]   dstOffset Offset in bytes of destination array
    !> @param[in]   srcDevice Source device pointer
    !> @param[in]   ByteCount Size of memory copy in bytes
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyDtoA(dstArray, dstOffset, srcDevice, ByteCount) &
       result(MemcpyDtoA) &
       bind(C, name="hipMemcpyDtoA")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dstArray
       integer(c_long), value :: dstOffset
       type(c_ptr), value :: srcDevice
       integer(c_long), value :: ByteCount
       integer(c_int) :: MemcpyDtoA
    end function hipMemcpyDtoA

    !---------------------------------------------
    ! hipMemcpyAtoA
    !---------------------------------------------
    !> @brief Copies from one 1D array to another.
    !>
    !> @param[out]  dstArray Destination array
    !> @param[in]   dstOffset Offset in bytes of destination array
    !> @param[in]   srcArray Source array
    !> @param[in]   srcOffset Offset in bytes of source array
    !> @param[in]   ByteCount Size of memory copy in bytes
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyAtoA(dstArray, dstOffset, srcArray, srcOffset, ByteCount) &
       result(MemcpyAtoA) &
       bind(C, name="hipMemcpyAtoA")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dstArray
       integer(c_long), value :: dstOffset
       type(c_ptr), value :: srcArray
       integer(c_long), value :: srcOffset
       integer(c_long), value :: ByteCount
       integer(c_int) :: MemcpyAtoA
    end function hipMemcpyAtoA

    !---------------------------------------------
    ! hipMemcpyHtoDAsync
    !---------------------------------------------
    !> @brief Copy data from Host to Device asynchronously
    !>
    !> @param[out]  dst  Data being copy to
    !> @param[in]   src  Data being copy from
    !> @param[in]   sizeBytes  Data size in bytes
    !> @param[in]   stream  Stream identifier
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyHtoDAsync(dst, src, sizeBytes, stream) &
       result(MemcpyHtoDAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyHtoDAsync")
#else
       bind(C, name="hipMemcpyHtoDAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyHtoDAsync
    end function hipMemcpyHtoDAsync

    !---------------------------------------------
    ! hipMemcpyDtoHAsync
    !---------------------------------------------
    !> @brief Copy data from Device to Host asynchronously
    !>
    !> @param[out]  dst Data being copy to
    !> @param[in]   src Data being copy from
    !> @param[in]   sizeBytes Data size in bytes
    !> @param[in]   stream  Stream identifier
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyDtoHAsync(dst, src, sizeBytes, stream) &
       result(MemcpyDtoHAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyDtoHAsync")
#else
       bind(C, name="hipMemcpyDtoHAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyDtoHAsync
    end function hipMemcpyDtoHAsync

    !---------------------------------------------
    ! hipMemcpyDtoDAsync
    !---------------------------------------------
    !> @brief Copy data from Device to Device asynchronously
    !>
    !> @param[out]  dst  Data being copy to
    !> @param[in]   src  Data being copy from
    !> @param[in]   sizeBytes  Data size in bytes
    !> @param[in]   stream  Stream identifier
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyDtoDAsync(dst, src, sizeBytes, stream) &
       result(MemcpyDtoDAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyDtoDAsync")
#else
       bind(C, name="hipMemcpyDtoDAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyDtoDAsync
    end function hipMemcpyDtoDAsync

    !---------------------------------------------
    ! hipMemcpyAtoHAsync
    !---------------------------------------------
    !> @brief Copies from one 1D array to host memory.
    !>
    !> @param[out]  dstHost Destination pointer
    !> @param[in]   srcArray Source array
    !> @param[in]   srcOffset Offset in bytes of source array
    !> @param[in]   ByteCount Size of memory copy in bytes
    !> @param[in]   stream Stream identifier
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyAtoHAsync(dstHost, srcArray, srcOffset, ByteCount, stream) &
       result(MemcpyAtoHAsync) &
       bind(C, name="hipMemcpyAtoHAsync")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dstHost
       type(c_ptr), value :: srcArray
       integer(c_long), value :: srcOffset
       integer(c_long), value :: ByteCount
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyAtoHAsync
    end function hipMemcpyAtoHAsync

    !---------------------------------------------
    ! hipMemcpyHtoAAsync
    !---------------------------------------------
    !> @brief Copies from host memory to a 1D array.
    !>
    !> @param[out]  dstArray Destination array
    !> @param[in]   dstOffset Offset in bytes of destination array
    !> @param[in]   srcHost Source host pointer
    !> @param[in]   ByteCount Size of memory copy in bytes
    !> @param[in]   stream Stream identifier
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyHtoAAsync(dstArray, dstOffset, srcHost, ByteCount, stream) &
       result(MemcpyHtoAAsync) &
       bind(C, name="hipMemcpyHtoAAsync")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dstArray
       integer(c_long), value :: dstOffset
       type(c_ptr), value :: srcHost
       integer(c_long), value :: ByteCount
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyHtoAAsync
    end function hipMemcpyHtoAAsync

    !---------------------------------------------
    ! hipGetSymbolAddress
    !---------------------------------------------
    !> @brief Gets device pointer associated with symbol on the device.
    !>
    !> @param[out]  devPtr  pointer to the device associated the symbole
    !> @param[in]   symbol  pointer to the symbole of the device
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGetSymbolAddress(devPtr, symbol) &
       result(GetSymbolAddress) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetSymbolAddress")
#else
       bind(C, name="hipGetSymbolAddress")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: devPtr
       type(c_ptr), value :: symbol
       integer(c_int) :: GetSymbolAddress
    end function hipGetSymbolAddress

    !---------------------------------------------
    ! hipGetSymbolSize
    !---------------------------------------------
    !> @brief Gets the size of the given symbol on the device.
    !>
    !> @param[in]   symbol  pointer to the device symbole
    !> @param[out]  size  pointer to the size
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGetSymbolSize(size, symbol) &
       result(GetSymbolSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetSymbolSize")
#else
       bind(C, name="hipGetSymbolSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: size
       type(c_ptr), value :: symbol
       integer(c_int) :: GetSymbolSize
    end function hipGetSymbolSize

    !---------------------------------------------
    ! hipMemcpyToSymbol
    !---------------------------------------------
    !> @brief Copies data to the given symbol on the device.
    !> Symbol HIP APIs allow a kernel to define a device-side data symbol which can be accessed on
    !> the host side. The symbol can be in __constant or device space.
    !> Note that the symbol name needs to be encased in the HIP_SYMBOL macro.
    !> This also applies to hipMemcpyFromSymbol, hipGetSymbolAddress, and hipGetSymbolSize.
    !> For detailed usage, see the
    !> <a
    !> href="https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/hip_porting_guide.html#memcpytosymbol">memcpyToSymbol
    !> example</a> in the HIP Porting Guide.
    !>
    !>
    !> @param[out]  symbol  pointer to the device symbole
    !> @param[in]   src  pointer to the source address
    !> @param[in]   sizeBytes  size in bytes to copy
    !> @param[in]   offset  offset in bytes from start of symbole
    !> @param[in]   kind  type of memory transfer
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemcpyToSymbol(symbol, src, sizeBytes, offset, kind) &
       result(MemcpyToSymbol) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyToSymbol")
#else
       bind(C, name="hipMemcpyToSymbol")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: symbol
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       integer(c_int) :: MemcpyToSymbol
    end function hipMemcpyToSymbol

    !---------------------------------------------
    ! hipMemcpyToSymbolAsync
    !---------------------------------------------
    !> @brief Copies data to the given symbol on the device asynchronously.
    !>
    !> @param[out]  symbol  pointer to the device symbole
    !> @param[in]   src  pointer to the source address
    !> @param[in]   sizeBytes  size in bytes to copy
    !> @param[in]   offset  offset in bytes from start of symbole
    !> @param[in]   kind  type of memory transfer
    !> @param[in]   stream  stream identifier
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemcpyToSymbolAsync(symbol, src, sizeBytes, offset, kind, stream) &
       result(MemcpyToSymbolAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyToSymbolAsync")
#else
       bind(C, name="hipMemcpyToSymbolAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: symbol
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyToSymbolAsync
    end function hipMemcpyToSymbolAsync

    !---------------------------------------------
    ! hipMemcpyFromSymbol
    !---------------------------------------------
    !> @brief Copies data from the given symbol on the device.
    !>
    !> @param[out]  dst  Returns pointer to destinition memory address
    !> @param[in]   symbol  Pointer to the symbole address on the device
    !> @param[in]   sizeBytes  Size in bytes to copy
    !> @param[in]   offset  Offset in bytes from the start of symbole
    !> @param[in]   kind  Type of memory transfer
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemcpyFromSymbol(dst, symbol, sizeBytes, offset, kind) &
       result(MemcpyFromSymbol) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyFromSymbol")
#else
       bind(C, name="hipMemcpyFromSymbol")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: symbol
       integer(c_long), value :: sizeBytes
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       integer(c_int) :: MemcpyFromSymbol
    end function hipMemcpyFromSymbol

    !---------------------------------------------
    ! hipMemcpyFromSymbolAsync
    !---------------------------------------------
    !> @brief Copies data from the given symbol on the device asynchronously.
    !>
    !> @param[out]  dst  Returns pointer to destinition memory address
    !> @param[in]   symbol  pointer to the symbole address on the device
    !> @param[in]   sizeBytes  size in bytes to copy
    !> @param[in]   offset  offset in bytes from the start of symbole
    !> @param[in]   kind  type of memory transfer
    !> @param[in]   stream  stream identifier
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemcpyFromSymbolAsync(dst, symbol, sizeBytes, offset, kind, stream) &
       result(MemcpyFromSymbolAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyFromSymbolAsync")
#else
       bind(C, name="hipMemcpyFromSymbolAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: symbol
       integer(c_long), value :: sizeBytes
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyFromSymbolAsync
    end function hipMemcpyFromSymbolAsync

    !---------------------------------------------
    ! hipMemset
    !---------------------------------------------
    !> @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the
    !> constant
    !> byte value value.
    !>
    !> @param[out] dst  Data being filled
    !> @param[in]  value  Value to be set
    !> @param[in]  sizeBytes  Data size in bytes
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
    function hipMemset(dst, value, sizeBytes) &
       result(Memset) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemset")
#else
       bind(C, name="hipMemset")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dst
       integer(c_int), value :: value
       integer(c_long), value :: sizeBytes
       integer(c_int) :: Memset
    end function hipMemset

    !---------------------------------------------
    ! hipMemsetD8
    !---------------------------------------------
    !> @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the
    !> constant
    !> byte value value.
    !>
    !> @param[out] dest  Data ptr to be filled
    !> @param[in]  value  Value to be set
    !> @param[in]  count  Number of values to be set
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
    function hipMemsetD8(dest, value, count) &
       result(MemsetD8) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemsetD8")
#else
       bind(C, name="hipMemsetD8")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dest
       type(c_ptr), value :: value
       integer(c_long), value :: count
       integer(c_int) :: MemsetD8
    end function hipMemsetD8

    !---------------------------------------------
    ! hipMemsetD8Async
    !---------------------------------------------
    !> @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the
    !> constant
    !> byte value value.
    !>
    !> hipMemsetD8Async() is asynchronous with respect to the host, so the call may return before
    !> the
    !> memset is complete. The operation can optionally be associated to a stream by passing a
    !> non-zero
    !> stream argument. If stream is non-zero, the operation may overlap with operations in other
    !> streams.
    !>
    !> @param[out] dest  Data ptr to be filled
    !> @param[in]  value  Constant value to be set
    !> @param[in]  count  Number of values to be set
    !> @param[in]  stream  Stream identifier
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
    function hipMemsetD8Async(dest, value, count, stream) &
       result(MemsetD8Async) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemsetD8Async")
#else
       bind(C, name="hipMemsetD8Async")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dest
       type(c_ptr), value :: value
       integer(c_long), value :: count
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD8Async
    end function hipMemsetD8Async

    !---------------------------------------------
    ! hipMemsetD16
    !---------------------------------------------
    !> @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the
    !> constant
    !> short value value.
    !>
    !> @param[out] dest  Data ptr to be filled
    !> @param[in]  value  Constant value to be set
    !> @param[in]  count  Number of values to be set
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
    function hipMemsetD16(dest, value, count) &
       result(MemsetD16) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemsetD16")
#else
       bind(C, name="hipMemsetD16")
#endif
       import :: c_ptr, c_short, c_long, c_int
       type(c_ptr), value :: dest
       integer(c_short), value :: value
       integer(c_long), value :: count
       integer(c_int) :: MemsetD16
    end function hipMemsetD16

    !---------------------------------------------
    ! hipMemsetD16Async
    !---------------------------------------------
    !> @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the
    !> constant
    !> short value value.
    !>
    !> hipMemsetD16Async() is asynchronous with respect to the host, so the call may return before
    !> the
    !> memset is complete. The operation can optionally be associated to a stream by passing a
    !> non-zero
    !> stream argument. If stream is non-zero, the operation may overlap with operations in other
    !> streams.
    !>
    !> @param[out] dest  Data ptr to be filled
    !> @param[in]  value  Constant value to be set
    !> @param[in]  count  Number of values to be set
    !> @param[in]  stream  Stream identifier
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
    function hipMemsetD16Async(dest, value, count, stream) &
       result(MemsetD16Async) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemsetD16Async")
#else
       bind(C, name="hipMemsetD16Async")
#endif
       import :: c_ptr, c_short, c_long, c_int
       type(c_ptr), value :: dest
       integer(c_short), value :: value
       integer(c_long), value :: count
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD16Async
    end function hipMemsetD16Async

    !---------------------------------------------
    ! hipMemsetD32
    !---------------------------------------------
    !> @brief Fills the memory area pointed to by dest with the constant integer
    !> value for specified number of times.
    !>
    !> @param[out] dest  Data being filled
    !> @param[in]  value  Constant value to be set
    !> @param[in]  count  Number of values to be set
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
    function hipMemsetD32(dest, value, count) &
       result(MemsetD32) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemsetD32")
#else
       bind(C, name="hipMemsetD32")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dest
       integer(c_int), value :: value
       integer(c_long), value :: count
       integer(c_int) :: MemsetD32
    end function hipMemsetD32

    !---------------------------------------------
    ! hipMemsetAsync
    !---------------------------------------------
    !> @brief Fills the first sizeBytes bytes of the memory area pointed to by dev with the constant
    !> byte value value.
    !>
    !> hipMemsetAsync() is asynchronous with respect to the host, so the call may return before the
    !> memset is complete. The operation can optionally be associated to a stream by passing a
    !> non-zero
    !> stream argument. If stream is non-zero, the operation may overlap with operations in other
    !> streams.
    !>
    !> @param[out] dst Pointer to device memory
    !> @param[in]  value  Value to set for each byte of specified memory
    !> @param[in]  sizeBytes  Size in bytes to set
    !> @param[in]  stream  Stream identifier
    !> @return #hipSuccess, #hipErrorInvalidValue
    function hipMemsetAsync(dst, value, sizeBytes, stream) &
       result(MemsetAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemsetAsync")
#else
       bind(C, name="hipMemsetAsync")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dst
       integer(c_int), value :: value
       integer(c_long), value :: sizeBytes
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetAsync
    end function hipMemsetAsync

    !---------------------------------------------
    ! hipMemsetD32Async
    !---------------------------------------------
    !> @brief Fills the memory area pointed to by dev with the constant integer
    !> value for specified number of times.
    !>
    !> hipMemsetD32Async() is asynchronous with respect to the host, so the call may return before
    !> the
    !> memset is complete. The operation can optionally be associated to a stream by passing a
    !> non-zero
    !> stream argument. If stream is non-zero, the operation may overlap with operations in other
    !> streams.
    !>
    !> @param[out] dst Pointer to device memory
    !> @param[in]  value  Value to set for each byte of specified memory
    !> @param[in]  count  Number of values to be set
    !> @param[in]  stream  Stream identifier
    !> @return #hipSuccess, #hipErrorInvalidValue
    function hipMemsetD32Async(dst, value, count, stream) &
       result(MemsetD32Async) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemsetD32Async")
#else
       bind(C, name="hipMemsetD32Async")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dst
       integer(c_int), value :: value
       integer(c_long), value :: count
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD32Async
    end function hipMemsetD32Async

    !---------------------------------------------
    ! hipMemset2D
    !---------------------------------------------
    !> @brief Fills the memory area pointed to by dst with the constant value.
    !>
    !> @param[out] dst Pointer to 2D device memory
    !> @param[in]  pitch  Pitch size in bytes of 2D device memory, unused if height equals 1
    !> @param[in]  value  Constant value to set for each byte of specified memory
    !> @param[in]  width  Width size in bytes in 2D memory
    !> @param[in]  height  Height size in bytes in 2D memory
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemset2D(dst, pitch, value, width, height) &
       result(Memset2D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemset2D")
#else
       bind(C, name="hipMemset2D")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: pitch
       integer(c_int), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int) :: Memset2D
    end function hipMemset2D

    !---------------------------------------------
    ! hipMemset2DAsync
    !---------------------------------------------
    !> @brief Fills asynchronously the memory area pointed to by dst with the constant value.
    !>
    !> @param[in]  dst Pointer to 2D device memory
    !> @param[in]  pitch  Pitch size in bytes of 2D device memory, unused if height equals 1
    !> @param[in]  value  Value to set for each byte of specified memory
    !> @param[in]  width  Width size in bytes in 2D memory
    !> @param[in]  height  Height size in bytes in 2D memory
    !> @param[in]  stream  Stream identifier
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemset2DAsync(dst, pitch, value, width, height, stream) &
       result(Memset2DAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemset2DAsync")
#else
       bind(C, name="hipMemset2DAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: pitch
       integer(c_int), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       type(c_ptr), value :: stream
       integer(c_int) :: Memset2DAsync
    end function hipMemset2DAsync

    !---------------------------------------------
    ! hipMemset3D
    !---------------------------------------------
    !> @brief Fills synchronously the memory area pointed to by pitchedDevPtr with the constant
    !> value.
    !>
    !> @param[in] pitchedDevPtr  Pointer to pitched device memory
    !> @param[in]  value  Value to set for each byte of specified memory
    !> @param[in]  extent  Size parameters for width field in bytes in device memory
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemset3D(pitchedDevPtr, value, extent) &
       result(Memset3D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemset3D")
#else
       bind(C, name="hipMemset3D")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pitchedDevPtr
       integer(c_int), value :: value
       type(c_ptr), value :: extent
       integer(c_int) :: Memset3D
    end function hipMemset3D

    !---------------------------------------------
    ! hipMemset3DAsync
    !---------------------------------------------
    !> @brief Fills asynchronously the memory area pointed to by pitchedDevPtr with the constant
    !> value.
    !>
    !> @param[in] pitchedDevPtr  Pointer to pitched device memory
    !> @param[in]  value  Value to set for each byte of specified memory
    !> @param[in]  extent  Size parameters for width field in bytes in device memory
    !> @param[in]  stream  Stream identifier
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemset3DAsync(pitchedDevPtr, value, extent, stream) &
       result(Memset3DAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemset3DAsync")
#else
       bind(C, name="hipMemset3DAsync")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pitchedDevPtr
       integer(c_int), value :: value
       type(c_ptr), value :: extent
       type(c_ptr), value :: stream
       integer(c_int) :: Memset3DAsync
    end function hipMemset3DAsync

    !---------------------------------------------
    ! hipMemsetD2D8
    !---------------------------------------------
    !> @brief Fills 2D memory range of 'width' 8-bit values synchronously to the specified char
    !> value.
    !> Height specifies numbers of rows to set and dstPitch speicifies the number of bytes between
    !> each
    !> row.
    !> @param[in] dst       Pointer to device memory
    !> @param[in] dstPitch  Pitch of dst device pointer
    !> @param[in] value     value to set
    !> @param[in] width     Width of row
    !> @param[in] height    Number of rows
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemsetD2D8(dst, dstPitch, value, width, height) &
       result(MemsetD2D8) &
       bind(C, name="hipMemsetD2D8")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dstPitch
       type(c_ptr), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int) :: MemsetD2D8
    end function hipMemsetD2D8

    !---------------------------------------------
    ! hipMemsetD2D8Async
    !---------------------------------------------
    !> @brief Fills 2D memory range of 'width' 8-bit values asynchronously to the specified char
    !> value.
    !> Height specifies numbers of rows to set and dstPitch speicifies the number of bytes between
    !> each
    !> row.
    !> @param[in] dst       Pointer to device memory
    !> @param[in] dstPitch  Pitch of dst device pointer
    !> @param[in] value     value to set
    !> @param[in] width     Width of row
    !> @param[in] height    Number of rows
    !> @param[in] stream    Stream Identifier
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemsetD2D8Async(dst, dstPitch, value, width, height, stream) &
       result(MemsetD2D8Async) &
       bind(C, name="hipMemsetD2D8Async")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dstPitch
       type(c_ptr), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD2D8Async
    end function hipMemsetD2D8Async

    !---------------------------------------------
    ! hipMemsetD2D16
    !---------------------------------------------
    !> @brief Fills 2D memory range of 'width' 16-bit values synchronously to the specified short
    !> value. Height specifies numbers of rows to set and dstPitch speicifies the number of bytes
    !> between each row.
    !> @param[in] dst       Pointer to device memory
    !> @param[in] dstPitch  Pitch of dst device pointer
    !> @param[in] value     value to set
    !> @param[in] width     Width of row
    !> @param[in] height    Number of rows
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemsetD2D16(dst, dstPitch, value, width, height) &
       result(MemsetD2D16) &
       bind(C, name="hipMemsetD2D16")
       import :: c_ptr, c_long, c_short, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dstPitch
       integer(c_short), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int) :: MemsetD2D16
    end function hipMemsetD2D16

    !---------------------------------------------
    ! hipMemsetD2D16Async
    !---------------------------------------------
    !> @brief Fills 2D memory range of 'width' 16-bit values asynchronously to the specified short
    !> value. Height specifies numbers of rows to set and dstPitch speicifies the number of bytes
    !> between each row.
    !> @param[in] dst       Pointer to device memory
    !> @param[in] dstPitch  Pitch of dst device pointer
    !> @param[in] value     value to set
    !> @param[in] width     Width of row
    !> @param[in] height    Number of rows
    !> @param[in] stream    Stream Identifier
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemsetD2D16Async(dst, dstPitch, value, width, height, stream) &
       result(MemsetD2D16Async) &
       bind(C, name="hipMemsetD2D16Async")
       import :: c_ptr, c_long, c_short, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dstPitch
       integer(c_short), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD2D16Async
    end function hipMemsetD2D16Async

    !---------------------------------------------
    ! hipMemsetD2D32
    !---------------------------------------------
    !> @brief Fills 2D memory range of 'width' 32-bit values synchronously to the specified int
    !> value.
    !> Height specifies numbers of rows to set and dstPitch speicifies the number of bytes between
    !> each
    !> row.
    !> @param[in] dst       Pointer to device memory
    !> @param[in] dstPitch  Pitch of dst device pointer
    !> @param[in] value     value to set
    !> @param[in] width     Width of row
    !> @param[in] height    Number of rows
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemsetD2D32(dst, dstPitch, value, width, height) &
       result(MemsetD2D32) &
       bind(C, name="hipMemsetD2D32")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dstPitch
       integer(c_int), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int) :: MemsetD2D32
    end function hipMemsetD2D32

    !---------------------------------------------
    ! hipMemsetD2D32Async
    !---------------------------------------------
    !> @brief Fills 2D memory range of 'width' 32-bit values asynchronously to the specified int
    !> value. Height specifies numbers of rows to set and dstPitch speicifies the number of bytes
    !> between each row.
    !> @param[in] dst       Pointer to device memory
    !> @param[in] dstPitch  Pitch of dst device pointer
    !> @param[in] value     value to set
    !> @param[in] width     Width of row
    !> @param[in] height    Number of rows
    !> @param[in] stream    Stream Identifier
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemsetD2D32Async(dst, dstPitch, value, width, height, stream) &
       result(MemsetD2D32Async) &
       bind(C, name="hipMemsetD2D32Async")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dstPitch
       integer(c_int), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD2D32Async
    end function hipMemsetD2D32Async

    !---------------------------------------------
    ! hipMemGetInfo
    !---------------------------------------------
    !> @brief Query memory info.
    !>
    !> On ROCM, this function gets the actual free memory left on the current device, so supports
    !> the cases while running multi-workload (such as multiple processes, multiple threads, and
    !> multiple GPUs).
    !>
    !> @warning On Windows, the free memory only accounts for memory allocated by this process and
    !> may
    !> be optimistic.
    !>
    !> @param[out] free Returns free memory on the current device in bytes
    !> @param[out] total Returns total allocatable memory on the current device in bytes
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
    function hipMemGetInfo(free, total) &
       result(MemGetInfo) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemGetInfo")
#else
       bind(C, name="hipMemGetInfo")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: free
       type(c_ptr), value :: total
       integer(c_int) :: MemGetInfo
    end function hipMemGetInfo

    !---------------------------------------------
    ! hipMemPtrGetInfo
    !---------------------------------------------
    !> @brief Get allocated memory size via memory pointer.
    !>
    !> This function gets the allocated shared virtual memory size from memory pointer.
    !>
    !> @param[in] ptr Pointer to allocated memory
    !> @param[out] size Returns the allocated memory size in bytes
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemPtrGetInfo(ptr, size) &
       result(MemPtrGetInfo) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPtrGetInfo")
#else
       bind(C, name="hipMemPtrGetInfo")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: ptr
       type(c_ptr), value :: size
       integer(c_int) :: MemPtrGetInfo
    end function hipMemPtrGetInfo

    !---------------------------------------------
    ! hipMallocArray
    !---------------------------------------------
    !> @brief Allocate an array on the device.
    !>
    !> @param[out]  array  Pointer to allocated array in device memory
    !> @param[in]   desc   Requested channel format
    !> @param[in]   width  Requested array allocation width
    !> @param[in]   height Requested array allocation height
    !> @param[in]   flags  Requested properties of allocated array
    !> @returns     #hipSuccess, #hipErrorOutOfMemory
    !>
    !> @see hipMalloc, hipMallocPitch, hipFree, hipFreeArray, hipHostMalloc, hipHostFree
    function hipMallocArray(array, desc, width, height, flags) &
       result(MallocArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMallocArray")
#else
       bind(C, name="hipMallocArray")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: array
       type(c_ptr), value :: desc
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: flags
       integer(c_int) :: MallocArray
    end function hipMallocArray

    !---------------------------------------------
    ! hipArrayCreate
    !---------------------------------------------
    !> @brief Create an array memory pointer on the device.
    !>
    !> @param[out]  pHandle  Pointer to the array memory
    !> @param[in]   pAllocateArray   Requested array desciptor
    !>
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @see hipMallocArray, hipArrayDestroy, hipFreeArray
    function hipArrayCreate(pHandle, pAllocateArray) &
       result(ArrayCreate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaArrayCreate")
#else
       bind(C, name="hipArrayCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pHandle
       type(c_ptr), value :: pAllocateArray
       integer(c_int) :: ArrayCreate
    end function hipArrayCreate

    !---------------------------------------------
    ! hipArrayDestroy
    !---------------------------------------------
    !> @brief Destroy an array memory pointer on the device.
    !>
    !> @param[in]  array  Pointer to the array memory
    !>
    !> @returns     #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipFreeArray
    function hipArrayDestroy(array) &
       result(ArrayDestroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaArrayDestroy")
#else
       bind(C, name="hipArrayDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: array
       integer(c_int) :: ArrayDestroy
    end function hipArrayDestroy

    !---------------------------------------------
    ! hipArray3DCreate
    !---------------------------------------------
    !> @brief Create a 3D array memory pointer on the device.
    !>
    !> @param[out]  array  Pointer to the 3D array memory
    !> @param[in]   pAllocateArray   Requested array desciptor
    !>
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @see hipMallocArray, hipArrayDestroy, hipFreeArray
    function hipArray3DCreate(array, pAllocateArray) &
       result(Array3DCreate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaArray3DCreate")
#else
       bind(C, name="hipArray3DCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: array
       type(c_ptr), value :: pAllocateArray
       integer(c_int) :: Array3DCreate
    end function hipArray3DCreate

    !---------------------------------------------
    ! hipMalloc3D
    !---------------------------------------------
    !> @brief Create a 3D memory pointer on the device.
    !>
    !> @param[out]  pitchedDevPtr  Pointer to the 3D memory
    !> @param[in]   extent   Requested extent
    !>
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @see hipMallocPitch, hipMemGetInfo, hipFree
    function hipMalloc3D(pitchedDevPtr, extent) &
       result(Malloc3D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMalloc3D")
#else
       bind(C, name="hipMalloc3D")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pitchedDevPtr
       type(c_ptr), value :: extent
       integer(c_int) :: Malloc3D
    end function hipMalloc3D

    !---------------------------------------------
    ! hipFreeArray
    !---------------------------------------------
    !> @brief Frees an array on the device.
    !>
    !> @param[in]  array  Pointer to array to free
    !> @returns    #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
    !>
    !> @see hipMalloc, hipMallocPitch, hipFree, hipMallocArray, hipHostMalloc, hipHostFree
    function hipFreeArray(array) &
       result(FreeArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaFreeArray")
#else
       bind(C, name="hipFreeArray")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: array
       integer(c_int) :: FreeArray
    end function hipFreeArray

    !---------------------------------------------
    ! hipMalloc3DArray
    !---------------------------------------------
    !> @brief Allocate an array on the device.
    !>
    !> @param[out]  array  Pointer to allocated array in device memory
    !> @param[in]   desc   Requested channel format
    !> @param[in]   extent Requested array allocation width, height and depth
    !> @param[in]   flags  Requested properties of allocated array
    !> @returns     #hipSuccess, #hipErrorOutOfMemory
    !>
    !> @see hipMalloc, hipMallocPitch, hipFree, hipFreeArray, hipHostMalloc, hipHostFree
    function hipMalloc3DArray(array, desc, extent, flags) &
       result(Malloc3DArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMalloc3DArray")
#else
       bind(C, name="hipMalloc3DArray")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: array
       type(c_ptr), value :: desc
       type(c_ptr), value :: extent
       integer(c_int), value :: flags
       integer(c_int) :: Malloc3DArray
    end function hipMalloc3DArray

    !---------------------------------------------
    ! hipArrayGetInfo
    !---------------------------------------------
    !> @brief Gets info about the specified array
    !>
    !> @param[out] desc   - Returned array type
    !> @param[out] extent - Returned array shape. 2D arrays will have depth of zero
    !> @param[out] flags  - Returned array flags
    !> @param[in]  array  - The HIP array to get info for
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue #hipErrorInvalidHandle
    !>
    !> @see hipArrayGetDescriptor, hipArray3DGetDescriptor
    function hipArrayGetInfo(desc, extent, flags, array) &
       result(ArrayGetInfo) &
       bind(C, name="hipArrayGetInfo")
       import :: c_ptr, c_int
       type(c_ptr), value :: desc
       type(c_ptr), value :: extent
       integer(c_int) :: flags(*)
       type(c_ptr), value :: array
       integer(c_int) :: ArrayGetInfo
    end function hipArrayGetInfo

    !---------------------------------------------
    ! hipArrayGetDescriptor
    !---------------------------------------------
    !> @brief Gets a 1D or 2D array descriptor
    !>
    !> @param[out] pArrayDescriptor - Returned array descriptor
    !> @param[in]  array            - Array to get descriptor of
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue #hipErrorInvalidHandle
    !>
    !> @see hipArray3DCreate, hipArray3DGetDescriptor, hipArrayCreate, hipArrayDestroy, hipMemAlloc,
    !> hipMemAllocHost, hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned,
    !> hipMemcpy3D, hipMemcpy3DAsync, hipMemcpyAtoA, hipMemcpyAtoD, hipMemcpyAtoH,
    !> hipMemcpyAtoHAsync,
    !> hipMemcpyDtoA, hipMemcpyDtoD, hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync,
    !> hipMemcpyHtoA, hipMemcpyHtoAAsync, hipMemcpyHtoD, hipMemcpyHtoDAsync, hipMemFree,
    !> hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo, hipMemHostAlloc,
    !> hipMemHostGetDevicePointer, hipMemsetD8, hipMemsetD16, hipMemsetD32, hipArrayGetInfo
    function hipArrayGetDescriptor(pArrayDescriptor, array) &
       result(ArrayGetDescriptor) &
       bind(C, name="hipArrayGetDescriptor")
       import :: c_ptr, c_int
       type(c_ptr), value :: pArrayDescriptor
       type(c_ptr), value :: array
       integer(c_int) :: ArrayGetDescriptor
    end function hipArrayGetDescriptor

    !---------------------------------------------
    ! hipArray3DGetDescriptor
    !---------------------------------------------
    !> @brief Gets a 3D array descriptor
    !>
    !> @param[out] pArrayDescriptor - Returned 3D array descriptor
    !> @param[in]  array            - 3D array to get descriptor of
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidValue #hipErrorInvalidHandle, #hipErrorContextIsDestroyed
    !>
    !> @see hipArray3DCreate, hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc,
    !> hipMemAllocHost, hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned,
    !> hipMemcpy3D, hipMemcpy3DAsync, hipMemcpyAtoA, hipMemcpyAtoD, hipMemcpyAtoH,
    !> hipMemcpyAtoHAsync,
    !> hipMemcpyDtoA, hipMemcpyDtoD, hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync,
    !> hipMemcpyHtoA, hipMemcpyHtoAAsync, hipMemcpyHtoD, hipMemcpyHtoDAsync, hipMemFree,
    !> hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo, hipMemHostAlloc,
    !> hipMemHostGetDevicePointer, hipMemsetD8, hipMemsetD16, hipMemsetD32, hipArrayGetInfo
    function hipArray3DGetDescriptor(pArrayDescriptor, array) &
       result(Array3DGetDescriptor) &
       bind(C, name="hipArray3DGetDescriptor")
       import :: c_ptr, c_int
       type(c_ptr), value :: pArrayDescriptor
       type(c_ptr), value :: array
       integer(c_int) :: Array3DGetDescriptor
    end function hipArray3DGetDescriptor

    !---------------------------------------------
    ! hipMemcpy2D
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> hipMemcpy2D supports memory matrix copy from the pointed area src to the pointed area dst.
    !> The copy direction is defined by kind which must be one of #hipMemcpyHostToDevice,
    !> #hipMemcpyHostToDevice, #hipMemcpyDeviceToHost #hipMemcpyDeviceToDevice or #hipMemcpyDefault.
    !> Device to Device copies don't need to wait for host synchronization.
    !> The copy is executed on the default null tream. The src and dst must not overlap.
    !> dpitch and spitch are the widths in bytes in memory matrix, width cannot exceed dpitch or
    !> spitch.
    !>
    !> For hipMemcpy2D, the copy is always performed by the current device (set by hipSetDevice).
    !> For multi-gpu or peer-to-peer configurations, it is recommended to set the current device to
    !> the
    !> device where the src data is physically located. For optimal peer-to-peer copies, the copy
    !> device
    !> must be able to access the src and dst pointers (by calling hipDeviceEnablePeerAccess with
    !> copy
    !> agent as the current device and src/dst as the peerDevice argument.  if this is not done, the
    !> hipMemcpy2D will still work, but will perform the copy using a staging buffer on the host.
    !>
    !> @warning  Calling hipMemcpy2D with dst and src pointers that do not match the hipMemcpyKind
    !> results in undefined behavior.
    !>
    !> @param[in]   dst    Destination memory address
    !> @param[in]   dpitch Pitch size in bytes of destination memory
    !> @param[in]   src    Source memory address
    !> @param[in]   spitch Pitch size in bytes of source memory
    !> @param[in]   width  Width size in bytes of matrix transfer (columns)
    !> @param[in]   height Height size in bytes of matrix transfer (rows)
    !> @param[in]   kind   Type of transfer
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy2D(dst, dpitch, src, spitch, width, height, kind) &
       result(Memcpy2D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy2D")
#else
       bind(C, name="hipMemcpy2D")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dpitch
       type(c_ptr), value :: src
       integer(c_long), value :: spitch
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       integer(c_int) :: Memcpy2D
    end function hipMemcpy2D

    !---------------------------------------------
    ! hipMemcpyParam2D
    !---------------------------------------------
    !> @brief Copies memory for 2D arrays.
    !> @param[in]   pCopy Parameters for the memory copy
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2D, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray,
    !> hipMemcpyToSymbol, hipMemcpyAsync
    function hipMemcpyParam2D(pCopy) &
       result(MemcpyParam2D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyParam2D")
#else
       bind(C, name="hipMemcpyParam2D")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pCopy
       integer(c_int) :: MemcpyParam2D
    end function hipMemcpyParam2D

    !---------------------------------------------
    ! hipMemcpyParam2DAsync
    !---------------------------------------------
    !> @brief Copies memory for 2D arrays.
    !> @param[in]   pCopy Parameters for the memory copy
    !> @param[in]   stream Stream to use
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2D, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray,
    !> hipMemcpyToSymbol, hipMemcpyAsync
    function hipMemcpyParam2DAsync(pCopy, stream) &
       result(MemcpyParam2DAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyParam2DAsync")
#else
       bind(C, name="hipMemcpyParam2DAsync")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pCopy
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyParam2DAsync
    end function hipMemcpyParam2DAsync

    !---------------------------------------------
    ! hipMemcpy2DAsync
    !---------------------------------------------
    !> @brief Copies data between host and device asynchronously.
    !>
    !> hipMemcpy2DAsync supports memory matrix copy from the pointed area src to the pointed area
    !> dst.
    !> The copy direction is defined by kind which must be one of #hipMemcpyHostToDevice,
    !> #hipMemcpyDeviceToHost, #hipMemcpyDeviceToDevice or #hipMemcpyDefault.
    !> dpitch and spitch are the widths in bytes for memory matrix corresponds to dst and src.
    !> width cannot exceed dpitch or spitch.
    !>
    !> The copy is always performed by the device associated with the specified stream.
    !> The API is asynchronous with respect to the host, so the call may return before the copy is
    !> complete. The copy can optionally be excuted in a specific stream by passing a non-zero
    !> stream
    !> argument, for HostToDevice or DeviceToHost copies, the copy can overlap with operations
    !> in other streams.
    !>
    !> For multi-gpu or peer-to-peer configurations, it is recommended to use a stream which is
    !> attached to the device where the src data is physically located.
    !>
    !> For optimal peer-to-peer copies, the copy device must be able to access the src and dst
    !> pointers
    !> (by calling hipDeviceEnablePeerAccess) with copy agent as the current device and src/dst as
    !> the
    !> peerDevice argument. If enabling device peer access is not done, the API will still work, but
    !> will perform the copy using a staging buffer on the host.
    !>
    !> @note If host or dst are not pinned, the memory copy will be performed synchronously.  For
    !> best performance, use hipHostMalloc to allocate host memory that is transferred
    !> asynchronously.
    !>
    !> @param[in]   dst    Pointer to destination memory address
    !> @param[in]   dpitch Pitch size in bytes of destination memory
    !> @param[in]   src    Pointer to source memory address
    !> @param[in]   spitch Pitch size in bytes of source memory
    !> @param[in]   width  Width of matrix transfer (columns in bytes)
    !> @param[in]   height Height of matrix transfer (rows)
    !> @param[in]   kind   Type of transfer
    !> @param[in]   stream Stream to use
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy2DAsync(dst, dpitch, src, spitch, width, height, kind, stream) &
       result(Memcpy2DAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy2DAsync")
#else
       bind(C, name="hipMemcpy2DAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dpitch
       type(c_ptr), value :: src
       integer(c_long), value :: spitch
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy2DAsync
    end function hipMemcpy2DAsync

    !---------------------------------------------
    ! hipMemcpy2DToArray
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> @param[in]   dst     Destination memory address
    !> @param[in]   wOffset Destination starting X offset
    !> @param[in]   hOffset Destination starting Y offset
    !> @param[in]   src     Source memory address
    !> @param[in]   spitch  Pitch of source memory
    !> @param[in]   width   Width of matrix transfer (columns in bytes)
    !> @param[in]   height  Height of matrix transfer (rows)
    !> @param[in]   kind    Type of transfer
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpyToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy2DToArray(dst, wOffset, hOffset, src, spitch, width, height, kind) &
       result(Memcpy2DToArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy2DToArray")
#else
       bind(C, name="hipMemcpy2DToArray")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: wOffset
       integer(c_long), value :: hOffset
       type(c_ptr), value :: src
       integer(c_long), value :: spitch
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       integer(c_int) :: Memcpy2DToArray
    end function hipMemcpy2DToArray

    !---------------------------------------------
    ! hipMemcpy2DToArrayAsync
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> @param[in]   dst     Destination memory address
    !> @param[in]   wOffset Destination starting X offset
    !> @param[in]   hOffset Destination starting Y offset
    !> @param[in]   src     Source memory address
    !> @param[in]   spitch  Pitch of source memory
    !> @param[in]   width   Width of matrix transfer (columns in bytes)
    !> @param[in]   height  Height of matrix transfer (rows)
    !> @param[in]   kind    Type of transfer
    !> @param[in]   stream    Accelerator view which the copy is being enqueued
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpyToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy2DToArrayAsync(dst, wOffset, hOffset, src, spitch, width, height, kind, &
                                     stream) &
       result(Memcpy2DToArrayAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy2DToArrayAsync")
#else
       bind(C, name="hipMemcpy2DToArrayAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: wOffset
       integer(c_long), value :: hOffset
       type(c_ptr), value :: src
       integer(c_long), value :: spitch
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy2DToArrayAsync
    end function hipMemcpy2DToArrayAsync

    !---------------------------------------------
    ! hipMemcpy2DArrayToArray
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> @param[in]   dst Destination memory address
    !> @param[in]   wOffsetDst Destination starting X offset
    !> @param[in]   hOffsetDst Destination starting Y offset
    !> @param[in]   src  Source memory address
    !> @param[in]   wOffsetSrc Source starting X offset
    !> @param[in]   hOffsetSrc Source starting Y offset (columns in bytes)
    !> @param[in]   width  Width of matrix transfer (columns in bytes)
    !> @param[in]   height  Height of matrix transfer (rows)
    !> @param[in]   kind Type of transfer
    !>
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpyToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy2DArrayToArray(dst, wOffsetDst, hOffsetDst, src, wOffsetSrc, hOffsetSrc, &
                                     width, height, kind) &
       result(Memcpy2DArrayToArray) &
       bind(C, name="hipMemcpy2DArrayToArray")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: wOffsetDst
       integer(c_long), value :: hOffsetDst
       type(c_ptr), value :: src
       integer(c_long), value :: wOffsetSrc
       integer(c_long), value :: hOffsetSrc
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       integer(c_int) :: Memcpy2DArrayToArray
    end function hipMemcpy2DArrayToArray

    !---------------------------------------------
    ! hipMemcpyToArray
    !---------------------------------------------
    !> @brief Copies data between host and device [Deprecated]
    !>
    !> @ingroup MemoryD
    !>
    !> @param[in]   dst     Destination memory address
    !> @param[in]   wOffset Destination starting X offset
    !> @param[in]   hOffset Destination starting Y offset
    !> @param[in]   src     Source memory address
    !> @param[in]   count   size in bytes to copy
    !> @param[in]   kind    Type of transfer
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    !> @warning  This API is deprecated.
    function hipMemcpyToArray(dst, wOffset, hOffset, src, count, kind) &
       result(MemcpyToArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyToArray")
#else
       bind(C, name="hipMemcpyToArray")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: wOffset
       integer(c_long), value :: hOffset
       type(c_ptr), value :: src
       integer(c_long), value :: count
       integer(c_int), value :: kind
       integer(c_int) :: MemcpyToArray
    end function hipMemcpyToArray

    !---------------------------------------------
    ! hipMemcpyFromArray
    !---------------------------------------------
    !> @brief Copies data between host and device [Deprecated]
    !>
    !> @ingroup MemoryD
    !>
    !> @param[in]   dst       Destination memory address
    !> @param[in]   srcArray  Source memory address
    !> @param[in]   wOffset   Source starting X offset
    !> @param[in]   hOffset   Source starting Y offset
    !> @param[in]   count     Size in bytes to copy
    !> @param[in]   kind      Type of transfer
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    !> @warning  This API is deprecated.
    function hipMemcpyFromArray(dst, srcArray, wOffset, hOffset, count, kind) &
       result(MemcpyFromArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyFromArray")
#else
       bind(C, name="hipMemcpyFromArray")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: srcArray
       integer(c_long), value :: wOffset
       integer(c_long), value :: hOffset
       integer(c_long), value :: count
       integer(c_int), value :: kind
       integer(c_int) :: MemcpyFromArray
    end function hipMemcpyFromArray

    !---------------------------------------------
    ! hipMemcpy2DFromArray
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> @param[in]   dst       Destination memory address
    !> @param[in]   dpitch    Pitch of destination memory
    !> @param[in]   src       Source memory address
    !> @param[in]   wOffset   Source starting X offset
    !> @param[in]   hOffset   Source starting Y offset
    !> @param[in]   width     Width of matrix transfer (columns in bytes)
    !> @param[in]   height    Height of matrix transfer (rows)
    !> @param[in]   kind      Type of transfer
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy2DFromArray(dst, dpitch, src, wOffset, hOffset, width, height, kind) &
       result(Memcpy2DFromArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy2DFromArray")
#else
       bind(C, name="hipMemcpy2DFromArray")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dpitch
       type(c_ptr), value :: src
       integer(c_long), value :: wOffset
       integer(c_long), value :: hOffset
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       integer(c_int) :: Memcpy2DFromArray
    end function hipMemcpy2DFromArray

    !---------------------------------------------
    ! hipMemcpy2DFromArrayAsync
    !---------------------------------------------
    !> @brief Copies data between host and device asynchronously.
    !>
    !> @param[in]   dst       Destination memory address
    !> @param[in]   dpitch    Pitch of destination memory
    !> @param[in]   src       Source memory address
    !> @param[in]   wOffset   Source starting X offset
    !> @param[in]   hOffset   Source starting Y offset
    !> @param[in]   width     Width of matrix transfer (columns in bytes)
    !> @param[in]   height    Height of matrix transfer (rows)
    !> @param[in]   kind      Type of transfer
    !> @param[in]   stream    Accelerator view which the copy is being enqueued
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy2DFromArrayAsync(dst, dpitch, src, wOffset, hOffset, width, height, kind, &
                                       stream) &
       result(Memcpy2DFromArrayAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy2DFromArrayAsync")
#else
       bind(C, name="hipMemcpy2DFromArrayAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dpitch
       type(c_ptr), value :: src
       integer(c_long), value :: wOffset
       integer(c_long), value :: hOffset
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy2DFromArrayAsync
    end function hipMemcpy2DFromArrayAsync

    !---------------------------------------------
    ! hipMemcpyAtoH
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> @param[in]   dst       Destination memory address
    !> @param[in]   srcArray  Source array
    !> @param[in]   srcOffset Offset in bytes of source array
    !> @param[in]   count     Size of memory copy in bytes
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpyAtoH(dst, srcArray, srcOffset, count) &
       result(MemcpyAtoH) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyAtoH")
#else
       bind(C, name="hipMemcpyAtoH")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: srcArray
       integer(c_long), value :: srcOffset
       integer(c_long), value :: count
       integer(c_int) :: MemcpyAtoH
    end function hipMemcpyAtoH

    !---------------------------------------------
    ! hipMemcpyHtoA
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> @param[in]   dstArray   Destination memory address
    !> @param[in]   dstOffset  Offset in bytes of destination array
    !> @param[in]   srcHost    Source host pointer
    !> @param[in]   count      Size of memory copy in bytes
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpyHtoA(dstArray, dstOffset, srcHost, count) &
       result(MemcpyHtoA) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyHtoA")
#else
       bind(C, name="hipMemcpyHtoA")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dstArray
       integer(c_long), value :: dstOffset
       type(c_ptr), value :: srcHost
       integer(c_long), value :: count
       integer(c_int) :: MemcpyHtoA
    end function hipMemcpyHtoA

    !---------------------------------------------
    ! hipMemcpy3D
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> @param[in]   p   3D memory copy parameters
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy3D(p) &
       result(Memcpy3D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy3D")
#else
       bind(C, name="hipMemcpy3D")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: p
       integer(c_int) :: Memcpy3D
    end function hipMemcpy3D

    !---------------------------------------------
    ! hipMemcpy3DAsync
    !---------------------------------------------
    !> @brief Copies data between host and device asynchronously.
    !>
    !> @param[in]   p        3D memory copy parameters
    !> @param[in]   stream   Stream to use
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy3DAsync(p, stream) &
       result(Memcpy3DAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy3DAsync")
#else
       bind(C, name="hipMemcpy3DAsync")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: p
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy3DAsync
    end function hipMemcpy3DAsync

    !---------------------------------------------
    ! hipDrvMemcpy3D
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> @param[in]   pCopy   3D memory copy parameters
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipDrvMemcpy3D(pCopy) &
       result(DrvMemcpy3D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDrvMemcpy3D")
#else
       bind(C, name="hipDrvMemcpy3D")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pCopy
       integer(c_int) :: DrvMemcpy3D
    end function hipDrvMemcpy3D

    !---------------------------------------------
    ! hipDrvMemcpy3DAsync
    !---------------------------------------------
    !> @brief Copies data between host and device asynchronously.
    !>
    !> @param[in]   pCopy    3D memory copy parameters
    !> @param[in]   stream   Stream to use
    !> @returns     #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
    !> #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipDrvMemcpy3DAsync(pCopy, stream) &
       result(DrvMemcpy3DAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDrvMemcpy3DAsync")
#else
       bind(C, name="hipDrvMemcpy3DAsync")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pCopy
       type(c_ptr), value :: stream
       integer(c_int) :: DrvMemcpy3DAsync
    end function hipDrvMemcpy3DAsync

    !---------------------------------------------
    ! hipMemGetAddressRange
    !---------------------------------------------
    !> @brief Get information on memory allocations.
    !>
    !> @param [out] pbase - BAse pointer address
    !> @param [out] psize - Size of allocation
    !> @param [in]  dptr- Device Pointer
    !>
    !> @returns #hipSuccess, #hipErrorNotFound
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    function hipMemGetAddressRange(pbase, psize, dptr) &
       result(MemGetAddressRange) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemGetAddressRange")
#else
       bind(C, name="hipMemGetAddressRange")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pbase
       type(c_ptr), value :: psize
       type(c_ptr), value :: dptr
       integer(c_int) :: MemGetAddressRange
    end function hipMemGetAddressRange

    !---------------------------------------------
    ! hipMemcpyBatchAsync
    !---------------------------------------------
    !> @brief Perform Batch of 1D copies
    !>
    !> @param [in] dsts      - Array of destination pointers
    !> @param [in] srcs      - Array of source pointers.
    !> @param [in] sizes     - Array of sizes for memcpy operations
    !> @param [in] count     - Size of dsts, srcs and sizes arrays
    !> @param [in] attrs     - Array of memcpy attributes (not supported)
    !> @param [in] attrsIdxs - Array of indices to map attrs to copies (not supported)
    !> @param [in] numAttrs  - Size of attrs and attrsIdxs arrays (not supported)
    !> @param [in] failIdx   - Pointer to a location to return failure index inside the batch
    !> @param [in] stream    - stream used to enqueue operations in.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemcpyBatchAsync(dsts, srcs, sizes, count, attrs, attrsIdxs, numAttrs, failIdx, &
                                 stream) &
       result(MemcpyBatchAsync) &
       bind(C, name="hipMemcpyBatchAsync")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: dsts
       type(c_ptr) :: srcs
       type(c_ptr), value :: sizes
       integer(c_long), value :: count
       type(c_ptr), value :: attrs
       type(c_ptr), value :: attrsIdxs
       integer(c_long), value :: numAttrs
       type(c_ptr), value :: failIdx
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyBatchAsync
    end function hipMemcpyBatchAsync

    !---------------------------------------------
    ! hipMemcpy3DBatchAsync
    !---------------------------------------------
    !> @brief Perform Batch of 3D copies
    !>
    !> @param [in] numOps  - Total number of memcpy operations.
    !> @param [in] opList  - Array of size numOps containing the actual memcpy operations.
    !> @param [in] failIdx - Pointer to a location to return the index of the copy where a failure
    !> - was encountered.
    !> @param [in] flags   - Flags for future use, must be zero now.
    !> @param [in] stream  - The stream to enqueue the operations in.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipMemcpy3DBatchAsync(numOps, opList, failIdx, flags, stream) &
       result(Memcpy3DBatchAsync) &
       bind(C, name="hipMemcpy3DBatchAsync")
       import :: c_long, c_ptr, c_int64_t, c_int
       integer(c_long), value :: numOps
       type(c_ptr), value :: opList
       type(c_ptr), value :: failIdx
       integer(c_int64_t), value :: flags
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy3DBatchAsync
    end function hipMemcpy3DBatchAsync

    !---------------------------------------------
    ! hipMemcpy3DPeer
    !---------------------------------------------
    !> @brief Performs 3D memory copies between devices
    !> This API is asynchronous with respect to host
    !>
    !> @param [in] p  - Parameters for memory copy
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, hipErrorInvalidDevice
    function hipMemcpy3DPeer(p) &
       result(Memcpy3DPeer) &
       bind(C, name="hipMemcpy3DPeer")
       import :: c_ptr, c_int
       type(c_ptr), value :: p
       integer(c_int) :: Memcpy3DPeer
    end function hipMemcpy3DPeer

    !---------------------------------------------
    ! hipMemcpy3DPeerAsync
    !---------------------------------------------
    !> @brief Performs 3D memory copies between devices asynchronously
    !>
    !> @param [in] p  - Parameters for memory copy
    !> @param [in] stream - Stream to enqueue operation in.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, hipErrorInvalidDevice
    function hipMemcpy3DPeerAsync(p, stream) &
       result(Memcpy3DPeerAsync) &
       bind(C, name="hipMemcpy3DPeerAsync")
       import :: c_ptr, c_int
       type(c_ptr), value :: p
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy3DPeerAsync
    end function hipMemcpy3DPeerAsync

    !---------------------------------------------
    ! hipDeviceCanAccessPeer
    !---------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> @defgroup PeerToPeer PeerToPeer Device Memory Access
    !>
    !> @ingroup API
    !> This section describes the PeerToPeer device memory access functions of HIP runtime API.
    !>
    !>
    !> @brief Determines if a device can access a peer device's memory.
    !>
    !> @param [out] canAccessPeer - Returns the peer access capability (0 or 1)
    !> @param [in] deviceId - The device accessing the peer device memory.
    !> @param [in] peerDeviceId - Peer device where memory is physically located
    !>
    !> The value of @p canAccessPeer,
    !>
    !> Returns "1" if the specified @p deviceId is capable of directly accessing memory physically
    !> located on @p peerDeviceId,
    !>
    !> Returns "0" if the specified @p deviceId is not capable of directly accessing memory
    !> physically
    !> located on @p peerDeviceId.
    !>
    !> Returns "0" if @p deviceId == @p peerDeviceId, both are valid devices,
    !> however, a device is not a peer of itself.
    !>
    !> Returns #hipErrorInvalidDevice if deviceId or peerDeviceId are not valid devices
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice
    function hipDeviceCanAccessPeer(canAccessPeer, deviceId, peerDeviceId) &
       result(DeviceCanAccessPeer) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceCanAccessPeer")
#else
       bind(C, name="hipDeviceCanAccessPeer")
#endif
       import :: c_int
       integer(c_int) :: canAccessPeer(*)
       integer(c_int), value :: deviceId
       integer(c_int), value :: peerDeviceId
       integer(c_int) :: DeviceCanAccessPeer
    end function hipDeviceCanAccessPeer

    !---------------------------------------------
    ! hipDeviceEnablePeerAccess
    !---------------------------------------------
    !> @brief Enables direct access to memory allocations on a peer device.
    !>
    !> When this API is successful, all memory allocations on peer device will be mapped into the
    !> address space of the current device. In addition, any future memory allocation on the
    !> peer device will remain accessible from the current device, until the access is disabled
    !> using
    !> hipDeviceDisablePeerAccess or device is reset using hipDeviceReset.
    !>
    !> @param [in] peerDeviceId - Peer device to enable direct access to from the current device
    !> @param [in] flags - Reserved for future use, must be zero
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue,
    !> @returns #hipErrorPeerAccessAlreadyEnabled if peer access is already enabled for this device.
    function hipDeviceEnablePeerAccess(peerDeviceId, flags) &
       result(DeviceEnablePeerAccess) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceEnablePeerAccess")
#else
       bind(C, name="hipDeviceEnablePeerAccess")
#endif
       import :: c_int
       integer(c_int), value :: peerDeviceId
       integer(c_int), value :: flags
       integer(c_int) :: DeviceEnablePeerAccess
    end function hipDeviceEnablePeerAccess

    !---------------------------------------------
    ! hipDeviceDisablePeerAccess
    !---------------------------------------------
    !> @brief Disables direct access to memory allocations on a peer device.
    !>
    !> If direct access to memory allocations on peer device has not been enabled yet from the
    !> current
    !> device, it returns #hipErrorPeerAccessNotEnabled.
    !>
    !> @param [in] peerDeviceId  Peer device to disable direct access to
    !>
    !> @returns #hipSuccess, #hipErrorPeerAccessNotEnabled
    function hipDeviceDisablePeerAccess(peerDeviceId) &
       result(DeviceDisablePeerAccess) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceDisablePeerAccess")
#else
       bind(C, name="hipDeviceDisablePeerAccess")
#endif
       import :: c_int
       integer(c_int), value :: peerDeviceId
       integer(c_int) :: DeviceDisablePeerAccess
    end function hipDeviceDisablePeerAccess

    !---------------------------------------------
    ! hipMemcpyPeer
    !---------------------------------------------
    !> @brief Copies memory between two peer accessible devices.
    !>
    !> @param [out] dst - Destination device pointer
    !> @param [in] dstDeviceId - Destination device
    !> @param [in] src - Source device pointer
    !> @param [in] srcDeviceId - Source device
    !> @param [in] sizeBytes - Size of memory copy in bytes
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDevice
    function hipMemcpyPeer(dst, dstDeviceId, src, srcDeviceId, sizeBytes) &
       result(MemcpyPeer) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyPeer")
#else
       bind(C, name="hipMemcpyPeer")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dst
       integer(c_int), value :: dstDeviceId
       type(c_ptr), value :: src
       integer(c_int), value :: srcDeviceId
       integer(c_long), value :: sizeBytes
       integer(c_int) :: MemcpyPeer
    end function hipMemcpyPeer

    !---------------------------------------------
    ! hipMemcpyPeerAsync
    !---------------------------------------------
    !> @brief Copies memory between two peer accessible devices asynchronously.
    !>
    !> @param [out] dst - Destination device pointer
    !> @param [in] dstDeviceId - Destination device
    !> @param [in] src - Source device pointer
    !> @param [in] srcDevice - Source device
    !> @param [in] sizeBytes - Size of memory copy in bytes
    !> @param [in] stream - Stream identifier
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDevice
    function hipMemcpyPeerAsync(dst, dstDeviceId, src, srcDevice, sizeBytes, stream) &
       result(MemcpyPeerAsync) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyPeerAsync")
#else
       bind(C, name="hipMemcpyPeerAsync")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dst
       integer(c_int), value :: dstDeviceId
       type(c_ptr), value :: src
       integer(c_int), value :: srcDevice
       integer(c_long), value :: sizeBytes
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyPeerAsync
    end function hipMemcpyPeerAsync

    !---------------------------------------------
    ! hipCtxCreate
    !---------------------------------------------
    !> @brief Create a context and set it as current/default context
    !>
    !> @param [out] ctx  Context to create
    !> @param [in] flags  Context creation flags
    !> @param [in] device  device handle
    !>
    !> @returns #hipSuccess
    !>
    !> @see hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent, hipCtxPushCurrent,
    !> hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxCreate(ctx, flags, device) &
       result(CtxCreate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxCreate")
#else
       bind(C, name="hipCtxCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: ctx
       integer(c_int), value :: flags
       integer(c_int), value :: device
       integer(c_int) :: CtxCreate
    end function hipCtxCreate

    !---------------------------------------------
    ! hipCtxDestroy
    !---------------------------------------------
    !> @brief Destroy a HIP context [Deprecated]
    !>
    !> @param [in] ctx Context to destroy
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @see hipCtxCreate, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,hipCtxSetCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize , hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxDestroy(ctx) &
       result(CtxDestroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxDestroy")
#else
       bind(C, name="hipCtxDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: ctx
       integer(c_int) :: CtxDestroy
    end function hipCtxDestroy

    !---------------------------------------------
    ! hipCtxPopCurrent
    !---------------------------------------------
    !> @brief Pop the current/default context and return the popped context [Deprecated]
    !>
    !> @param [out] ctx  The current context to pop
    !>
    !> @returns #hipSuccess, #hipErrorInvalidContext
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxSetCurrent, hipCtxGetCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxPopCurrent(ctx) &
       result(CtxPopCurrent) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxPopCurrent")
#else
       bind(C, name="hipCtxPopCurrent")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: ctx
       integer(c_int) :: CtxPopCurrent
    end function hipCtxPopCurrent

    !---------------------------------------------
    ! hipCtxPushCurrent
    !---------------------------------------------
    !> @brief Push the context to be set as current/ default context [Deprecated]
    !>
    !> @param [in] ctx  The current context to push
    !>
    !> @returns #hipSuccess, #hipErrorInvalidContext
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize , hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxPushCurrent(ctx) &
       result(CtxPushCurrent) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxPushCurrent")
#else
       bind(C, name="hipCtxPushCurrent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: ctx
       integer(c_int) :: CtxPushCurrent
    end function hipCtxPushCurrent

    !---------------------------------------------
    ! hipCtxSetCurrent
    !---------------------------------------------
    !> @brief Set the passed context as current/default [Deprecated]
    !>
    !> @param [in] ctx The context to set as current
    !>
    !> @returns #hipSuccess, #hipErrorInvalidContext
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize , hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxSetCurrent(ctx) &
       result(CtxSetCurrent) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxSetCurrent")
#else
       bind(C, name="hipCtxSetCurrent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: ctx
       integer(c_int) :: CtxSetCurrent
    end function hipCtxSetCurrent

    !---------------------------------------------
    ! hipCtxGetCurrent
    !---------------------------------------------
    !> @brief Get the handle of the current/ default context [Deprecated]
    !>
    !> @param [out] ctx  The context to get as current
    !>
    !> @returns #hipSuccess, #hipErrorInvalidContext
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetDevice, hipCtxGetFlags, hipCtxPopCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxGetCurrent(ctx) &
       result(CtxGetCurrent) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxGetCurrent")
#else
       bind(C, name="hipCtxGetCurrent")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: ctx
       integer(c_int) :: CtxGetCurrent
    end function hipCtxGetCurrent

    !---------------------------------------------
    ! hipCtxGetDevice
    !---------------------------------------------
    !> @brief Get the handle of the device associated with current/default context [Deprecated]
    !>
    !> @param [out] device The device from the current context
    !>
    !> @returns #hipSuccess, #hipErrorInvalidContext
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxGetDevice(device) &
       result(CtxGetDevice) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxGetDevice")
#else
       bind(C, name="hipCtxGetDevice")
#endif
       import :: c_int
       integer(c_int) :: device(*)
       integer(c_int) :: CtxGetDevice
    end function hipCtxGetDevice

    !---------------------------------------------
    ! hipCtxGetApiVersion
    !---------------------------------------------
    !> @brief Returns the approximate HIP api version.
    !>
    !> @param [in]  ctx Context to check [Deprecated]
    !> @param [out] apiVersion API version to get
    !>
    !> @returns #hipSuccess
    !>
    !> @warning The HIP feature set does not correspond to an exact CUDA SDK api revision.
    !> This function always set *apiVersion to 4 as an approximation though HIP supports
    !> some features which were introduced in later CUDA SDK revisions.
    !> HIP apps code should not rely on the api revision number here and should
    !> use arch feature flags to test device capabilities or conditional compilation.
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetDevice, hipCtxGetFlags, hipCtxPopCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxGetApiVersion(ctx, apiVersion) &
       result(CtxGetApiVersion) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxGetApiVersion")
#else
       bind(C, name="hipCtxGetApiVersion")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: ctx
       integer(c_int) :: apiVersion(*)
       integer(c_int) :: CtxGetApiVersion
    end function hipCtxGetApiVersion

    !---------------------------------------------
    ! hipCtxGetCacheConfig
    !---------------------------------------------
    !> @brief Get Cache configuration for a specific function [Deprecated]
    !>
    !> @param [out] cacheConfig  Cache configuration
    !>
    !> @returns #hipSuccess
    !>
    !> @warning AMD devices and some Nvidia GPUS do not support reconfigurable cache.  This hint is
    !> ignored on those architectures.
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxGetCacheConfig(cacheConfig) &
       result(CtxGetCacheConfig) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxGetCacheConfig")
#else
       bind(C, name="hipCtxGetCacheConfig")
#endif
       import :: c_int
       integer(c_int) :: cacheConfig(*)
       integer(c_int) :: CtxGetCacheConfig
    end function hipCtxGetCacheConfig

    !---------------------------------------------
    ! hipCtxSetCacheConfig
    !---------------------------------------------
    !> @brief Set L1/Shared cache partition [Deprecated]
    !>
    !> @param [in] cacheConfig  Cache configuration to set
    !>
    !> @return #hipSuccess
    !>
    !> @warning AMD devices and some Nvidia GPUS do not support reconfigurable cache.  This hint is
    !> ignored on those architectures.
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxSetCacheConfig(cacheConfig) &
       result(CtxSetCacheConfig) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxSetCacheConfig")
#else
       bind(C, name="hipCtxSetCacheConfig")
#endif
       import :: c_int
       integer(c_int), value :: cacheConfig
       integer(c_int) :: CtxSetCacheConfig
    end function hipCtxSetCacheConfig

    !---------------------------------------------
    ! hipCtxSetSharedMemConfig
    !---------------------------------------------
    !> @brief Set Shared memory bank configuration  [Deprecated]
    !>
    !> @param [in] config  Shared memory configuration to set
    !>
    !> @return #hipSuccess
    !>
    !> @warning AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint
    !> is
    !> ignored on those architectures.
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxSetSharedMemConfig(config) &
       result(CtxSetSharedMemConfig) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxSetSharedMemConfig")
#else
       bind(C, name="hipCtxSetSharedMemConfig")
#endif
       import :: c_int
       integer(c_int), value :: config
       integer(c_int) :: CtxSetSharedMemConfig
    end function hipCtxSetSharedMemConfig

    !---------------------------------------------
    ! hipCtxGetSharedMemConfig
    !---------------------------------------------
    !> @brief Get Shared memory bank configuration [Deprecated]
    !>
    !> @param [out] pConfig  Pointer of shared memory configuration
    !>
    !> @return #hipSuccess
    !>
    !> @warning AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint
    !> is
    !> ignored on those architectures.
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxGetSharedMemConfig(pConfig) &
       result(CtxGetSharedMemConfig) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxGetSharedMemConfig")
#else
       bind(C, name="hipCtxGetSharedMemConfig")
#endif
       import :: c_int
       integer(c_int) :: pConfig(*)
       integer(c_int) :: CtxGetSharedMemConfig
    end function hipCtxGetSharedMemConfig

    !---------------------------------------------
    ! hipCtxSynchronize
    !---------------------------------------------
    !> @brief Blocks until the default context has completed all preceding requested tasks
    !> [Deprecated]
    !>
    !> @return #hipSuccess
    !>
    !> @warning This function waits for all streams on the default context to complete execution,
    !> and
    !> then returns.
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxSynchronize() &
       result(CtxSynchronize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxSynchronize")
#else
       bind(C, name="hipCtxSynchronize")
#endif
       import :: c_int
       integer(c_int) :: CtxSynchronize
    end function hipCtxSynchronize

    !---------------------------------------------
    ! hipCtxGetFlags
    !---------------------------------------------
    !> @brief Return flags used for creating default context [Deprecated]
    !>
    !> @param [out] flags  Pointer of flags
    !>
    !> @returns #hipSuccess
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxPopCurrent, hipCtxGetCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxGetFlags(flags) &
       result(CtxGetFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxGetFlags")
#else
       bind(C, name="hipCtxGetFlags")
#endif
       import :: c_int
       integer(c_int) :: flags(*)
       integer(c_int) :: CtxGetFlags
    end function hipCtxGetFlags

    !---------------------------------------------
    ! hipCtxEnablePeerAccess
    !---------------------------------------------
    !> @brief Enables direct access to memory allocations in a peer context [Deprecated]
    !>
    !> Memory which already allocated on peer device will be mapped into the address space of the
    !> current device. In addition, all future memory allocations on peerDeviceId will be mapped
    !> into
    !> the address space of the current device when the memory is allocated. The peer memory remains
    !> accessible from the current device until a call to hipDeviceDisablePeerAccess or
    !> hipDeviceReset.
    !>
    !>
    !> @param [in] peerCtx  Peer context
    !> @param [in] flags  flags, need to set as 0
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue,
    !> #hipErrorPeerAccessAlreadyEnabled
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !> @warning PeerToPeer support is experimental.
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxEnablePeerAccess(peerCtx, flags) &
       result(CtxEnablePeerAccess) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxEnablePeerAccess")
#else
       bind(C, name="hipCtxEnablePeerAccess")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: peerCtx
       integer(c_int), value :: flags
       integer(c_int) :: CtxEnablePeerAccess
    end function hipCtxEnablePeerAccess

    !---------------------------------------------
    ! hipCtxDisablePeerAccess
    !---------------------------------------------
    !> @brief Disable direct access from current context's virtual address space to memory
    !> allocations
    !> physically located on a peer context.Disables direct access to memory allocations in a peer
    !> context and unregisters any registered allocations [Deprecated]
    !>
    !> Returns #hipErrorPeerAccessNotEnabled if direct access to memory on peerDevice has not yet
    !> been
    !> enabled from the current device.
    !>
    !> @param [in] peerCtx  Peer context to be disabled
    !>
    !> @returns #hipSuccess, #hipErrorPeerAccessNotEnabled
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !> @warning PeerToPeer support is experimental.
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxDisablePeerAccess(peerCtx) &
       result(CtxDisablePeerAccess) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCtxDisablePeerAccess")
#else
       bind(C, name="hipCtxDisablePeerAccess")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: peerCtx
       integer(c_int) :: CtxDisablePeerAccess
    end function hipCtxDisablePeerAccess

    !---------------------------------------------
    ! hipDevicePrimaryCtxGetState
    !---------------------------------------------
    !> @brief Get the state of the primary context [Deprecated]
    !>
    !> @param [in] dev  Device to get primary context flags for
    !> @param [out] flags  Pointer to store flags
    !> @param [out] active  Pointer to store context state; 0 = inactive, 1 = active
    !>
    !> @returns #hipSuccess
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
    !> NVIDIA platform.
    function hipDevicePrimaryCtxGetState(dev, flags, active) &
       result(DevicePrimaryCtxGetState) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDevicePrimaryCtxGetState")
#else
       bind(C, name="hipDevicePrimaryCtxGetState")
#endif
       import :: c_int
       integer(c_int), value :: dev
       integer(c_int) :: flags(*)
       integer(c_int) :: active(*)
       integer(c_int) :: DevicePrimaryCtxGetState
    end function hipDevicePrimaryCtxGetState

    !---------------------------------------------
    ! hipDevicePrimaryCtxRelease
    !---------------------------------------------
    !> @brief Release the primary context on the GPU.
    !>
    !> @param [in] dev  Device which primary context is released [Deprecated]
    !>
    !> @returns #hipSuccess
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !> @warning This function return #hipSuccess though doesn't release the primaryCtx by design on
    !> HIP/HIP-CLANG path.
    !>
    !> @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
    !> NVIDIA platform.
    function hipDevicePrimaryCtxRelease(dev) &
       result(DevicePrimaryCtxRelease) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDevicePrimaryCtxRelease")
#else
       bind(C, name="hipDevicePrimaryCtxRelease")
#endif
       import :: c_int
       integer(c_int), value :: dev
       integer(c_int) :: DevicePrimaryCtxRelease
    end function hipDevicePrimaryCtxRelease

    !---------------------------------------------
    ! hipDevicePrimaryCtxRetain
    !---------------------------------------------
    !> @brief Retain the primary context on the GPU [Deprecated]
    !>
    !> @param [out] pctx  Returned context handle of the new context
    !> @param [in] dev  Device which primary context is released
    !>
    !> @returns #hipSuccess
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
    !> NVIDIA platform.
    function hipDevicePrimaryCtxRetain(pctx, dev) &
       result(DevicePrimaryCtxRetain) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDevicePrimaryCtxRetain")
#else
       bind(C, name="hipDevicePrimaryCtxRetain")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pctx
       integer(c_int), value :: dev
       integer(c_int) :: DevicePrimaryCtxRetain
    end function hipDevicePrimaryCtxRetain

    !---------------------------------------------
    ! hipDevicePrimaryCtxReset
    !---------------------------------------------
    !> @brief Resets the primary context on the GPU [Deprecated]
    !>
    !> @param [in] dev  Device which primary context is reset
    !>
    !> @returns #hipSuccess
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
    !> NVIDIA platform.
    function hipDevicePrimaryCtxReset(dev) &
       result(DevicePrimaryCtxReset) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDevicePrimaryCtxReset")
#else
       bind(C, name="hipDevicePrimaryCtxReset")
#endif
       import :: c_int
       integer(c_int), value :: dev
       integer(c_int) :: DevicePrimaryCtxReset
    end function hipDevicePrimaryCtxReset

    !---------------------------------------------
    ! hipDevicePrimaryCtxSetFlags
    !---------------------------------------------
    !> @brief Set flags for the primary context [Deprecated]
    !>
    !> @param [in] dev  Device for which the primary context flags are set
    !> @param [in] flags  New flags for the device
    !>
    !> @returns #hipSuccess, #hipErrorContextAlreadyInUse
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
    !> NVIDIA platform.
    function hipDevicePrimaryCtxSetFlags(dev, flags) &
       result(DevicePrimaryCtxSetFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDevicePrimaryCtxSetFlags")
#else
       bind(C, name="hipDevicePrimaryCtxSetFlags")
#endif
       import :: c_int
       integer(c_int), value :: dev
       integer(c_int), value :: flags
       integer(c_int) :: DevicePrimaryCtxSetFlags
    end function hipDevicePrimaryCtxSetFlags

    !---------------------------------------------
    ! hipModuleLoadFatBinary
    !---------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !>
    !> @defgroup Module Module Management
    !>
    !> @ingroup API
    !> This section describes the module management functions of HIP runtime API.
    !>
    !>
    !>
    !> @brief Loads fatbin object
    !>
    !> @param [in] fatbin  fatbin to be loaded as a module
    !> @param [out] module  Module
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidContext, #hipErrorFileNotFound,
    !> #hipErrorOutOfMemory, #hipErrorSharedObjectInitFailed, #hipErrorNotInitialized
    function hipModuleLoadFatBinary(module, fatbin) &
       result(ModuleLoadFatBinary) &
       bind(C, name="hipModuleLoadFatBinary")
       import :: c_ptr, c_int
       type(c_ptr) :: module
       type(c_ptr), value :: fatbin
       integer(c_int) :: ModuleLoadFatBinary
    end function hipModuleLoadFatBinary

    !---------------------------------------------
    ! hipModuleUnload
    !---------------------------------------------
    !> @brief Frees the module
    !>
    !> @param [in] module  Module to free
    !>
    !> @returns #hipSuccess, #hipErrorInvalidResourceHandle
    !>
    !> The module is freed, and the code objects associated with it are destroyed.
    function hipModuleUnload(module) &
       result(ModuleUnload) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaModuleUnload")
#else
       bind(C, name="hipModuleUnload")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: module
       integer(c_int) :: ModuleUnload
    end function hipModuleUnload

    !---------------------------------------------
    ! hipModuleGetFunctionCount
    !---------------------------------------------
    !> @brief Returns the number of functions within a module.
    !>
    !> @param [in] mod  Module to get function count from
    !> @param [out] count  function count from module
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidContext,
    !> #hipErrorNotInitialized,
    !> #hipErrorNotFound,
    function hipModuleGetFunctionCount(count, mod) &
       result(ModuleGetFunctionCount) &
       bind(C, name="hipModuleGetFunctionCount")
       import :: c_int, c_ptr
       integer(c_int) :: count(*)
       type(c_ptr), value :: mod
       integer(c_int) :: ModuleGetFunctionCount
    end function hipModuleGetFunctionCount

    !---------------------------------------------
    ! hipLibraryLoadData
    !---------------------------------------------
    !> @brief Load hip Library from inmemory object
    !>
    !> @param [out] library Output Library
    !> @param [in] code In memory object
    !> @param [in] jitOptions JIT options, CUDA only
    !> @param [in] jitOptionsValues JIT options values, CUDA only
    !> @param [in] numJitOptions Number of JIT options
    !> @param [in] libraryOptions Library options
    !> @param [in] libraryOptionValues Library options values
    !> @param [in] numLibraryOptions Number of library options
    !> @return #hipSuccess, #hipErrorInvalidValue,
    function hipLibraryLoadData(library, code, jitOptions, jitOptionsValues, numJitOptions, &
                                libraryOptions, libraryOptionValues, numLibraryOptions) &
       result(LibraryLoadData) &
       bind(C, name="hipLibraryLoadData")
       import :: c_ptr, c_int
       type(c_ptr) :: library
       type(c_ptr), value :: code
       integer(c_int) :: jitOptions(*)
       type(c_ptr) :: jitOptionsValues
       integer(c_int), value :: numJitOptions
       integer(c_int) :: libraryOptions(*)
       type(c_ptr) :: libraryOptionValues
       integer(c_int), value :: numLibraryOptions
       integer(c_int) :: LibraryLoadData
    end function hipLibraryLoadData

    !---------------------------------------------
    ! hipLibraryUnload
    !---------------------------------------------
    !> @brief Unload HIP Library
    !>
    !> @param [in] library Input created hip library
    !> @return #hipSuccess, #hipErrorInvalidValue
    function hipLibraryUnload(library) &
       result(LibraryUnload) &
       bind(C, name="hipLibraryUnload")
       import :: c_ptr, c_int
       type(c_ptr), value :: library
       integer(c_int) :: LibraryUnload
    end function hipLibraryUnload

    !---------------------------------------------
    ! hipLibraryGetKernelCount
    !---------------------------------------------
    !> @brief Get Kernel count in library
    !>
    !> @param [out] count Count of kernels in library
    !> @param [in] library Input created hip library
    !> @return #hipSuccess, #hipErrorInvalidValue
    function hipLibraryGetKernelCount(count, library) &
       result(LibraryGetKernelCount) &
       bind(C, name="hipLibraryGetKernelCount")
       import :: c_int, c_ptr
       integer(c_int) :: count(*)
       type(c_ptr), value :: library
       integer(c_int) :: LibraryGetKernelCount
    end function hipLibraryGetKernelCount

    !---------------------------------------------
    ! hipLibraryEnumerateKernels
    !---------------------------------------------
    !> @brief Retrieve kernel handles within a library
    !>
    !> @param [out] kernels Buffer for kernel handles
    !> @param [in] numKernels Maximum number of kernel handles to return to buffer
    !> @oaram [in] library Library handle to query from
    !> @return #hipSuccess, #hipErrorInvalidValue
    function hipLibraryEnumerateKernels(kernels, numKernels, library) &
       result(LibraryEnumerateKernels) &
       bind(C, name="hipLibraryEnumerateKernels")
       import :: c_ptr, c_int
       type(c_ptr) :: kernels
       integer(c_int), value :: numKernels
       type(c_ptr), value :: library
       integer(c_int) :: LibraryEnumerateKernels
    end function hipLibraryEnumerateKernels

    !---------------------------------------------
    ! hipKernelGetLibrary
    !---------------------------------------------
    !> @brief Returns a Library Handle
    !>
    !> @param [out] library Returned Library handle
    !> @param [in] kernel Kernel to retrieve library Handle
    !> @return #hipSuccess, #hipErrorInvalidValue
    function hipKernelGetLibrary(library, kernel) &
       result(KernelGetLibrary) &
       bind(C, name="hipKernelGetLibrary")
       import :: c_ptr, c_int
       type(c_ptr) :: library
       type(c_ptr), value :: kernel
       integer(c_int) :: KernelGetLibrary
    end function hipKernelGetLibrary

    !---------------------------------------------
    ! hipKernelGetName
    !---------------------------------------------
    !> @brief Returns a Kernel Name
    !>
    !> @param [out] name Returned Kernel Name
    !> @param [in] kernel Kernel handle to retrieve name
    !> @return #hipSuccess, #hipErrorInvalidValue
    function hipKernelGetName(name, kernel) &
       result(KernelGetName) &
       bind(C, name="hipKernelGetName")
       import :: c_ptr, c_int
       type(c_ptr) :: name
       type(c_ptr), value :: kernel
       integer(c_int) :: KernelGetName
    end function hipKernelGetName

    !---------------------------------------------
    ! hipFuncGetAttributes
    !---------------------------------------------
    !> @brief Find out attributes for a given function.
    !> @ingroup Execution
    !> @param [out] attr  Attributes of funtion
    !> @param [in] func  Pointer to the function handle
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDeviceFunction
    function hipFuncGetAttributes(attr, func) &
       result(FuncGetAttributes) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaFuncGetAttributes")
#else
       bind(C, name="hipFuncGetAttributes")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: attr
       type(c_ptr), value :: func
       integer(c_int) :: FuncGetAttributes
    end function hipFuncGetAttributes

    !---------------------------------------------
    ! hipFuncGetAttribute
    !---------------------------------------------
    !> @brief Find out a specific attribute for a given function.
    !> @ingroup Execution
    !> @param [out] value  Pointer to the value
    !> @param [in]  attrib  Attributes of the given funtion
    !> @param [in]  hfunc  Function to get attributes from
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDeviceFunction
    function hipFuncGetAttribute(value, attrib, hfunc) &
       result(FuncGetAttribute) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaFuncGetAttribute")
#else
       bind(C, name="hipFuncGetAttribute")
#endif
       import :: c_int, c_ptr
       integer(c_int) :: value(*)
       integer(c_int), value :: attrib
       type(c_ptr), value :: hfunc
       integer(c_int) :: FuncGetAttribute
    end function hipFuncGetAttribute

    !---------------------------------------------
    ! hipGetFuncBySymbol
    !---------------------------------------------
    !> @brief Gets pointer to device entry function that matches entry function symbolPtr.
    !>
    !> @param [out] functionPtr  Device entry function
    !> @param [in]  symbolPtr  Pointer to device entry function to search for
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDeviceFunction
    function hipGetFuncBySymbol(functionPtr, symbolPtr) &
       result(GetFuncBySymbol) &
       bind(C, name="hipGetFuncBySymbol")
       import :: c_ptr, c_int
       type(c_ptr) :: functionPtr
       type(c_ptr), value :: symbolPtr
       integer(c_int) :: GetFuncBySymbol
    end function hipGetFuncBySymbol

    !---------------------------------------------
    ! hipModuleLoadData
    !---------------------------------------------
    !> @brief builds module from code object data which resides in host memory.
    !>
    !> The "image" is a pointer to the location of code object data. This data can be either
    !> a single code object or a fat binary (fatbin), which serves as the entry point for loading
    !> and
    !> launching device-specific kernel executions.
    !>
    !> By default, the following command generates a fatbin:
    !>
    !> "amdclang++ -O3 -c --offload-device-only --offload-arch=<GPU_ARCH> <input_file> -o
    !> <output_file>"
    !>
    !> For more details, refer to:
    !> <a
    !> href=
    !> "https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/kernel_language_cpp_support.html#kernel-compilation">
    !> Kernel Compilation</a> in the HIP kernel language C++ support, or
    !> <a
    !> href="https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/hip_rtc.html">HIP runtime
    !> compilation (HIP RTC)</a>.
    !>
    !> @param [in] image  The pointer to the location of data
    !> @param [out] module  Retuned module
    !>
    !> @returns hipSuccess, hipErrorNotInitialized, hipErrorOutOfMemory, hipErrorNotInitialized
    function hipModuleLoadData(module, image) &
       result(ModuleLoadData) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaModuleLoadData")
#else
       bind(C, name="hipModuleLoadData")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: module
       type(c_ptr), value :: image
       integer(c_int) :: ModuleLoadData
    end function hipModuleLoadData

    !---------------------------------------------
    ! hipModuleLoadDataEx
    !---------------------------------------------
    !> @brief builds module from code object which resides in host memory. Image is pointer to that
    !> location. Options are not used. hipModuleLoadData is called.
    !>
    !> @param [in] image  The pointer to the location of data
    !> @param [out] module  Retuned module
    !> @param [in] numOptions Number of options
    !> @param [in] options Options for JIT
    !> @param [in] optionValues  Option values for JIT
    !>
    !> @returns hipSuccess, hipErrorNotInitialized, hipErrorOutOfMemory, hipErrorNotInitialized
    function hipModuleLoadDataEx(module, image, numOptions, options, optionValues) &
       result(ModuleLoadDataEx) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaModuleLoadDataEx")
#else
       bind(C, name="hipModuleLoadDataEx")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: module
       type(c_ptr), value :: image
       integer(c_int), value :: numOptions
       integer(c_int) :: options(*)
       type(c_ptr) :: optionValues
       integer(c_int) :: ModuleLoadDataEx
    end function hipModuleLoadDataEx

    !---------------------------------------------
    ! hipLinkComplete
    !---------------------------------------------
    !> @brief Completes the linking of the given program.
    !> @param [in]   state hip link state
    !> @param [out]  hipBinOut  Upon success, points to the output binary
    !> @param [out]  sizeOut  Size of the binary is stored (optional)
    !>
    !> @returns #hipSuccess #hipErrorInvalidValue
    !>
    !> If adding the data fails, it will
    !> @return #hipErrorInvalidConfiguration
    !>
    !> @see hipError_t
    function hipLinkComplete(state, hipBinOut, sizeOut) &
       result(LinkComplete) &
       bind(C, name="hipLinkComplete")
       import :: c_ptr, c_int
       type(c_ptr), value :: state
       type(c_ptr) :: hipBinOut
       type(c_ptr), value :: sizeOut
       integer(c_int) :: LinkComplete
    end function hipLinkComplete

    !---------------------------------------------
    ! hipLinkCreate
    !---------------------------------------------
    !> @brief Creates a linker instance with options.
    !> @param [in] numOptions  Number of options
    !> @param [in] options  Array of options
    !> @param [in] optionValues  Array of option values cast to void*
    !> @param [out] stateOut  hip link state created upon success
    !>
    !> @returns #hipSuccess #hipErrorInvalidValue #hipErrorInvalidConfiguration
    !>
    !> @see hipSuccess
    function hipLinkCreate(numOptions, options, optionValues, stateOut) &
       result(LinkCreate) &
       bind(C, name="hipLinkCreate")
       import :: c_int, c_ptr
       integer(c_int), value :: numOptions
       integer(c_int) :: options(*)
       type(c_ptr) :: optionValues
       type(c_ptr) :: stateOut
       integer(c_int) :: LinkCreate
    end function hipLinkCreate

    !---------------------------------------------
    ! hipLinkDestroy
    !---------------------------------------------
    !> @brief Deletes the linker instance.
    !> @param [in] state link state instance
    !>
    !> @returns #hipSuccess #hipErrorInvalidValue
    !>
    !> @see hipSuccess
    function hipLinkDestroy(state) &
       result(LinkDestroy) &
       bind(C, name="hipLinkDestroy")
       import :: c_ptr, c_int
       type(c_ptr), value :: state
       integer(c_int) :: LinkDestroy
    end function hipLinkDestroy

    !---------------------------------------------
    ! hipModuleLaunchKernel
    !---------------------------------------------
    !> @brief launches kernel f with launch parameters and shared memory on stream with arguments
    !> passed
    !> to kernelparams or extra
    !> @ingroup Execution
    !> @param [in] f         Kernel to launch.
    !> @param [in] gridDimX  X grid dimension specified as multiple of blockDimX.
    !> @param [in] gridDimY  Y grid dimension specified as multiple of blockDimY.
    !> @param [in] gridDimZ  Z grid dimension specified as multiple of blockDimZ.
    !> @param [in] blockDimX X block dimensions specified in work-items
    !> @param [in] blockDimY Y grid dimension specified in work-items
    !> @param [in] blockDimZ Z grid dimension specified in work-items
    !> @param [in] sharedMemBytes Amount of dynamic shared memory to allocate for this kernel. The
    !> HIP-Clang compiler provides support for extern shared declarations.
    !> @param [in] stream Stream where the kernel should be dispatched. May be 0, in which case th
    !> default stream is used with associated synchronization rules.
    !> @param [in] kernelParams  Kernel parameters to launch
    !> @param [in] extra Pointer to kernel arguments. These are passed directly to the kernel and
    !> must be in the memory layout and alignment expected by the kernel.
    !> All passed arguments must be naturally aligned according to their type. The memory address of
    !> each argument should be a multiple of its size in bytes. Please refer to
    !> hip_porting_driver_api.md for sample usage.
    !>
    !> Please note, HIP does not support kernel launch with total work items defined in dimension
    !> with
    !> size gridDim x blockDim >= 2^32. So gridDim.x * blockDim.x, gridDim.y * blockDim.y
    !> and gridDim.z * blockDim.z are always less than 2^32.
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue
    function hipModuleLaunchKernel(f, gridDimX, gridDimY, gridDimZ, blockDimX, blockDimY, &
                                   blockDimZ, sharedMemBytes, stream, kernelParams, extra) &
       result(ModuleLaunchKernel) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaModuleLaunchKernel")
#else
       bind(C, name="hipModuleLaunchKernel")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: f
       integer(c_int), value :: gridDimX
       integer(c_int), value :: gridDimY
       integer(c_int), value :: gridDimZ
       integer(c_int), value :: blockDimX
       integer(c_int), value :: blockDimY
       integer(c_int), value :: blockDimZ
       integer(c_int), value :: sharedMemBytes
       type(c_ptr), value :: stream
       type(c_ptr) :: kernelParams
       type(c_ptr) :: extra
       integer(c_int) :: ModuleLaunchKernel
    end function hipModuleLaunchKernel

    !---------------------------------------------
    ! hipModuleLaunchCooperativeKernel
    !---------------------------------------------
    !> \addtogroup ModuleCooperativeG Cooperative groups kernel launch of Module management.
    !> \ingroup Module
    !>
    !>
    !> @brief launches kernel f with launch parameters and shared memory on stream with arguments
    !> passed
    !> to kernelParams, where thread blocks can cooperate and synchronize as they execute
    !>
    !> @param [in] f              Kernel to launch.
    !> @param [in] gridDimX       X grid dimension specified as multiple of blockDimX.
    !> @param [in] gridDimY       Y grid dimension specified as multiple of blockDimY.
    !> @param [in] gridDimZ       Z grid dimension specified as multiple of blockDimZ.
    !> @param [in] blockDimX      X block dimension specified in work-items.
    !> @param [in] blockDimY      Y block dimension specified in work-items.
    !> @param [in] blockDimZ      Z block dimension specified in work-items.
    !> @param [in] sharedMemBytes Amount of dynamic shared memory to allocate for this kernel. The
    !> HIP-Clang compiler provides support for extern shared declarations.
    !> @param [in] stream         Stream where the kernel should be dispatched. May be 0,
    !> in which case the default stream is used with associated synchronization rules.
    !> @param [in] kernelParams   A list of kernel arguments.
    !>
    !> Please note, HIP does not support kernel launch with total work items defined in dimension
    !> with
    !> size \f$ gridDim \cdot blockDim \geq 2^{32} \f$.
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidHandle, #hipErrorInvalidImage, #hipErrorInvalidValue,
    !> #hipErrorInvalidConfiguration, #hipErrorLaunchFailure, #hipErrorLaunchOutOfResources,
    !> #hipErrorLaunchTimeOut, #hipErrorCooperativeLaunchTooLarge, #hipErrorSharedObjectInitFailed
    function hipModuleLaunchCooperativeKernel(f, gridDimX, gridDimY, gridDimZ, blockDimX, &
                                              blockDimY, blockDimZ, sharedMemBytes, stream, &
                                              kernelParams) &
       result(ModuleLaunchCooperativeKernel) &
       bind(C, name="hipModuleLaunchCooperativeKernel")
       import :: c_ptr, c_int
       type(c_ptr), value :: f
       integer(c_int), value :: gridDimX
       integer(c_int), value :: gridDimY
       integer(c_int), value :: gridDimZ
       integer(c_int), value :: blockDimX
       integer(c_int), value :: blockDimY
       integer(c_int), value :: blockDimZ
       integer(c_int), value :: sharedMemBytes
       type(c_ptr), value :: stream
       type(c_ptr) :: kernelParams
       integer(c_int) :: ModuleLaunchCooperativeKernel
    end function hipModuleLaunchCooperativeKernel

    !---------------------------------------------
    ! hipModuleLaunchCooperativeKernelMultiDevice
    !---------------------------------------------
    !> @brief Launches kernels on multiple devices where thread blocks can cooperate and
    !> synchronize as they execute.
    !>
    !> @param [in] launchParamsList         List of launch parameters, one per device.
    !> @param [in] numDevices               Size of the launchParamsList array.
    !> @param [in] flags                    Flags to control launch behavior.
    !>
    !> @returns #hipSuccess, #hipErrorDeinitialized, #hipErrorNotInitialized,
    !> #hipErrorInvalidContext,
    !> #hipErrorInvalidHandle, #hipErrorInvalidImage, #hipErrorInvalidValue,
    !> #hipErrorInvalidConfiguration, #hipErrorInvalidResourceHandle, #hipErrorLaunchFailure,
    !> #hipErrorLaunchOutOfResources, #hipErrorLaunchTimeOut, #hipErrorCooperativeLaunchTooLarge,
    !> #hipErrorSharedObjectInitFailed
    function hipModuleLaunchCooperativeKernelMultiDevice(launchParamsList, numDevices, flags) &
       result(ModuleLaunchCooperativeKernelMultiDevice) &
       bind(C, name="hipModuleLaunchCooperativeKernelMultiDevice")
       import :: c_ptr, c_int
       type(c_ptr), value :: launchParamsList
       integer(c_int), value :: numDevices
       integer(c_int), value :: flags
       integer(c_int) :: ModuleLaunchCooperativeKernelMultiDevice
    end function hipModuleLaunchCooperativeKernelMultiDevice

    !---------------------------------------------
    ! hipLaunchCooperativeKernel
    !---------------------------------------------
    !> @brief Launches kernel f with launch parameters and shared memory on stream with arguments
    !> passed
    !> to kernelparams or extra, where thread blocks can cooperate and synchronize as they execute.
    !>
    !> @param [in] f - Kernel to launch.
    !> @param [in] gridDim - Grid dimensions specified as multiple of blockDim.
    !> @param [in] blockDimX - Block dimensions specified in work-items
    !> @param [in] kernelParams - Pointer of arguments passed to the kernel. If the kernel has
    !> multiple
    !> parameters, 'kernelParams' should be array of pointers, each points the corresponding
    !> argument.
    !> @param [in] sharedMemBytes - Amount of dynamic shared memory to allocate for this kernel. The
    !> HIP-Clang compiler provides support for extern shared declarations.
    !> @param [in] stream - Stream where the kernel should be dispatched. May be 0, in which case th
    !> default stream is used with associated synchronization rules.
    !>
    !> Please note, HIP does not support kernel launch with total work items defined in dimension
    !> with
    !> size \f$ gridDim \cdot blockDim \geq 2^{32} \f$.
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue,
    !> #hipErrorCooperativeLaunchTooLarge
    function hipLaunchCooperativeKernel(f, gridDim, blockDimX, kernelParams, sharedMemBytes, &
                                        stream) &
       result(LaunchCooperativeKernel) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaLaunchCooperativeKernel")
#else
       bind(C, name="hipLaunchCooperativeKernel")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: f
       type(c_ptr), value :: gridDim
       type(c_ptr), value :: blockDimX
       type(c_ptr) :: kernelParams
       integer(c_int), value :: sharedMemBytes
       type(c_ptr), value :: stream
       integer(c_int) :: LaunchCooperativeKernel
    end function hipLaunchCooperativeKernel

    !---------------------------------------------
    ! hipLaunchCooperativeKernelMultiDevice
    !---------------------------------------------
    !> @brief Launches kernels on multiple devices where thread blocks can cooperate and
    !> synchronize as they execute.
    !>
    !> @param [in] launchParamsList         List of launch parameters, one per device.
    !> @param [in] numDevices               Size of the launchParamsList array.
    !> @param [in] flags                    Flags to control launch behavior.
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue,
    !> #hipErrorCooperativeLaunchTooLarge
    function hipLaunchCooperativeKernelMultiDevice(launchParamsList, numDevices, flags) &
       result(LaunchCooperativeKernelMultiDevice) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaLaunchCooperativeKernelMultiDevice")
#else
       bind(C, name="hipLaunchCooperativeKernelMultiDevice")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: launchParamsList
       integer(c_int), value :: numDevices
       integer(c_int), value :: flags
       integer(c_int) :: LaunchCooperativeKernelMultiDevice
    end function hipLaunchCooperativeKernelMultiDevice

    !---------------------------------------------
    ! hipExtLaunchMultiKernelMultiDevice
    !---------------------------------------------
    !> @brief Launches kernels on multiple devices and guarantees all specified kernels are
    !> dispatched
    !> on respective streams before enqueuing any other work on the specified streams from any other
    !> threads
    !> @ingroup Execution
    !> @param [in] launchParamsList          List of launch parameters, one per device.
    !> @param [in] numDevices               Size of the launchParamsList array.
    !> @param [in] flags                    Flags to control launch behavior.
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue
    function hipExtLaunchMultiKernelMultiDevice(launchParamsList, numDevices, flags) &
       result(ExtLaunchMultiKernelMultiDevice) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaExtLaunchMultiKernelMultiDevice")
#else
       bind(C, name="hipExtLaunchMultiKernelMultiDevice")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: launchParamsList
       integer(c_int), value :: numDevices
       integer(c_int), value :: flags
       integer(c_int) :: ExtLaunchMultiKernelMultiDevice
    end function hipExtLaunchMultiKernelMultiDevice

    !---------------------------------------------
    ! hipLaunchKernelExC
    !---------------------------------------------
    !> @brief Launches a HIP kernel using a generic function pointer and the specified
    !> configuration.
    !> @ingroup Execution
    !>
    !> This function is equivalent to hipLaunchKernelEx but accepts the kernel as a generic function
    !> pointer.
    !>
    !> @param [in] config                 Pointer to the kernel launch configuration structure.
    !> @param [in] fPtr                   Pointer to the device kernel function.
    !> @param [in] args                   Array of pointers to the kernel arguments.
    !>
    !> @returns #hipSuccess if the kernel is launched successfully, otherwise an appropriate error
    !> code.
    function hipLaunchKernelExC(config, fPtr, args) &
       result(LaunchKernelExC) &
       bind(C, name="hipLaunchKernelExC")
       import :: c_ptr, c_int
       type(c_ptr), value :: config
       type(c_ptr), value :: fPtr
       type(c_ptr) :: args
       integer(c_int) :: LaunchKernelExC
    end function hipLaunchKernelExC

    !---------------------------------------------
    ! hipDrvLaunchKernelEx
    !---------------------------------------------
    !> @brief Launches a HIP kernel using the driver API with the specified configuration.
    !> @ingroup Execution
    !>
    !> This function dispatches the device kernel represented by a HIP function object.
    !> It passes both the kernel parameters and any extra configuration arguments to the kernel
    !> launch.
    !>
    !> @param [in] config  Pointer to the kernel launch configuration structure.
    !> @param [in] f       HIP function object representing the device kernel to be launched.
    !> @param [in] params  Array of pointers to the kernel parameters.
    !> @param [in] extra   Array of pointers for additional launch parameters or extra configuration
    !> data.
    !>
    !> @returns #hipSuccess if the kernel is launched successfully, otherwise an appropriate error
    !> code.
    function hipDrvLaunchKernelEx(config, f, params, extra) &
       result(DrvLaunchKernelEx) &
       bind(C, name="hipDrvLaunchKernelEx")
       import :: c_ptr, c_int
       type(c_ptr), value :: config
       type(c_ptr), value :: f
       type(c_ptr) :: params
       type(c_ptr) :: extra
       integer(c_int) :: DrvLaunchKernelEx
    end function hipDrvLaunchKernelEx

    !---------------------------------------------
    ! hipMemGetHandleForAddressRange
    !---------------------------------------------
    !> @brief Returns a handle for the address range requested.
    !>
    !> This function returns a handle to a device pointer created using either hipMalloc set of APIs
    !> or through hipMemAddressReserve (as long as the ptr is mapped).
    !>
    !> @param [out] handle     Ptr to the handle where the fd or other types will be returned.
    !> @param [in] dptr        Device ptr for which we get the handle.
    !> @param [in] size        Size of the address range.
    !> @param [in] handleType  Type of the handle requested for the address range.
    !> @param [in] flags       Any flags set regarding the handle requested.
    !>
    !> @returns #hipSuccess if the kernel is launched successfully, otherwise an appropriate error
    !> code.
    function hipMemGetHandleForAddressRange(handle, dptr, size, handleType, flags) &
       result(MemGetHandleForAddressRange) &
       bind(C, name="hipMemGetHandleForAddressRange")
       import :: c_ptr, c_long, c_int, c_int64_t
       type(c_ptr), value :: handle
       type(c_ptr), value :: dptr
       integer(c_long), value :: size
       integer(c_int), value :: handleType
       integer(c_int64_t), value :: flags
       integer(c_int) :: MemGetHandleForAddressRange
    end function hipMemGetHandleForAddressRange

    !---------------------------------------------
    ! hipModuleOccupancyMaxPotentialBlockSize
    !---------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> @defgroup Occupancy Occupancy
    !>
    !> This section describes the occupancy functions of HIP runtime API.
    !>
    !>
    !>
    !> @brief determine the grid and block sizes to achieves maximum occupancy for a kernel
    !>
    !> @param [out] gridSize           minimum grid size for maximum potential occupancy
    !> @param [out] blockSize          block size for maximum potential occupancy
    !> @param [in]  f                  kernel function for which occupancy is calulated
    !> @param [in] dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
    !> @param [in]  blockSizeLimit     the maximum block size for the kernel, use 0 for no limit
    !>
    !> Please note, HIP does not support kernel launch with total work items defined in dimension
    !> with
    !> size gridDim x blockDim >= 2^32.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipModuleOccupancyMaxPotentialBlockSize(gridSize, blockSize, f, dynSharedMemPerBlk, &
                                                     blockSizeLimit) &
       result(ModuleOccupancyMaxPotentialBlockSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaModuleOccupancyMaxPotentialBlockSize")
#else
       bind(C, name="hipModuleOccupancyMaxPotentialBlockSize")
#endif
       import :: c_int, c_ptr, c_long
       integer(c_int) :: gridSize(*)
       integer(c_int) :: blockSize(*)
       type(c_ptr), value :: f
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int), value :: blockSizeLimit
       integer(c_int) :: ModuleOccupancyMaxPotentialBlockSize
    end function hipModuleOccupancyMaxPotentialBlockSize

    !---------------------------------------------
    ! hipModuleOccupancyMaxPotentialBlockSizeWithFlags
    !---------------------------------------------
    !> @brief determine the grid and block sizes to achieves maximum occupancy for a kernel
    !>
    !> @param [out] gridSize           minimum grid size for maximum potential occupancy
    !> @param [out] blockSize          block size for maximum potential occupancy
    !> @param [in]  f                  kernel function for which occupancy is calulated
    !> @param [in] dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
    !> @param [in]  blockSizeLimit     the maximum block size for the kernel, use 0 for no limit
    !> @param [in]  flags            Extra flags for occupancy calculation (only default supported)
    !>
    !> Please note, HIP does not support kernel launch with total work items defined in dimension
    !> with
    !> size gridDim x blockDim >= 2^32.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipModuleOccupancyMaxPotentialBlockSizeWithFlags(gridSize, blockSize, f, &
                                                              dynSharedMemPerBlk, blockSizeLimit, &
                                                              flags) &
       result(ModuleOccupancyMaxPotentialBlockSizeWithFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaModuleOccupancyMaxPotentialBlockSizeWithFlags")
#else
       bind(C, name="hipModuleOccupancyMaxPotentialBlockSizeWithFlags")
#endif
       import :: c_int, c_ptr, c_long
       integer(c_int) :: gridSize(*)
       integer(c_int) :: blockSize(*)
       type(c_ptr), value :: f
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int), value :: blockSizeLimit
       integer(c_int), value :: flags
       integer(c_int) :: ModuleOccupancyMaxPotentialBlockSizeWithFlags
    end function hipModuleOccupancyMaxPotentialBlockSizeWithFlags

    !---------------------------------------------
    ! hipModuleOccupancyMaxActiveBlocksPerMultiprocessor
    !---------------------------------------------
    !> @brief Returns occupancy for a device function.
    !>
    !> @param [out] numBlocks        Returned occupancy
    !> @param [in]  f                Kernel function (hipFunction) for which occupancy is calulated
    !> @param [in]  blockSize        Block size the kernel is intended to be launched with
    !> @param [in] dynSharedMemPerBlk Dynamic shared memory usage (in bytes) intended for each block
    !> @returns  #hipSuccess, #hipErrorInvalidValue
    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor(numBlocks, f, blockSize, &
                                                                dynSharedMemPerBlk) &
       result(ModuleOccupancyMaxActiveBlocksPerMultiprocessor) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaModuleOccupancyMaxActiveBlocksPerMultiprocessor")
#else
       bind(C, name="hipModuleOccupancyMaxActiveBlocksPerMultiprocessor")
#endif
       import :: c_int, c_ptr, c_long
       integer(c_int) :: numBlocks(*)
       type(c_ptr), value :: f
       integer(c_int), value :: blockSize
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int) :: ModuleOccupancyMaxActiveBlocksPerMultiprocessor
    end function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor

    !---------------------------------------------
    ! hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
    !---------------------------------------------
    !> @brief Returns occupancy for a device function.
    !>
    !> @param [out] numBlocks        Returned occupancy
    !> @param [in]  f                Kernel function(hipFunction_t) for which occupancy is calulated
    !> @param [in]  blockSize        Block size the kernel is intended to be launched with
    !> @param [in] dynSharedMemPerBlk Dynamic shared memory usage (in bytes) intended for each block
    !> @param [in]  flags            Extra flags for occupancy calculation (only default supported)
    !> @returns  #hipSuccess, #hipErrorInvalidValue
    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags(numBlocks, f, blockSize, &
                                                                         dynSharedMemPerBlk, &
                                                                         flags) &
       result(ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags) &
       bind(C, name="hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
       import :: c_int, c_ptr, c_long
       integer(c_int) :: numBlocks(*)
       type(c_ptr), value :: f
       integer(c_int), value :: blockSize
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int), value :: flags
       integer(c_int) :: ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
    end function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags

    !---------------------------------------------
    ! hipOccupancyMaxActiveBlocksPerMultiprocessor
    !---------------------------------------------
    !> @brief Returns occupancy for a device function.
    !>
    !> @param [out] numBlocks        Returned occupancy
    !> @param [in]  f                Kernel function for which occupancy is calulated
    !> @param [in]  blockSize        Block size the kernel is intended to be launched with
    !> @param [in] dynSharedMemPerBlk Dynamic shared memory usage (in bytes) intended for each block
    !> @returns  #hipSuccess, #hipErrorInvalidDeviceFunction, #hipErrorInvalidValue
    function hipOccupancyMaxActiveBlocksPerMultiprocessor(numBlocks, f, blockSize, &
                                                          dynSharedMemPerBlk) &
       result(OccupancyMaxActiveBlocksPerMultiprocessor) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaOccupancyMaxActiveBlocksPerMultiprocessor")
#else
       bind(C, name="hipOccupancyMaxActiveBlocksPerMultiprocessor")
#endif
       import :: c_int, c_ptr, c_long
       integer(c_int) :: numBlocks(*)
       type(c_ptr), value :: f
       integer(c_int), value :: blockSize
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int) :: OccupancyMaxActiveBlocksPerMultiprocessor
    end function hipOccupancyMaxActiveBlocksPerMultiprocessor

    !---------------------------------------------
    ! hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
    !---------------------------------------------
    !> @brief Returns occupancy for a device function.
    !>
    !> @param [out] numBlocks        Returned occupancy
    !> @param [in]  f                Kernel function for which occupancy is calulated
    !> @param [in]  blockSize        Block size the kernel is intended to be launched with
    !> @param [in] dynSharedMemPerBlk Dynamic shared memory usage (in bytes) intended for each block
    !> @param [in]  flags            Extra flags for occupancy calculation (currently ignored)
    !> @returns  #hipSuccess, #hipErrorInvalidDeviceFunction, #hipErrorInvalidValue
    function hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags(numBlocks, f, blockSize, &
                                                                   dynSharedMemPerBlk, flags) &
       result(OccupancyMaxActiveBlocksPerMultiprocessorWithFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
#else
       bind(C, name="hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
#endif
       import :: c_int, c_ptr, c_long
       integer(c_int) :: numBlocks(*)
       type(c_ptr), value :: f
       integer(c_int), value :: blockSize
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int), value :: flags
       integer(c_int) :: OccupancyMaxActiveBlocksPerMultiprocessorWithFlags
    end function hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags

    !---------------------------------------------
    ! hipOccupancyMaxPotentialBlockSize
    !---------------------------------------------
    !> @brief determine the grid and block sizes to achieves maximum occupancy for a kernel
    !>
    !> @param [out] gridSize           minimum grid size for maximum potential occupancy
    !> @param [out] blockSize          block size for maximum potential occupancy
    !> @param [in]  f                  kernel function for which occupancy is calulated
    !> @param [in] dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
    !> @param [in]  blockSizeLimit     the maximum block size for the kernel, use 0 for no limit
    !>
    !> Please note, HIP does not support kernel launch with total work items defined in dimension
    !> with
    !> size gridDim x blockDim >= 2^32.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipOccupancyMaxPotentialBlockSize(gridSize, blockSize, f, dynSharedMemPerBlk, &
                                               blockSizeLimit) &
       result(OccupancyMaxPotentialBlockSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaOccupancyMaxPotentialBlockSize")
#else
       bind(C, name="hipOccupancyMaxPotentialBlockSize")
#endif
       import :: c_int, c_ptr, c_long
       integer(c_int) :: gridSize(*)
       integer(c_int) :: blockSize(*)
       type(c_ptr), value :: f
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int), value :: blockSizeLimit
       integer(c_int) :: OccupancyMaxPotentialBlockSize
    end function hipOccupancyMaxPotentialBlockSize

    !---------------------------------------------
    ! hipOccupancyAvailableDynamicSMemPerBlock
    !---------------------------------------------
    !> @brief Returns dynamic shared memory available per block when launching numBlocks blocks on
    !> SM.
    !>
    !> @ingroup Occupancy
    !> Returns in \p *dynamicSmemSize the maximum size of dynamic shared memory /
    !> to allow numBlocks blocks per SM.
    !>
    !> @param [out] dynamicSmemSize Returned maximum dynamic shared memory.
    !> @param [in]  f               Kernel function for which occupancy is calculated.
    !> @param [in]  numBlocks       Number of blocks to fit on SM
    !> @param [in]  blockSize       Size of the block
    !>
    !> @return #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidDeviceFunction,
    !> #hipErrorInvalidValue,
    !> #hipErrorUnknown
    function hipOccupancyAvailableDynamicSMemPerBlock(dynamicSmemSize, f, numBlocks, blockSize) &
       result(OccupancyAvailableDynamicSMemPerBlock) &
       bind(C, name="hipOccupancyAvailableDynamicSMemPerBlock")
       import :: c_ptr, c_int
       type(c_ptr), value :: dynamicSmemSize
       type(c_ptr), value :: f
       integer(c_int), value :: numBlocks
       integer(c_int), value :: blockSize
       integer(c_int) :: OccupancyAvailableDynamicSMemPerBlock
    end function hipOccupancyAvailableDynamicSMemPerBlock

    !---------------------------------------------
    ! hipProfilerStart
    !---------------------------------------------
    !> @brief Start recording of profiling information [Deprecated]
    !> When using this API, start the profiler with profiling disabled.  (--startdisabled)
    !> @returns  #hipErrorNotSupported
    !> @warning hipProfilerStart API is deprecated, use roctracer/rocTX instead.
    function hipProfilerStart() &
       result(ProfilerStart) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaProfilerStart")
#else
       bind(C, name="hipProfilerStart")
#endif
       import :: c_int
       integer(c_int) :: ProfilerStart
    end function hipProfilerStart

    !---------------------------------------------
    ! hipProfilerStop
    !---------------------------------------------
    !> @brief Stop recording of profiling information [Deprecated]
    !> When using this API, start the profiler with profiling disabled.  (--startdisabled)
    !> @returns  #hipErrorNotSupported
    !> @warning  hipProfilerStart API is deprecated, use roctracer/rocTX instead.
    function hipProfilerStop() &
       result(ProfilerStop) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaProfilerStop")
#else
       bind(C, name="hipProfilerStop")
#endif
       import :: c_int
       integer(c_int) :: ProfilerStop
    end function hipProfilerStop

    !---------------------------------------------
    ! hipConfigureCall
    !---------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> -------------------------------------------------------------------------------------------------
    !> @defgroup Clang Launch API to support the triple-chevron syntax
    !>
    !> This section describes the API to support the triple-chevron syntax.
    !>
    !>
    !> @brief Configure a kernel launch.
    !>
    !> @param [in] gridDim   grid dimension specified as multiple of blockDim.
    !> @param [in] blockDim  block dimensions specified in work-items
    !> @param [in] sharedMem Amount of dynamic shared memory to allocate for this kernel. The
    !> HIP-Clang compiler provides support for extern shared declarations.
    !> @param [in] stream Stream where the kernel should be dispatched. May be 0, in which case the
    !> default stream is used with associated synchronization rules.
    !>
    !> Please note, HIP does not support kernel launch with total work items defined in dimension
    !> with
    !> size gridDim x blockDim >= 2^32.
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue
    function hipConfigureCall(gridDim, blockDim, sharedMem, stream) &
       result(ConfigureCall) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaConfigureCall")
#else
       bind(C, name="hipConfigureCall")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: gridDim
       type(c_ptr), value :: blockDim
       integer(c_long), value :: sharedMem
       type(c_ptr), value :: stream
       integer(c_int) :: ConfigureCall
    end function hipConfigureCall

    !---------------------------------------------
    ! hipSetupArgument
    !---------------------------------------------
    !> @brief Set a kernel argument.
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue
    !>
    !> @param [in] arg    Pointer the argument in host memory.
    !> @param [in] size   Size of the argument.
    !> @param [in] offset Offset of the argument on the argument stack.
    function hipSetupArgument(arg, size, offset) &
       result(SetupArgument) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaSetupArgument")
#else
       bind(C, name="hipSetupArgument")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: arg
       integer(c_long), value :: size
       integer(c_long), value :: offset
       integer(c_int) :: SetupArgument
    end function hipSetupArgument

    !---------------------------------------------
    ! hipLaunchByPtr
    !---------------------------------------------
    !> @brief Launch a kernel.
    !>
    !> @param [in] func Kernel to launch.
    !>
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue
    function hipLaunchByPtr(func) &
       result(LaunchByPtr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaLaunchByPtr")
#else
       bind(C, name="hipLaunchByPtr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: func
       integer(c_int) :: LaunchByPtr
    end function hipLaunchByPtr

    !---------------------------------------------
    ! hipLaunchKernel
    !---------------------------------------------
    !> @brief C compliant kernel launch API
    !>
    !> @param [in] function_address - Kernel stub function pointer.
    !> @param [in] numBlocks - Number of blocks.
    !> @param [in] dimBlocks - Dimension of a block
    !> @param [in] args - Pointer of arguments passed to the kernel. If the kernel has multiple
    !> parameters, 'args' should be array of pointers, each points the corresponding argument.
    !> @param [in] sharedMemBytes - Amount of dynamic shared memory to allocate for this kernel. The
    !> HIP-Clang compiler provides support for extern shared declarations.
    !> @param [in] stream - Stream where the kernel should be dispatched. May be 0, in which case th
    !> default stream is used with associated synchronization rules.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipLaunchKernel(function_address, numBlocks, dimBlocks, args, sharedMemBytes, stream) &
       result(LaunchKernel) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaLaunchKernel")
#else
       bind(C, name="hipLaunchKernel")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: function_address
       type(c_ptr), value :: numBlocks
       type(c_ptr), value :: dimBlocks
       type(c_ptr) :: args
       integer(c_long), value :: sharedMemBytes
       type(c_ptr), value :: stream
       integer(c_int) :: LaunchKernel
    end function hipLaunchKernel

    !---------------------------------------------
    ! hipLaunchHostFunc
    !---------------------------------------------
    !> @brief Enqueues a host function call in a stream.
    !>
    !> @param [in] stream - The stream to enqueue work in.
    !> @param [in] fn - The function to call once enqueued preceeding operations are complete.
    !> @param [in] userData - User-specified data to be passed to the function.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidResourceHandle, #hipErrorInvalidValue,
    !> #hipErrorNotSupported
    !>
    !> The host function to call in this API will be executed after the preceding operations in
    !> the stream are complete. The function is a blocking operation that blocks operations in the
    !> stream that follow it, until the function is returned.
    !> Event synchronization and internal callback functions make sure enqueued operations will
    !> execute in order, in the stream.
    !>
    !> The host function must not make any HIP API calls. The host function is non-reentrant. It
    !> must
    !> not perform sychronization with any operation that may depend on other processing execution
    !> but is not enqueued to run earlier in the stream.
    !>
    !> Host functions that are enqueued respectively in different non-blocking streams can run
    !> concurrently.
    !>
    !> @warning  This API is marked as beta, meaning, while this is feature complete,
    !> it is still open to changes and may have outstanding issues.
    function hipLaunchHostFunc(stream, fn, userData) &
       result(LaunchHostFunc) &
       bind(C, name="hipLaunchHostFunc")
       import :: c_ptr, c_funptr, c_int
       type(c_ptr), value :: stream
       type(c_funptr), value :: fn
       type(c_ptr), value :: userData
       integer(c_int) :: LaunchHostFunc
    end function hipLaunchHostFunc

    !---------------------------------------------
    ! hipDrvMemcpy2DUnaligned
    !---------------------------------------------
    !> Copies memory for 2D arrays.
    !>
    !> @param pCopy           - Parameters for the memory copy
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipDrvMemcpy2DUnaligned(pCopy) &
       result(DrvMemcpy2DUnaligned) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDrvMemcpy2DUnaligned")
#else
       bind(C, name="hipDrvMemcpy2DUnaligned")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pCopy
       integer(c_int) :: DrvMemcpy2DUnaligned
    end function hipDrvMemcpy2DUnaligned

    !---------------------------------------------
    ! hipExtLaunchKernel
    !---------------------------------------------
    !> @brief Launches kernel from the pointer address, with arguments and shared memory on stream.
    !>
    !> @param [in] function_address - Pointer to the Kernel to launch.
    !> @param [in] numBlocks -  Number of blocks.
    !> @param [in] dimBlocks - Dimension of a block.
    !> @param [in] args - Pointer of arguments passed to the kernel. If the kernel has multiple
    !> parameters, 'args' should be array of pointers, each points the corresponding argument.
    !> @param [in] sharedMemBytes - Amount of dynamic shared memory to allocate for this kernel.
    !> HIP-Clang compiler provides support for extern shared declarations.
    !> @param [in] stream - Stream where the kernel should be dispatched.
    !> May be 0, in which case the default stream is used with associated synchronization rules.
    !> @param [in] startEvent - If non-null, specified event will be updated to track the start time
    !> of
    !> the kernel launch. The event must be created before calling this API.
    !> @param [in] stopEvent - If non-null, specified event will be updated to track the stop time
    !> of
    !> the kernel launch. The event must be created before calling this API.
    !> @param [in] flags - The value of hipExtAnyOrderLaunch, signifies if kernel can be
    !> launched in any order.
    !> @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue.
    function hipExtLaunchKernel(function_address, numBlocks, dimBlocks, args, sharedMemBytes, &
                                stream, startEvent, stopEvent, flags) &
       result(ExtLaunchKernel) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaExtLaunchKernel")
#else
       bind(C, name="hipExtLaunchKernel")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: function_address
       type(c_ptr), value :: numBlocks
       type(c_ptr), value :: dimBlocks
       type(c_ptr) :: args
       integer(c_long), value :: sharedMemBytes
       type(c_ptr), value :: stream
       type(c_ptr), value :: startEvent
       type(c_ptr), value :: stopEvent
       integer(c_int), value :: flags
       integer(c_int) :: ExtLaunchKernel
    end function hipExtLaunchKernel

    !---------------------------------------------
    ! hipCreateTextureObject
    !---------------------------------------------
    !> @brief Creates a texture object.
    !>
    !> @param [out] pTexObject  pointer to the texture object to create
    !> @param [in] pResDesc  pointer to resource descriptor
    !> @param [in] pTexDesc  pointer to texture descriptor
    !> @param [in] pResViewDesc  pointer to resource view descriptor
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported, #hipErrorOutOfMemory
    !>
    !> @note 3D linear filter isn't supported on GFX90A boards, on which the API @p
    !> hipCreateTextureObject will return hipErrorNotSupported.
    function hipCreateTextureObject(pTexObject, pResDesc, pTexDesc, pResViewDesc) &
       result(CreateTextureObject) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCreateTextureObject")
#else
       bind(C, name="hipCreateTextureObject")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pTexObject
       type(c_ptr), value :: pResDesc
       type(c_ptr), value :: pTexDesc
       type(c_ptr), value :: pResViewDesc
       integer(c_int) :: CreateTextureObject
    end function hipCreateTextureObject

    !---------------------------------------------
    ! hipDestroyTextureObject
    !---------------------------------------------
    !> @brief Destroys a texture object.
    !>
    !> @param [in] textureObject  texture object to destroy
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipDestroyTextureObject(textureObject) &
       result(DestroyTextureObject) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDestroyTextureObject")
#else
       bind(C, name="hipDestroyTextureObject")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: textureObject
       integer(c_int) :: DestroyTextureObject
    end function hipDestroyTextureObject

    !---------------------------------------------
    ! hipGetChannelDesc
    !---------------------------------------------
    !> @brief Gets the channel descriptor in an array.
    !>
    !> @param [in] desc  pointer to channel format descriptor
    !> @param [out] array  memory array on the device
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGetChannelDesc(desc, array) &
       result(GetChannelDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetChannelDesc")
#else
       bind(C, name="hipGetChannelDesc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: desc
       type(c_ptr), value :: array
       integer(c_int) :: GetChannelDesc
    end function hipGetChannelDesc

    !---------------------------------------------
    ! hipGetTextureObjectResourceDesc
    !---------------------------------------------
    !> @brief Gets resource descriptor for the texture object.
    !>
    !> @param [out] pResDesc  pointer to resource descriptor
    !> @param [in] textureObject  texture object
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGetTextureObjectResourceDesc(pResDesc, textureObject) &
       result(GetTextureObjectResourceDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetTextureObjectResourceDesc")
#else
       bind(C, name="hipGetTextureObjectResourceDesc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pResDesc
       type(c_ptr), value :: textureObject
       integer(c_int) :: GetTextureObjectResourceDesc
    end function hipGetTextureObjectResourceDesc

    !---------------------------------------------
    ! hipGetTextureObjectResourceViewDesc
    !---------------------------------------------
    !> @brief Gets resource view descriptor for the texture object.
    !>
    !> @param [out] pResViewDesc  pointer to resource view descriptor
    !> @param [in] textureObject  texture object
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGetTextureObjectResourceViewDesc(pResViewDesc, textureObject) &
       result(GetTextureObjectResourceViewDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetTextureObjectResourceViewDesc")
#else
       bind(C, name="hipGetTextureObjectResourceViewDesc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pResViewDesc
       type(c_ptr), value :: textureObject
       integer(c_int) :: GetTextureObjectResourceViewDesc
    end function hipGetTextureObjectResourceViewDesc

    !---------------------------------------------
    ! hipGetTextureObjectTextureDesc
    !---------------------------------------------
    !> @brief Gets texture descriptor for the texture object.
    !>
    !> @param [out] pTexDesc  pointer to texture descriptor
    !> @param [in] textureObject  texture object
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGetTextureObjectTextureDesc(pTexDesc, textureObject) &
       result(GetTextureObjectTextureDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetTextureObjectTextureDesc")
#else
       bind(C, name="hipGetTextureObjectTextureDesc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pTexDesc
       type(c_ptr), value :: textureObject
       integer(c_int) :: GetTextureObjectTextureDesc
    end function hipGetTextureObjectTextureDesc

    !---------------------------------------------
    ! hipTexObjectCreate
    !---------------------------------------------
    !> @brief Creates a texture object.
    !>
    !> @param [out] pTexObject  pointer to texture object to create
    !> @param [in] pResDesc  pointer to resource descriptor
    !> @param [in] pTexDesc  pointer to texture descriptor
    !> @param [in] pResViewDesc  pointer to resource view descriptor
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipTexObjectCreate(pTexObject, pResDesc, pTexDesc, pResViewDesc) &
       result(TexObjectCreate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexObjectCreate")
#else
       bind(C, name="hipTexObjectCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pTexObject
       type(c_ptr), value :: pResDesc
       type(c_ptr), value :: pTexDesc
       type(c_ptr), value :: pResViewDesc
       integer(c_int) :: TexObjectCreate
    end function hipTexObjectCreate

    !---------------------------------------------
    ! hipTexObjectDestroy
    !---------------------------------------------
    !> @brief Destroys a texture object.
    !>
    !> @param [in] texObject  texture object to destroy
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipTexObjectDestroy(texObject) &
       result(TexObjectDestroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexObjectDestroy")
#else
       bind(C, name="hipTexObjectDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: texObject
       integer(c_int) :: TexObjectDestroy
    end function hipTexObjectDestroy

    !---------------------------------------------
    ! hipTexObjectGetResourceDesc
    !---------------------------------------------
    !> @brief Gets resource descriptor of a texture object.
    !>
    !> @param [out] pResDesc  pointer to resource descriptor
    !> @param [in] texObject  texture object
    !>
    !> @returns #hipSuccess, #hipErrorNotSupported, #hipErrorInvalidValue
    function hipTexObjectGetResourceDesc(pResDesc, texObject) &
       result(TexObjectGetResourceDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexObjectGetResourceDesc")
#else
       bind(C, name="hipTexObjectGetResourceDesc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pResDesc
       type(c_ptr), value :: texObject
       integer(c_int) :: TexObjectGetResourceDesc
    end function hipTexObjectGetResourceDesc

    !---------------------------------------------
    ! hipTexObjectGetResourceViewDesc
    !---------------------------------------------
    !> @brief Gets resource view descriptor of a texture object.
    !>
    !> @param [out] pResViewDesc  pointer to resource view descriptor
    !> @param [in] texObject  texture object
    !>
    !> @returns #hipSuccess, #hipErrorNotSupported, #hipErrorInvalidValue
    function hipTexObjectGetResourceViewDesc(pResViewDesc, texObject) &
       result(TexObjectGetResourceViewDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexObjectGetResourceViewDesc")
#else
       bind(C, name="hipTexObjectGetResourceViewDesc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pResViewDesc
       type(c_ptr), value :: texObject
       integer(c_int) :: TexObjectGetResourceViewDesc
    end function hipTexObjectGetResourceViewDesc

    !---------------------------------------------
    ! hipTexObjectGetTextureDesc
    !---------------------------------------------
    !> @brief Gets texture descriptor of a texture object.
    !>
    !> @param [out] pTexDesc  pointer to texture descriptor
    !> @param [in] texObject  texture object
    !>
    !> @returns #hipSuccess, #hipErrorNotSupported, #hipErrorInvalidValue
    function hipTexObjectGetTextureDesc(pTexDesc, texObject) &
       result(TexObjectGetTextureDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexObjectGetTextureDesc")
#else
       bind(C, name="hipTexObjectGetTextureDesc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pTexDesc
       type(c_ptr), value :: texObject
       integer(c_int) :: TexObjectGetTextureDesc
    end function hipTexObjectGetTextureDesc

    !---------------------------------------------
    ! hipMallocMipmappedArray
    !---------------------------------------------
    !> @brief Allocate a mipmapped array on the device.
    !>
    !> @param[out] mipmappedArray  - Pointer to allocated mipmapped array in device memory
    !> @param[in]  desc            - Requested channel format
    !> @param[in]  extent          - Requested allocation size (width field in elements)
    !> @param[in]  numLevels       - Number of mipmap levels to allocate
    !> @param[in]  flags           - Flags for extensions
    !>
    !> @return #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryAllocation
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMallocMipmappedArray(mipmappedArray, desc, extent, numLevels, flags) &
       result(MallocMipmappedArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMallocMipmappedArray")
#else
       bind(C, name="hipMallocMipmappedArray")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: mipmappedArray
       type(c_ptr), value :: desc
       type(c_ptr), value :: extent
       integer(c_int), value :: numLevels
       integer(c_int), value :: flags
       integer(c_int) :: MallocMipmappedArray
    end function hipMallocMipmappedArray

    !---------------------------------------------
    ! hipFreeMipmappedArray
    !---------------------------------------------
    !> @brief Frees a mipmapped array on the device.
    !>
    !> @param[in] mipmappedArray - Pointer to mipmapped array to free
    !>
    !> @return #hipSuccess, #hipErrorInvalidValue
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipFreeMipmappedArray(mipmappedArray) &
       result(FreeMipmappedArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaFreeMipmappedArray")
#else
       bind(C, name="hipFreeMipmappedArray")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: mipmappedArray
       integer(c_int) :: FreeMipmappedArray
    end function hipFreeMipmappedArray

    !---------------------------------------------
    ! hipGetMipmappedArrayLevel
    !---------------------------------------------
    !> @brief Gets a mipmap level of a HIP mipmapped array.
    !>
    !> @param[out] levelArray     - Returned mipmap level HIP array
    !> @param[in]  mipmappedArray - HIP mipmapped array
    !> @param[in]  level          - Mipmap level
    !>
    !> @return #hipSuccess, #hipErrorInvalidValue
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipGetMipmappedArrayLevel(levelArray, mipmappedArray, level) &
       result(GetMipmappedArrayLevel) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetMipmappedArrayLevel")
#else
       bind(C, name="hipGetMipmappedArrayLevel")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: levelArray
       type(c_ptr), value :: mipmappedArray
       integer(c_int), value :: level
       integer(c_int) :: GetMipmappedArrayLevel
    end function hipGetMipmappedArrayLevel

    !---------------------------------------------
    ! hipMipmappedArrayCreate
    !---------------------------------------------
    !> @brief Create a mipmapped array.
    !>
    !> @param [out] pHandle  pointer to mipmapped array
    !> @param [in] pMipmappedArrayDesc  mipmapped array descriptor
    !> @param [in] numMipmapLevels  mipmap level
    !>
    !> @returns #hipSuccess, #hipErrorNotSupported, #hipErrorInvalidValue
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMipmappedArrayCreate(pHandle, pMipmappedArrayDesc, numMipmapLevels) &
       result(MipmappedArrayCreate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMipmappedArrayCreate")
#else
       bind(C, name="hipMipmappedArrayCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pHandle
       type(c_ptr), value :: pMipmappedArrayDesc
       integer(c_int), value :: numMipmapLevels
       integer(c_int) :: MipmappedArrayCreate
    end function hipMipmappedArrayCreate

    !---------------------------------------------
    ! hipMipmappedArrayDestroy
    !---------------------------------------------
    !> @brief Destroy a mipmapped array.
    !>
    !> @param [out] hMipmappedArray  pointer to mipmapped array to destroy
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMipmappedArrayDestroy(hMipmappedArray) &
       result(MipmappedArrayDestroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMipmappedArrayDestroy")
#else
       bind(C, name="hipMipmappedArrayDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hMipmappedArray
       integer(c_int) :: MipmappedArrayDestroy
    end function hipMipmappedArrayDestroy

    !---------------------------------------------
    ! hipMipmappedArrayGetLevel
    !---------------------------------------------
    !> @brief Get a mipmapped array on a mipmapped level.
    !>
    !> @param [in] pLevelArray Pointer of array
    !> @param [out] hMipMappedArray Pointer of mipmapped array on the requested mipmap level
    !> @param [out] level  Mipmap level
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMipmappedArrayGetLevel(pLevelArray, hMipMappedArray, level) &
       result(MipmappedArrayGetLevel) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMipmappedArrayGetLevel")
#else
       bind(C, name="hipMipmappedArrayGetLevel")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pLevelArray
       type(c_ptr), value :: hMipMappedArray
       integer(c_int), value :: level
       integer(c_int) :: MipmappedArrayGetLevel
    end function hipMipmappedArrayGetLevel

    !---------------------------------------------
    ! hipBindTextureToMipmappedArray
    !---------------------------------------------
    !> @brief  Binds a mipmapped array to a texture [Deprecated]
    !>
    !> @param [in] tex  pointer to the texture reference to bind
    !> @param [in] mipmappedArray memory mipmapped array on the device
    !> @param [in] desc  opointer to the channel format
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipBindTextureToMipmappedArray(tex, mipmappedArray, desc) &
       result(BindTextureToMipmappedArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaBindTextureToMipmappedArray")
#else
       bind(C, name="hipBindTextureToMipmappedArray")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: tex
       type(c_ptr), value :: mipmappedArray
       type(c_ptr), value :: desc
       integer(c_int) :: BindTextureToMipmappedArray
    end function hipBindTextureToMipmappedArray

    !---------------------------------------------
    ! hipGetTextureReference
    !---------------------------------------------
    !> @brief Gets the texture reference related with the symbol [Deprecated]
    !>
    !> @param [out] texref  texture reference
    !> @param [in] symbol  pointer to the symbol related with the texture for the reference
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !> @warning This API is deprecated.
    function hipGetTextureReference(texref, symbol) &
       result(GetTextureReference) &
       bind(C, name="hipGetTextureReference")
       import :: c_ptr, c_int
       type(c_ptr) :: texref
       type(c_ptr), value :: symbol
       integer(c_int) :: GetTextureReference
    end function hipGetTextureReference

    !---------------------------------------------
    ! hipTexRefGetBorderColor
    !---------------------------------------------
    !> @brief Gets the border color used by a texture reference [Deprecated]
    !>
    !> @param [out] pBorderColor  Returned Type and Value of RGBA color.
    !> @param [in] texRef  Texture reference.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !> @warning This API is deprecated.
    function hipTexRefGetBorderColor(pBorderColor, texRef) &
       result(TexRefGetBorderColor) &
       bind(C, name="hipTexRefGetBorderColor")
       import :: c_float, c_ptr, c_int
       real(c_float) :: pBorderColor(*)
       type(c_ptr), value :: texRef
       integer(c_int) :: TexRefGetBorderColor
    end function hipTexRefGetBorderColor

    !---------------------------------------------
    ! hipTexRefGetArray
    !---------------------------------------------
    !> @brief Gets the array bound to a texture reference [Deprecated]
    !>
    !>
    !> @param [in] pArray  Returned array.
    !> @param [in] texRef  texture reference.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !> @warning This API is deprecated.
    function hipTexRefGetArray(pArray, texRef) &
       result(TexRefGetArray) &
       bind(C, name="hipTexRefGetArray")
       import :: c_ptr, c_int
       type(c_ptr) :: pArray
       type(c_ptr), value :: texRef
       integer(c_int) :: TexRefGetArray
    end function hipTexRefGetArray

    !---------------------------------------------
    ! hipTexRefSetAddressMode
    !---------------------------------------------
    !> @brief Sets address mode for a texture reference [Deprecated]
    !>
    !> @param [in] texRef  texture reference.
    !> @param [in] dim  Dimension of the texture.
    !> @param [in] am  Value of the texture address mode.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !> @warning This API is deprecated.
    function hipTexRefSetAddressMode(texRef, dim, am) &
       result(TexRefSetAddressMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetAddressMode")
#else
       bind(C, name="hipTexRefSetAddressMode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: texRef
       integer(c_int), value :: dim
       integer(c_int), value :: am
       integer(c_int) :: TexRefSetAddressMode
    end function hipTexRefSetAddressMode

    !---------------------------------------------
    ! hipTexRefSetArray
    !---------------------------------------------
    !> @brief Binds an array as a texture reference [Deprecated]
    !>
    !> @param [in] tex  Pointer texture reference.
    !> @param [in] array  Array to bind.
    !> @param [in] flags  Flags should be set as HIP_TRSA_OVERRIDE_FORMAT, as a valid value.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetArray(tex, array, flags) &
       result(TexRefSetArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetArray")
#else
       bind(C, name="hipTexRefSetArray")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: tex
       type(c_ptr), value :: array
       integer(c_int), value :: flags
       integer(c_int) :: TexRefSetArray
    end function hipTexRefSetArray

    !---------------------------------------------
    ! hipTexRefSetFilterMode
    !---------------------------------------------
    !> @brief Set filter mode for a texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer texture reference.
    !> @param [in] fm  Value of texture filter mode.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetFilterMode(texRef, fm) &
       result(TexRefSetFilterMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetFilterMode")
#else
       bind(C, name="hipTexRefSetFilterMode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: texRef
       integer(c_int), value :: fm
       integer(c_int) :: TexRefSetFilterMode
    end function hipTexRefSetFilterMode

    !---------------------------------------------
    ! hipTexRefSetFlags
    !---------------------------------------------
    !> @brief Set flags for a texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer texture reference.
    !> @param [in] Flags  Value of flags.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetFlags(texRef, Flags) &
       result(TexRefSetFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetFlags")
#else
       bind(C, name="hipTexRefSetFlags")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: texRef
       integer(c_int), value :: Flags
       integer(c_int) :: TexRefSetFlags
    end function hipTexRefSetFlags

    !---------------------------------------------
    ! hipTexRefSetFormat
    !---------------------------------------------
    !> @brief Set format for a texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer texture reference.
    !> @param [in] fmt  Value of format.
    !> @param [in] NumPackedComponents  Number of components per array.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetFormat(texRef, fmt, NumPackedComponents) &
       result(TexRefSetFormat) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetFormat")
#else
       bind(C, name="hipTexRefSetFormat")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: texRef
       integer(c_int), value :: fmt
       integer(c_int), value :: NumPackedComponents
       integer(c_int) :: TexRefSetFormat
    end function hipTexRefSetFormat

    !---------------------------------------------
    ! hipBindTexture
    !---------------------------------------------
    !> @brief Binds a memory area to a texture [Deprecated]
    !>
    !> @param [in] offset  Offset in bytes.
    !> @param [in] tex  Texture to bind.
    !> @param [in] devPtr  Pointer of memory on the device.
    !> @param [in] desc  Pointer of channel format descriptor.
    !> @param [in] size  Size of memory in bites.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipBindTexture(offset, tex, devPtr, desc, size) &
       result(BindTexture) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaBindTexture")
#else
       bind(C, name="hipBindTexture")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: offset
       type(c_ptr), value :: tex
       type(c_ptr), value :: devPtr
       type(c_ptr), value :: desc
       integer(c_long), value :: size
       integer(c_int) :: BindTexture
    end function hipBindTexture

    !---------------------------------------------
    ! hipBindTexture2D
    !---------------------------------------------
    !> @brief Binds a 2D memory area to a texture [Deprecated]
    !>
    !> @param [in] offset  Offset in bytes.
    !> @param [in] tex  Texture to bind.
    !> @param [in] devPtr  Pointer of 2D memory area on the device.
    !> @param [in] desc  Pointer of channel format descriptor.
    !> @param [in] width  Width in texel units.
    !> @param [in] height  Height in texel units.
    !> @param [in] pitch  Pitch in bytes.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipBindTexture2D(offset, tex, devPtr, desc, width, height, pitch) &
       result(BindTexture2D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaBindTexture2D")
#else
       bind(C, name="hipBindTexture2D")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: offset
       type(c_ptr), value :: tex
       type(c_ptr), value :: devPtr
       type(c_ptr), value :: desc
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_long), value :: pitch
       integer(c_int) :: BindTexture2D
    end function hipBindTexture2D

    !---------------------------------------------
    ! hipBindTextureToArray
    !---------------------------------------------
    !> @brief Binds a memory area to a texture [Deprecated]
    !>
    !> @param [in] tex  Pointer of texture reference.
    !> @param [in] array  Array to bind.
    !> @param [in] desc  Pointer of channel format descriptor.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipBindTextureToArray(tex, array, desc) &
       result(BindTextureToArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaBindTextureToArray")
#else
       bind(C, name="hipBindTextureToArray")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: tex
       type(c_ptr), value :: array
       type(c_ptr), value :: desc
       integer(c_int) :: BindTextureToArray
    end function hipBindTextureToArray

    !---------------------------------------------
    ! hipGetTextureAlignmentOffset
    !---------------------------------------------
    !> @brief Get the offset of the alignment in a texture [Deprecated]
    !>
    !> @param [in] offset  Offset in bytes.
    !> @param [in] texref  Pointer of texture reference.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipGetTextureAlignmentOffset(offset, texref) &
       result(GetTextureAlignmentOffset) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetTextureAlignmentOffset")
#else
       bind(C, name="hipGetTextureAlignmentOffset")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: offset
       type(c_ptr), value :: texref
       integer(c_int) :: GetTextureAlignmentOffset
    end function hipGetTextureAlignmentOffset

    !---------------------------------------------
    ! hipUnbindTexture
    !---------------------------------------------
    !> @brief Unbinds a texture [Deprecated]
    !>
    !> @param [in] tex  Texture to unbind.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipUnbindTexture(tex) &
       result(UnbindTexture) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaUnbindTexture")
#else
       bind(C, name="hipUnbindTexture")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: tex
       integer(c_int) :: UnbindTexture
    end function hipUnbindTexture

    !---------------------------------------------
    ! hipTexRefGetAddress
    !---------------------------------------------
    !> @brief Gets the address for a texture reference [Deprecated]
    !>
    !> @param [out] dev_ptr  Pointer of device address.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetAddress(dev_ptr, texRef) &
       result(TexRefGetAddress) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefGetAddress")
#else
       bind(C, name="hipTexRefGetAddress")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: dev_ptr
       type(c_ptr), value :: texRef
       integer(c_int) :: TexRefGetAddress
    end function hipTexRefGetAddress

    !---------------------------------------------
    ! hipTexRefGetAddressMode
    !---------------------------------------------
    !> @brief Gets the address mode for a texture reference [Deprecated]
    !>
    !> @param [out] pam  Pointer of address mode.
    !> @param [in] texRef  Pointer of texture reference.
    !> @param [in] dim  Dimension.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetAddressMode(pam, texRef, dim) &
       result(TexRefGetAddressMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefGetAddressMode")
#else
       bind(C, name="hipTexRefGetAddressMode")
#endif
       import :: c_int, c_ptr
       integer(c_int) :: pam(*)
       type(c_ptr), value :: texRef
       integer(c_int), value :: dim
       integer(c_int) :: TexRefGetAddressMode
    end function hipTexRefGetAddressMode

    !---------------------------------------------
    ! hipTexRefGetFilterMode
    !---------------------------------------------
    !> @brief Gets filter mode for a texture reference [Deprecated]
    !>
    !> @param [out] pfm  Pointer of filter mode.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetFilterMode(pfm, texRef) &
       result(TexRefGetFilterMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefGetFilterMode")
#else
       bind(C, name="hipTexRefGetFilterMode")
#endif
       import :: c_int, c_ptr
       integer(c_int) :: pfm(*)
       type(c_ptr), value :: texRef
       integer(c_int) :: TexRefGetFilterMode
    end function hipTexRefGetFilterMode

    !---------------------------------------------
    ! hipTexRefGetFlags
    !---------------------------------------------
    !> @brief Gets flags for a texture reference [Deprecated]
    !>
    !> @param [out] pFlags  Pointer of flags.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetFlags(pFlags, texRef) &
       result(TexRefGetFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefGetFlags")
#else
       bind(C, name="hipTexRefGetFlags")
#endif
       import :: c_int, c_ptr
       integer(c_int) :: pFlags(*)
       type(c_ptr), value :: texRef
       integer(c_int) :: TexRefGetFlags
    end function hipTexRefGetFlags

    !---------------------------------------------
    ! hipTexRefGetFormat
    !---------------------------------------------
    !> @brief Gets texture format for a texture reference [Deprecated]
    !>
    !> @param [out] pFormat  Pointer of the format.
    !> @param [out] pNumChannels  Pointer of number of channels.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetFormat(pFormat, pNumChannels, texRef) &
       result(TexRefGetFormat) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefGetFormat")
#else
       bind(C, name="hipTexRefGetFormat")
#endif
       import :: c_int, c_ptr
       integer(c_int) :: pFormat(*)
       integer(c_int) :: pNumChannels(*)
       type(c_ptr), value :: texRef
       integer(c_int) :: TexRefGetFormat
    end function hipTexRefGetFormat

    !---------------------------------------------
    ! hipTexRefGetMaxAnisotropy
    !---------------------------------------------
    !> @brief Gets the maximum anisotropy for a texture reference [Deprecated]
    !>
    !> @param [out] pmaxAnsio  Pointer of the maximum anisotropy.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetMaxAnisotropy(pmaxAnsio, texRef) &
       result(TexRefGetMaxAnisotropy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefGetMaxAnisotropy")
#else
       bind(C, name="hipTexRefGetMaxAnisotropy")
#endif
       import :: c_int, c_ptr
       integer(c_int) :: pmaxAnsio(*)
       type(c_ptr), value :: texRef
       integer(c_int) :: TexRefGetMaxAnisotropy
    end function hipTexRefGetMaxAnisotropy

    !---------------------------------------------
    ! hipTexRefGetMipmapFilterMode
    !---------------------------------------------
    !> @brief Gets the mipmap filter mode for a texture reference [Deprecated]
    !>
    !> @param [out] pfm  Pointer of the mipmap filter mode.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetMipmapFilterMode(pfm, texRef) &
       result(TexRefGetMipmapFilterMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefGetMipmapFilterMode")
#else
       bind(C, name="hipTexRefGetMipmapFilterMode")
#endif
       import :: c_int, c_ptr
       integer(c_int) :: pfm(*)
       type(c_ptr), value :: texRef
       integer(c_int) :: TexRefGetMipmapFilterMode
    end function hipTexRefGetMipmapFilterMode

    !---------------------------------------------
    ! hipTexRefGetMipmapLevelBias
    !---------------------------------------------
    !> @brief Gets the mipmap level bias for a texture reference [Deprecated]
    !>
    !> @param [out] pbias  Pointer of the mipmap level bias.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetMipmapLevelBias(pbias, texRef) &
       result(TexRefGetMipmapLevelBias) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefGetMipmapLevelBias")
#else
       bind(C, name="hipTexRefGetMipmapLevelBias")
#endif
       import :: c_float, c_ptr, c_int
       real(c_float) :: pbias(*)
       type(c_ptr), value :: texRef
       integer(c_int) :: TexRefGetMipmapLevelBias
    end function hipTexRefGetMipmapLevelBias

    !---------------------------------------------
    ! hipTexRefGetMipmapLevelClamp
    !---------------------------------------------
    !> @brief Gets the minimum and maximum mipmap level clamps for a texture reference [Deprecated]
    !>
    !> @param [out] pminMipmapLevelClamp  Pointer of the minimum mipmap level clamp.
    !> @param [out] pmaxMipmapLevelClamp  Pointer of the maximum mipmap level clamp.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetMipmapLevelClamp(pminMipmapLevelClamp, pmaxMipmapLevelClamp, texRef) &
       result(TexRefGetMipmapLevelClamp) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefGetMipmapLevelClamp")
#else
       bind(C, name="hipTexRefGetMipmapLevelClamp")
#endif
       import :: c_float, c_ptr, c_int
       real(c_float) :: pminMipmapLevelClamp(*)
       real(c_float) :: pmaxMipmapLevelClamp(*)
       type(c_ptr), value :: texRef
       integer(c_int) :: TexRefGetMipmapLevelClamp
    end function hipTexRefGetMipmapLevelClamp

    !---------------------------------------------
    ! hipTexRefGetMipMappedArray
    !---------------------------------------------
    !> @brief Gets the mipmapped array bound to a texture reference [Deprecated]
    !>
    !> @param [out] pArray  Pointer of the mipmapped array.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetMipMappedArray(pArray, texRef) &
       result(TexRefGetMipMappedArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefGetMipMappedArray")
#else
       bind(C, name="hipTexRefGetMipMappedArray")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pArray
       type(c_ptr), value :: texRef
       integer(c_int) :: TexRefGetMipMappedArray
    end function hipTexRefGetMipMappedArray

    !---------------------------------------------
    ! hipTexRefSetAddress
    !---------------------------------------------
    !> @brief Sets an bound address for a texture reference [Deprecated]
    !>
    !> @param [out] ByteOffset  Pointer of the offset in bytes.
    !> @param [in] texRef  Pointer of texture reference.
    !> @param [in] dptr  Pointer of device address to bind.
    !> @param [in] bytes  Size in bytes.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetAddress(ByteOffset, texRef, dptr, bytes) &
       result(TexRefSetAddress) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetAddress")
#else
       bind(C, name="hipTexRefSetAddress")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: ByteOffset
       type(c_ptr), value :: texRef
       type(c_ptr), value :: dptr
       integer(c_long), value :: bytes
       integer(c_int) :: TexRefSetAddress
    end function hipTexRefSetAddress

    !---------------------------------------------
    ! hipTexRefSetAddress2D
    !---------------------------------------------
    !> @brief Set a bind an address as a 2D texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer of texture reference.
    !> @param [in] desc  Pointer of array descriptor.
    !> @param [in] dptr  Pointer of device address to bind.
    !> @param [in] Pitch  Pitch in bytes.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetAddress2D(texRef, desc, dptr, Pitch) &
       result(TexRefSetAddress2D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetAddress2D")
#else
       bind(C, name="hipTexRefSetAddress2D")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: texRef
       type(c_ptr), value :: desc
       type(c_ptr), value :: dptr
       integer(c_long), value :: Pitch
       integer(c_int) :: TexRefSetAddress2D
    end function hipTexRefSetAddress2D

    !---------------------------------------------
    ! hipTexRefSetMaxAnisotropy
    !---------------------------------------------
    !> @brief Sets the maximum anisotropy for a texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer of texture reference.
    !> @param [out] maxAniso  Value of the maximum anisotropy.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetMaxAnisotropy(texRef, maxAniso) &
       result(TexRefSetMaxAnisotropy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetMaxAnisotropy")
#else
       bind(C, name="hipTexRefSetMaxAnisotropy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: texRef
       integer(c_int), value :: maxAniso
       integer(c_int) :: TexRefSetMaxAnisotropy
    end function hipTexRefSetMaxAnisotropy

    !---------------------------------------------
    ! hipTexRefSetBorderColor
    !---------------------------------------------
    !> @brief Sets border color for a texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer of texture reference.
    !> @param [in] pBorderColor  Pointer of border color.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetBorderColor(texRef, pBorderColor) &
       result(TexRefSetBorderColor) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetBorderColor")
#else
       bind(C, name="hipTexRefSetBorderColor")
#endif
       import :: c_ptr, c_float, c_int
       type(c_ptr), value :: texRef
       real(c_float) :: pBorderColor(*)
       integer(c_int) :: TexRefSetBorderColor
    end function hipTexRefSetBorderColor

    !---------------------------------------------
    ! hipTexRefSetMipmapFilterMode
    !---------------------------------------------
    !> @brief Sets mipmap filter mode for a texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer of texture reference.
    !> @param [in] fm  Value of filter mode.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetMipmapFilterMode(texRef, fm) &
       result(TexRefSetMipmapFilterMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetMipmapFilterMode")
#else
       bind(C, name="hipTexRefSetMipmapFilterMode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: texRef
       integer(c_int), value :: fm
       integer(c_int) :: TexRefSetMipmapFilterMode
    end function hipTexRefSetMipmapFilterMode

    !---------------------------------------------
    ! hipTexRefSetMipmapLevelBias
    !---------------------------------------------
    !> @brief Sets mipmap level bias for a texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer of texture reference.
    !> @param [in] bias  Value of mipmap bias.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetMipmapLevelBias(texRef, bias) &
       result(TexRefSetMipmapLevelBias) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetMipmapLevelBias")
#else
       bind(C, name="hipTexRefSetMipmapLevelBias")
#endif
       import :: c_ptr, c_float, c_int
       type(c_ptr), value :: texRef
       real(c_float), value :: bias
       integer(c_int) :: TexRefSetMipmapLevelBias
    end function hipTexRefSetMipmapLevelBias

    !---------------------------------------------
    ! hipTexRefSetMipmapLevelClamp
    !---------------------------------------------
    !> @brief Sets mipmap level clamp for a texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer of texture reference.
    !> @param [in] minMipMapLevelClamp  Value of minimum mipmap level clamp.
    !> @param [in] maxMipMapLevelClamp  Value of maximum mipmap level clamp.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetMipmapLevelClamp(texRef, minMipMapLevelClamp, maxMipMapLevelClamp) &
       result(TexRefSetMipmapLevelClamp) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetMipmapLevelClamp")
#else
       bind(C, name="hipTexRefSetMipmapLevelClamp")
#endif
       import :: c_ptr, c_float, c_int
       type(c_ptr), value :: texRef
       real(c_float), value :: minMipMapLevelClamp
       real(c_float), value :: maxMipMapLevelClamp
       integer(c_int) :: TexRefSetMipmapLevelClamp
    end function hipTexRefSetMipmapLevelClamp

    !---------------------------------------------
    ! hipTexRefSetMipmappedArray
    !---------------------------------------------
    !> @brief Binds mipmapped array to a texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer of texture reference to bind.
    !> @param [in] mipmappedArray  Pointer of mipmapped array to bind.
    !> @param [in] Flags  Flags should be set as HIP_TRSA_OVERRIDE_FORMAT, as a valid value.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetMipmappedArray(texRef, mipmappedArray, Flags) &
       result(TexRefSetMipmappedArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaTexRefSetMipmappedArray")
#else
       bind(C, name="hipTexRefSetMipmappedArray")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: texRef
       type(c_ptr), value :: mipmappedArray
       integer(c_int), value :: Flags
       integer(c_int) :: TexRefSetMipmappedArray
    end function hipTexRefSetMipmappedArray

    !---------------------------------------------
    ! hipApiName
    !---------------------------------------------
    !> @defgroup Callback Callback Activity APIs
    !>
    !> This section describes the callback/Activity of HIP runtime API.
    !>
    !>
    !> @brief Returns HIP API name by ID.
    !>
    !> @param [in] id ID of HIP API
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipApiName(id) &
       result(ApiName) &
       bind(C, name="hipApiName")
       import :: c_int, c_char
       integer(c_int), value :: id
       character(c_char) :: ApiName
    end function hipApiName

    !---------------------------------------------
    ! hipKernelNameRef
    !---------------------------------------------
    !> @brief Returns kernel name reference by function name.
    !>
    !> @param [in] f Name of function
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipKernelNameRef(f) &
       result(KernelNameRef) &
       bind(C, name="hipKernelNameRef")
       import :: c_ptr, c_char
       type(c_ptr), value :: f
       character(c_char) :: KernelNameRef
    end function hipKernelNameRef

    !---------------------------------------------
    ! hipKernelNameRefByPtr
    !---------------------------------------------
    !> @brief Retrives kernel for a given host pointer, unless stated otherwise.
    !>
    !> @param [in] hostFunction Pointer of host function.
    !> @param [in] stream Stream the kernel is executed on.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipKernelNameRefByPtr(hostFunction, stream) &
       result(KernelNameRefByPtr) &
       bind(C, name="hipKernelNameRefByPtr")
       import :: c_ptr, c_char
       type(c_ptr), value :: hostFunction
       type(c_ptr), value :: stream
       character(c_char) :: KernelNameRefByPtr
    end function hipKernelNameRefByPtr

    !---------------------------------------------
    ! hipGetStreamDeviceId
    !---------------------------------------------
    !> @brief Returns device ID on the stream.
    !>
    !> @param [in] stream Stream of device executed on.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGetStreamDeviceId(stream) &
       result(GetStreamDeviceId) &
       bind(C, name="hipGetStreamDeviceId")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: GetStreamDeviceId
    end function hipGetStreamDeviceId

    !---------------------------------------------
    ! hipStreamBeginCapture
    !---------------------------------------------
    !> @brief Begins graph capture on a stream.
    !>
    !> @param [in] stream - Stream to initiate capture.
    !> @param [in] mode - Controls the interaction of this capture sequence with other API calls
    !> that
    !> are not safe.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipStreamBeginCapture(stream, mode) &
       result(StreamBeginCapture) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamBeginCapture")
#else
       bind(C, name="hipStreamBeginCapture")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: mode
       integer(c_int) :: StreamBeginCapture
    end function hipStreamBeginCapture

    !---------------------------------------------
    ! hipStreamBeginCaptureToGraph
    !---------------------------------------------
    !> @brief Begins graph capture on a stream to an existing graph.
    !>
    !> @param [in] stream - Stream to initiate capture.
    !> @param [in] graph - Graph to capture into.
    !> @param [in] dependencies - Dependencies of the first node captured in the stream. Can be NULL
    !> if
    !> numDependencies is 0.
    !> @param [in] dependencyData - Optional array of data associated with each dependency.
    !> @param [in] numDependencies - Number of dependencies.
    !> @param [in] mode - Controls the interaction of this capture sequence with other API calls
    !> that
    !> are not safe.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning param "const hipGraphEdgeData* dependencyData" is currently not supported and has to
    !> be
    !> passed as nullptr. This API is marked as beta, meaning, while this is feature complete, it is
    !> still
    !> open to changes and may have outstanding issues.
    function hipStreamBeginCaptureToGraph(stream, graph, dependencies, dependencyData, &
                                          numDependencies, mode) &
       result(StreamBeginCaptureToGraph) &
       bind(C, name="hipStreamBeginCaptureToGraph")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: graph
       type(c_ptr) :: dependencies
       type(c_ptr), value :: dependencyData
       integer(c_long), value :: numDependencies
       integer(c_int), value :: mode
       integer(c_int) :: StreamBeginCaptureToGraph
    end function hipStreamBeginCaptureToGraph

    !---------------------------------------------
    ! hipStreamEndCapture
    !---------------------------------------------
    !> @brief Ends capture on a stream, returning the captured graph.
    !>
    !> @param [in] stream - Stream to end capture.
    !> @param [out] pGraph - Captured graph.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipStreamEndCapture(stream, pGraph) &
       result(StreamEndCapture) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamEndCapture")
#else
       bind(C, name="hipStreamEndCapture")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr) :: pGraph
       integer(c_int) :: StreamEndCapture
    end function hipStreamEndCapture

    !---------------------------------------------
    ! hipStreamGetCaptureInfo
    !---------------------------------------------
    !> @brief Get capture status of a stream.
    !>
    !> @param [in] stream - Stream of which to get capture status from.
    !> @param [out] pCaptureStatus - Returns current capture status.
    !> @param [out] pId - Unique capture ID.
    !>
    !> @returns #hipSuccess, #hipErrorStreamCaptureImplicit
    function hipStreamGetCaptureInfo(stream, pCaptureStatus, pId) &
       result(StreamGetCaptureInfo) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamGetCaptureInfo")
#else
       bind(C, name="hipStreamGetCaptureInfo")
#endif
       import :: c_ptr, c_int, c_int64_t
       type(c_ptr), value :: stream
       integer(c_int) :: pCaptureStatus(*)
       integer(c_int64_t) :: pId(*)
       integer(c_int) :: StreamGetCaptureInfo
    end function hipStreamGetCaptureInfo

    !---------------------------------------------
    ! hipStreamGetCaptureInfo_v2
    !---------------------------------------------
    !> @brief Get stream's capture state
    !>
    !> @param [in] stream - Stream of which to get capture status from.
    !> @param [out] captureStatus_out - Returns current capture status.
    !> @param [out] id_out - Unique capture ID.
    !> @param [out] graph_out - Returns the graph being captured into.
    !> @param [out] dependencies_out - Pointer to an array of nodes representing the graphs
    !> dependencies.
    !> @param [out] numDependencies_out - Returns size of the array returned in dependencies_out.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorStreamCaptureImplicit
    function hipStreamGetCaptureInfo_v2(stream, captureStatus_out, id_out, graph_out, &
                                        dependencies_out, numDependencies_out) &
       result(StreamGetCaptureInfo_v2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamGetCaptureInfo_v2")
#else
       bind(C, name="hipStreamGetCaptureInfo_v2")
#endif
       import :: c_ptr, c_int, c_int64_t
       type(c_ptr), value :: stream
       integer(c_int) :: captureStatus_out(*)
       integer(c_int64_t) :: id_out(*)
       type(c_ptr) :: graph_out
       type(c_ptr) :: dependencies_out
       type(c_ptr), value :: numDependencies_out
       integer(c_int) :: StreamGetCaptureInfo_v2
    end function hipStreamGetCaptureInfo_v2

    !---------------------------------------------
    ! hipStreamIsCapturing
    !---------------------------------------------
    !> @brief Get stream's capture state
    !>
    !> @param [in] stream - Stream of which to get capture status from.
    !> @param [out] pCaptureStatus - Returns current capture status.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorStreamCaptureImplicit
    function hipStreamIsCapturing(stream, pCaptureStatus) &
       result(StreamIsCapturing) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamIsCapturing")
#else
       bind(C, name="hipStreamIsCapturing")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: pCaptureStatus(*)
       integer(c_int) :: StreamIsCapturing
    end function hipStreamIsCapturing

    !---------------------------------------------
    ! hipStreamUpdateCaptureDependencies
    !---------------------------------------------
    !> @brief Update the set of dependencies in a capturing stream
    !>
    !> @param [in] stream  Stream that is being captured.
    !> @param [in] dependencies  Pointer to an array of nodes to add/replace.
    !> @param [in] numDependencies  Size of the dependencies array.
    !> @param [in] flags  Flag to update dependency set. Should be one of the values
    !> in enum #hipStreamUpdateCaptureDependenciesFlags.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorIllegalState
    function hipStreamUpdateCaptureDependencies(stream, dependencies, numDependencies, flags) &
       result(StreamUpdateCaptureDependencies) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamUpdateCaptureDependencies")
#else
       bind(C, name="hipStreamUpdateCaptureDependencies")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: stream
       type(c_ptr) :: dependencies
       integer(c_long), value :: numDependencies
       integer(c_int), value :: flags
       integer(c_int) :: StreamUpdateCaptureDependencies
    end function hipStreamUpdateCaptureDependencies

    !---------------------------------------------
    ! hipThreadExchangeStreamCaptureMode
    !---------------------------------------------
    !> @brief Swaps the stream capture mode of a thread.
    !>
    !> @param [in] mode - Pointer to mode value to swap with the current mode.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipThreadExchangeStreamCaptureMode(mode) &
       result(ThreadExchangeStreamCaptureMode) &
       bind(C, name="hipThreadExchangeStreamCaptureMode")
       import :: c_int
       integer(c_int) :: mode(*)
       integer(c_int) :: ThreadExchangeStreamCaptureMode
    end function hipThreadExchangeStreamCaptureMode

    !---------------------------------------------
    ! hipGraphCreate
    !---------------------------------------------
    !> @brief Creates a graph
    !>
    !> @param [out] pGraph - pointer to graph to create.
    !> @param [in] flags - flags for graph creation, must be 0.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryAllocation
    function hipGraphCreate(pGraph, flags) &
       result(GraphCreate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphCreate")
#else
       bind(C, name="hipGraphCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pGraph
       integer(c_int), value :: flags
       integer(c_int) :: GraphCreate
    end function hipGraphCreate

    !---------------------------------------------
    ! hipGraphDestroy
    !---------------------------------------------
    !> @brief Destroys a graph
    !>
    !> @param [in] graph - instance of graph to destroy.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphDestroy(graph) &
       result(GraphDestroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphDestroy")
#else
       bind(C, name="hipGraphDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       integer(c_int) :: GraphDestroy
    end function hipGraphDestroy

    !---------------------------------------------
    ! hipGraphAddDependencies
    !---------------------------------------------
    !> @brief Adds dependency edges to a graph.
    !>
    !> @param [in] graph - Instance of the graph to add dependencies to.
    !> @param [in] from - Pointer to the graph nodes with dependencies to add from.
    !> @param [in] to - Pointer to the graph nodes to add dependencies to.
    !> @param [in] numDependencies - Number of dependencies to add.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddDependencies(graph, from, to, numDependencies) &
       result(GraphAddDependencies) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddDependencies")
#else
       bind(C, name="hipGraphAddDependencies")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: graph
       type(c_ptr) :: from
       type(c_ptr) :: to
       integer(c_long), value :: numDependencies
       integer(c_int) :: GraphAddDependencies
    end function hipGraphAddDependencies

    !---------------------------------------------
    ! hipGraphRemoveDependencies
    !---------------------------------------------
    !> @brief Removes dependency edges from a graph.
    !>
    !> @param [in] graph - Instance of the graph to remove dependencies from.
    !> @param [in] from - Array of nodes that provide the dependencies.
    !> @param [in] to - Array of dependent nodes.
    !> @param [in] numDependencies - Number of dependencies to remove.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphRemoveDependencies(graph, from, to, numDependencies) &
       result(GraphRemoveDependencies) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphRemoveDependencies")
#else
       bind(C, name="hipGraphRemoveDependencies")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: graph
       type(c_ptr) :: from
       type(c_ptr) :: to
       integer(c_long), value :: numDependencies
       integer(c_int) :: GraphRemoveDependencies
    end function hipGraphRemoveDependencies

    !---------------------------------------------
    ! hipGraphGetEdges
    !---------------------------------------------
    !> @brief Returns a graph's dependency edges.
    !>
    !> @param [in] graph - Instance of the graph to get the edges from.
    !> @param [out] from - Pointer to the graph nodes to return edge endpoints.
    !> @param [out] to - Pointer to the graph nodes to return edge endpoints.
    !> @param [out] numEdges - Returns number of edges.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> from and to may both be NULL, in which case this function only returns the number of edges in
    !> numEdges. Otherwise, numEdges entries will be filled in. If numEdges is higher than the
    !> actual
    !> number of edges, the remaining entries in from and to will be set to NULL, and the number of
    !> edges actually returned will be written to numEdges.
    function hipGraphGetEdges(graph, from, to, numEdges) &
       result(GraphGetEdges) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphGetEdges")
#else
       bind(C, name="hipGraphGetEdges")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       type(c_ptr) :: from
       type(c_ptr) :: to
       type(c_ptr), value :: numEdges
       integer(c_int) :: GraphGetEdges
    end function hipGraphGetEdges

    !---------------------------------------------
    ! hipGraphGetNodes
    !---------------------------------------------
    !> @brief Returns a graph's nodes.
    !>
    !> @param [in] graph - Instance of graph to get the nodes from.
    !> @param [out] nodes - Pointer to return the  graph nodes.
    !> @param [out] numNodes - Returns the number of graph nodes.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> nodes may be NULL, in which case this function will return the number of nodes in numNodes.
    !> Otherwise, numNodes entries will be filled in. If numNodes is higher than the actual number
    !> of
    !> nodes, the remaining entries in nodes will be set to NULL, and the number of nodes actually
    !> obtained will be returned in numNodes.
    function hipGraphGetNodes(graph, nodes, numNodes) &
       result(GraphGetNodes) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphGetNodes")
#else
       bind(C, name="hipGraphGetNodes")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       type(c_ptr) :: nodes
       type(c_ptr), value :: numNodes
       integer(c_int) :: GraphGetNodes
    end function hipGraphGetNodes

    !---------------------------------------------
    ! hipGraphGetRootNodes
    !---------------------------------------------
    !> @brief Returns a graph's root nodes.
    !>
    !> @param [in] graph - Instance of the graph to get the nodes from.
    !> @param [out] pRootNodes - Pointer to return the graph's root nodes.
    !> @param [out] pNumRootNodes - Returns the number of graph's root nodes.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> pRootNodes may be NULL, in which case this function will return the number of root nodes in
    !> pNumRootNodes. Otherwise, pNumRootNodes entries will be filled in. If pNumRootNodes is higher
    !> than the actual number of root nodes, the remaining entries in pRootNodes will be set to
    !> NULL,
    !> and the number of nodes actually obtained will be returned in pNumRootNodes.
    function hipGraphGetRootNodes(graph, pRootNodes, pNumRootNodes) &
       result(GraphGetRootNodes) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphGetRootNodes")
#else
       bind(C, name="hipGraphGetRootNodes")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       type(c_ptr) :: pRootNodes
       type(c_ptr), value :: pNumRootNodes
       integer(c_int) :: GraphGetRootNodes
    end function hipGraphGetRootNodes

    !---------------------------------------------
    ! hipGraphNodeGetDependencies
    !---------------------------------------------
    !> @brief Returns a node's dependencies.
    !>
    !> @param [in] node - Graph node to get the dependencies from.
    !> @param [out] pDependencies - Pointer to return the dependencies.
    !> @param [out] pNumDependencies -  Returns the number of graph node dependencies.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> pDependencies may be NULL, in which case this function will return the number of dependencies
    !> in
    !> pNumDependencies. Otherwise, pNumDependencies entries will be filled in. If pNumDependencies
    !> is
    !> higher than the actual number of dependencies, the remaining entries in pDependencies will be
    !> set
    !> to NULL, and the number of nodes actually obtained will be returned in pNumDependencies.
    function hipGraphNodeGetDependencies(node, pDependencies, pNumDependencies) &
       result(GraphNodeGetDependencies) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphNodeGetDependencies")
#else
       bind(C, name="hipGraphNodeGetDependencies")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr) :: pDependencies
       type(c_ptr), value :: pNumDependencies
       integer(c_int) :: GraphNodeGetDependencies
    end function hipGraphNodeGetDependencies

    !---------------------------------------------
    ! hipGraphNodeGetDependentNodes
    !---------------------------------------------
    !> @brief Returns a node's dependent nodes.
    !>
    !> @param [in] node - Graph node to get the dependent nodes from.
    !> @param [out] pDependentNodes - Pointer to return the graph dependent nodes.
    !> @param [out] pNumDependentNodes - Returns the number of graph node dependent nodes.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> pDependentNodes may be NULL, in which case this function will return the number of dependent
    !> nodes in pNumDependentNodes. Otherwise, pNumDependentNodes entries will be filled in. If
    !> pNumDependentNodes is higher than the actual number of dependent nodes, the remaining entries
    !> in
    !> pDependentNodes will be set to NULL, and the number of nodes actually obtained will be
    !> returned
    !> in pNumDependentNodes.
    function hipGraphNodeGetDependentNodes(node, pDependentNodes, pNumDependentNodes) &
       result(GraphNodeGetDependentNodes) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphNodeGetDependentNodes")
#else
       bind(C, name="hipGraphNodeGetDependentNodes")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr) :: pDependentNodes
       type(c_ptr), value :: pNumDependentNodes
       integer(c_int) :: GraphNodeGetDependentNodes
    end function hipGraphNodeGetDependentNodes

    !---------------------------------------------
    ! hipGraphNodeGetType
    !---------------------------------------------
    !> @brief Returns a node's type.
    !>
    !> @param [in] node - Node to get type of.
    !> @param [out] pType - Returns the node's type.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphNodeGetType(node, pType) &
       result(GraphNodeGetType) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphNodeGetType")
#else
       bind(C, name="hipGraphNodeGetType")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       integer(c_int) :: pType(*)
       integer(c_int) :: GraphNodeGetType
    end function hipGraphNodeGetType

    !---------------------------------------------
    ! hipGraphDestroyNode
    !---------------------------------------------
    !> @brief Remove a node from the graph.
    !>
    !> @param [in] node - graph node to remove
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphDestroyNode(node) &
       result(GraphDestroyNode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphDestroyNode")
#else
       bind(C, name="hipGraphDestroyNode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       integer(c_int) :: GraphDestroyNode
    end function hipGraphDestroyNode

    !---------------------------------------------
    ! hipGraphClone
    !---------------------------------------------
    !> @brief Clones a graph.
    !>
    !> @param [out] pGraphClone - Returns newly created cloned graph.
    !> @param [in] originalGraph - original graph to clone from.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryAllocation
    function hipGraphClone(pGraphClone, originalGraph) &
       result(GraphClone) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphClone")
#else
       bind(C, name="hipGraphClone")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pGraphClone
       type(c_ptr), value :: originalGraph
       integer(c_int) :: GraphClone
    end function hipGraphClone

    !---------------------------------------------
    ! hipGraphNodeFindInClone
    !---------------------------------------------
    !> @brief Finds a cloned version of a node.
    !>
    !> @param [out] pNode - Returns the cloned node.
    !> @param [in] originalNode - original node handle.
    !> @param [in] clonedGraph - Cloned graph to query.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphNodeFindInClone(pNode, originalNode, clonedGraph) &
       result(GraphNodeFindInClone) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphNodeFindInClone")
#else
       bind(C, name="hipGraphNodeFindInClone")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pNode
       type(c_ptr), value :: originalNode
       type(c_ptr), value :: clonedGraph
       integer(c_int) :: GraphNodeFindInClone
    end function hipGraphNodeFindInClone

    !---------------------------------------------
    ! hipGraphInstantiateWithFlags
    !---------------------------------------------
    !> @brief Creates an executable graph from a graph.
    !>
    !> @param [out] pGraphExec - Pointer to instantiated executable graph.
    !> @param [in] graph - Instance of graph to instantiate.
    !> @param [in] flags - Flags to control instantiation.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @warning This API does not support any of flag and is behaving as hipGraphInstantiate.
    function hipGraphInstantiateWithFlags(pGraphExec, graph, flags) &
       result(GraphInstantiateWithFlags) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphInstantiateWithFlags")
#else
       bind(C, name="hipGraphInstantiateWithFlags")
#endif
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr) :: pGraphExec
       type(c_ptr), value :: graph
       integer(c_int64_t), value :: flags
       integer(c_int) :: GraphInstantiateWithFlags
    end function hipGraphInstantiateWithFlags

    !---------------------------------------------
    ! hipGraphInstantiateWithParams
    !---------------------------------------------
    !> @brief Creates an executable graph from a graph.
    !>
    !> @param [out] pGraphExec - Pointer to instantiated executable graph.
    !> @param [in] graph - Instance of graph to instantiate.
    !> @param [in] instantiateParams - Graph instantiation Params
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphInstantiateWithParams(pGraphExec, graph, instantiateParams) &
       result(GraphInstantiateWithParams) &
       bind(C, name="hipGraphInstantiateWithParams")
       import :: c_ptr, c_int
       type(c_ptr) :: pGraphExec
       type(c_ptr), value :: graph
       type(c_ptr), value :: instantiateParams
       integer(c_int) :: GraphInstantiateWithParams
    end function hipGraphInstantiateWithParams

    !---------------------------------------------
    ! hipGraphLaunch
    !---------------------------------------------
    !> @brief Launches an executable graph in the specified stream.
    !>
    !> @param [in] graphExec - Instance of executable graph to launch.
    !> @param [in] stream - Instance of stream in which to launch executable graph.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphLaunch(graphExec, stream) &
       result(GraphLaunch) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphLaunch")
#else
       bind(C, name="hipGraphLaunch")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graphExec
       type(c_ptr), value :: stream
       integer(c_int) :: GraphLaunch
    end function hipGraphLaunch

    !---------------------------------------------
    ! hipGraphUpload
    !---------------------------------------------
    !> @brief Uploads an executable graph to a stream
    !>
    !> @param [in] graphExec - Instance of executable graph to be uploaded.
    !> @param [in] stream - Instance of stream to which the executable graph is uploaded to.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphUpload(graphExec, stream) &
       result(GraphUpload) &
       bind(C, name="hipGraphUpload")
       import :: c_ptr, c_int
       type(c_ptr), value :: graphExec
       type(c_ptr), value :: stream
       integer(c_int) :: GraphUpload
    end function hipGraphUpload

    !---------------------------------------------
    ! hipGraphAddNode
    !---------------------------------------------
    !> @brief Creates a kernel execution node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to kernel graph node that is created.
    !> @param [in] graph - Instance of graph to add the created node to.
    !> @param [in] pDependencies - Pointer to the dependencies on the kernel execution node.
    !> @param [in] numDependencies - Number of dependencies.
    !> @param [in] nodeParams - Pointer to the node parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue.
    function hipGraphAddNode(pGraphNode, graph, pDependencies, numDependencies, nodeParams) &
       result(GraphAddNode) &
       bind(C, name="hipGraphAddNode")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphAddNode
    end function hipGraphAddNode

    !---------------------------------------------
    ! hipGraphExecGetFlags
    !---------------------------------------------
    !> @brief Return the flags of an executable graph.
    !>
    !> @param [in] graphExec - Executable graph to get the flags from.
    !> @param [out] flags - Flags used to instantiate this executable graph.
    !> @returns #hipSuccess, #hipErrorInvalidValue.
    function hipGraphExecGetFlags(graphExec, flags) &
       result(GraphExecGetFlags) &
       bind(C, name="hipGraphExecGetFlags")
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr), value :: graphExec
       integer(c_int64_t) :: flags(*)
       integer(c_int) :: GraphExecGetFlags
    end function hipGraphExecGetFlags

    !---------------------------------------------
    ! hipGraphNodeSetParams
    !---------------------------------------------
    !> @brief Updates parameters of a graph's node.
    !>
    !> @param [in] node - Instance of the node to set parameters for.
    !> @param [in] nodeParams - Pointer to the parameters to be set.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDeviceFunction,
    !> #hipErrorNotSupported.
    function hipGraphNodeSetParams(node, nodeParams) &
       result(GraphNodeSetParams) &
       bind(C, name="hipGraphNodeSetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphNodeSetParams
    end function hipGraphNodeSetParams

    !---------------------------------------------
    ! hipGraphExecNodeSetParams
    !---------------------------------------------
    !> @brief Updates parameters of an executable graph's node.
    !>
    !> @param [in] graphExec - Instance of the executable graph.
    !> @param [in] node - Instance of the node to set parameters to.
    !> @param [in] nodeParams - Pointer to the parameters to be set.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDeviceFunction,
    !> #hipErrorNotSupported.
    function hipGraphExecNodeSetParams(graphExec, node, nodeParams) &
       result(GraphExecNodeSetParams) &
       bind(C, name="hipGraphExecNodeSetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: graphExec
       type(c_ptr), value :: node
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphExecNodeSetParams
    end function hipGraphExecNodeSetParams

    !---------------------------------------------
    ! hipGraphExecDestroy
    !---------------------------------------------
    !> @brief Destroys an executable graph
    !>
    !> @param [in] graphExec - Instance of executable graph to destroy.
    !>
    !> @returns #hipSuccess.
    function hipGraphExecDestroy(graphExec) &
       result(GraphExecDestroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecDestroy")
#else
       bind(C, name="hipGraphExecDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graphExec
       integer(c_int) :: GraphExecDestroy
    end function hipGraphExecDestroy

    !---------------------------------------------
    ! hipGraphExecUpdate
    !---------------------------------------------
    !> @brief Check whether an executable graph can be updated with a graph and perform the update
    !> if *
    !> possible.
    !>
    !> @param [in] hGraphExec - instance of executable graph to update.
    !> @param [in] hGraph - graph that contains the updated parameters.
    !> @param [in] hErrorNode_out - node which caused the permissibility check to forbid the update.
    !> @param [in] updateResult_out - Return code whether the graph update was performed.
    !> @returns #hipSuccess, #hipErrorGraphExecUpdateFailure
    function hipGraphExecUpdate(hGraphExec, hGraph, hErrorNode_out, updateResult_out) &
       result(GraphExecUpdate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecUpdate")
#else
       bind(C, name="hipGraphExecUpdate")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hGraph
       type(c_ptr) :: hErrorNode_out
       integer(c_int) :: updateResult_out(*)
       integer(c_int) :: GraphExecUpdate
    end function hipGraphExecUpdate

    !---------------------------------------------
    ! hipGraphAddKernelNode
    !---------------------------------------------
    !> @brief Creates a kernel execution node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created
    !> @param [in] graph - Instance of graph to add the created node to.
    !> @param [in] pDependencies - Pointer to the dependencies of the kernel execution node.
    !> @param [in] numDependencies - The number of the dependencies.
    !> @param [in] pNodeParams - Pointer to the parameters of the kernel execution node.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDeviceFunction
    function hipGraphAddKernelNode(pGraphNode, graph, pDependencies, numDependencies, pNodeParams) &
       result(GraphAddKernelNode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddKernelNode")
#else
       bind(C, name="hipGraphAddKernelNode")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphAddKernelNode
    end function hipGraphAddKernelNode

    !---------------------------------------------
    ! hipGraphKernelNodeGetParams
    !---------------------------------------------
    !> @brief Gets kernel node's parameters.
    !>
    !> @param [in] node - instance of the node to get parameters from.
    !> @param [out] pNodeParams - pointer to the parameters
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphKernelNodeGetParams(node, pNodeParams) &
       result(GraphKernelNodeGetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphKernelNodeGetParams")
#else
       bind(C, name="hipGraphKernelNodeGetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphKernelNodeGetParams
    end function hipGraphKernelNodeGetParams

    !---------------------------------------------
    ! hipGraphKernelNodeSetParams
    !---------------------------------------------
    !> @brief Sets a kernel node's parameters.
    !>
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - const pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphKernelNodeSetParams(node, pNodeParams) &
       result(GraphKernelNodeSetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphKernelNodeSetParams")
#else
       bind(C, name="hipGraphKernelNodeSetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphKernelNodeSetParams
    end function hipGraphKernelNodeSetParams

    !---------------------------------------------
    ! hipGraphExecKernelNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a kernel node in the given graphExec.
    !>
    !> @param [in] hGraphExec - Instance of the executable graph with the node.
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - const pointer to the kernel node parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecKernelNodeSetParams(hGraphExec, node, pNodeParams) &
       result(GraphExecKernelNodeSetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecKernelNodeSetParams")
#else
       bind(C, name="hipGraphExecKernelNodeSetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphExecKernelNodeSetParams
    end function hipGraphExecKernelNodeSetParams

    !---------------------------------------------
    ! hipDrvGraphAddMemcpyNode
    !---------------------------------------------
    !> @brief Creates a memcpy node and adds it to a graph.
    !>
    !> @param [out] phGraphNode - Pointer to graph node that is created.
    !> @param [in] hGraph - Instance of graph to add the created node to.
    !> @param [in] dependencies - const pointer to the dependencies of the memcpy execution node.
    !> @param [in] numDependencies - The number of dependencies.
    !> @param [in] copyParams - const pointer to the parameters for the memory copy.
    !> @param [in] ctx - context related to current device.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipDrvGraphAddMemcpyNode(phGraphNode, hGraph, dependencies, numDependencies, &
                                      copyParams, ctx) &
       result(DrvGraphAddMemcpyNode) &
       bind(C, name="hipDrvGraphAddMemcpyNode")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: phGraphNode
       type(c_ptr), value :: hGraph
       type(c_ptr) :: dependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: copyParams
       type(c_ptr), value :: ctx
       integer(c_int) :: DrvGraphAddMemcpyNode
    end function hipDrvGraphAddMemcpyNode

    !---------------------------------------------
    ! hipGraphAddMemcpyNode
    !---------------------------------------------
    !> @brief Creates a memcpy node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created.
    !> @param [in] graph - Instance of graph to add the created node to.
    !> @param [in] pDependencies - const pointer to the dependencies of the memcpy execution node.
    !> @param [in] numDependencies - The number of dependencies.
    !> @param [in] pCopyParams - const pointer to the parameters for the memory copy.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddMemcpyNode(pGraphNode, graph, pDependencies, numDependencies, pCopyParams) &
       result(GraphAddMemcpyNode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddMemcpyNode")
#else
       bind(C, name="hipGraphAddMemcpyNode")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: pCopyParams
       integer(c_int) :: GraphAddMemcpyNode
    end function hipGraphAddMemcpyNode

    !---------------------------------------------
    ! hipGraphMemcpyNodeGetParams
    !---------------------------------------------
    !> @brief Gets a memcpy node's parameters.
    !>
    !> @param [in] node - instance of the node to get parameters from.
    !> @param [out] pNodeParams - pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphMemcpyNodeGetParams(node, pNodeParams) &
       result(GraphMemcpyNodeGetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemcpyNodeGetParams")
#else
       bind(C, name="hipGraphMemcpyNodeGetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphMemcpyNodeGetParams
    end function hipGraphMemcpyNodeGetParams

    !---------------------------------------------
    ! hipGraphMemcpyNodeSetParams
    !---------------------------------------------
    !> @brief Sets a memcpy node's parameters.
    !>
    !> @param [in] node - instance of the node to set parameters to.
    !> @param [in] pNodeParams - const pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphMemcpyNodeSetParams(node, pNodeParams) &
       result(GraphMemcpyNodeSetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemcpyNodeSetParams")
#else
       bind(C, name="hipGraphMemcpyNodeSetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphMemcpyNodeSetParams
    end function hipGraphMemcpyNodeSetParams

    !---------------------------------------------
    ! hipGraphKernelNodeSetAttribute
    !---------------------------------------------
    !> @brief Sets a node's attribute.
    !>
    !> @param [in] hNode - Instance of the node to set parameters of.
    !> @param [in] attr - The attribute type to be set.
    !> @param [in] value - const pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphKernelNodeSetAttribute(hNode, attr, value) &
       result(GraphKernelNodeSetAttribute) &
       bind(C, name="hipGraphKernelNodeSetAttribute")
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: GraphKernelNodeSetAttribute
    end function hipGraphKernelNodeSetAttribute

    !---------------------------------------------
    ! hipGraphKernelNodeGetAttribute
    !---------------------------------------------
    !> @brief Gets a node's attribute.
    !>
    !> @param [in] hNode - Instance of the node to set parameters of.
    !> @param [in] attr - The attribute type to be set.
    !> @param [in] value - const pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphKernelNodeGetAttribute(hNode, attr, value) &
       result(GraphKernelNodeGetAttribute) &
       bind(C, name="hipGraphKernelNodeGetAttribute")
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: GraphKernelNodeGetAttribute
    end function hipGraphKernelNodeGetAttribute

    !---------------------------------------------
    ! hipGraphExecMemcpyNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters of a memcpy node in the given graphExec.
    !>
    !> @param [in] hGraphExec - Instance of the executable graph with the node.
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - const pointer to the kernel node parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecMemcpyNodeSetParams(hGraphExec, node, pNodeParams) &
       result(GraphExecMemcpyNodeSetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecMemcpyNodeSetParams")
#else
       bind(C, name="hipGraphExecMemcpyNodeSetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphExecMemcpyNodeSetParams
    end function hipGraphExecMemcpyNodeSetParams

    !---------------------------------------------
    ! hipGraphAddMemcpyNode1D
    !---------------------------------------------
    !> @brief Creates a 1D memcpy node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created.
    !> @param [in] graph - Instance of graph to add the created node to.
    !> @param [in] pDependencies - const pointer to the dependencies of the memcpy execution node.
    !> @param [in] numDependencies - The number of dependencies.
    !> @param [in] dst - Pointer to memory address of the destination.
    !> @param [in] src - Pointer to memory address of the source.
    !> @param [in] count - Size of the memory to copy.
    !> @param [in] kind - Type of memory copy.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddMemcpyNode1D(pGraphNode, graph, pDependencies, numDependencies, dst, src, &
                                     count, kind) &
       result(GraphAddMemcpyNode1D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddMemcpyNode1D")
#else
       bind(C, name="hipGraphAddMemcpyNode1D")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: count
       integer(c_int), value :: kind
       integer(c_int) :: GraphAddMemcpyNode1D
    end function hipGraphAddMemcpyNode1D

    !---------------------------------------------
    ! hipGraphMemcpyNodeSetParams1D
    !---------------------------------------------
    !> @brief Sets a memcpy node's parameters to perform a 1-dimensional copy.
    !>
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] dst - Pointer to memory address of the destination.
    !> @param [in] src - Pointer to memory address of the source.
    !> @param [in] count - Size of the memory to copy.
    !> @param [in] kind - Type of memory copy.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphMemcpyNodeSetParams1D(node, dst, src, count, kind) &
       result(GraphMemcpyNodeSetParams1D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemcpyNodeSetParams1D")
#else
       bind(C, name="hipGraphMemcpyNodeSetParams1D")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: count
       integer(c_int), value :: kind
       integer(c_int) :: GraphMemcpyNodeSetParams1D
    end function hipGraphMemcpyNodeSetParams1D

    !---------------------------------------------
    ! hipGraphExecMemcpyNodeSetParams1D
    !---------------------------------------------
    !> @brief Sets the parameters for a memcpy node in the given graphExec to perform a
    !> 1-dimensional
    !> copy.
    !>
    !> @param [in] hGraphExec - Instance of the executable graph with the node.
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] dst - Pointer to memory address of the destination.
    !> @param [in] src - Pointer to memory address of the source.
    !> @param [in] count - Size of the memory to copy.
    !> @param [in] kind - Type of memory copy.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecMemcpyNodeSetParams1D(hGraphExec, node, dst, src, count, kind) &
       result(GraphExecMemcpyNodeSetParams1D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecMemcpyNodeSetParams1D")
#else
       bind(C, name="hipGraphExecMemcpyNodeSetParams1D")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: count
       integer(c_int), value :: kind
       integer(c_int) :: GraphExecMemcpyNodeSetParams1D
    end function hipGraphExecMemcpyNodeSetParams1D

    !---------------------------------------------
    ! hipGraphAddMemcpyNodeFromSymbol
    !---------------------------------------------
    !> @brief Creates a memcpy node to copy from a symbol on the device and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created.
    !> @param [in] graph - Instance of graph to add the created node to.
    !> @param [in] pDependencies - const pointer to the dependencies of the memcpy execution node.
    !> @param [in] numDependencies - Number of the dependencies.
    !> @param [in] dst - Pointer to memory address of the destination.
    !> @param [in] symbol - Device symbol address.
    !> @param [in] count - Size of the memory to copy.
    !> @param [in] offset - Offset from start of symbol in bytes.
    !> @param [in] kind - Type of memory copy.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddMemcpyNodeFromSymbol(pGraphNode, graph, pDependencies, numDependencies, &
                                             dst, symbol, count, offset, kind) &
       result(GraphAddMemcpyNodeFromSymbol) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddMemcpyNodeFromSymbol")
#else
       bind(C, name="hipGraphAddMemcpyNodeFromSymbol")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: dst
       type(c_ptr), value :: symbol
       integer(c_long), value :: count
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       integer(c_int) :: GraphAddMemcpyNodeFromSymbol
    end function hipGraphAddMemcpyNodeFromSymbol

    !---------------------------------------------
    ! hipGraphMemcpyNodeSetParamsFromSymbol
    !---------------------------------------------
    !> @brief Sets a memcpy node's parameters to copy from a symbol on the device.
    !>
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] dst - Pointer to memory address of the destination.
    !> @param [in] symbol - Device symbol address.
    !> @param [in] count - Size of the memory to copy.
    !> @param [in] offset - Offset from start of symbol in bytes.
    !> @param [in] kind - Type of memory copy.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphMemcpyNodeSetParamsFromSymbol(node, dst, symbol, count, offset, kind) &
       result(GraphMemcpyNodeSetParamsFromSymbol) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemcpyNodeSetParamsFromSymbol")
#else
       bind(C, name="hipGraphMemcpyNodeSetParamsFromSymbol")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: dst
       type(c_ptr), value :: symbol
       integer(c_long), value :: count
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       integer(c_int) :: GraphMemcpyNodeSetParamsFromSymbol
    end function hipGraphMemcpyNodeSetParamsFromSymbol

    !---------------------------------------------
    ! hipGraphExecMemcpyNodeSetParamsFromSymbol
    !---------------------------------------------
    !> @brief Sets the parameters for a memcpy node in the given graphExec to copy from a symbol on
    !> the
    !> * device.
    !>
    !> @param [in] hGraphExec - Instance of the executable graph with the node.
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] dst - Pointer to memory address of the destination.
    !> @param [in] symbol - Device symbol address.
    !> @param [in] count - Size of the memory to copy.
    !> @param [in] offset - Offset from start of symbol in bytes.
    !> @param [in] kind - Type of memory copy.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecMemcpyNodeSetParamsFromSymbol(hGraphExec, node, dst, symbol, count, &
                                                       offset, kind) &
       result(GraphExecMemcpyNodeSetParamsFromSymbol) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecMemcpyNodeSetParamsFromSymbol")
#else
       bind(C, name="hipGraphExecMemcpyNodeSetParamsFromSymbol")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(c_ptr), value :: dst
       type(c_ptr), value :: symbol
       integer(c_long), value :: count
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       integer(c_int) :: GraphExecMemcpyNodeSetParamsFromSymbol
    end function hipGraphExecMemcpyNodeSetParamsFromSymbol

    !---------------------------------------------
    ! hipGraphAddMemcpyNodeToSymbol
    !---------------------------------------------
    !> @brief Creates a memcpy node to copy to a symbol on the device and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created.
    !> @param [in] graph - Instance of graph to add the created node to.
    !> @param [in] pDependencies - const pointer to the dependencies on the memcpy execution node.
    !> @param [in] numDependencies - Number of dependencies.
    !> @param [in] symbol - Device symbol address.
    !> @param [in] src - Pointer to memory address of the src.
    !> @param [in] count - Size of the memory to copy.
    !> @param [in] offset - Offset from start of symbol in bytes.
    !> @param [in] kind - Type of memory copy.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddMemcpyNodeToSymbol(pGraphNode, graph, pDependencies, numDependencies, &
                                           symbol, src, count, offset, kind) &
       result(GraphAddMemcpyNodeToSymbol) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddMemcpyNodeToSymbol")
#else
       bind(C, name="hipGraphAddMemcpyNodeToSymbol")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: symbol
       type(c_ptr), value :: src
       integer(c_long), value :: count
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       integer(c_int) :: GraphAddMemcpyNodeToSymbol
    end function hipGraphAddMemcpyNodeToSymbol

    !---------------------------------------------
    ! hipGraphMemcpyNodeSetParamsToSymbol
    !---------------------------------------------
    !> @brief Sets a memcpy node's parameters to copy to a symbol on the device.
    !>
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] symbol - Device symbol address.
    !> @param [in] src - Pointer to memory address of the src.
    !> @param [in] count - Size of the memory to copy.
    !> @param [in] offset - Offset from start of symbol in bytes.
    !> @param [in] kind - Type of memory copy.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphMemcpyNodeSetParamsToSymbol(node, symbol, src, count, offset, kind) &
       result(GraphMemcpyNodeSetParamsToSymbol) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemcpyNodeSetParamsToSymbol")
#else
       bind(C, name="hipGraphMemcpyNodeSetParamsToSymbol")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: symbol
       type(c_ptr), value :: src
       integer(c_long), value :: count
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       integer(c_int) :: GraphMemcpyNodeSetParamsToSymbol
    end function hipGraphMemcpyNodeSetParamsToSymbol

    !---------------------------------------------
    ! hipGraphExecMemcpyNodeSetParamsToSymbol
    !---------------------------------------------
    !> @brief Sets the parameters for a memcpy node in the given graphExec to copy to a symbol on
    !> the
    !> device.
    !> @param [in] hGraphExec - Instance of the executable graph with the node.
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] symbol - Device symbol address.
    !> @param [in] src - Pointer to memory address of the src.
    !> @param [in] count - Size of the memory to copy.
    !> @param [in] offset - Offset from start of symbol in bytes.
    !> @param [in] kind - Type of memory copy.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecMemcpyNodeSetParamsToSymbol(hGraphExec, node, symbol, src, count, offset, &
                                                     kind) &
       result(GraphExecMemcpyNodeSetParamsToSymbol) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecMemcpyNodeSetParamsToSymbol")
#else
       bind(C, name="hipGraphExecMemcpyNodeSetParamsToSymbol")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(c_ptr), value :: symbol
       type(c_ptr), value :: src
       integer(c_long), value :: count
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       integer(c_int) :: GraphExecMemcpyNodeSetParamsToSymbol
    end function hipGraphExecMemcpyNodeSetParamsToSymbol

    !---------------------------------------------
    ! hipGraphAddMemsetNode
    !---------------------------------------------
    !> @brief Creates a memset node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created.
    !> @param [in] graph - Instance of the graph to add the created node to.
    !> @param [in] pDependencies - const pointer to the dependencies on the memset execution node.
    !> @param [in] numDependencies - Number of dependencies.
    !> @param [in] pMemsetParams - const pointer to the parameters for the memory set.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddMemsetNode(pGraphNode, graph, pDependencies, numDependencies, &
                                   pMemsetParams) &
       result(GraphAddMemsetNode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddMemsetNode")
#else
       bind(C, name="hipGraphAddMemsetNode")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: pMemsetParams
       integer(c_int) :: GraphAddMemsetNode
    end function hipGraphAddMemsetNode

    !---------------------------------------------
    ! hipGraphMemsetNodeGetParams
    !---------------------------------------------
    !> @brief Gets a memset node's parameters.
    !>
    !> @param [in] node - Instance of the node to get parameters of.
    !> @param [out] pNodeParams - Pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphMemsetNodeGetParams(node, pNodeParams) &
       result(GraphMemsetNodeGetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemsetNodeGetParams")
#else
       bind(C, name="hipGraphMemsetNodeGetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphMemsetNodeGetParams
    end function hipGraphMemsetNodeGetParams

    !---------------------------------------------
    ! hipGraphMemsetNodeSetParams
    !---------------------------------------------
    !> @brief Sets a memset node's parameters.
    !>
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - Pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphMemsetNodeSetParams(node, pNodeParams) &
       result(GraphMemsetNodeSetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemsetNodeSetParams")
#else
       bind(C, name="hipGraphMemsetNodeSetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphMemsetNodeSetParams
    end function hipGraphMemsetNodeSetParams

    !---------------------------------------------
    ! hipGraphExecMemsetNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a memset node in the given graphExec.
    !>
    !> @param [in] hGraphExec - Instance of the executable graph with the node.
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - Pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecMemsetNodeSetParams(hGraphExec, node, pNodeParams) &
       result(GraphExecMemsetNodeSetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecMemsetNodeSetParams")
#else
       bind(C, name="hipGraphExecMemsetNodeSetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphExecMemsetNodeSetParams
    end function hipGraphExecMemsetNodeSetParams

    !---------------------------------------------
    ! hipGraphAddHostNode
    !---------------------------------------------
    !> @brief Creates a host execution node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created.
    !> @param [in] graph - Instance of the graph to add the created node to.
    !> @param [in] pDependencies - const pointer to the dependencies of the memset execution node.
    !> @param [in] numDependencies - Number of dependencies.
    !> @param [in] pNodeParams - Pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddHostNode(pGraphNode, graph, pDependencies, numDependencies, pNodeParams) &
       result(GraphAddHostNode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddHostNode")
#else
       bind(C, name="hipGraphAddHostNode")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphAddHostNode
    end function hipGraphAddHostNode

    !---------------------------------------------
    ! hipGraphHostNodeGetParams
    !---------------------------------------------
    !> @brief Returns a host node's parameters.
    !>
    !> @param [in] node - Instance of the node to get parameters of.
    !> @param [out] pNodeParams - Pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphHostNodeGetParams(node, pNodeParams) &
       result(GraphHostNodeGetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphHostNodeGetParams")
#else
       bind(C, name="hipGraphHostNodeGetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphHostNodeGetParams
    end function hipGraphHostNodeGetParams

    !---------------------------------------------
    ! hipGraphHostNodeSetParams
    !---------------------------------------------
    !> @brief Sets a host node's parameters.
    !>
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - Pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphHostNodeSetParams(node, pNodeParams) &
       result(GraphHostNodeSetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphHostNodeSetParams")
#else
       bind(C, name="hipGraphHostNodeSetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphHostNodeSetParams
    end function hipGraphHostNodeSetParams

    !---------------------------------------------
    ! hipGraphExecHostNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a host node in the given graphExec.
    !>
    !> @param [in] hGraphExec - Instance of the executable graph with the node.
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - Pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecHostNodeSetParams(hGraphExec, node, pNodeParams) &
       result(GraphExecHostNodeSetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecHostNodeSetParams")
#else
       bind(C, name="hipGraphExecHostNodeSetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphExecHostNodeSetParams
    end function hipGraphExecHostNodeSetParams

    !---------------------------------------------
    ! hipGraphAddChildGraphNode
    !---------------------------------------------
    !> @brief Creates a child graph node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created.
    !> @param [in] graph - Instance of the graph to add the created node.
    !> @param [in] pDependencies - const pointer to the dependencies of the memset execution node.
    !> @param [in] numDependencies - Number of dependencies.
    !> @param [in] childGraph - Graph to clone into this node
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddChildGraphNode(pGraphNode, graph, pDependencies, numDependencies, &
                                       childGraph) &
       result(GraphAddChildGraphNode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddChildGraphNode")
#else
       bind(C, name="hipGraphAddChildGraphNode")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: childGraph
       integer(c_int) :: GraphAddChildGraphNode
    end function hipGraphAddChildGraphNode

    !---------------------------------------------
    ! hipGraphChildGraphNodeGetGraph
    !---------------------------------------------
    !> @brief Gets a handle to the embedded graph of a child graph node.
    !>
    !> @param [in] node - Instance of the node to get child graph of.
    !> @param [out] pGraph - Pointer to get the graph.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphChildGraphNodeGetGraph(node, pGraph) &
       result(GraphChildGraphNodeGetGraph) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphChildGraphNodeGetGraph")
#else
       bind(C, name="hipGraphChildGraphNodeGetGraph")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr) :: pGraph
       integer(c_int) :: GraphChildGraphNodeGetGraph
    end function hipGraphChildGraphNodeGetGraph

    !---------------------------------------------
    ! hipGraphExecChildGraphNodeSetParams
    !---------------------------------------------
    !> @brief Updates node parameters in the child graph node in the given graphExec.
    !>
    !> @param [in] hGraphExec - instance of the executable graph with the node.
    !> @param [in] node - node from the graph which was used to instantiate graphExec.
    !> @param [in] childGraph - child graph with updated parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecChildGraphNodeSetParams(hGraphExec, node, childGraph) &
       result(GraphExecChildGraphNodeSetParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecChildGraphNodeSetParams")
#else
       bind(C, name="hipGraphExecChildGraphNodeSetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(c_ptr), value :: childGraph
       integer(c_int) :: GraphExecChildGraphNodeSetParams
    end function hipGraphExecChildGraphNodeSetParams

    !---------------------------------------------
    ! hipGraphAddEmptyNode
    !---------------------------------------------
    !> @brief Creates an empty node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created.
    !> @param [in] graph - Instance of the graph the node is added to.
    !> @param [in] pDependencies - const pointer to the node dependencies.
    !> @param [in] numDependencies - Number of dependencies.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddEmptyNode(pGraphNode, graph, pDependencies, numDependencies) &
       result(GraphAddEmptyNode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddEmptyNode")
#else
       bind(C, name="hipGraphAddEmptyNode")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       integer(c_int) :: GraphAddEmptyNode
    end function hipGraphAddEmptyNode

    !---------------------------------------------
    ! hipGraphAddEventRecordNode
    !---------------------------------------------
    !> @brief Creates an event record node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created.
    !> @param [in] graph - Instance of the graph the node is added to.
    !> @param [in] pDependencies - const pointer to the node dependencies.
    !> @param [in] numDependencies - Number of dependencies.
    !> @param [in] event - Event of the node.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddEventRecordNode(pGraphNode, graph, pDependencies, numDependencies, event) &
       result(GraphAddEventRecordNode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddEventRecordNode")
#else
       bind(C, name="hipGraphAddEventRecordNode")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: event
       integer(c_int) :: GraphAddEventRecordNode
    end function hipGraphAddEventRecordNode

    !---------------------------------------------
    ! hipGraphEventRecordNodeGetEvent
    !---------------------------------------------
    !> @brief Returns the event associated with an event record node.
    !>
    !> @param [in] node -  Instance of the node to get event of.
    !> @param [out] event_out - Pointer to return the event.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphEventRecordNodeGetEvent(node, event_out) &
       result(GraphEventRecordNodeGetEvent) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphEventRecordNodeGetEvent")
#else
       bind(C, name="hipGraphEventRecordNodeGetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr) :: event_out
       integer(c_int) :: GraphEventRecordNodeGetEvent
    end function hipGraphEventRecordNodeGetEvent

    !---------------------------------------------
    ! hipGraphEventRecordNodeSetEvent
    !---------------------------------------------
    !> @brief Sets an event record node's event.
    !>
    !> @param [in] node - Instance of the node to set event to.
    !> @param [in] event - Pointer to the event.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphEventRecordNodeSetEvent(node, event) &
       result(GraphEventRecordNodeSetEvent) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphEventRecordNodeSetEvent")
#else
       bind(C, name="hipGraphEventRecordNodeSetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: event
       integer(c_int) :: GraphEventRecordNodeSetEvent
    end function hipGraphEventRecordNodeSetEvent

    !---------------------------------------------
    ! hipGraphExecEventRecordNodeSetEvent
    !---------------------------------------------
    !> @brief Sets the event for an event record node in the given graphExec.
    !>
    !> @param [in] hGraphExec - instance of the executable graph with the node.
    !> @param [in] hNode - node from the graph which was used to instantiate graphExec.
    !> @param [in] event - pointer to the event.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecEventRecordNodeSetEvent(hGraphExec, hNode, event) &
       result(GraphExecEventRecordNodeSetEvent) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecEventRecordNodeSetEvent")
#else
       bind(C, name="hipGraphExecEventRecordNodeSetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(c_ptr), value :: event
       integer(c_int) :: GraphExecEventRecordNodeSetEvent
    end function hipGraphExecEventRecordNodeSetEvent

    !---------------------------------------------
    ! hipGraphAddEventWaitNode
    !---------------------------------------------
    !> @brief Creates an event wait node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created.
    !> @param [in] graph - Instance of the graph the node to be added.
    !> @param [in] pDependencies - const pointer to the node dependencies.
    !> @param [in] numDependencies - Number of dependencies.
    !> @param [in] event - Event for the node.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddEventWaitNode(pGraphNode, graph, pDependencies, numDependencies, event) &
       result(GraphAddEventWaitNode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddEventWaitNode")
#else
       bind(C, name="hipGraphAddEventWaitNode")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: event
       integer(c_int) :: GraphAddEventWaitNode
    end function hipGraphAddEventWaitNode

    !---------------------------------------------
    ! hipGraphEventWaitNodeGetEvent
    !---------------------------------------------
    !> @brief Returns the event associated with an event wait node.
    !>
    !> @param [in] node -  Instance of the node to get event of.
    !> @param [out] event_out - Pointer to return the event.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphEventWaitNodeGetEvent(node, event_out) &
       result(GraphEventWaitNodeGetEvent) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphEventWaitNodeGetEvent")
#else
       bind(C, name="hipGraphEventWaitNodeGetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr) :: event_out
       integer(c_int) :: GraphEventWaitNodeGetEvent
    end function hipGraphEventWaitNodeGetEvent

    !---------------------------------------------
    ! hipGraphEventWaitNodeSetEvent
    !---------------------------------------------
    !> @brief Sets an event wait node's event.
    !>
    !> @param [in] node - Instance of the node to set event of.
    !> @param [in] event - Pointer to the event.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphEventWaitNodeSetEvent(node, event) &
       result(GraphEventWaitNodeSetEvent) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphEventWaitNodeSetEvent")
#else
       bind(C, name="hipGraphEventWaitNodeSetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: event
       integer(c_int) :: GraphEventWaitNodeSetEvent
    end function hipGraphEventWaitNodeSetEvent

    !---------------------------------------------
    ! hipGraphExecEventWaitNodeSetEvent
    !---------------------------------------------
    !> @brief Sets the event for an event record node in the given graphExec.
    !>
    !> @param [in] hGraphExec - instance of the executable graph with the node.
    !> @param [in] hNode - node from the graph which was used to instantiate graphExec.
    !> @param [in] event - pointer to the event.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecEventWaitNodeSetEvent(hGraphExec, hNode, event) &
       result(GraphExecEventWaitNodeSetEvent) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecEventWaitNodeSetEvent")
#else
       bind(C, name="hipGraphExecEventWaitNodeSetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(c_ptr), value :: event
       integer(c_int) :: GraphExecEventWaitNodeSetEvent
    end function hipGraphExecEventWaitNodeSetEvent

    !---------------------------------------------
    ! hipGraphAddMemAllocNode
    !---------------------------------------------
    !> @brief Creates a memory allocation node and adds it to a graph
    !>
    !> @param [out] pGraphNode      - Pointer to the graph node to create and add to the graph
    !> @param [in] graph            - Instance of the graph node to be added
    !> @param [in] pDependencies    - Const pointer to the node dependencies
    !> @param [in] numDependencies  - The number of dependencies
    !> @param [in, out] pNodeParams - Node parameters for memory allocation, returns a pointer to
    !> the
    !> allocated memory.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddMemAllocNode(pGraphNode, graph, pDependencies, numDependencies, &
                                     pNodeParams) &
       result(GraphAddMemAllocNode) &
       bind(C, name="hipGraphAddMemAllocNode")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphAddMemAllocNode
    end function hipGraphAddMemAllocNode

    !---------------------------------------------
    ! hipGraphMemAllocNodeGetParams
    !---------------------------------------------
    !> @brief Returns parameters for memory allocation node
    !>
    !> @param [in] node         - Memory allocation node to query
    !> @param [out] pNodeParams - Parameters for the specified memory allocation node
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphMemAllocNodeGetParams(node, pNodeParams) &
       result(GraphMemAllocNodeGetParams) &
       bind(C, name="hipGraphMemAllocNodeGetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: pNodeParams
       integer(c_int) :: GraphMemAllocNodeGetParams
    end function hipGraphMemAllocNodeGetParams

    !---------------------------------------------
    ! hipGraphAddMemFreeNode
    !---------------------------------------------
    !> @brief Creates a memory free node and adds it to a graph
    !>
    !> @param [out] pGraphNode      - Pointer to the graph node to create and add to the graph
    !> @param [in] graph            - Instance of the graph node to be added
    !> @param [in] pDependencies    - Const pointer to the node dependencies
    !> @param [in] numDependencies  - The number of dependencies
    !> @param [in] dev_ptr          - Pointer to the memory to be freed
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddMemFreeNode(pGraphNode, graph, pDependencies, numDependencies, dev_ptr) &
       result(GraphAddMemFreeNode) &
       bind(C, name="hipGraphAddMemFreeNode")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: dev_ptr
       integer(c_int) :: GraphAddMemFreeNode
    end function hipGraphAddMemFreeNode

    !---------------------------------------------
    ! hipGraphMemFreeNodeGetParams
    !---------------------------------------------
    !> @brief Returns parameters for memory free node
    !>
    !> @param [in] node     - Memory free node to query
    !> @param [out] dev_ptr - Device pointer of the specified memory free node
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphMemFreeNodeGetParams(node, dev_ptr) &
       result(GraphMemFreeNodeGetParams) &
       bind(C, name="hipGraphMemFreeNodeGetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: dev_ptr
       integer(c_int) :: GraphMemFreeNodeGetParams
    end function hipGraphMemFreeNodeGetParams

    !---------------------------------------------
    ! hipDeviceGetGraphMemAttribute
    !---------------------------------------------
    !> @brief Get the mem attribute for graphs.
    !>
    !> @param [in] device - Device to get attributes from
    !> @param [in] attr - Attribute type to be queried
    !> @param [out] value - Value of the queried attribute
    !> @returns #hipSuccess, #hipErrorInvalidDevice
    function hipDeviceGetGraphMemAttribute(device, attr, value) &
       result(DeviceGetGraphMemAttribute) &
       bind(C, name="hipDeviceGetGraphMemAttribute")
       import :: c_int, c_ptr
       integer(c_int), value :: device
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: DeviceGetGraphMemAttribute
    end function hipDeviceGetGraphMemAttribute

    !---------------------------------------------
    ! hipDeviceSetGraphMemAttribute
    !---------------------------------------------
    !> @brief Set the mem attribute for graphs.
    !>
    !> @param [in] device - Device to set attribute of.
    !> @param [in] attr - Attribute type to be set.
    !> @param [in] value - Value of the attribute.
    !> @returns #hipSuccess, #hipErrorInvalidDevice
    function hipDeviceSetGraphMemAttribute(device, attr, value) &
       result(DeviceSetGraphMemAttribute) &
       bind(C, name="hipDeviceSetGraphMemAttribute")
       import :: c_int, c_ptr
       integer(c_int), value :: device
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: DeviceSetGraphMemAttribute
    end function hipDeviceSetGraphMemAttribute

    !---------------------------------------------
    ! hipDeviceGraphMemTrim
    !---------------------------------------------
    !> @brief Free unused memory reserved for graphs on a specific device and return it back to the
    !> OS.
    !>
    !> @param [in] device - Device for which memory should be trimmed
    !> @returns #hipSuccess, #hipErrorInvalidDevice
    function hipDeviceGraphMemTrim(device) &
       result(DeviceGraphMemTrim) &
       bind(C, name="hipDeviceGraphMemTrim")
       import :: c_int
       integer(c_int), value :: device
       integer(c_int) :: DeviceGraphMemTrim
    end function hipDeviceGraphMemTrim

    !---------------------------------------------
    ! hipUserObjectCreate
    !---------------------------------------------
    !> @brief Create an instance of userObject to manage lifetime of a resource.
    !>
    !> @param [out] object_out - pointer to instace of userobj.
    !> @param [in] ptr - pointer to pass to destroy function.
    !> @param [in] destroy - destroy callback to remove resource.
    !> @param [in] initialRefcount - reference to resource.
    !> @param [in] flags - flags passed to API.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipUserObjectCreate(object_out, ptr, destroy, initialRefcount, flags) &
       result(UserObjectCreate) &
       bind(C, name="hipUserObjectCreate")
       import :: c_ptr, c_funptr, c_int
       type(c_ptr) :: object_out
       type(c_ptr), value :: ptr
       type(c_funptr), value :: destroy
       integer(c_int), value :: initialRefcount
       integer(c_int), value :: flags
       integer(c_int) :: UserObjectCreate
    end function hipUserObjectCreate

    !---------------------------------------------
    ! hipUserObjectRelease
    !---------------------------------------------
    !> @brief Release number of references to resource.
    !>
    !> @param [in] object - pointer to instace of userobj.
    !> @param [in] count - reference to resource to be retained.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipUserObjectRelease(object, count) &
       result(UserObjectRelease) &
       bind(C, name="hipUserObjectRelease")
       import :: c_ptr, c_int
       type(c_ptr), value :: object
       integer(c_int), value :: count
       integer(c_int) :: UserObjectRelease
    end function hipUserObjectRelease

    !---------------------------------------------
    ! hipUserObjectRetain
    !---------------------------------------------
    !> @brief Retain number of references to resource.
    !>
    !> @param [in] object - pointer to instace of userobj.
    !> @param [in] count - reference to resource to be retained.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipUserObjectRetain(object, count) &
       result(UserObjectRetain) &
       bind(C, name="hipUserObjectRetain")
       import :: c_ptr, c_int
       type(c_ptr), value :: object
       integer(c_int), value :: count
       integer(c_int) :: UserObjectRetain
    end function hipUserObjectRetain

    !---------------------------------------------
    ! hipGraphRetainUserObject
    !---------------------------------------------
    !> @brief Retain user object for graphs.
    !>
    !> @param [in] graph - pointer to graph to retain the user object for.
    !> @param [in] object - pointer to instace of userobj.
    !> @param [in] count - reference to resource to be retained.
    !> @param [in] flags - flags passed to API.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphRetainUserObject(graph, object, count, flags) &
       result(GraphRetainUserObject) &
       bind(C, name="hipGraphRetainUserObject")
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       type(c_ptr), value :: object
       integer(c_int), value :: count
       integer(c_int), value :: flags
       integer(c_int) :: GraphRetainUserObject
    end function hipGraphRetainUserObject

    !---------------------------------------------
    ! hipGraphReleaseUserObject
    !---------------------------------------------
    !> @brief Release user object from graphs.
    !>
    !> @param [in] graph - pointer to graph to retain the user object for.
    !> @param [in] object - pointer to instace of userobj.
    !> @param [in] count - reference to resource to be retained.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphReleaseUserObject(graph, object, count) &
       result(GraphReleaseUserObject) &
       bind(C, name="hipGraphReleaseUserObject")
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       type(c_ptr), value :: object
       integer(c_int), value :: count
       integer(c_int) :: GraphReleaseUserObject
    end function hipGraphReleaseUserObject

    !---------------------------------------------
    ! hipGraphKernelNodeCopyAttributes
    !---------------------------------------------
    !> @brief Copies attributes from source node to destination node.
    !>
    !> Copies attributes from source node to destination node.
    !> Both node must have the same context.
    !>
    !> @param [out] hDst - Destination node.
    !> @param [in] hSrc - Source node.
    !> For list of attributes see ::hipKernelNodeAttrID.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidContext
    function hipGraphKernelNodeCopyAttributes(hSrc, hDst) &
       result(GraphKernelNodeCopyAttributes) &
       bind(C, name="hipGraphKernelNodeCopyAttributes")
       import :: c_ptr, c_int
       type(c_ptr), value :: hSrc
       type(c_ptr), value :: hDst
       integer(c_int) :: GraphKernelNodeCopyAttributes
    end function hipGraphKernelNodeCopyAttributes

    !---------------------------------------------
    ! hipGraphNodeSetEnabled
    !---------------------------------------------
    !> @brief Enables or disables the specified node in the given graphExec
    !>
    !> Sets hNode to be either enabled or disabled. Disabled nodes are functionally equivalent
    !> to empty nodes until they are reenabled. Existing node parameters are not affected by
    !> disabling/enabling the node.
    !>
    !> The node is identified by the corresponding hNode in the non-executable graph, from which the
    !> executable graph was instantiated.
    !>
    !> hNode must not have been removed from the original graph.
    !>
    !> @note Currently only kernel, memset and memcpy nodes are supported.
    !>
    !> @param [in] hGraphExec - The executable graph in which to set the specified node.
    !> @param [in] hNode      - Node from the graph from which graphExec was instantiated.
    !> @param [in] isEnabled  - Node is enabled if != 0, otherwise the node is disabled.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue,
    function hipGraphNodeSetEnabled(hGraphExec, hNode, isEnabled) &
       result(GraphNodeSetEnabled) &
       bind(C, name="hipGraphNodeSetEnabled")
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       integer(c_int), value :: isEnabled
       integer(c_int) :: GraphNodeSetEnabled
    end function hipGraphNodeSetEnabled

    !---------------------------------------------
    ! hipGraphNodeGetEnabled
    !---------------------------------------------
    !> @brief Query whether a node in the given graphExec is enabled
    !>
    !> Sets isEnabled to 1 if hNode is enabled, or 0 if it is disabled.
    !>
    !> The node is identified by the corresponding node in the non-executable graph, from which the
    !> executable graph was instantiated.
    !>
    !> hNode must not have been removed from the original graph.
    !>
    !> @note Currently only kernel, memset and memcpy nodes are supported.
    !>
    !> @param [in]  hGraphExec - The executable graph in which to set the specified node.
    !> @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
    !> @param [out] isEnabled  - Location to return the enabled status of the node.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphNodeGetEnabled(hGraphExec, hNode, isEnabled) &
       result(GraphNodeGetEnabled) &
       bind(C, name="hipGraphNodeGetEnabled")
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       integer(c_int) :: isEnabled(*)
       integer(c_int) :: GraphNodeGetEnabled
    end function hipGraphNodeGetEnabled

    !---------------------------------------------
    ! hipGraphAddExternalSemaphoresWaitNode
    !---------------------------------------------
    !> @brief Creates a external semaphor wait node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - pointer to the graph node to create.
    !> @param [in] graph - instance of the graph to add the created node.
    !> @param [in] pDependencies - const pointer to the dependencies on the memset execution node.
    !> @param [in] numDependencies - the number of the dependencies.
    !> @param [in] nodeParams -pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddExternalSemaphoresWaitNode(pGraphNode, graph, pDependencies, &
                                                   numDependencies, nodeParams) &
       result(GraphAddExternalSemaphoresWaitNode) &
       bind(C, name="hipGraphAddExternalSemaphoresWaitNode")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphAddExternalSemaphoresWaitNode
    end function hipGraphAddExternalSemaphoresWaitNode

    !---------------------------------------------
    ! hipGraphAddExternalSemaphoresSignalNode
    !---------------------------------------------
    !> @brief Creates a external semaphor signal node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - pointer to the graph node to create.
    !> @param [in] graph - instance of the graph to add the created node.
    !> @param [in] pDependencies - const pointer to the dependencies on the memset execution node.
    !> @param [in] numDependencies - the number of the dependencies.
    !> @param [in] nodeParams -pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphAddExternalSemaphoresSignalNode(pGraphNode, graph, pDependencies, &
                                                     numDependencies, nodeParams) &
       result(GraphAddExternalSemaphoresSignalNode) &
       bind(C, name="hipGraphAddExternalSemaphoresSignalNode")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphAddExternalSemaphoresSignalNode
    end function hipGraphAddExternalSemaphoresSignalNode

    !---------------------------------------------
    ! hipGraphExternalSemaphoresSignalNodeSetParams
    !---------------------------------------------
    !> @brief Updates node parameters in the external semaphore signal node.
    !>
    !> @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
    !> @param [in]  nodeParams  - Pointer to the params to be set.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExternalSemaphoresSignalNodeSetParams(hNode, nodeParams) &
       result(GraphExternalSemaphoresSignalNodeSetParams) &
       bind(C, name="hipGraphExternalSemaphoresSignalNodeSetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphExternalSemaphoresSignalNodeSetParams
    end function hipGraphExternalSemaphoresSignalNodeSetParams

    !---------------------------------------------
    ! hipGraphExternalSemaphoresWaitNodeSetParams
    !---------------------------------------------
    !> @brief Updates node parameters in the external semaphore wait node.
    !>
    !> @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
    !> @param [in]  nodeParams  - Pointer to the params to be set.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExternalSemaphoresWaitNodeSetParams(hNode, nodeParams) &
       result(GraphExternalSemaphoresWaitNodeSetParams) &
       bind(C, name="hipGraphExternalSemaphoresWaitNodeSetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphExternalSemaphoresWaitNodeSetParams
    end function hipGraphExternalSemaphoresWaitNodeSetParams

    !---------------------------------------------
    ! hipGraphExternalSemaphoresSignalNodeGetParams
    !---------------------------------------------
    !> @brief Returns external semaphore signal node params.
    !>
    !> @param [in]   hNode       - Node from the graph from which graphExec was instantiated.
    !> @param [out]  params_out  - Pointer to params.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExternalSemaphoresSignalNodeGetParams(hNode, params_out) &
       result(GraphExternalSemaphoresSignalNodeGetParams) &
       bind(C, name="hipGraphExternalSemaphoresSignalNodeGetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       type(c_ptr), value :: params_out
       integer(c_int) :: GraphExternalSemaphoresSignalNodeGetParams
    end function hipGraphExternalSemaphoresSignalNodeGetParams

    !---------------------------------------------
    ! hipGraphExternalSemaphoresWaitNodeGetParams
    !---------------------------------------------
    !> @brief Returns external semaphore wait node params.
    !>
    !> @param [in]   hNode       - Node from the graph from which graphExec was instantiated.
    !> @param [out]  params_out  - Pointer to params.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExternalSemaphoresWaitNodeGetParams(hNode, params_out) &
       result(GraphExternalSemaphoresWaitNodeGetParams) &
       bind(C, name="hipGraphExternalSemaphoresWaitNodeGetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       type(c_ptr), value :: params_out
       integer(c_int) :: GraphExternalSemaphoresWaitNodeGetParams
    end function hipGraphExternalSemaphoresWaitNodeGetParams

    !---------------------------------------------
    ! hipGraphExecExternalSemaphoresSignalNodeSetParams
    !---------------------------------------------
    !> @brief Updates node parameters in the external semaphore signal node in the given graphExec.
    !>
    !> @param [in]  hGraphExec - The executable graph in which to set the specified node.
    !> @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
    !> @param [in]  nodeParams  - Pointer to the params to be set.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecExternalSemaphoresSignalNodeSetParams(hGraphExec, hNode, nodeParams) &
       result(GraphExecExternalSemaphoresSignalNodeSetParams) &
       bind(C, name="hipGraphExecExternalSemaphoresSignalNodeSetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphExecExternalSemaphoresSignalNodeSetParams
    end function hipGraphExecExternalSemaphoresSignalNodeSetParams

    !---------------------------------------------
    ! hipGraphExecExternalSemaphoresWaitNodeSetParams
    !---------------------------------------------
    !> @brief Updates node parameters in the external semaphore wait node in the given graphExec.
    !>
    !> @param [in]  hGraphExec - The executable graph in which to set the specified node.
    !> @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
    !> @param [in]  nodeParams  - Pointer to the params to be set.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphExecExternalSemaphoresWaitNodeSetParams(hGraphExec, hNode, nodeParams) &
       result(GraphExecExternalSemaphoresWaitNodeSetParams) &
       bind(C, name="hipGraphExecExternalSemaphoresWaitNodeSetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(c_ptr), value :: nodeParams
       integer(c_int) :: GraphExecExternalSemaphoresWaitNodeSetParams
    end function hipGraphExecExternalSemaphoresWaitNodeSetParams

    !---------------------------------------------
    ! hipDrvGraphMemcpyNodeGetParams
    !---------------------------------------------
    !> @brief Gets a memcpy node's parameters.
    !>
    !> @param [in] hNode - instance of the node to get parameters from.
    !> @param [out] nodeParams - pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipDrvGraphMemcpyNodeGetParams(hNode, nodeParams) &
       result(DrvGraphMemcpyNodeGetParams) &
       bind(C, name="hipDrvGraphMemcpyNodeGetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       type(c_ptr), value :: nodeParams
       integer(c_int) :: DrvGraphMemcpyNodeGetParams
    end function hipDrvGraphMemcpyNodeGetParams

    !---------------------------------------------
    ! hipDrvGraphMemcpyNodeSetParams
    !---------------------------------------------
    !> @brief Sets a memcpy node's parameters.
    !>
    !> @param [in] hNode - instance of the node to Set parameters for.
    !> @param [out] nodeParams - pointer to the parameters.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipDrvGraphMemcpyNodeSetParams(hNode, nodeParams) &
       result(DrvGraphMemcpyNodeSetParams) &
       bind(C, name="hipDrvGraphMemcpyNodeSetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       type(c_ptr), value :: nodeParams
       integer(c_int) :: DrvGraphMemcpyNodeSetParams
    end function hipDrvGraphMemcpyNodeSetParams

    !---------------------------------------------
    ! hipDrvGraphAddMemsetNode
    !---------------------------------------------
    !> @brief Creates a memset node and adds it to a graph.
    !>
    !> @param [out] phGraphNode - pointer to graph node to create.
    !> @param [in] hGraph - instance of graph to add the created node to.
    !> @param [in] dependencies - const pointer to the dependencies on the memset execution node.
    !> @param [in] numDependencies - number of the dependencies.
    !> @param [in] memsetParams - const pointer to the parameters for the memory set.
    !> @param [in] ctx - cotext related to current device.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipDrvGraphAddMemsetNode(phGraphNode, hGraph, dependencies, numDependencies, &
                                      memsetParams, ctx) &
       result(DrvGraphAddMemsetNode) &
       bind(C, name="hipDrvGraphAddMemsetNode")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: phGraphNode
       type(c_ptr), value :: hGraph
       type(c_ptr) :: dependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: memsetParams
       type(c_ptr), value :: ctx
       integer(c_int) :: DrvGraphAddMemsetNode
    end function hipDrvGraphAddMemsetNode

    !---------------------------------------------
    ! hipDrvGraphAddMemFreeNode
    !---------------------------------------------
    !> @brief Creates a memory free node and adds it to a graph
    !>
    !> @param [out] phGraphNode - Pointer to the graph node to create and add to the graph
    !> @param [in]  hGraph - Instance of the graph the node to be added
    !> @param [in]  dependencies - Const pointer to the node dependencies
    !> @param [in]  numDependencies - The number of dependencies
    !> @param [in]  dptr - Pointer to the memory to be freed
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipDrvGraphAddMemFreeNode(phGraphNode, hGraph, dependencies, numDependencies, dptr) &
       result(DrvGraphAddMemFreeNode) &
       bind(C, name="hipDrvGraphAddMemFreeNode")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: phGraphNode
       type(c_ptr), value :: hGraph
       type(c_ptr) :: dependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: dptr
       integer(c_int) :: DrvGraphAddMemFreeNode
    end function hipDrvGraphAddMemFreeNode

    !---------------------------------------------
    ! hipDrvGraphExecMemcpyNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a memcpy node in the given graphExec.
    !>
    !> @param [in] hGraphExec - instance of the executable graph with the node.
    !> @param [in] hNode - instance of the node to set parameters to.
    !> @param [in] copyParams - const pointer to the memcpy node params.
    !> @param [in] ctx - cotext related to current device.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipDrvGraphExecMemcpyNodeSetParams(hGraphExec, hNode, copyParams, ctx) &
       result(DrvGraphExecMemcpyNodeSetParams) &
       bind(C, name="hipDrvGraphExecMemcpyNodeSetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(c_ptr), value :: copyParams
       type(c_ptr), value :: ctx
       integer(c_int) :: DrvGraphExecMemcpyNodeSetParams
    end function hipDrvGraphExecMemcpyNodeSetParams

    !---------------------------------------------
    ! hipDrvGraphExecMemsetNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a memset node in the given graphExec.
    !>
    !> @param [in] hGraphExec - instance of the executable graph with the node.
    !> @param [in] hNode - instance of the node to set parameters to.
    !> @param [in] memsetParams - pointer to the parameters.
    !> @param [in] ctx - cotext related to current device.
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipDrvGraphExecMemsetNodeSetParams(hGraphExec, hNode, memsetParams, ctx) &
       result(DrvGraphExecMemsetNodeSetParams) &
       bind(C, name="hipDrvGraphExecMemsetNodeSetParams")
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(c_ptr), value :: memsetParams
       type(c_ptr), value :: ctx
       integer(c_int) :: DrvGraphExecMemsetNodeSetParams
    end function hipDrvGraphExecMemsetNodeSetParams

    !---------------------------------------------
    ! hipMemAddressFree
    !---------------------------------------------
    !> @brief Frees an address range reservation made via hipMemAddressReserve
    !>
    !> @param [in] devPtr - starting address of the range.
    !> @param [in] size - size of the range.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemAddressFree(devPtr, size) &
       result(MemAddressFree) &
       bind(C, name="hipMemAddressFree")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: devPtr
       integer(c_long), value :: size
       integer(c_int) :: MemAddressFree
    end function hipMemAddressFree

    !---------------------------------------------
    ! hipMemAddressReserve
    !---------------------------------------------
    !> @brief Reserves an address range
    !>
    !> @param [out] ptr - starting address of the reserved range.
    !> @param [in] size - size of the reservation.
    !> @param [in] alignment - alignment of the address.
    !> @param [in] addr - requested starting address of the range.
    !> @param [in] flags - currently unused, must be zero.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemAddressReserve(ptr, size, alignment, addr, flags) &
       result(MemAddressReserve) &
       bind(C, name="hipMemAddressReserve")
       import :: c_ptr, c_long, c_int64_t, c_int
       type(c_ptr) :: ptr
       integer(c_long), value :: size
       integer(c_long), value :: alignment
       type(c_ptr), value :: addr
       integer(c_int64_t), value :: flags
       integer(c_int) :: MemAddressReserve
    end function hipMemAddressReserve

    !---------------------------------------------
    ! hipMemCreate
    !---------------------------------------------
    !> @brief Creates a memory allocation described by the properties and size
    !>
    !> @param [out] handle - value of the returned handle.
    !> @param [in] size - size of the allocation.
    !> @param [in] prop - properties of the allocation.
    !> @param [in] flags - currently unused, must be zero.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemCreate(handle, size, prop, flags) &
       result(MemCreate) &
       bind(C, name="hipMemCreate")
       import :: c_ptr, c_long, c_int64_t, c_int
       type(c_ptr) :: handle
       integer(c_long), value :: size
       type(c_ptr), value :: prop
       integer(c_int64_t), value :: flags
       integer(c_int) :: MemCreate
    end function hipMemCreate

    !---------------------------------------------
    ! hipMemExportToShareableHandle
    !---------------------------------------------
    !> @brief Exports an allocation to a requested shareable handle type.
    !>
    !> @param [out] shareableHandle - value of the returned handle.
    !> @param [in] handle - handle to share.
    !> @param [in] handleType - type of the shareable handle.
    !> @param [in] flags - currently unused, must be zero.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemExportToShareableHandle(shareableHandle, handle, handleType, flags) &
       result(MemExportToShareableHandle) &
       bind(C, name="hipMemExportToShareableHandle")
       import :: c_ptr, c_int, c_int64_t
       type(c_ptr), value :: shareableHandle
       type(c_ptr), value :: handle
       integer(c_int), value :: handleType
       integer(c_int64_t), value :: flags
       integer(c_int) :: MemExportToShareableHandle
    end function hipMemExportToShareableHandle

    !---------------------------------------------
    ! hipMemGetAccess
    !---------------------------------------------
    !> @brief Get the access flags set for the given location and ptr.
    !>
    !> @param [out] flags - flags for this location.
    !> @param [in] location - target location.
    !> @param [in] ptr - address to check the access flags.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemGetAccess(flags, location, ptr) &
       result(MemGetAccess) &
       bind(C, name="hipMemGetAccess")
       import :: c_int64_t, c_ptr, c_int
       integer(c_int64_t) :: flags(*)
       type(c_ptr), value :: location
       type(c_ptr), value :: ptr
       integer(c_int) :: MemGetAccess
    end function hipMemGetAccess

    !---------------------------------------------
    ! hipMemGetAllocationGranularity
    !---------------------------------------------
    !> @brief Calculates either the minimal or recommended granularity.
    !>
    !> @param [out] granularity - returned granularity.
    !> @param [in] prop - location properties.
    !> @param [in] option - determines which granularity to return.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemGetAllocationGranularity(granularity, prop, option) &
       result(MemGetAllocationGranularity) &
       bind(C, name="hipMemGetAllocationGranularity")
       import :: c_ptr, c_int
       type(c_ptr), value :: granularity
       type(c_ptr), value :: prop
       integer(c_int), value :: option
       integer(c_int) :: MemGetAllocationGranularity
    end function hipMemGetAllocationGranularity

    !---------------------------------------------
    ! hipMemGetAllocationPropertiesFromHandle
    !---------------------------------------------
    !> @brief Retrieve the property structure of the given handle.
    !>
    !> @param [out] prop - properties of the given handle.
    !> @param [in] handle - handle to perform the query on.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemGetAllocationPropertiesFromHandle(prop, handle) &
       result(MemGetAllocationPropertiesFromHandle) &
       bind(C, name="hipMemGetAllocationPropertiesFromHandle")
       import :: c_ptr, c_int
       type(c_ptr), value :: prop
       type(c_ptr), value :: handle
       integer(c_int) :: MemGetAllocationPropertiesFromHandle
    end function hipMemGetAllocationPropertiesFromHandle

    !---------------------------------------------
    ! hipMemImportFromShareableHandle
    !---------------------------------------------
    !> @brief Imports an allocation from a requested shareable handle type.
    !>
    !> @param [out] handle - returned value.
    !> @param [in] osHandle - shareable handle representing the memory allocation.
    !> @param [in] shHandleType - handle type.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemImportFromShareableHandle(handle, osHandle, shHandleType) &
       result(MemImportFromShareableHandle) &
       bind(C, name="hipMemImportFromShareableHandle")
       import :: c_ptr, c_int
       type(c_ptr) :: handle
       type(c_ptr), value :: osHandle
       integer(c_int), value :: shHandleType
       integer(c_int) :: MemImportFromShareableHandle
    end function hipMemImportFromShareableHandle

    !---------------------------------------------
    ! hipMemMap
    !---------------------------------------------
    !> @brief Maps an allocation handle to a reserved virtual address range.
    !>
    !> @param [in] ptr - address where the memory will be mapped.
    !> @param [in] size - size of the mapping.
    !> @param [in] offset - offset into the memory, currently must be zero.
    !> @param [in] handle - memory allocation to be mapped.
    !> @param [in] flags - currently unused, must be zero.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemMap(ptr, size, offset, handle, flags) &
       result(MemMap) &
       bind(C, name="hipMemMap")
       import :: c_ptr, c_long, c_int64_t, c_int
       type(c_ptr), value :: ptr
       integer(c_long), value :: size
       integer(c_long), value :: offset
       type(c_ptr), value :: handle
       integer(c_int64_t), value :: flags
       integer(c_int) :: MemMap
    end function hipMemMap

    !---------------------------------------------
    ! hipMemMapArrayAsync
    !---------------------------------------------
    !> @brief Maps or unmaps subregions of sparse HIP arrays and sparse HIP mipmapped arrays.
    !>
    !> @param [in] mapInfoList - list of hipArrayMapInfo.
    !> @param [in] count - number of hipArrayMapInfo in mapInfoList.
    !> @param [in] stream - stream identifier for the stream to use for map or unmap operations.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is under development. Currently it is not supported on AMD
    !> GPUs and returns #hipErrorNotSupported.
    function hipMemMapArrayAsync(mapInfoList, count, stream) &
       result(MemMapArrayAsync) &
       bind(C, name="hipMemMapArrayAsync")
       import :: c_ptr, c_int
       type(c_ptr), value :: mapInfoList
       integer(c_int), value :: count
       type(c_ptr), value :: stream
       integer(c_int) :: MemMapArrayAsync
    end function hipMemMapArrayAsync

    !---------------------------------------------
    ! hipMemRelease
    !---------------------------------------------
    !> @brief Release a memory handle representing a memory allocation which was previously
    !> allocated
    !> through hipMemCreate.
    !>
    !> @param [in] handle - handle of the memory allocation.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemRelease(handle) &
       result(MemRelease) &
       bind(C, name="hipMemRelease")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: MemRelease
    end function hipMemRelease

    !---------------------------------------------
    ! hipMemRetainAllocationHandle
    !---------------------------------------------
    !> @brief Returns the allocation handle of the backing memory allocation given the address.
    !>
    !> @param [out] handle - handle representing addr.
    !> @param [in] addr - address to look up.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemRetainAllocationHandle(handle, addr) &
       result(MemRetainAllocationHandle) &
       bind(C, name="hipMemRetainAllocationHandle")
       import :: c_ptr, c_int
       type(c_ptr) :: handle
       type(c_ptr), value :: addr
       integer(c_int) :: MemRetainAllocationHandle
    end function hipMemRetainAllocationHandle

    !---------------------------------------------
    ! hipMemSetAccess
    !---------------------------------------------
    !> @brief Set the access flags for each location specified in desc for the given virtual address
    !> range.
    !>
    !> @param [in] ptr - starting address of the virtual address range.
    !> @param [in] size - size of the range.
    !> @param [in] desc - array of hipMemAccessDesc.
    !> @param [in] count - number of hipMemAccessDesc in desc.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemSetAccess(ptr, size, desc, count) &
       result(MemSetAccess) &
       bind(C, name="hipMemSetAccess")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: ptr
       integer(c_long), value :: size
       type(c_ptr), value :: desc
       integer(c_long), value :: count
       integer(c_int) :: MemSetAccess
    end function hipMemSetAccess

    !---------------------------------------------
    ! hipMemUnmap
    !---------------------------------------------
    !> @brief Unmap memory allocation of a given address range.
    !>
    !> @param [in] ptr - starting address of the range to unmap.
    !> @param [in] size - size of the virtual address range.
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotSupported
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemUnmap(ptr, size) &
       result(MemUnmap) &
       bind(C, name="hipMemUnmap")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: ptr
       integer(c_long), value :: size
       integer(c_int) :: MemUnmap
    end function hipMemUnmap

    !---------------------------------------------
    ! hipGraphicsMapResources
    !---------------------------------------------
    !> @brief Maps a graphics resource for access.
    !>
    !> @param [in] count - Number of resources to map.
    !> @param [in] resources - Pointer of resources to map.
    !> @param [in] stream - Stream for synchronization.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorUnknown, #hipErrorInvalidResourceHandle
    function hipGraphicsMapResources(count, resources, stream) &
       result(GraphicsMapResources) &
       bind(C, name="hipGraphicsMapResources")
       import :: c_int, c_ptr
       integer(c_int), value :: count
       type(c_ptr) :: resources
       type(c_ptr), value :: stream
       integer(c_int) :: GraphicsMapResources
    end function hipGraphicsMapResources

    !---------------------------------------------
    ! hipGraphicsSubResourceGetMappedArray
    !---------------------------------------------
    !> @brief Get an array through which to access a subresource of a mapped graphics resource.
    !>
    !> @param [out] array - Pointer of array through which a subresource of resource may be
    !> accessed.
    !> @param [in] resource - Mapped resource to access.
    !> @param [in] arrayIndex - Array index for the subresource to access.
    !> @param [in] mipLevel - Mipmap level for the subresource to access.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    !>
    !> @note  In this API, the value of arrayIndex higher than zero is currently not supported.
    function hipGraphicsSubResourceGetMappedArray(array, resource, arrayIndex, mipLevel) &
       result(GraphicsSubResourceGetMappedArray) &
       bind(C, name="hipGraphicsSubResourceGetMappedArray")
       import :: c_ptr, c_int
       type(c_ptr) :: array
       type(c_ptr), value :: resource
       integer(c_int), value :: arrayIndex
       integer(c_int), value :: mipLevel
       integer(c_int) :: GraphicsSubResourceGetMappedArray
    end function hipGraphicsSubResourceGetMappedArray

    !---------------------------------------------
    ! hipGraphicsResourceGetMappedPointer
    !---------------------------------------------
    !> @brief Gets device accessible address of a graphics resource.
    !>
    !> @param [out] devPtr - Pointer of device through which graphic resource may be accessed.
    !> @param [out] size - Size of the buffer accessible from devPtr.
    !> @param [in] resource - Mapped resource to access.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipGraphicsResourceGetMappedPointer(devPtr, size, resource) &
       result(GraphicsResourceGetMappedPointer) &
       bind(C, name="hipGraphicsResourceGetMappedPointer")
       import :: c_ptr, c_int
       type(c_ptr) :: devPtr
       type(c_ptr), value :: size
       type(c_ptr), value :: resource
       integer(c_int) :: GraphicsResourceGetMappedPointer
    end function hipGraphicsResourceGetMappedPointer

    !---------------------------------------------
    ! hipGraphicsUnmapResources
    !---------------------------------------------
    !> @brief Unmaps graphics resources.
    !>
    !> @param [in] count - Number of resources to unmap.
    !> @param [in] resources - Pointer of resources to unmap.
    !> @param [in] stream - Stream for synchronization.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorUnknown, #hipErrorContextIsDestroyed
    function hipGraphicsUnmapResources(count, resources, stream) &
       result(GraphicsUnmapResources) &
       bind(C, name="hipGraphicsUnmapResources")
       import :: c_int, c_ptr
       integer(c_int), value :: count
       type(c_ptr) :: resources
       type(c_ptr), value :: stream
       integer(c_int) :: GraphicsUnmapResources
    end function hipGraphicsUnmapResources

    !---------------------------------------------
    ! hipGraphicsUnregisterResource
    !---------------------------------------------
    !> @brief Unregisters a graphics resource.
    !>
    !> @param [in] resource - Graphics resources to unregister.
    !>
    !> @returns #hipSuccess
    function hipGraphicsUnregisterResource(resource) &
       result(GraphicsUnregisterResource) &
       bind(C, name="hipGraphicsUnregisterResource")
       import :: c_ptr, c_int
       type(c_ptr), value :: resource
       integer(c_int) :: GraphicsUnregisterResource
    end function hipGraphicsUnregisterResource

    !---------------------------------------------
    ! hipCreateSurfaceObject
    !---------------------------------------------
    !> @brief Create a surface object.
    !>
    !> @param [out] pSurfObject  Pointer of surface object to be created.
    !> @param [in] pResDesc  Pointer of suface object descriptor.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipCreateSurfaceObject(pSurfObject, pResDesc) &
       result(CreateSurfaceObject) &
       bind(C, name="hipCreateSurfaceObject")
       import :: c_ptr, c_int
       type(c_ptr) :: pSurfObject
       type(c_ptr), value :: pResDesc
       integer(c_int) :: CreateSurfaceObject
    end function hipCreateSurfaceObject

    !---------------------------------------------
    ! hipDestroySurfaceObject
    !---------------------------------------------
    !> @brief Destroy a surface object.
    !>
    !> @param [in] surfaceObject  Surface object to be destroyed.
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipDestroySurfaceObject(surfaceObject) &
       result(DestroySurfaceObject) &
       bind(C, name="hipDestroySurfaceObject")
       import :: c_ptr, c_int
       type(c_ptr), value :: surfaceObject
       integer(c_int) :: DestroySurfaceObject
    end function hipDestroySurfaceObject

    !---------------------------------------------
    ! hipMemcpy_spt
    !---------------------------------------------
    function hipMemcpy_spt(dst, src, sizeBytes, kind) &
       result(Memcpy_spt) &
       bind(C, name="hipMemcpy_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_int), value :: kind
       integer(c_int) :: Memcpy_spt
    end function hipMemcpy_spt

    !---------------------------------------------
    ! hipMemcpyToSymbol_spt
    !---------------------------------------------
    function hipMemcpyToSymbol_spt(symbol, src, sizeBytes, offset, kind) &
       result(MemcpyToSymbol_spt) &
       bind(C, name="hipMemcpyToSymbol_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: symbol
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       integer(c_int) :: MemcpyToSymbol_spt
    end function hipMemcpyToSymbol_spt

    !---------------------------------------------
    ! hipMemcpyFromSymbol_spt
    !---------------------------------------------
    function hipMemcpyFromSymbol_spt(dst, symbol, sizeBytes, offset, kind) &
       result(MemcpyFromSymbol_spt) &
       bind(C, name="hipMemcpyFromSymbol_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: symbol
       integer(c_long), value :: sizeBytes
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       integer(c_int) :: MemcpyFromSymbol_spt
    end function hipMemcpyFromSymbol_spt

    !---------------------------------------------
    ! hipMemcpy2D_spt
    !---------------------------------------------
    function hipMemcpy2D_spt(dst, dpitch, src, spitch, width, height, kind) &
       result(Memcpy2D_spt) &
       bind(C, name="hipMemcpy2D_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dpitch
       type(c_ptr), value :: src
       integer(c_long), value :: spitch
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       integer(c_int) :: Memcpy2D_spt
    end function hipMemcpy2D_spt

    !---------------------------------------------
    ! hipMemcpy2DFromArray_spt
    !---------------------------------------------
    function hipMemcpy2DFromArray_spt(dst, dpitch, src, wOffset, hOffset, width, height, kind) &
       result(Memcpy2DFromArray_spt) &
       bind(C, name="hipMemcpy2DFromArray_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dpitch
       type(c_ptr), value :: src
       integer(c_long), value :: wOffset
       integer(c_long), value :: hOffset
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       integer(c_int) :: Memcpy2DFromArray_spt
    end function hipMemcpy2DFromArray_spt

    !---------------------------------------------
    ! hipMemcpy3D_spt
    !---------------------------------------------
    function hipMemcpy3D_spt(p) &
       result(Memcpy3D_spt) &
       bind(C, name="hipMemcpy3D_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: p
       integer(c_int) :: Memcpy3D_spt
    end function hipMemcpy3D_spt

    !---------------------------------------------
    ! hipMemset_spt
    !---------------------------------------------
    function hipMemset_spt(dst, value, sizeBytes) &
       result(Memset_spt) &
       bind(C, name="hipMemset_spt")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dst
       integer(c_int), value :: value
       integer(c_long), value :: sizeBytes
       integer(c_int) :: Memset_spt
    end function hipMemset_spt

    !---------------------------------------------
    ! hipMemsetAsync_spt
    !---------------------------------------------
    function hipMemsetAsync_spt(dst, value, sizeBytes, stream) &
       result(MemsetAsync_spt) &
       bind(C, name="hipMemsetAsync_spt")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dst
       integer(c_int), value :: value
       integer(c_long), value :: sizeBytes
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetAsync_spt
    end function hipMemsetAsync_spt

    !---------------------------------------------
    ! hipMemset2D_spt
    !---------------------------------------------
    function hipMemset2D_spt(dst, pitch, value, width, height) &
       result(Memset2D_spt) &
       bind(C, name="hipMemset2D_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: pitch
       integer(c_int), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int) :: Memset2D_spt
    end function hipMemset2D_spt

    !---------------------------------------------
    ! hipMemset2DAsync_spt
    !---------------------------------------------
    function hipMemset2DAsync_spt(dst, pitch, value, width, height, stream) &
       result(Memset2DAsync_spt) &
       bind(C, name="hipMemset2DAsync_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: pitch
       integer(c_int), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       type(c_ptr), value :: stream
       integer(c_int) :: Memset2DAsync_spt
    end function hipMemset2DAsync_spt

    !---------------------------------------------
    ! hipMemset3DAsync_spt
    !---------------------------------------------
    function hipMemset3DAsync_spt(pitchedDevPtr, value, extent, stream) &
       result(Memset3DAsync_spt) &
       bind(C, name="hipMemset3DAsync_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: pitchedDevPtr
       integer(c_int), value :: value
       type(c_ptr), value :: extent
       type(c_ptr), value :: stream
       integer(c_int) :: Memset3DAsync_spt
    end function hipMemset3DAsync_spt

    !---------------------------------------------
    ! hipMemset3D_spt
    !---------------------------------------------
    function hipMemset3D_spt(pitchedDevPtr, value, extent) &
       result(Memset3D_spt) &
       bind(C, name="hipMemset3D_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: pitchedDevPtr
       integer(c_int), value :: value
       type(c_ptr), value :: extent
       integer(c_int) :: Memset3D_spt
    end function hipMemset3D_spt

    !---------------------------------------------
    ! hipMemcpyAsync_spt
    !---------------------------------------------
    function hipMemcpyAsync_spt(dst, src, sizeBytes, kind, stream) &
       result(MemcpyAsync_spt) &
       bind(C, name="hipMemcpyAsync_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyAsync_spt
    end function hipMemcpyAsync_spt

    !---------------------------------------------
    ! hipMemcpy3DAsync_spt
    !---------------------------------------------
    function hipMemcpy3DAsync_spt(p, stream) &
       result(Memcpy3DAsync_spt) &
       bind(C, name="hipMemcpy3DAsync_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: p
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy3DAsync_spt
    end function hipMemcpy3DAsync_spt

    !---------------------------------------------
    ! hipMemcpy2DAsync_spt
    !---------------------------------------------
    function hipMemcpy2DAsync_spt(dst, dpitch, src, spitch, width, height, kind, stream) &
       result(Memcpy2DAsync_spt) &
       bind(C, name="hipMemcpy2DAsync_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dpitch
       type(c_ptr), value :: src
       integer(c_long), value :: spitch
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy2DAsync_spt
    end function hipMemcpy2DAsync_spt

    !---------------------------------------------
    ! hipMemcpyFromSymbolAsync_spt
    !---------------------------------------------
    function hipMemcpyFromSymbolAsync_spt(dst, symbol, sizeBytes, offset, kind, stream) &
       result(MemcpyFromSymbolAsync_spt) &
       bind(C, name="hipMemcpyFromSymbolAsync_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: symbol
       integer(c_long), value :: sizeBytes
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyFromSymbolAsync_spt
    end function hipMemcpyFromSymbolAsync_spt

    !---------------------------------------------
    ! hipMemcpyToSymbolAsync_spt
    !---------------------------------------------
    function hipMemcpyToSymbolAsync_spt(symbol, src, sizeBytes, offset, kind, stream) &
       result(MemcpyToSymbolAsync_spt) &
       bind(C, name="hipMemcpyToSymbolAsync_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: symbol
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyToSymbolAsync_spt
    end function hipMemcpyToSymbolAsync_spt

    !---------------------------------------------
    ! hipMemcpyFromArray_spt
    !---------------------------------------------
    function hipMemcpyFromArray_spt(dst, src, wOffsetSrc, hOffset, count, kind) &
       result(MemcpyFromArray_spt) &
       bind(C, name="hipMemcpyFromArray_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: wOffsetSrc
       integer(c_long), value :: hOffset
       integer(c_long), value :: count
       integer(c_int), value :: kind
       integer(c_int) :: MemcpyFromArray_spt
    end function hipMemcpyFromArray_spt

    !---------------------------------------------
    ! hipMemcpy2DToArray_spt
    !---------------------------------------------
    function hipMemcpy2DToArray_spt(dst, wOffset, hOffset, src, spitch, width, height, kind) &
       result(Memcpy2DToArray_spt) &
       bind(C, name="hipMemcpy2DToArray_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: wOffset
       integer(c_long), value :: hOffset
       type(c_ptr), value :: src
       integer(c_long), value :: spitch
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       integer(c_int) :: Memcpy2DToArray_spt
    end function hipMemcpy2DToArray_spt

    !---------------------------------------------
    ! hipMemcpy2DFromArrayAsync_spt
    !---------------------------------------------
    function hipMemcpy2DFromArrayAsync_spt(dst, dpitch, src, wOffsetSrc, hOffsetSrc, width, &
                                           height, kind, stream) &
       result(Memcpy2DFromArrayAsync_spt) &
       bind(C, name="hipMemcpy2DFromArrayAsync_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dpitch
       type(c_ptr), value :: src
       integer(c_long), value :: wOffsetSrc
       integer(c_long), value :: hOffsetSrc
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy2DFromArrayAsync_spt
    end function hipMemcpy2DFromArrayAsync_spt

    !---------------------------------------------
    ! hipMemcpy2DToArrayAsync_spt
    !---------------------------------------------
    function hipMemcpy2DToArrayAsync_spt(dst, wOffset, hOffset, src, spitch, width, height, kind, &
                                         stream) &
       result(Memcpy2DToArrayAsync_spt) &
       bind(C, name="hipMemcpy2DToArrayAsync_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: wOffset
       integer(c_long), value :: hOffset
       type(c_ptr), value :: src
       integer(c_long), value :: spitch
       integer(c_long), value :: width
       integer(c_long), value :: height
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy2DToArrayAsync_spt
    end function hipMemcpy2DToArrayAsync_spt

    !---------------------------------------------
    ! hipStreamQuery_spt
    !---------------------------------------------
    function hipStreamQuery_spt(stream) &
       result(StreamQuery_spt) &
       bind(C, name="hipStreamQuery_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: StreamQuery_spt
    end function hipStreamQuery_spt

    !---------------------------------------------
    ! hipStreamSynchronize_spt
    !---------------------------------------------
    function hipStreamSynchronize_spt(stream) &
       result(StreamSynchronize_spt) &
       bind(C, name="hipStreamSynchronize_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: StreamSynchronize_spt
    end function hipStreamSynchronize_spt

    !---------------------------------------------
    ! hipStreamGetPriority_spt
    !---------------------------------------------
    function hipStreamGetPriority_spt(stream, priority) &
       result(StreamGetPriority_spt) &
       bind(C, name="hipStreamGetPriority_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: priority(*)
       integer(c_int) :: StreamGetPriority_spt
    end function hipStreamGetPriority_spt

    !---------------------------------------------
    ! hipStreamWaitEvent_spt
    !---------------------------------------------
    function hipStreamWaitEvent_spt(stream, event, flags) &
       result(StreamWaitEvent_spt) &
       bind(C, name="hipStreamWaitEvent_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: event
       integer(c_int), value :: flags
       integer(c_int) :: StreamWaitEvent_spt
    end function hipStreamWaitEvent_spt

    !---------------------------------------------
    ! hipStreamGetFlags_spt
    !---------------------------------------------
    function hipStreamGetFlags_spt(stream, flags) &
       result(StreamGetFlags_spt) &
       bind(C, name="hipStreamGetFlags_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: flags(*)
       integer(c_int) :: StreamGetFlags_spt
    end function hipStreamGetFlags_spt

    !---------------------------------------------
    ! hipStreamAddCallback_spt
    !---------------------------------------------
    function hipStreamAddCallback_spt(stream, callback, userData, flags) &
       result(StreamAddCallback_spt) &
       bind(C, name="hipStreamAddCallback_spt")
       import :: c_ptr, c_funptr, c_int
       type(c_ptr), value :: stream
       type(c_funptr), value :: callback
       type(c_ptr), value :: userData
       integer(c_int), value :: flags
       integer(c_int) :: StreamAddCallback_spt
    end function hipStreamAddCallback_spt

    !---------------------------------------------
    ! hipEventRecord_spt
    !---------------------------------------------
    function hipEventRecord_spt(event, stream) &
       result(EventRecord_spt) &
       bind(C, name="hipEventRecord_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       type(c_ptr), value :: stream
       integer(c_int) :: EventRecord_spt
    end function hipEventRecord_spt

    !---------------------------------------------
    ! hipLaunchCooperativeKernel_spt
    !---------------------------------------------
    function hipLaunchCooperativeKernel_spt(f, gridDim, blockDim, kernelParams, sharedMemBytes, &
                                            hStream) &
       result(LaunchCooperativeKernel_spt) &
       bind(C, name="hipLaunchCooperativeKernel_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: f
       type(c_ptr), value :: gridDim
       type(c_ptr), value :: blockDim
       type(c_ptr) :: kernelParams
       integer(c_int), value :: sharedMemBytes
       type(c_ptr), value :: hStream
       integer(c_int) :: LaunchCooperativeKernel_spt
    end function hipLaunchCooperativeKernel_spt

    !---------------------------------------------
    ! hipLaunchKernel_spt
    !---------------------------------------------
    function hipLaunchKernel_spt(function_address, numBlocks, dimBlocks, args, sharedMemBytes, &
                                 stream) &
       result(LaunchKernel_spt) &
       bind(C, name="hipLaunchKernel_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: function_address
       type(c_ptr), value :: numBlocks
       type(c_ptr), value :: dimBlocks
       type(c_ptr) :: args
       integer(c_long), value :: sharedMemBytes
       type(c_ptr), value :: stream
       integer(c_int) :: LaunchKernel_spt
    end function hipLaunchKernel_spt

    !---------------------------------------------
    ! hipGraphLaunch_spt
    !---------------------------------------------
    function hipGraphLaunch_spt(graphExec, stream) &
       result(GraphLaunch_spt) &
       bind(C, name="hipGraphLaunch_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: graphExec
       type(c_ptr), value :: stream
       integer(c_int) :: GraphLaunch_spt
    end function hipGraphLaunch_spt

    !---------------------------------------------
    ! hipStreamBeginCapture_spt
    !---------------------------------------------
    function hipStreamBeginCapture_spt(stream, mode) &
       result(StreamBeginCapture_spt) &
       bind(C, name="hipStreamBeginCapture_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: mode
       integer(c_int) :: StreamBeginCapture_spt
    end function hipStreamBeginCapture_spt

    !---------------------------------------------
    ! hipStreamEndCapture_spt
    !---------------------------------------------
    function hipStreamEndCapture_spt(stream, pGraph) &
       result(StreamEndCapture_spt) &
       bind(C, name="hipStreamEndCapture_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr) :: pGraph
       integer(c_int) :: StreamEndCapture_spt
    end function hipStreamEndCapture_spt

    !---------------------------------------------
    ! hipStreamIsCapturing_spt
    !---------------------------------------------
    function hipStreamIsCapturing_spt(stream, pCaptureStatus) &
       result(StreamIsCapturing_spt) &
       bind(C, name="hipStreamIsCapturing_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: pCaptureStatus(*)
       integer(c_int) :: StreamIsCapturing_spt
    end function hipStreamIsCapturing_spt

    !---------------------------------------------
    ! hipStreamGetCaptureInfo_spt
    !---------------------------------------------
    function hipStreamGetCaptureInfo_spt(stream, pCaptureStatus, pId) &
       result(StreamGetCaptureInfo_spt) &
       bind(C, name="hipStreamGetCaptureInfo_spt")
       import :: c_ptr, c_int, c_int64_t
       type(c_ptr), value :: stream
       integer(c_int) :: pCaptureStatus(*)
       integer(c_int64_t) :: pId(*)
       integer(c_int) :: StreamGetCaptureInfo_spt
    end function hipStreamGetCaptureInfo_spt

    !---------------------------------------------
    ! hipStreamGetCaptureInfo_v2_spt
    !---------------------------------------------
    function hipStreamGetCaptureInfo_v2_spt(stream, captureStatus_out, id_out, graph_out, &
                                            dependencies_out, numDependencies_out) &
       result(StreamGetCaptureInfo_v2_spt) &
       bind(C, name="hipStreamGetCaptureInfo_v2_spt")
       import :: c_ptr, c_int, c_int64_t
       type(c_ptr), value :: stream
       integer(c_int) :: captureStatus_out(*)
       integer(c_int64_t) :: id_out(*)
       type(c_ptr) :: graph_out
       type(c_ptr) :: dependencies_out
       type(c_ptr), value :: numDependencies_out
       integer(c_int) :: StreamGetCaptureInfo_v2_spt
    end function hipStreamGetCaptureInfo_v2_spt

    !---------------------------------------------
    ! hipLaunchHostFunc_spt
    !---------------------------------------------
    function hipLaunchHostFunc_spt(stream, fn, userData) &
       result(LaunchHostFunc_spt) &
       bind(C, name="hipLaunchHostFunc_spt")
       import :: c_ptr, c_funptr, c_int
       type(c_ptr), value :: stream
       type(c_funptr), value :: fn
       type(c_ptr), value :: userData
       integer(c_int) :: LaunchHostFunc_spt
    end function hipLaunchHostFunc_spt

    !---------------------------------------------
    ! hipChooseDeviceR0600
    !---------------------------------------------
    !> @brief Device which matches hipDeviceProp_t is returned
    !>
    !> @param [out] device Pointer of the device
    !> @param [in]  prop Pointer of the properties
    !>
    !> @returns #hipSuccess, #hipErrorInvalidValue
    function hipChooseDevice(device, prop) &
       result(ChooseDevice) &
       bind(C, name="hipChooseDeviceR0600")
       import :: c_int, c_ptr
       integer(c_int) :: device(*)
       type(c_ptr), value :: prop
       integer(c_int) :: ChooseDevice
    end function hipChooseDevice

    !---------------------------------------------
    ! hipGetDevicePropertiesR0600
    !---------------------------------------------
    !> @brief Returns device properties.
    !>
    !> @param [out] prop written with device properties
    !> @param [in]  deviceId which device to query for information
    !>
    !> @returns #hipSuccess, #hipErrorInvalidDevice
    !> @bug HIP-Clang always returns 0 for maxThreadsPerMultiProcessor
    !> @bug HIP-Clang always returns 0 for regsPerBlock
    !> @bug HIP-Clang always returns 0 for l2CacheSize
    !>
    !> Populates hipGetDeviceProperties with information for the specified device.
    function hipGetDeviceProperties(prop, deviceId) &
       result(GetDeviceProperties) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetDeviceProperties")
#else
       bind(C, name="hipGetDevicePropertiesR0600")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: prop
       integer(c_int), value :: deviceId
       integer(c_int) :: GetDeviceProperties
    end function hipGetDeviceProperties

  end interface
end module hipfort
