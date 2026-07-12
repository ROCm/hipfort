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

module hipfort
#ifdef USE_CUDA_NAMES
  use hipfort_cuda_errors
#endif
  use hipfort_enums
  use hipfort_types
  use hipfort_handles
  use hipfort_auxiliary
  use, intrinsic :: iso_c_binding
  implicit none

  interface

    !---------------------------------------------
    ! hipCreateChannelDesc
    !---------------------------------------------
    function hipCreateChannelDesc(x, y, z, w, f) &
       result(CreateChannelDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCreateChannelDesc")
#else
       bind(C, name="hipCreateChannelDesc")
#endif
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipInit(flags) &
       result(Init) &
       bind(C, name="hipInit")
       import :: c_int
       integer(c_int), value :: flags
       integer(c_int) :: Init
    end function hipInit

    !---------------------------------------------
    ! hipDeviceGet
    !---------------------------------------------
    !> @brief Returns a handle to a compute device
    !> @param [out] device Handle of device
    !> @param [in] ordinal Device ordinal
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
    function hipDeviceGet(device, ordinal) &
       result(DeviceGet) &
       bind(C, name="hipDeviceGet")
       import :: c_int
       integer(c_int) :: device
       integer(c_int), value :: ordinal
       integer(c_int) :: DeviceGet
    end function hipDeviceGet

    !---------------------------------------------
    ! hipDeviceGetName
    !---------------------------------------------
    !> @brief Returns an identifer string for the device.
    !> @param [out] name String of the device name
    !> @param [in] len Maximum length of string to store in device name
    !> @param [in] device Device ordinal
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
    function hipDeviceGetName(name, len, device) &
       result(DeviceGetName) &
       bind(C, name="hipDeviceGetName")
       import :: c_ptr, c_int
       type(c_ptr), value :: name
       integer(c_int), value :: len
       integer(c_int), value :: device
       integer(c_int) :: DeviceGetName
    end function hipDeviceGetName

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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`,
    !> `hipErrorNotInitialized`,
    !> `hipErrorDeinitialized`
    function hipDeviceGetUuid(uuid, device) &
       result(DeviceGetUuid) &
       bind(C, name="hipDeviceGetUuid")
       import :: hipUUID, c_int
       type(hipUUID) :: uuid
       integer(c_int), value :: device
       integer(c_int) :: DeviceGetUuid
    end function hipDeviceGetUuid

    !---------------------------------------------
    ! hipDeviceGetPCIBusId
    !---------------------------------------------
    !> @brief Returns a PCI Bus Id string for the device, overloaded to take int device ID.
    !> @param [out] pciBusId The string of PCI Bus Id format for the device
    !> @param [in] len Maximum length of string
    !> @param [in] device The device ordinal
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
    function hipDeviceGetPCIBusId(pciBusId, len, device) &
       result(DeviceGetPCIBusId) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetPCIBusId")
#else
       bind(C, name="hipDeviceGetPCIBusId")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pciBusId
       integer(c_int), value :: len
       integer(c_int), value :: device
       integer(c_int) :: DeviceGetPCIBusId
    end function hipDeviceGetPCIBusId

    !---------------------------------------------
    ! hipDeviceTotalMem
    !---------------------------------------------
    !> @brief Returns the total amount of memory on the device.
    !> @param [out] bytes The size of memory in bytes, on the device
    !> @param [in] device The ordinal of the device
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
    function hipDeviceTotalMem(bytes, device) &
       result(DeviceTotalMem) &
       bind(C, name="hipDeviceTotalMem")
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
    !> @returns `hipSuccess`
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
    !> @returns `hipSuccess`
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
    !> @param[in] deviceId Valid device in range 0...`hipGetDeviceCount()`.
    !>
    !> Sets @p device as the default device for the calling host thread.  Valid device id's are 0...
    !> (`hipGetDeviceCount()`-1).
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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorNoDevice`
    !>
    !> @see `hipGetDevice`, `hipGetDeviceCount`
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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
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
       integer(c_int) :: deviceId
       integer(c_int) :: GetDevice
    end function hipGetDevice

    !---------------------------------------------
    ! hipGetDeviceCount
    !---------------------------------------------
    !> @brief Return number of compute-capable devices.
    !>
    !> @param [out] count Returns number of compute-capable devices.
    !>
    !> @returns `hipSuccess`, `hipErrorNoDevice`
    !>
    !>
    !> Returns in @p *count the number of devices that have ability to run compute commands. If
    !> there
    !> are no such devices, then `hipGetDeviceCount` will return `hipErrorNoDevice`. If 1 or more
    !> devices can be found, then hipGetDeviceCount returns `hipSuccess`.
    function hipGetDeviceCount(count) &
       result(GetDeviceCount) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetDeviceCount")
#else
       bind(C, name="hipGetDeviceCount")
#endif
       import :: c_int
       integer(c_int) :: count
       integer(c_int) :: GetDeviceCount
    end function hipGetDeviceCount

    !---------------------------------------------
    ! hipGetDevicePropertiesR0600
    !---------------------------------------------
    !> @brief Returns device properties.
    !>
    !> @param [out] prop written with device properties
    !> @param [in]  deviceId which device to query for information
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
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
       import :: hipDeviceProp_t, c_int
       type(hipDeviceProp_t) :: prop
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDevice`
    !>
    !> @see hipDeviceGetAttribute, hipMalloc, hipTexRefSetAddressMode
    function hipDeviceGetTexture1DLinearMaxWidth(max_width, desc, device) &
       result(DeviceGetTexture1DLinearMaxWidth) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetTexture1DLinearMaxWidth")
#else
       bind(C, name="hipDeviceGetTexture1DLinearMaxWidth")
#endif
       import :: c_ptr, hipChannelFormatDesc, c_int
       type(c_ptr), value :: max_width
       type(hipChannelFormatDesc) :: desc
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
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorNotSupported`
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
    ! hipDeviceGetLimit
    !---------------------------------------------
    !> @brief Gets resource limits of current device
    !>
    !> The function queries the size of limit value, as required by the input enum value hipLimit_t,
    !> which can be either `hipLimitStackSize`, or `hipLimitMallocHeapSize`. Any other input as
    !> default, the function will return `hipErrorUnsupportedLimit`.
    !>
    !> @param [out] pValue Returns the size of the limit in bytes
    !> @param [in]  limit The limit to query
    !>
    !> @returns `hipSuccess`, `hipErrorUnsupportedLimit`, `hipErrorInvalidValue`
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
    !> `hipLimitStackSize` sets the limit value of the stack size on the current GPU device, per
    !> thread.
    !> The limit size can get via hipDeviceGetLimit. The size is in units of 256 dwords, up to the
    !> limit
    !> (128K - 16).
    !>
    !> `hipLimitMallocHeapSize` sets the limit value of the heap used by the malloc()/free()
    !> calls. For limit size, use the `hipDeviceGetLimit` API.
    !>
    !> Any other input as default, the funtion will return hipErrorUnsupportedLimit.
    !>
    !> @param [in] limit Enum of hipLimit_t to set
    !> @param [in] value The size of limit value in bytes
    !>
    !> @returns `hipSuccess`, `hipErrorUnsupportedLimit`, `hipErrorInvalidValue`
    function hipDeviceSetLimit(limit, value) &
       result(DeviceSetLimit) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceSetLimit")
#else
       bind(C, name="hipDeviceSetLimit")
#endif
       import :: c_int, c_long
       integer(c_int), value :: limit
       integer(c_long), value :: value
       integer(c_int) :: DeviceSetLimit
    end function hipDeviceSetLimit

    !---------------------------------------------
    ! hipDeviceSetSharedMemConfig
    !---------------------------------------------
    !> @brief The bank width of shared memory on current device is set
    !>
    !> @param [in] config Configuration for the bank width of shared memory
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
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
    !> `hipDeviceScheduleSpin` : HIP runtime will actively spin in the thread which submitted
    !> the work until the command completes.  This offers the lowest latency, but will consume a CPU
    !> core and may increase power.
    !>
    !> `hipDeviceScheduleYield`        : The HIP runtime will yield the CPU to system so that other
    !> tasks can use it. This may increase latency to detect the completion but will consume less
    !> power and is friendlier to other tasks in the system.
    !>
    !> `hipDeviceScheduleBlockingSync` : On ROCm platform, this is a synonym for
    !> hipDeviceScheduleYield.
    !>
    !> `hipDeviceScheduleAuto`         : This is the default value if the input 'flags' is zero.
    !> Uses a heuristic to select between Spin and Yield modes. If the number of HIP contexts is
    !> greater than the number of logical processors in the system, uses Spin scheduling, otherwise
    !> uses Yield scheduling.
    !>
    !> `hipDeviceMapHost` : Allows mapping host memory. On ROCm, this is always allowed and
    !> the flag is ignored.
    !>
    !> `hipDeviceLmemResizeToMax`      : This flag is silently ignored on ROCm.
    !>
    !> @returns `hipSuccess`, `hipErrorNoDevice`, `hipErrorInvalidDevice`,
    !> `hipErrorSetOnActiveProcess`
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
    !> @returns `hipSuccess`, `hipErrorInvalidHandle`, `hipErrorOutOfMemory`, `hipErrorMapFailed`
    !>
    !> @note This IPC memory related feature API on Windows may behave differently from Linux.
    function hipIpcGetMemHandle(handle, devPtr) &
       result(IpcGetMemHandle) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaIpcGetMemHandle")
#else
       bind(C, name="hipIpcGetMemHandle")
#endif
       import :: hipIpcMemHandle_t, c_ptr, c_int
       type(hipIpcMemHandle_t) :: handle
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`,
    !> `hipErrorInvalidDevicePointer`
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
    !> @returns `hipSuccess`, `hipErrorMapFailed`, `hipErrorInvalidHandle`
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
    !> @returns `hipSuccess`, `hipErrorInvalidDeviceFunction`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorNotInitialized`
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
    !> @returns `hipSuccess`, `hipErrorInvalidDeviceFunction`, `hipErrorInvalidValue`
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
    !> `hipSuccess`
    !>
    !> @returns return code from last HIP called from the active host thread
    !>
    !> Returns the last error that has been returned by any of the runtime calls in the same host
    !> thread, and then resets the saved error to `hipSuccess`.
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
    !> `hipSuccess`
    !>
    !> @returns return code from last HIP called from the active host thread
    !>
    !> Returns the last error that has been returned by any of the runtime calls in the same host
    !> thread, and then resets the saved error to `hipSuccess`.
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
    !> @returns `hipSuccess`
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
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetErrorName")
#else
       bind(C, name="hipGetErrorName")
#endif
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
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetErrorString")
#else
       bind(C, name="hipGetErrorString")
#endif
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    ! hipPointerSetAttribute
    !---------------------------------------------
    !> @brief Sets information on the specified pointer.[BETA]
    !>
    !> @param [in]      value     Sets pointer attribute value
    !> @param [in]      attribute  Attribute to set
    !> @param [in]      ptr      Pointer to set attributes for
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
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
    !> Otherwise, the API cannot handle the pointer and returns `hipErrorInvalidValue`.
    !>
    !> @note  The unrecognized memory type is unsupported to keep the HIP functionality backward
    !> compatibility due to `hipMemoryType` enum values.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
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
       import :: hipPointerAttribute_t, c_ptr, c_int
       type(hipPointerAttribute_t) :: attributes
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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @see hipPointerGetAttributes
    function hipPointerGetAttribute(data, attribute, ptr) &
       result(PointerGetAttribute) &
       bind(C, name="hipPointerGetAttribute")
       import :: c_ptr, c_int
       type(c_ptr), value :: data
       integer(c_int), value :: attribute
       type(c_ptr), value :: ptr
       integer(c_int) :: PointerGetAttribute
    end function hipPointerGetAttribute

    !---------------------------------------------
    ! hipExtMallocWithFlags
    !---------------------------------------------
    !> @brief Allocate memory on the default accelerator
    !>
    !> @param[out] ptr  Pointer to the allocated memory
    !> @param[in]  sizeBytes  Requested memory size
    !> @param[in]  flags  Type of memory allocation
    !>
    !> If requested memory size is 0, no memory is allocated, *ptr returns nullptr, and `hipSuccess`
    !> is returned.
    !>
    !> The memory allocation flag should be either `hipDeviceMallocDefault`,
    !> `hipDeviceMallocFinegrained`, `hipDeviceMallocUncached`, or `hipMallocSignalMemory`.
    !> If the flag is any other value, the API returns `hipErrorInvalidValue`.
    !>
    !> @returns `hipSuccess`, `hipErrorOutOfMemory`, `hipErrorInvalidValue` (bad context, null *ptr)
    !>
    !> @see hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D, hipMalloc3DArray,
    !> hipHostFree, hiHostMalloc
    function hipExtMallocWithFlags(ptr, sizeBytes, flags) &
       result(ExtMallocWithFlags) &
       bind(C, name="hipExtMallocWithFlags")
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
    !> @returns `hipSuccess`, `hipErrorOutOfMemory`
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
    !> @returns `hipSuccess`, `hipErrorOutOfMemory`
    !>
    !> @warning  This API is deprecated, use hipHostMalloc() instead
    function hipMemAllocHost(ptr, size) &
       result(MemAllocHost) &
       bind(C, name="hipMemAllocHost")
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
    !> @returns `hipSuccess`, `hipErrorOutOfMemory`
    !>
    !>
    !> @see hipSetDeviceFlags, hiptHostFree
    function hipHostMalloc(ptr, size, flags) &
       result(HostMalloc) &
       bind(C, name="hipHostMalloc")
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
    !> @returns `hipSuccess`, `hipErrorMemoryAllocation`, `hipErrorNotSupported`,
    !> `hipErrorInvalidValue`
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
    ! hipMemAdvise
    !---------------------------------------------
    !> @brief Advise about the usage of a given memory range to HIP.
    !>
    !> @param [in] dev_ptr  pointer to memory to set the advice for
    !> @param [in] count    size in bytes of the memory range, it should be CPU page size alligned.
    !> @param [in] advice   advice to be applied for the specified memory range
    !> @param [in] device   device to apply the advice for
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorOutOfMemory`
    !>
    !> @see hipMemPoolImportPointer
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolExportPointer(export_data, dev_ptr) &
       result(MemPoolExportPointer) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPoolExportPointer")
#else
       bind(C, name="hipMemPoolExportPointer")
#endif
       import :: hipMemPoolPtrExportData, c_ptr, c_int
       type(hipMemPoolPtrExportData) :: export_data
       type(c_ptr), value :: dev_ptr
       integer(c_int) :: MemPoolExportPointer
    end function hipMemPoolExportPointer

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
    !> - `hipHostAllocDefault`   Default pinned memory allocation on the host.
    !> - `hipHostAllocPortable`  Memory is considered allocated by all contexts.
    !> - `hipHostAllocMapped`    Map the allocation into the address space for the current device.
    !> - `hipHostAllocWriteCombined`  Allocates the memory as write-combined.
    !> - `hipHostAllocUncached`  Allocate the host memory on extended fine grained access system
    !> memory pool
    !>
    !> @return `hipSuccess`, `hipErrorOutOfMemory`, `hipErrorInvalidValue`
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
       bind(C, name="hipMemAllocPitch")
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
    !> @returns `hipSuccess`,
    !> `hipErrorInvalidValue` (if pointer is invalid, including device pointers allocated
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
    !> @returns `hipSuccess`,
    !> `hipErrorInvalidValue` (if pointer is invalid, including device pointers allocated with
    !> hipMalloc)
    !>
    !> @see hipMalloc, hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D,
    !> hipMalloc3DArray, hipHostMalloc
    function hipHostFree(ptr) &
       result(HostFree) &
       bind(C, name="hipHostFree")
       import :: c_ptr, c_int
       type(c_ptr), value :: ptr
       integer(c_int) :: HostFree
    end function hipHostFree

    !---------------------------------------------
    ! hipMemcpyHtoD
    !---------------------------------------------
    !> @brief Copy data from Host to Device
    !>
    !> @param[out]  dst Data being copy to
    !> @param[in]   src Data being copy from
    !> @param[in]   sizeBytes Data size in bytes
    !>
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue`
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyHtoD(dst, src, sizeBytes) &
       result(MemcpyHtoD) &
       bind(C, name="hipMemcpyHtoD")
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
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue`
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyDtoH(dst, src, sizeBytes) &
       result(MemcpyDtoH) &
       bind(C, name="hipMemcpyDtoH")
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
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue`
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyDtoD(dst, src, sizeBytes) &
       result(MemcpyDtoD) &
       bind(C, name="hipMemcpyDtoD")
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
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue`
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
    ! hipGetSymbolAddress
    !---------------------------------------------
    !> @brief Gets device pointer associated with symbol on the device.
    !>
    !> @param[out]  devPtr  pointer to the device associated the symbole
    !> @param[in]   symbol  pointer to the symbole of the device
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    ! hipMemset
    !---------------------------------------------
    !> @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the
    !> constant
    !> byte value value.
    !>
    !> @param[out] dst  Data being filled
    !> @param[in]  value  Value to be set
    !> @param[in]  sizeBytes  Data size in bytes
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
    function hipMemsetD8(dest, value, count) &
       result(MemsetD8) &
       bind(C, name="hipMemsetD8")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dest
       type(c_ptr), value :: value
       integer(c_long), value :: count
       integer(c_int) :: MemsetD8
    end function hipMemsetD8

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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
    function hipMemsetD16(dest, value, count) &
       result(MemsetD16) &
       bind(C, name="hipMemsetD16")
       import :: c_ptr, c_short, c_long, c_int
       type(c_ptr), value :: dest
       integer(c_short), value :: value
       integer(c_long), value :: count
       integer(c_int) :: MemsetD16
    end function hipMemsetD16

    !---------------------------------------------
    ! hipMemsetD32
    !---------------------------------------------
    !> @brief Fills the memory area pointed to by dest with the constant integer
    !> value for specified number of times.
    !>
    !> @param[out] dest  Data being filled
    !> @param[in]  value  Constant value to be set
    !> @param[in]  count  Number of values to be set
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
    function hipMemsetD32(dest, value, count) &
       result(MemsetD32) &
       bind(C, name="hipMemsetD32")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dest
       integer(c_int), value :: value
       integer(c_long), value :: count
       integer(c_int) :: MemsetD32
    end function hipMemsetD32

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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    ! hipMemset3D
    !---------------------------------------------
    !> @brief Fills synchronously the memory area pointed to by pitchedDevPtr with the constant
    !> value.
    !>
    !> @param[in] pitchedDevPtr  Pointer to pitched device memory
    !> @param[in]  value  Value to set for each byte of specified memory
    !> @param[in]  extent  Size parameters for width field in bytes in device memory
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipMemPtrGetInfo(ptr, size) &
       result(MemPtrGetInfo) &
       bind(C, name="hipMemPtrGetInfo")
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
    !> @returns     `hipSuccess`, `hipErrorOutOfMemory`
    !>
    !> @see hipMalloc, hipMallocPitch, hipFree, hipFreeArray, hipHostMalloc, hipHostFree
    function hipMallocArray(array, desc, width, height, flags) &
       result(MallocArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMallocArray")
#else
       bind(C, name="hipMallocArray")
#endif
       import :: c_ptr, hipChannelFormatDesc, c_long, c_int
       type(c_ptr) :: array
       type(hipChannelFormatDesc) :: desc
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @see hipMallocArray, hipArrayDestroy, hipFreeArray
    function hipArrayCreate(pHandle, pAllocateArray) &
       result(ArrayCreate) &
       bind(C, name="hipArrayCreate")
       import :: c_ptr, HIP_ARRAY_DESCRIPTOR, c_int
       type(c_ptr) :: pHandle
       type(HIP_ARRAY_DESCRIPTOR) :: pAllocateArray
       integer(c_int) :: ArrayCreate
    end function hipArrayCreate

    !---------------------------------------------
    ! hipArrayDestroy
    !---------------------------------------------
    !> @brief Destroy an array memory pointer on the device.
    !>
    !> @param[in]  array  Pointer to the array memory
    !>
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipFreeArray
    function hipArrayDestroy(array) &
       result(ArrayDestroy) &
       bind(C, name="hipArrayDestroy")
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @see hipMallocArray, hipArrayDestroy, hipFreeArray
    function hipArray3DCreate(array, pAllocateArray) &
       result(Array3DCreate) &
       bind(C, name="hipArray3DCreate")
       import :: c_ptr, HIP_ARRAY3D_DESCRIPTOR, c_int
       type(c_ptr) :: array
       type(HIP_ARRAY3D_DESCRIPTOR) :: pAllocateArray
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @see hipMallocPitch, hipMemGetInfo, hipFree
    function hipMalloc3D(pitchedDevPtr, extent) &
       result(Malloc3D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMalloc3D")
#else
       bind(C, name="hipMalloc3D")
#endif
       import :: hipPitchedPtr, c_ptr, c_int
       type(hipPitchedPtr) :: pitchedDevPtr
       type(c_ptr), value :: extent
       integer(c_int) :: Malloc3D
    end function hipMalloc3D

    !---------------------------------------------
    ! hipFreeArray
    !---------------------------------------------
    !> @brief Frees an array on the device.
    !>
    !> @param[in]  array  Pointer to array to free
    !> @returns    `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
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
    !> @returns     `hipSuccess`, `hipErrorOutOfMemory`
    !>
    !> @see hipMalloc, hipMallocPitch, hipFree, hipFreeArray, hipHostMalloc, hipHostFree
    function hipMalloc3DArray(array, desc, extent, flags) &
       result(Malloc3DArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMalloc3DArray")
#else
       bind(C, name="hipMalloc3DArray")
#endif
       import :: c_ptr, hipChannelFormatDesc, c_int
       type(c_ptr) :: array
       type(hipChannelFormatDesc) :: desc
       type(c_ptr), value :: extent
       integer(c_int), value :: flags
       integer(c_int) :: Malloc3DArray
    end function hipMalloc3DArray

    !---------------------------------------------
    ! hipArrayGetDescriptor
    !---------------------------------------------
    !> @brief Gets a 1D or 2D array descriptor
    !>
    !> @param[out] pArrayDescriptor - Returned array descriptor
    !> @param[in]  array            - Array to get descriptor of
    !>
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue` `hipErrorInvalidHandle`
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
       import :: HIP_ARRAY_DESCRIPTOR, c_ptr, c_int
       type(HIP_ARRAY_DESCRIPTOR) :: pArrayDescriptor
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
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue` `hipErrorInvalidHandle`, `hipErrorContextIsDestroyed`
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
       import :: HIP_ARRAY3D_DESCRIPTOR, c_ptr, c_int
       type(HIP_ARRAY3D_DESCRIPTOR) :: pArrayDescriptor
       type(c_ptr), value :: array
       integer(c_int) :: Array3DGetDescriptor
    end function hipArray3DGetDescriptor

    !---------------------------------------------
    ! hipMemcpy2D
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> hipMemcpy2D supports memory matrix copy from the pointed area src to the pointed area dst.
    !> The copy direction is defined by kind which must be one of `hipMemcpyHostToDevice`,
    !> `hipMemcpyHostToDevice`, `hipMemcpyDeviceToHost` `hipMemcpyDeviceToDevice` or
    !> `hipMemcpyDefault`.
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
    !>
    !> @see hipMemcpy, hipMemcpy2D, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray,
    !> hipMemcpyToSymbol, hipMemcpyAsync
    function hipMemcpyParam2D(pCopy) &
       result(MemcpyParam2D) &
       bind(C, name="hipMemcpyParam2D")
       import :: hip_Memcpy2D, c_int
       type(hip_Memcpy2D) :: pCopy
       integer(c_int) :: MemcpyParam2D
    end function hipMemcpyParam2D

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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidMemcpyDirection`
    !>
    !> @see hipMemcpy, hipMemcpyToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy2DArrayToArray(dst, wOffsetDst, hOffsetDst, src, wOffsetSrc, hOffsetSrc, &
                                     width, height, kind) &
       result(Memcpy2DArrayToArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy2DArrayToArray")
#else
       bind(C, name="hipMemcpy2DArrayToArray")
#endif
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
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
    ! hipMemcpyAtoH
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> @param[in]   dst       Destination memory address
    !> @param[in]   srcArray  Source array
    !> @param[in]   srcOffset Offset in bytes of source array
    !> @param[in]   count     Size of memory copy in bytes
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpyAtoH(dst, srcArray, srcOffset, count) &
       result(MemcpyAtoH) &
       bind(C, name="hipMemcpyAtoH")
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpyHtoA(dstArray, dstOffset, srcHost, count) &
       result(MemcpyHtoA) &
       bind(C, name="hipMemcpyHtoA")
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
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
       import :: hipMemcpy3DParms, c_int
       type(hipMemcpy3DParms) :: p
       integer(c_int) :: Memcpy3D
    end function hipMemcpy3D

    !---------------------------------------------
    ! hipDrvMemcpy3D
    !---------------------------------------------
    !> @brief Copies data between host and device.
    !>
    !> @param[in]   pCopy   3D memory copy parameters
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipDrvMemcpy3D(pCopy) &
       result(DrvMemcpy3D) &
       bind(C, name="hipDrvMemcpy3D")
       import :: HIP_MEMCPY3D, c_int
       type(HIP_MEMCPY3D) :: pCopy
       integer(c_int) :: DrvMemcpy3D
    end function hipDrvMemcpy3D

    !---------------------------------------------
    ! hipMemGetAddressRange
    !---------------------------------------------
    !> @brief Get information on memory allocations.
    !>
    !> @param [out] pbase - BAse pointer address
    !> @param [out] psize - Size of allocation
    !> @param [in]  dptr- Device Pointer
    !>
    !> @returns `hipSuccess`, `hipErrorNotFound`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    function hipMemGetAddressRange(pbase, psize, dptr) &
       result(MemGetAddressRange) &
       bind(C, name="hipMemGetAddressRange")
       import :: c_ptr, c_int
       type(c_ptr) :: pbase
       type(c_ptr), value :: psize
       type(c_ptr), value :: dptr
       integer(c_int) :: MemGetAddressRange
    end function hipMemGetAddressRange

    !---------------------------------------------
    ! hipMemcpy3DPeer
    !---------------------------------------------
    !> @brief Performs 3D memory copies between devices
    !> This API is asynchronous with respect to host
    !>
    !> @param [in] p  - Parameters for memory copy
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, hipErrorInvalidDevice
    function hipMemcpy3DPeer(p) &
       result(Memcpy3DPeer) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy3DPeer")
#else
       bind(C, name="hipMemcpy3DPeer")
#endif
       import :: hipMemcpy3DPeerParms, c_int
       type(hipMemcpy3DPeerParms) :: p
       integer(c_int) :: Memcpy3DPeer
    end function hipMemcpy3DPeer

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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`,
    !> @returns `hipErrorPeerAccessAlreadyEnabled` if peer access is already enabled for this
    !> device.
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
    !> device, it returns `hipErrorPeerAccessNotEnabled`.
    !>
    !> @param [in] peerDeviceId  Peer device to disable direct access to
    !>
    !> @returns `hipSuccess`, `hipErrorPeerAccessNotEnabled`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDevice`
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
    ! hipCtxGetDevice
    !---------------------------------------------
    !> @brief Get the handle of the device associated with current/default context [Deprecated]
    !>
    !> @param [out] device The device from the current context
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidContext`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxGetDevice(device) &
       result(CtxGetDevice) &
       bind(C, name="hipCtxGetDevice")
       import :: c_int
       integer(c_int) :: device
       integer(c_int) :: CtxGetDevice
    end function hipCtxGetDevice

    !---------------------------------------------
    ! hipCtxSetCacheConfig
    !---------------------------------------------
    !> @brief Set L1/Shared cache partition [Deprecated]
    !>
    !> @param [in] cacheConfig  Cache configuration to set
    !>
    !> @return `hipSuccess`
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
       bind(C, name="hipCtxSetCacheConfig")
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
    !> @return `hipSuccess`
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
       bind(C, name="hipCtxSetSharedMemConfig")
       import :: c_int
       integer(c_int), value :: config
       integer(c_int) :: CtxSetSharedMemConfig
    end function hipCtxSetSharedMemConfig

    !---------------------------------------------
    ! hipCtxSynchronize
    !---------------------------------------------
    !> @brief Blocks until the default context has completed all preceding requested tasks
    !> [Deprecated]
    !>
    !> @return `hipSuccess`
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
       bind(C, name="hipCtxSynchronize")
       import :: c_int
       integer(c_int) :: CtxSynchronize
    end function hipCtxSynchronize

    !---------------------------------------------
    ! hipDevicePrimaryCtxRelease
    !---------------------------------------------
    !> @brief Release the primary context on the GPU.
    !>
    !> @param [in] dev  Device which primary context is released [Deprecated]
    !>
    !> @returns `hipSuccess`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !> @warning This function return `hipSuccess` though doesn't release the primaryCtx by design on
    !> HIP/HIP-CLANG path.
    !>
    !> @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
    !> NVIDIA platform.
    function hipDevicePrimaryCtxRelease(dev) &
       result(DevicePrimaryCtxRelease) &
       bind(C, name="hipDevicePrimaryCtxRelease")
       import :: c_int
       integer(c_int), value :: dev
       integer(c_int) :: DevicePrimaryCtxRelease
    end function hipDevicePrimaryCtxRelease

    !---------------------------------------------
    ! hipDevicePrimaryCtxReset
    !---------------------------------------------
    !> @brief Resets the primary context on the GPU [Deprecated]
    !>
    !> @param [in] dev  Device which primary context is reset
    !>
    !> @returns `hipSuccess`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
    !> NVIDIA platform.
    function hipDevicePrimaryCtxReset(dev) &
       result(DevicePrimaryCtxReset) &
       bind(C, name="hipDevicePrimaryCtxReset")
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
    !> @returns `hipSuccess`, `hipErrorContextAlreadyInUse`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
    !> NVIDIA platform.
    function hipDevicePrimaryCtxSetFlags(dev, flags) &
       result(DevicePrimaryCtxSetFlags) &
       bind(C, name="hipDevicePrimaryCtxSetFlags")
       import :: c_int
       integer(c_int), value :: dev
       integer(c_int), value :: flags
       integer(c_int) :: DevicePrimaryCtxSetFlags
    end function hipDevicePrimaryCtxSetFlags

    !---------------------------------------------
    ! hipLibraryUnload
    !---------------------------------------------
    !> @brief Unload HIP Library
    !>
    !> @param [in] library Input created hip library
    !> @return `hipSuccess`, `hipErrorInvalidValue`
    function hipLibraryUnload(library) &
       result(LibraryUnload) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaLibraryUnload")
#else
       bind(C, name="hipLibraryUnload")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: library
       integer(c_int) :: LibraryUnload
    end function hipLibraryUnload

    !---------------------------------------------
    ! hipLibraryEnumerateKernels
    !---------------------------------------------
    !> @brief Retrieve kernel handles within a library
    !>
    !> @param [out] kernels Buffer for kernel handles
    !> @param [in] numKernels Maximum number of kernel handles to return to buffer
    !> @param [in] library Library handle to query from
    !> @return `hipSuccess`, `hipErrorInvalidValue`
    function hipLibraryEnumerateKernels(kernels, numKernels, library) &
       result(LibraryEnumerateKernels) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaLibraryEnumerateKernels")
#else
       bind(C, name="hipLibraryEnumerateKernels")
#endif
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
    !> @return `hipSuccess`, `hipErrorInvalidValue`
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
    !> @return `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDeviceFunction`
    function hipFuncGetAttributes(attr, func) &
       result(FuncGetAttributes) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaFuncGetAttributes")
#else
       bind(C, name="hipFuncGetAttributes")
#endif
       import :: hipFuncAttributes, c_ptr, c_int
       type(hipFuncAttributes) :: attr
       type(c_ptr), value :: func
       integer(c_int) :: FuncGetAttributes
    end function hipFuncGetAttributes

    !---------------------------------------------
    ! hipLinkComplete
    !---------------------------------------------
    !> @brief Completes the linking of the given program.
    !> @param [in]   state hip link state
    !> @param [out]  hipBinOut  Upon success, points to the output binary
    !> @param [out]  sizeOut  Size of the binary is stored (optional)
    !>
    !> @returns `hipSuccess` `hipErrorInvalidValue`
    !>
    !> If adding the data fails, it will
    !> @return `hipErrorInvalidConfiguration`
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
    ! hipLinkDestroy
    !---------------------------------------------
    !> @brief Deletes the linker instance.
    !> @param [in] state link state instance
    !>
    !> @returns `hipSuccess` `hipErrorInvalidValue`
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
    ! hipModuleLaunchCooperativeKernelMultiDevice
    !---------------------------------------------
    !> @brief Launches kernels on multiple devices where thread blocks can cooperate and
    !> synchronize as they execute.
    !>
    !> @param [in] launchParamsList         List of launch parameters, one per device.
    !> @param [in] numDevices               Size of the launchParamsList array.
    !> @param [in] flags                    Flags to control launch behavior.
    !>
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidHandle`, `hipErrorInvalidImage`, `hipErrorInvalidValue`,
    !> `hipErrorInvalidConfiguration`, `hipErrorInvalidResourceHandle`, `hipErrorLaunchFailure`,
    !> `hipErrorLaunchOutOfResources`, `hipErrorLaunchTimeOut`, `hipErrorCooperativeLaunchTooLarge`,
    !> `hipErrorSharedObjectInitFailed`
    function hipModuleLaunchCooperativeKernelMultiDevice(launchParamsList, numDevices, flags) &
       result(ModuleLaunchCooperativeKernelMultiDevice) &
       bind(C, name="hipModuleLaunchCooperativeKernelMultiDevice")
       import :: hipFunctionLaunchParams, c_int
       type(hipFunctionLaunchParams) :: launchParamsList
       integer(c_int), value :: numDevices
       integer(c_int), value :: flags
       integer(c_int) :: ModuleLaunchCooperativeKernelMultiDevice
    end function hipModuleLaunchCooperativeKernelMultiDevice

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
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`,
    !> `hipErrorCooperativeLaunchTooLarge`
    function hipLaunchCooperativeKernelMultiDevice(launchParamsList, numDevices, flags) &
       result(LaunchCooperativeKernelMultiDevice) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaLaunchCooperativeKernelMultiDevice")
#else
       bind(C, name="hipLaunchCooperativeKernelMultiDevice")
#endif
       import :: hipLaunchParams, c_int
       type(hipLaunchParams) :: launchParamsList
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
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`
    function hipExtLaunchMultiKernelMultiDevice(launchParamsList, numDevices, flags) &
       result(ExtLaunchMultiKernelMultiDevice) &
       bind(C, name="hipExtLaunchMultiKernelMultiDevice")
       import :: hipLaunchParams, c_int
       type(hipLaunchParams) :: launchParamsList
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
    !> @returns `hipSuccess` if the kernel is launched successfully, otherwise an appropriate error
    !> code.
    function hipLaunchKernelExC(config, fPtr, args) &
       result(LaunchKernelExC) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaLaunchKernelExC")
#else
       bind(C, name="hipLaunchKernelExC")
#endif
       import :: hipLaunchConfig_t, c_ptr, c_int
       type(hipLaunchConfig_t) :: config
       type(c_ptr), value :: fPtr
       type(c_ptr) :: args
       integer(c_int) :: LaunchKernelExC
    end function hipLaunchKernelExC

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
    !> @returns `hipSuccess` if the kernel is launched successfully, otherwise an appropriate error
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
    !> @return `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidDeviceFunction`,
    !> `hipErrorInvalidValue`,
    !> `hipErrorUnknown`
    function hipOccupancyAvailableDynamicSMemPerBlock(dynamicSmemSize, f, numBlocks, blockSize) &
       result(OccupancyAvailableDynamicSMemPerBlock) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaOccupancyAvailableDynamicSMemPerBlock")
#else
       bind(C, name="hipOccupancyAvailableDynamicSMemPerBlock")
#endif
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
    !> @returns  `hipErrorNotSupported`
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
    !> @returns  `hipErrorNotSupported`
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
    ! hipSetupArgument
    !---------------------------------------------
    !> @brief Set a kernel argument.
    !>
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`
    !>
    !> @param [in] arg    Pointer the argument in host memory.
    !> @param [in] size   Size of the argument.
    !> @param [in] offset Offset of the argument on the argument stack.
    function hipSetupArgument(arg, size, offset) &
       result(SetupArgument) &
       bind(C, name="hipSetupArgument")
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
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`
    function hipLaunchByPtr(func) &
       result(LaunchByPtr) &
       bind(C, name="hipLaunchByPtr")
       import :: c_ptr, c_int
       type(c_ptr), value :: func
       integer(c_int) :: LaunchByPtr
    end function hipLaunchByPtr

    !---------------------------------------------
    ! hipDrvMemcpy2DUnaligned
    !---------------------------------------------
    !> Copies memory for 2D arrays.
    !>
    !> @param pCopy           - Parameters for the memory copy
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipDrvMemcpy2DUnaligned(pCopy) &
       result(DrvMemcpy2DUnaligned) &
       bind(C, name="hipDrvMemcpy2DUnaligned")
       import :: hip_Memcpy2D, c_int
       type(hip_Memcpy2D) :: pCopy
       integer(c_int) :: DrvMemcpy2DUnaligned
    end function hipDrvMemcpy2DUnaligned

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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`, `hipErrorOutOfMemory`
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
       import :: c_ptr, hipResourceDesc, hipTextureDesc, hipResourceViewDesc, c_int
       type(c_ptr) :: pTexObject
       type(hipResourceDesc) :: pResDesc
       type(hipTextureDesc) :: pTexDesc
       type(hipResourceViewDesc) :: pResViewDesc
       integer(c_int) :: CreateTextureObject
    end function hipCreateTextureObject

    !---------------------------------------------
    ! hipDestroyTextureObject
    !---------------------------------------------
    !> @brief Destroys a texture object.
    !>
    !> @param [in] textureObject  texture object to destroy
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGetChannelDesc(desc, array) &
       result(GetChannelDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetChannelDesc")
#else
       bind(C, name="hipGetChannelDesc")
#endif
       import :: hipChannelFormatDesc, c_ptr, c_int
       type(hipChannelFormatDesc) :: desc
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGetTextureObjectResourceDesc(pResDesc, textureObject) &
       result(GetTextureObjectResourceDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetTextureObjectResourceDesc")
#else
       bind(C, name="hipGetTextureObjectResourceDesc")
#endif
       import :: hipResourceDesc, c_ptr, c_int
       type(hipResourceDesc) :: pResDesc
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGetTextureObjectResourceViewDesc(pResViewDesc, textureObject) &
       result(GetTextureObjectResourceViewDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetTextureObjectResourceViewDesc")
#else
       bind(C, name="hipGetTextureObjectResourceViewDesc")
#endif
       import :: hipResourceViewDesc, c_ptr, c_int
       type(hipResourceViewDesc) :: pResViewDesc
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGetTextureObjectTextureDesc(pTexDesc, textureObject) &
       result(GetTextureObjectTextureDesc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetTextureObjectTextureDesc")
#else
       bind(C, name="hipGetTextureObjectTextureDesc")
#endif
       import :: hipTextureDesc, c_ptr, c_int
       type(hipTextureDesc) :: pTexDesc
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipTexObjectCreate(pTexObject, pResDesc, pTexDesc, pResViewDesc) &
       result(TexObjectCreate) &
       bind(C, name="hipTexObjectCreate")
       import :: c_ptr, HIP_RESOURCE_DESC, HIP_TEXTURE_DESC, HIP_RESOURCE_VIEW_DESC, c_int
       type(c_ptr) :: pTexObject
       type(HIP_RESOURCE_DESC) :: pResDesc
       type(HIP_TEXTURE_DESC) :: pTexDesc
       type(HIP_RESOURCE_VIEW_DESC) :: pResViewDesc
       integer(c_int) :: TexObjectCreate
    end function hipTexObjectCreate

    !---------------------------------------------
    ! hipTexObjectDestroy
    !---------------------------------------------
    !> @brief Destroys a texture object.
    !>
    !> @param [in] texObject  texture object to destroy
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipTexObjectDestroy(texObject) &
       result(TexObjectDestroy) &
       bind(C, name="hipTexObjectDestroy")
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
    !> @returns `hipSuccess`, `hipErrorNotSupported`, `hipErrorInvalidValue`
    function hipTexObjectGetResourceDesc(pResDesc, texObject) &
       result(TexObjectGetResourceDesc) &
       bind(C, name="hipTexObjectGetResourceDesc")
       import :: HIP_RESOURCE_DESC, c_ptr, c_int
       type(HIP_RESOURCE_DESC) :: pResDesc
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
    !> @returns `hipSuccess`, `hipErrorNotSupported`, `hipErrorInvalidValue`
    function hipTexObjectGetResourceViewDesc(pResViewDesc, texObject) &
       result(TexObjectGetResourceViewDesc) &
       bind(C, name="hipTexObjectGetResourceViewDesc")
       import :: HIP_RESOURCE_VIEW_DESC, c_ptr, c_int
       type(HIP_RESOURCE_VIEW_DESC) :: pResViewDesc
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
    !> @returns `hipSuccess`, `hipErrorNotSupported`, `hipErrorInvalidValue`
    function hipTexObjectGetTextureDesc(pTexDesc, texObject) &
       result(TexObjectGetTextureDesc) &
       bind(C, name="hipTexObjectGetTextureDesc")
       import :: HIP_TEXTURE_DESC, c_ptr, c_int
       type(HIP_TEXTURE_DESC) :: pTexDesc
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
    !> @return `hipSuccess`, `hipErrorInvalidValue`, `hipErrorMemoryAllocation`
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMallocMipmappedArray(mipmappedArray, desc, extent, numLevels, flags) &
       result(MallocMipmappedArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMallocMipmappedArray")
#else
       bind(C, name="hipMallocMipmappedArray")
#endif
       import :: c_ptr, hipChannelFormatDesc, c_int
       type(c_ptr) :: mipmappedArray
       type(hipChannelFormatDesc) :: desc
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
    !> @return `hipSuccess`, `hipErrorInvalidValue`
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
    !> @return `hipSuccess`, `hipErrorInvalidValue`
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
    !> @returns `hipSuccess`, `hipErrorNotSupported`, `hipErrorInvalidValue`
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMipmappedArrayCreate(pHandle, pMipmappedArrayDesc, numMipmapLevels) &
       result(MipmappedArrayCreate) &
       bind(C, name="hipMipmappedArrayCreate")
       import :: c_ptr, HIP_ARRAY3D_DESCRIPTOR, c_int
       type(c_ptr) :: pHandle
       type(HIP_ARRAY3D_DESCRIPTOR) :: pMipmappedArrayDesc
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMipmappedArrayDestroy(hMipmappedArray) &
       result(MipmappedArrayDestroy) &
       bind(C, name="hipMipmappedArrayDestroy")
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMipmappedArrayGetLevel(pLevelArray, hMipMappedArray, level) &
       result(MipmappedArrayGetLevel) &
       bind(C, name="hipMipmappedArrayGetLevel")
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipBindTextureToMipmappedArray(tex, mipmappedArray, desc) &
       result(BindTextureToMipmappedArray) &
       bind(C, name="hipBindTextureToMipmappedArray")
       import :: textureReference, c_ptr, hipChannelFormatDesc, c_int
       type(textureReference) :: tex
       type(c_ptr), value :: mipmappedArray
       type(hipChannelFormatDesc) :: desc
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    ! hipTexRefGetArray
    !---------------------------------------------
    !> @brief Gets the array bound to a texture reference [Deprecated]
    !>
    !>
    !> @param [in] pArray  Returned array.
    !> @param [in] texRef  texture reference.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !> @warning This API is deprecated.
    function hipTexRefGetArray(pArray, texRef) &
       result(TexRefGetArray) &
       bind(C, name="hipTexRefGetArray")
       import :: c_ptr, textureReference, c_int
       type(c_ptr) :: pArray
       type(textureReference) :: texRef
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !> @warning This API is deprecated.
    function hipTexRefSetAddressMode(texRef, dim, am) &
       result(TexRefSetAddressMode) &
       bind(C, name="hipTexRefSetAddressMode")
       import :: textureReference, c_int
       type(textureReference) :: texRef
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetArray(tex, array, flags) &
       result(TexRefSetArray) &
       bind(C, name="hipTexRefSetArray")
       import :: textureReference, c_ptr, c_int
       type(textureReference) :: tex
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetFilterMode(texRef, fm) &
       result(TexRefSetFilterMode) &
       bind(C, name="hipTexRefSetFilterMode")
       import :: textureReference, c_int
       type(textureReference) :: texRef
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetFlags(texRef, Flags) &
       result(TexRefSetFlags) &
       bind(C, name="hipTexRefSetFlags")
       import :: textureReference, c_int
       type(textureReference) :: texRef
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetFormat(texRef, fmt, NumPackedComponents) &
       result(TexRefSetFormat) &
       bind(C, name="hipTexRefSetFormat")
       import :: textureReference, c_int
       type(textureReference) :: texRef
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipBindTexture(offset, tex, devPtr, desc, size) &
       result(BindTexture) &
       bind(C, name="hipBindTexture")
       import :: c_ptr, textureReference, hipChannelFormatDesc, c_long, c_int
       type(c_ptr), value :: offset
       type(textureReference) :: tex
       type(c_ptr), value :: devPtr
       type(hipChannelFormatDesc) :: desc
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipBindTexture2D(offset, tex, devPtr, desc, width, height, pitch) &
       result(BindTexture2D) &
       bind(C, name="hipBindTexture2D")
       import :: c_ptr, textureReference, hipChannelFormatDesc, c_long, c_int
       type(c_ptr), value :: offset
       type(textureReference) :: tex
       type(c_ptr), value :: devPtr
       type(hipChannelFormatDesc) :: desc
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipBindTextureToArray(tex, array, desc) &
       result(BindTextureToArray) &
       bind(C, name="hipBindTextureToArray")
       import :: textureReference, c_ptr, hipChannelFormatDesc, c_int
       type(textureReference) :: tex
       type(c_ptr), value :: array
       type(hipChannelFormatDesc) :: desc
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipGetTextureAlignmentOffset(offset, texref) &
       result(GetTextureAlignmentOffset) &
       bind(C, name="hipGetTextureAlignmentOffset")
       import :: c_ptr, textureReference, c_int
       type(c_ptr), value :: offset
       type(textureReference) :: texref
       integer(c_int) :: GetTextureAlignmentOffset
    end function hipGetTextureAlignmentOffset

    !---------------------------------------------
    ! hipUnbindTexture
    !---------------------------------------------
    !> @brief Unbinds a texture [Deprecated]
    !>
    !> @param [in] tex  Texture to unbind.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipUnbindTexture(tex) &
       result(UnbindTexture) &
       bind(C, name="hipUnbindTexture")
       import :: textureReference, c_int
       type(textureReference) :: tex
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetAddress(dev_ptr, texRef) &
       result(TexRefGetAddress) &
       bind(C, name="hipTexRefGetAddress")
       import :: c_ptr, textureReference, c_int
       type(c_ptr) :: dev_ptr
       type(textureReference) :: texRef
       integer(c_int) :: TexRefGetAddress
    end function hipTexRefGetAddress

    !---------------------------------------------
    ! hipTexRefGetMipMappedArray
    !---------------------------------------------
    !> @brief Gets the mipmapped array bound to a texture reference [Deprecated]
    !>
    !> @param [out] pArray  Pointer of the mipmapped array.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetMipMappedArray(pArray, texRef) &
       result(TexRefGetMipMappedArray) &
       bind(C, name="hipTexRefGetMipMappedArray")
       import :: c_ptr, textureReference, c_int
       type(c_ptr) :: pArray
       type(textureReference) :: texRef
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetAddress(ByteOffset, texRef, dptr, bytes) &
       result(TexRefSetAddress) &
       bind(C, name="hipTexRefSetAddress")
       import :: c_ptr, textureReference, c_long, c_int
       type(c_ptr), value :: ByteOffset
       type(textureReference) :: texRef
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetAddress2D(texRef, desc, dptr, Pitch) &
       result(TexRefSetAddress2D) &
       bind(C, name="hipTexRefSetAddress2D")
       import :: textureReference, HIP_ARRAY_DESCRIPTOR, c_ptr, c_long, c_int
       type(textureReference) :: texRef
       type(HIP_ARRAY_DESCRIPTOR) :: desc
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetMaxAnisotropy(texRef, maxAniso) &
       result(TexRefSetMaxAnisotropy) &
       bind(C, name="hipTexRefSetMaxAnisotropy")
       import :: textureReference, c_int
       type(textureReference) :: texRef
       integer(c_int), value :: maxAniso
       integer(c_int) :: TexRefSetMaxAnisotropy
    end function hipTexRefSetMaxAnisotropy

    !---------------------------------------------
    ! hipTexRefSetMipmapFilterMode
    !---------------------------------------------
    !> @brief Sets mipmap filter mode for a texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer of texture reference.
    !> @param [in] fm  Value of filter mode.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetMipmapFilterMode(texRef, fm) &
       result(TexRefSetMipmapFilterMode) &
       bind(C, name="hipTexRefSetMipmapFilterMode")
       import :: textureReference, c_int
       type(textureReference) :: texRef
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetMipmapLevelBias(texRef, bias) &
       result(TexRefSetMipmapLevelBias) &
       bind(C, name="hipTexRefSetMipmapLevelBias")
       import :: textureReference, c_float, c_int
       type(textureReference) :: texRef
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetMipmapLevelClamp(texRef, minMipMapLevelClamp, maxMipMapLevelClamp) &
       result(TexRefSetMipmapLevelClamp) &
       bind(C, name="hipTexRefSetMipmapLevelClamp")
       import :: textureReference, c_float, c_int
       type(textureReference) :: texRef
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetMipmappedArray(texRef, mipmappedArray, Flags) &
       result(TexRefSetMipmappedArray) &
       bind(C, name="hipTexRefSetMipmappedArray")
       import :: textureReference, hipMipmappedArray, c_int
       type(textureReference) :: texRef
       type(hipMipmappedArray) :: mipmappedArray
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipApiName(id) &
       result(ApiName) &
       bind(C, name="hipApiName")
       import :: c_int, c_char
       integer(c_int), value :: id
       character(c_char) :: ApiName
    end function hipApiName

    !---------------------------------------------
    ! hipDeviceGetGraphMemAttribute
    !---------------------------------------------
    !> @brief Get the mem attribute for graphs.
    !>
    !> @param [in] device - Device to get attributes from
    !> @param [in] attr - Attribute type to be queried
    !> @param [out] value - Value of the queried attribute
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
    function hipDeviceGetGraphMemAttribute(device, attr, value) &
       result(DeviceGetGraphMemAttribute) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetGraphMemAttribute")
#else
       bind(C, name="hipDeviceGetGraphMemAttribute")
#endif
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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
    function hipDeviceSetGraphMemAttribute(device, attr, value) &
       result(DeviceSetGraphMemAttribute) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceSetGraphMemAttribute")
#else
       bind(C, name="hipDeviceSetGraphMemAttribute")
#endif
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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
    function hipDeviceGraphMemTrim(device) &
       result(DeviceGraphMemTrim) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGraphMemTrim")
#else
       bind(C, name="hipDeviceGraphMemTrim")
#endif
       import :: c_int
       integer(c_int), value :: device
       integer(c_int) :: DeviceGraphMemTrim
    end function hipDeviceGraphMemTrim

    !---------------------------------------------
    ! hipMemAddressFree
    !---------------------------------------------
    !> @brief Frees an address range reservation made via hipMemAddressReserve
    !>
    !> @param [in] devPtr - starting address of the range.
    !> @param [in] size - size of the range.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemCreate(handle, size, prop, flags) &
       result(MemCreate) &
       bind(C, name="hipMemCreate")
       import :: c_ptr, c_long, hipMemAllocationProp, c_int64_t, c_int
       type(c_ptr) :: handle
       integer(c_long), value :: size
       type(hipMemAllocationProp) :: prop
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
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
    ! hipMemGetAllocationGranularity
    !---------------------------------------------
    !> @brief Calculates either the minimal or recommended granularity.
    !>
    !> @param [out] granularity - returned granularity.
    !> @param [in] prop - location properties.
    !> @param [in] option - determines which granularity to return.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemGetAllocationGranularity(granularity, prop, option) &
       result(MemGetAllocationGranularity) &
       bind(C, name="hipMemGetAllocationGranularity")
       import :: c_ptr, hipMemAllocationProp, c_int
       type(c_ptr), value :: granularity
       type(hipMemAllocationProp) :: prop
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemGetAllocationPropertiesFromHandle(prop, handle) &
       result(MemGetAllocationPropertiesFromHandle) &
       bind(C, name="hipMemGetAllocationPropertiesFromHandle")
       import :: hipMemAllocationProp, c_ptr, c_int
       type(hipMemAllocationProp) :: prop
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
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
    ! hipMemRelease
    !---------------------------------------------
    !> @brief Release a memory handle representing a memory allocation which was previously
    !> allocated
    !> through hipMemCreate.
    !>
    !> @param [in] handle - handle of the memory allocation.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemSetAccess(ptr, size, desc, count) &
       result(MemSetAccess) &
       bind(C, name="hipMemSetAccess")
       import :: c_ptr, c_long, hipMemAccessDesc, c_int
       type(c_ptr), value :: ptr
       integer(c_long), value :: size
       type(hipMemAccessDesc) :: desc
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @note  In this API, the value of arrayIndex higher than zero is currently not supported.
    function hipGraphicsSubResourceGetMappedArray(array, resource, arrayIndex, mipLevel) &
       result(GraphicsSubResourceGetMappedArray) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphicsSubResourceGetMappedArray")
#else
       bind(C, name="hipGraphicsSubResourceGetMappedArray")
#endif
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphicsResourceGetMappedPointer(devPtr, size, resource) &
       result(GraphicsResourceGetMappedPointer) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphicsResourceGetMappedPointer")
#else
       bind(C, name="hipGraphicsResourceGetMappedPointer")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: devPtr
       type(c_ptr), value :: size
       type(c_ptr), value :: resource
       integer(c_int) :: GraphicsResourceGetMappedPointer
    end function hipGraphicsResourceGetMappedPointer

    !---------------------------------------------
    ! hipGraphicsUnregisterResource
    !---------------------------------------------
    !> @brief Unregisters a graphics resource.
    !>
    !> @param [in] resource - Graphics resources to unregister.
    !>
    !> @returns `hipSuccess`
    function hipGraphicsUnregisterResource(resource) &
       result(GraphicsUnregisterResource) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphicsUnregisterResource")
#else
       bind(C, name="hipGraphicsUnregisterResource")
#endif
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipCreateSurfaceObject(pSurfObject, pResDesc) &
       result(CreateSurfaceObject) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaCreateSurfaceObject")
#else
       bind(C, name="hipCreateSurfaceObject")
#endif
       import :: c_ptr, hipResourceDesc, c_int
       type(c_ptr) :: pSurfObject
       type(hipResourceDesc) :: pResDesc
       integer(c_int) :: CreateSurfaceObject
    end function hipCreateSurfaceObject

    !---------------------------------------------
    ! hipDestroySurfaceObject
    !---------------------------------------------
    !> @brief Destroy a surface object.
    !>
    !> @param [in] surfaceObject  Surface object to be destroyed.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipDestroySurfaceObject(surfaceObject) &
       result(DestroySurfaceObject) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDestroySurfaceObject")
#else
       bind(C, name="hipDestroySurfaceObject")
#endif
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
       import :: hipMemcpy3DParms, c_int
       type(hipMemcpy3DParms) :: p
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
    ! hipGetDevicePropertiesR0600
    !---------------------------------------------
    !> @brief Returns device properties.
    !>
    !> @param [out] prop written with device properties
    !> @param [in]  deviceId which device to query for information
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
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
       import :: hipDeviceProp_t, c_int
       type(hipDeviceProp_t) :: prop
       integer(c_int), value :: deviceId
       integer(c_int) :: GetDeviceProperties
    end function hipGetDeviceProperties

  end interface

  interface hipDriverGetVersion
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning The HIP driver version does not correspond to an exact CUDA driver revision.
    !> On AMD platform, the API returns the HIP driver version, while on NVIDIA platform, it calls
    !> the corresponding CUDA runtime API and returns the CUDA driver version.
    !> There is no mapping/correlation between HIP driver version and CUDA driver version.
    !>
    !> @see hipRuntimeGetVersion
    function hipDriverGetVersion_raw(driverVersion) &
       result(DriverGetVersion_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDriverGetVersion")
#else
       bind(C, name="hipDriverGetVersion")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: driverVersion
       integer(c_int) :: DriverGetVersion_raw
    end function hipDriverGetVersion_raw

    module procedure hipDriverGetVersion_native
  end interface hipDriverGetVersion

  interface hipRuntimeGetVersion
    !---------------------------------------------
    ! hipRuntimeGetVersion
    !---------------------------------------------
    !> @brief Returns the approximate HIP Runtime version.
    !>
    !> @param [out] runtimeVersion HIP runtime version
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning The version definition of HIP runtime is different from CUDA.
    !> On AMD platform, the function returns HIP runtime version,
    !> while on NVIDIA platform, it returns CUDA runtime version.
    !> And there is no mapping/correlation between HIP version and CUDA version.
    !>
    !> @see hipDriverGetVersion
    function hipRuntimeGetVersion_raw(runtimeVersion) &
       result(RuntimeGetVersion_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaRuntimeGetVersion")
#else
       bind(C, name="hipRuntimeGetVersion")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: runtimeVersion
       integer(c_int) :: RuntimeGetVersion_raw
    end function hipRuntimeGetVersion_raw

    module procedure hipRuntimeGetVersion_native
  end interface hipRuntimeGetVersion

  interface hipDeviceComputeCapability
    !---------------------------------------------
    ! hipDeviceComputeCapability
    !---------------------------------------------
    !> @brief Returns the compute capability of the device
    !> @param [out] major Major compute capability version number
    !> @param [out] minor Minor compute capability version number
    !> @param [in] device Device ordinal
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
    function hipDeviceComputeCapability_raw(major, minor, device) &
       result(DeviceComputeCapability_raw) &
       bind(C, name="hipDeviceComputeCapability")
       import :: c_ptr, c_int
       type(c_ptr), value :: major
       type(c_ptr), value :: minor
       integer(c_int), value :: device
       integer(c_int) :: DeviceComputeCapability_raw
    end function hipDeviceComputeCapability_raw

    module procedure hipDeviceComputeCapability_native
  end interface hipDeviceComputeCapability

  interface hipDeviceGetP2PAttribute
    !---------------------------------------------
    ! hipDeviceGetP2PAttribute
    !---------------------------------------------
    !> @brief Returns a value for attribute of link between two devices
    !> @param [out] value Pointer of the value for the attrubute
    !> @param [in] attr enum of hipDeviceP2PAttr to query
    !> @param [in] srcDevice The source device of the link
    !> @param [in] dstDevice The destination device of the link
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
    function hipDeviceGetP2PAttribute_raw(value, attr, srcDevice, dstDevice) &
       result(DeviceGetP2PAttribute_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetP2PAttribute")
#else
       bind(C, name="hipDeviceGetP2PAttribute")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: value
       integer(c_int), value :: attr
       integer(c_int), value :: srcDevice
       integer(c_int), value :: dstDevice
       integer(c_int) :: DeviceGetP2PAttribute_raw
    end function hipDeviceGetP2PAttribute_raw

    module procedure hipDeviceGetP2PAttribute_native
  end interface hipDeviceGetP2PAttribute

  interface hipDeviceGetByPCIBusId
    !---------------------------------------------
    ! hipDeviceGetByPCIBusId
    !---------------------------------------------
    !> @brief Returns a handle to a compute device.
    !> @param [out] device The handle of the device
    !> @param [in] pciBusId The string of PCI Bus Id for the device
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    function hipDeviceGetByPCIBusId_raw(device, pciBusId) &
       result(DeviceGetByPCIBusId_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetByPCIBusId")
#else
       bind(C, name="hipDeviceGetByPCIBusId")
#endif
       import :: c_int, c_ptr
       integer(c_int) :: device
       type(c_ptr), value :: pciBusId
       integer(c_int) :: DeviceGetByPCIBusId_raw
    end function hipDeviceGetByPCIBusId_raw

    module procedure hipDeviceGetByPCIBusId_cstr
  end interface hipDeviceGetByPCIBusId

  interface hipSetValidDevices
    !---------------------------------------------
    ! hipSetValidDevices
    !---------------------------------------------
    !> @brief Set a list of devices that can be used.
    !>
    !> @param[in] device_arr List of devices to try
    !> @param[in] len Number of devices in specified list
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    !>
    !> @see `hipGetDevice`, `hipGetDeviceCount`. `hipSetDevice`. `hipGetDeviceProperties`.
    !> `hipSetDeviceFlags`. `hipChooseDevice`
    function hipSetValidDevices_raw(device_arr, len) &
       result(SetValidDevices_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaSetValidDevices")
#else
       bind(C, name="hipSetValidDevices")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: device_arr
       integer(c_int), value :: len
       integer(c_int) :: SetValidDevices_raw
    end function hipSetValidDevices_raw

    module procedure hipSetValidDevices_native
  end interface hipSetValidDevices

  interface hipDeviceGetAttribute
    !---------------------------------------------
    ! hipDeviceGetAttribute
    !---------------------------------------------
    !> @brief Query for a specific device attribute.
    !>
    !> @param [out] pi pointer to value to return
    !> @param [in] attr attribute to query
    !> @param [in] deviceId which device to query for information
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    function hipDeviceGetAttribute_raw(pi, attr, deviceId) &
       result(DeviceGetAttribute_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetAttribute")
#else
       bind(C, name="hipDeviceGetAttribute")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pi
       integer(c_int), value :: attr
       integer(c_int), value :: deviceId
       integer(c_int) :: DeviceGetAttribute_raw
    end function hipDeviceGetAttribute_raw

    module procedure hipDeviceGetAttribute_native
  end interface hipDeviceGetAttribute

  interface hipDeviceGetDefaultMemPool
    !---------------------------------------------
    ! hipDeviceGetDefaultMemPool
    !---------------------------------------------
    !> @brief Returns the default memory pool of the specified device
    !>
    !> @param [out] mem_pool Default memory pool to return
    !> @param [in] device    Device index for query the default memory pool
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`,
    !> `hipErrorNotSupported`
    !>
    !> @see hipDeviceGetDefaultMemPool, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    function hipDeviceGetDefaultMemPool_raw(mem_pool, device) &
       result(DeviceGetDefaultMemPool_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetDefaultMemPool")
#else
       bind(C, name="hipDeviceGetDefaultMemPool")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: mem_pool
       integer(c_int), value :: device
       integer(c_int) :: DeviceGetDefaultMemPool_raw
    end function hipDeviceGetDefaultMemPool_raw

    module procedure hipDeviceGetDefaultMemPool_typed
  end interface hipDeviceGetDefaultMemPool

  interface hipDeviceSetMemPool
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDevice`,
    !> `hipErrorNotSupported`
    !>
    !> @see hipDeviceGetDefaultMemPool, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    function hipDeviceSetMemPool_raw(device, mem_pool) &
       result(DeviceSetMemPool_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceSetMemPool")
#else
       bind(C, name="hipDeviceSetMemPool")
#endif
       import :: c_int, c_ptr
       integer(c_int), value :: device
       type(c_ptr), value :: mem_pool
       integer(c_int) :: DeviceSetMemPool_raw
    end function hipDeviceSetMemPool_raw

    module procedure hipDeviceSetMemPool_typed
  end interface hipDeviceSetMemPool

  interface hipDeviceGetMemPool
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @see hipDeviceGetDefaultMemPool, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    function hipDeviceGetMemPool_raw(mem_pool, device) &
       result(DeviceGetMemPool_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetMemPool")
#else
       bind(C, name="hipDeviceGetMemPool")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: mem_pool
       integer(c_int), value :: device
       integer(c_int) :: DeviceGetMemPool_raw
    end function hipDeviceGetMemPool_raw

    module procedure hipDeviceGetMemPool_typed
  end interface hipDeviceGetMemPool

  interface hipDeviceGetCacheConfig
    !---------------------------------------------
    ! hipDeviceGetCacheConfig
    !---------------------------------------------
    !> @brief Get Cache configuration for a specific Device
    !>
    !> @param [out] cacheConfig Pointer of cache configuration
    !>
    !> @returns `hipSuccess`, `hipErrorNotInitialized`
    !> Note: AMD devices do not support reconfigurable cache. This hint is ignored
    !> on these architectures.
    function hipDeviceGetCacheConfig_raw(cacheConfig) &
       result(DeviceGetCacheConfig_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetCacheConfig")
#else
       bind(C, name="hipDeviceGetCacheConfig")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: cacheConfig
       integer(c_int) :: DeviceGetCacheConfig_raw
    end function hipDeviceGetCacheConfig_raw

    module procedure hipDeviceGetCacheConfig_native
  end interface hipDeviceGetCacheConfig

  interface hipDeviceGetSharedMemConfig
    !---------------------------------------------
    ! hipDeviceGetSharedMemConfig
    !---------------------------------------------
    !> @brief Returns bank width of shared memory for current device
    !>
    !> @param [out] pConfig The pointer of the bank width for shared memory
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
    !>
    !> Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
    !> ignored on those architectures.
    function hipDeviceGetSharedMemConfig_raw(pConfig) &
       result(DeviceGetSharedMemConfig_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetSharedMemConfig")
#else
       bind(C, name="hipDeviceGetSharedMemConfig")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: pConfig
       integer(c_int) :: DeviceGetSharedMemConfig_raw
    end function hipDeviceGetSharedMemConfig_raw

    module procedure hipDeviceGetSharedMemConfig_native
  end interface hipDeviceGetSharedMemConfig

  interface hipGetDeviceFlags
    !---------------------------------------------
    ! hipGetDeviceFlags
    !---------------------------------------------
    !> @brief Gets the flags set for current device
    !>
    !> @param [out] flags Pointer of the flags
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    function hipGetDeviceFlags_raw(flags) &
       result(GetDeviceFlags_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetDeviceFlags")
#else
       bind(C, name="hipGetDeviceFlags")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: flags
       integer(c_int) :: GetDeviceFlags_raw
    end function hipGetDeviceFlags_raw

    module procedure hipGetDeviceFlags_native
  end interface hipGetDeviceFlags

  interface hipChooseDeviceR0600
    !---------------------------------------------
    ! hipChooseDeviceR0600
    !---------------------------------------------
    !> @brief Device which matches hipDeviceProp_t is returned
    !>
    !> @param [out] device Pointer of the device
    !> @param [in]  prop Pointer of the properties
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipChooseDeviceR0600_raw(device, prop) &
       result(ChooseDeviceR0600_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaChooseDevice")
#else
       bind(C, name="hipChooseDeviceR0600")
#endif
       import :: c_ptr, hipDeviceProp_t, c_int
       type(c_ptr), value :: device
       type(hipDeviceProp_t) :: prop
       integer(c_int) :: ChooseDeviceR0600_raw
    end function hipChooseDeviceR0600_raw

    module procedure hipChooseDeviceR0600_native
  end interface hipChooseDeviceR0600

  interface hipExtGetLinkTypeAndHopCount
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipExtGetLinkTypeAndHopCount_raw(device1, device2, linktype, hopcount) &
       result(ExtGetLinkTypeAndHopCount_raw) &
       bind(C, name="hipExtGetLinkTypeAndHopCount")
       import :: c_int, c_ptr
       integer(c_int), value :: device1
       integer(c_int), value :: device2
       type(c_ptr), value :: linktype
       type(c_ptr), value :: hopcount
       integer(c_int) :: ExtGetLinkTypeAndHopCount_raw
    end function hipExtGetLinkTypeAndHopCount_raw

    module procedure hipExtGetLinkTypeAndHopCount_native
  end interface hipExtGetLinkTypeAndHopCount

  interface hipIpcGetEventHandle
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
    !> @returns `hipSuccess`, `hipErrorInvalidConfiguration`, `hipErrorInvalidValue`
    !>
    !> @note This IPC event related feature API is currently applicable on Linux.
    function hipIpcGetEventHandle_raw(handle, event) &
       result(IpcGetEventHandle_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaIpcGetEventHandle")
#else
       bind(C, name="hipIpcGetEventHandle")
#endif
       import :: hipIpcEventHandle_t, c_ptr, c_int
       type(hipIpcEventHandle_t) :: handle
       type(c_ptr), value :: event
       integer(c_int) :: IpcGetEventHandle_raw
    end function hipIpcGetEventHandle_raw

    module procedure hipIpcGetEventHandle_typed
  end interface hipIpcGetEventHandle

  interface hipIpcOpenEventHandle
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`
    !>
    !> @note This IPC event related feature API is currently applicable on Linux.
    function hipIpcOpenEventHandle_raw(event, handle) &
       result(IpcOpenEventHandle_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaIpcOpenEventHandle")
#else
       bind(C, name="hipIpcOpenEventHandle")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: event
       type(c_ptr), value :: handle
       integer(c_int) :: IpcOpenEventHandle_raw
    end function hipIpcOpenEventHandle_raw

    module procedure hipIpcOpenEventHandle_typed
  end interface hipIpcOpenEventHandle

  interface hipStreamCreate
    !---------------------------------------------
    ! hipStreamCreate
    !---------------------------------------------
    !> @brief Creates an asynchronous stream.
    !>
    !> @param[in, out] stream Valid pointer to hipStream_t. This function writes the memory with the
    !> newly created stream.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> Creates a new asynchronous stream with its associated current device. The @p stream returns
    !> an
    !> opaque handle that can be used to reference the newly created stream in subsequent hipStream*
    !> commands. The stream is allocated on the heap and will remain allocated even if the handle
    !> goes
    !> out-of-scope. To release the memory used by the stream, the application must call
    !> hipStreamDestroy.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @see hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamSynchronize,
    !> hipStreamWaitEvent, hipStreamDestroy
    function hipStreamCreate_raw(stream) &
       result(StreamCreate_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamCreate")
#else
       bind(C, name="hipStreamCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: stream
       integer(c_int) :: StreamCreate_raw
    end function hipStreamCreate_raw

    module procedure hipStreamCreate_typed
  end interface hipStreamCreate

  interface hipStreamCreateWithFlags
    !---------------------------------------------
    ! hipStreamCreateWithFlags
    !---------------------------------------------
    !> @brief Creates an asynchronous stream with flag.
    !>
    !> @param[in, out] stream  Pointer to new stream
    !> @param[in] flags  Parameters to control stream creation
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> Creates a new asynchronous stream with its associated current device. @p stream returns an
    !> opaque handle that can be used to reference the newly created stream in subsequent hipStream*
    !> commands. The stream is allocated on the heap and will remain allocated even if the handle
    !> goes out-of-scope. To release the memory used by the stream, application must call
    !> hipStreamDestroy.
    !>
    !> The @p flags parameter controls behavior of the stream. The valid values are
    !> `hipStreamDefault`
    !> and `hipStreamNonBlocking`.
    !>
    !> @see hipStreamCreate, hipStreamCreateWithPriority, hipStreamSynchronize, hipStreamWaitEvent,
    !> hipStreamDestroy.
    function hipStreamCreateWithFlags_raw(stream, flags) &
       result(StreamCreateWithFlags_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamCreateWithFlags")
#else
       bind(C, name="hipStreamCreateWithFlags")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: stream
       integer(c_int), value :: flags
       integer(c_int) :: StreamCreateWithFlags_raw
    end function hipStreamCreateWithFlags_raw

    module procedure hipStreamCreateWithFlags_typed
  end interface hipStreamCreateWithFlags

  interface hipStreamCreateWithPriority
    !---------------------------------------------
    ! hipStreamCreateWithPriority
    !---------------------------------------------
    !> @brief Creates an asynchronous stream with the specified priority.
    !>
    !> @param[in, out] stream  Pointer to new stream
    !> @param[in] flags  Parameters to control stream creation
    !> @param[in] priority  Priority of the stream. Lower numbers represent higher priorities.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    !> `hipStreamDefault`
    !> and `hipStreamNonBlocking`.
    !>
    !> @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
    function hipStreamCreateWithPriority_raw(stream, flags, priority) &
       result(StreamCreateWithPriority_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamCreateWithPriority")
#else
       bind(C, name="hipStreamCreateWithPriority")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: stream
       integer(c_int), value :: flags
       integer(c_int), value :: priority
       integer(c_int) :: StreamCreateWithPriority_raw
    end function hipStreamCreateWithPriority_raw

    module procedure hipStreamCreateWithPriority_typed
  end interface hipStreamCreateWithPriority

  interface hipDeviceGetStreamPriorityRange
    !---------------------------------------------
    ! hipDeviceGetStreamPriorityRange
    !---------------------------------------------
    !> @brief Returns numerical values that correspond to the least and greatest stream priority.
    !>
    !> @param[in, out] leastPriority  Pointer in which a value corresponding to least priority
    !> is returned.
    !> @param[in, out] greatestPriority  Pointer in which a value corresponding to greatest priority
    !> is returned.
    !> @returns `hipSuccess`
    !>
    !> Returns in *leastPriority and *greatestPriority the numerical values that correspond to the
    !> least and greatest stream priority respectively. Stream priorities follow a convention where
    !> lower numbers imply greater priorities. The range of meaningful stream priorities is given by
    !> [*leastPriority,*greatestPriority]. If the user attempts to create a stream with a priority
    !> value that is outside the meaningful range as specified by this API, the priority is
    !> automatically clamped to within the valid range.
    !>
    !> @warning This API is under development on AMD GPUs and simply returns `hipSuccess`.
    function hipDeviceGetStreamPriorityRange_raw(leastPriority, greatestPriority) &
       result(DeviceGetStreamPriorityRange_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceGetStreamPriorityRange")
#else
       bind(C, name="hipDeviceGetStreamPriorityRange")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: leastPriority
       type(c_ptr), value :: greatestPriority
       integer(c_int) :: DeviceGetStreamPriorityRange_raw
    end function hipDeviceGetStreamPriorityRange_raw

    module procedure hipDeviceGetStreamPriorityRange_native
  end interface hipDeviceGetStreamPriorityRange

  interface hipStreamDestroy
    !---------------------------------------------
    ! hipStreamDestroy
    !---------------------------------------------
    !> @brief Destroys the specified stream.
    !>
    !> @param[in] stream  Stream identifier
    !> @returns `hipSuccess` `hipErrorInvalidHandle`
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
    function hipStreamDestroy_raw(stream) &
       result(StreamDestroy_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamDestroy")
#else
       bind(C, name="hipStreamDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: StreamDestroy_raw
    end function hipStreamDestroy_raw

    module procedure hipStreamDestroy_typed
  end interface hipStreamDestroy

  interface hipStreamQuery
    !---------------------------------------------
    ! hipStreamQuery
    !---------------------------------------------
    !> @brief Returns `hipSuccess` if all of the operations in the specified @p stream have
    !> completed, or
    !> `hipErrorNotReady` if not.
    !>
    !> @param[in] stream  Stream to query
    !>
    !> @returns `hipSuccess`, `hipErrorNotReady`, `hipErrorInvalidHandle`
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
    function hipStreamQuery_raw(stream) &
       result(StreamQuery_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamQuery")
#else
       bind(C, name="hipStreamQuery")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: StreamQuery_raw
    end function hipStreamQuery_raw

    module procedure hipStreamQuery_typed
  end interface hipStreamQuery

  interface hipStreamSynchronize
    !---------------------------------------------
    ! hipStreamSynchronize
    !---------------------------------------------
    !> @brief Waits for all commands in the stream to complete.
    !>
    !> @param[in] stream  Stream identifier.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidHandle`
    !>
    !> This command is host-synchronous : the host will block until all operations on the specified
    !> stream with its associated device are completed. On multiple device systems, the @p stream is
    !> associated with its device, no need to call hipSetDevice before this API.
    !>
    !> This command follows standard null-stream semantics. Specifying the null stream will cause
    !> the
    !> command to wait for other streams on the same device to complete all pending operations.
    !>
    !> This command honors the `hipDeviceScheduleBlockingSync` flag, which controls whether the wait
    !> is
    !> active or blocking.
    !>
    !> @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority,
    !> hipStreamWaitEvent,
    !> hipStreamDestroy
    function hipStreamSynchronize_raw(stream) &
       result(StreamSynchronize_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamSynchronize")
#else
       bind(C, name="hipStreamSynchronize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: StreamSynchronize_raw
    end function hipStreamSynchronize_raw

    module procedure hipStreamSynchronize_typed
  end interface hipStreamSynchronize

  interface hipStreamWaitEvent
    !---------------------------------------------
    ! hipStreamWaitEvent
    !---------------------------------------------
    !> @brief Makes the specified compute stream wait for the specified event
    !>
    !> @param[in] stream  Stream to make wait
    !> @param[in] event  Event to wait on
    !> @param[in] flags  Parameters to control the operation
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidHandle`, `hipErrorInvalidValue`,
    !> `hipErrorStreamCaptureIsolation`
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
    function hipStreamWaitEvent_raw(stream, event, flags) &
       result(StreamWaitEvent_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamWaitEvent")
#else
       bind(C, name="hipStreamWaitEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: event
       integer(c_int), value :: flags
       integer(c_int) :: StreamWaitEvent_raw
    end function hipStreamWaitEvent_raw

    module procedure hipStreamWaitEvent_typed
  end interface hipStreamWaitEvent

  interface hipStreamGetFlags
    !---------------------------------------------
    ! hipStreamGetFlags
    !---------------------------------------------
    !> @brief Returns flags associated with this stream.
    !>
    !> @param[in] stream  Stream to be queried
    !> @param[in,out] flags  Pointer to an unsigned integer in which the stream's flags are returned
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidHandle`.
    !>
    !> @see hipStreamCreateWithFlags
    function hipStreamGetFlags_raw(stream, flags) &
       result(StreamGetFlags_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamGetFlags")
#else
       bind(C, name="hipStreamGetFlags")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: flags
       integer(c_int) :: StreamGetFlags_raw
    end function hipStreamGetFlags_raw

    module procedure hipStreamGetFlags_native
    module procedure hipStreamGetFlags_typed
  end interface hipStreamGetFlags

  interface hipStreamGetId
    !---------------------------------------------
    ! hipStreamGetId
    !---------------------------------------------
    !> @brief Queries the Id of a stream.
    !>
    !> @param[in] stream  Stream to be queried
    !> flags  Pointer to an unsigned long long in which the stream's id is returned
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidHandle`.
    !>
    !> @see hipStreamCreateWithFlags, hipStreamGetFlags, hipStreamCreateWithPriority,
    !> hipStreamGetPriority
    function hipStreamGetId_raw(stream, streamId) &
       result(StreamGetId_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamGetId")
#else
       bind(C, name="hipStreamGetId")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: streamId
       integer(c_int) :: StreamGetId_raw
    end function hipStreamGetId_raw

    module procedure hipStreamGetId_native
    module procedure hipStreamGetId_typed
  end interface hipStreamGetId

  interface hipStreamGetPriority
    !---------------------------------------------
    ! hipStreamGetPriority
    !---------------------------------------------
    !> @brief Queries the priority of a stream.
    !>
    !> @param[in] stream  Stream to be queried
    !> @param[in,out] priority  Pointer to an unsigned integer in which the stream's priority is
    !> returned
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidHandle`.
    !>
    !> @see hipStreamCreateWithPriority
    function hipStreamGetPriority_raw(stream, priority) &
       result(StreamGetPriority_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamGetPriority")
#else
       bind(C, name="hipStreamGetPriority")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: priority
       integer(c_int) :: StreamGetPriority_raw
    end function hipStreamGetPriority_raw

    module procedure hipStreamGetPriority_native
    module procedure hipStreamGetPriority_typed
  end interface hipStreamGetPriority

  interface hipStreamGetDevice
    !---------------------------------------------
    ! hipStreamGetDevice
    !---------------------------------------------
    !> @brief Gets the device associated with the stream.
    !>
    !> @param[in] stream  Stream to be queried
    !> @param[out] device  Device associated with the stream
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorContextIsDestroyed`,
    !> `hipErrorInvalidHandle`,
    !> `hipErrorNotInitialized`, `hipErrorDeinitialized`, `hipErrorInvalidContext`
    !>
    !> @see hipStreamCreate, hipStreamDestroy, hipDeviceGetStreamPriorityRange
    function hipStreamGetDevice_raw(stream, device) &
       result(StreamGetDevice_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamGetDevice")
#else
       bind(C, name="hipStreamGetDevice")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: device
       integer(c_int) :: StreamGetDevice_raw
    end function hipStreamGetDevice_raw

    module procedure hipStreamGetDevice_native
    module procedure hipStreamGetDevice_typed
  end interface hipStreamGetDevice

  interface hipExtStreamCreateWithCUMask
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
    !> @returns `hipSuccess`, `hipErrorInvalidHandle`, `hipErrorInvalidValue`
    !>
    !> Creates  a new asynchronous stream with the specified CU mask.  @p stream returns an opaque
    !> handle that can be used to reference the newly created stream in subsequent hipStream*
    !> commands.
    !> The stream is allocated on the heap and will remain allocated even if the handle goes
    !> out-of-scope. To release the memory used by the stream, application must call
    !> hipStreamDestroy.
    !>
    !> @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
    function hipExtStreamCreateWithCUMask_raw(stream, cuMaskSize, cuMask) &
       result(ExtStreamCreateWithCUMask_raw) &
       bind(C, name="hipExtStreamCreateWithCUMask")
       import :: c_ptr, c_int
       type(c_ptr) :: stream
       integer(c_int), value :: cuMaskSize
       type(c_ptr), value :: cuMask
       integer(c_int) :: ExtStreamCreateWithCUMask_raw
    end function hipExtStreamCreateWithCUMask_raw

    module procedure hipExtStreamCreateWithCUMask_native
    module procedure hipExtStreamCreateWithCUMask_typed
  end interface hipExtStreamCreateWithCUMask

  interface hipExtStreamGetCUMask
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
    !> @returns `hipSuccess`, `hipErrorInvalidHandle`, `hipErrorInvalidValue`
    !>
    !> @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
    function hipExtStreamGetCUMask_raw(stream, cuMaskSize, cuMask) &
       result(ExtStreamGetCUMask_raw) &
       bind(C, name="hipExtStreamGetCUMask")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: cuMaskSize
       type(c_ptr), value :: cuMask
       integer(c_int) :: ExtStreamGetCUMask_raw
    end function hipExtStreamGetCUMask_raw

    module procedure hipExtStreamGetCUMask_native
    module procedure hipExtStreamGetCUMask_typed
  end interface hipExtStreamGetCUMask

  interface hipStreamAddCallback
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
    !> @returns `hipSuccess`, `hipErrorInvalidHandle`, `hipErrorNotSupported`
    !>
    !> @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamQuery, hipStreamSynchronize,
    !> hipStreamWaitEvent, hipStreamDestroy, hipStreamCreateWithPriority
    function hipStreamAddCallback_raw(stream, callback, userData, flags) &
       result(StreamAddCallback_raw) &
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
       integer(c_int) :: StreamAddCallback_raw
    end function hipStreamAddCallback_raw

    module procedure hipStreamAddCallback_typed
  end interface hipStreamAddCallback

  interface hipStreamSetAttribute
    !---------------------------------------------
    ! hipStreamSetAttribute
    !---------------------------------------------
    !> @brief Sets stream attribute. Updated attribute is applied to work submitted to the stream.
    !> @param[in] stream - Stream to set attributes to
    !> @param[in] attr   - Attribute ID for the attribute to set
    !> @param[in] value  - Attribute value for the attribute to set
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidResourceHandle`
    function hipStreamSetAttribute_raw(stream, attr, value) &
       result(StreamSetAttribute_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamSetAttribute")
#else
       bind(C, name="hipStreamSetAttribute")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: StreamSetAttribute_raw
    end function hipStreamSetAttribute_raw

    module procedure hipStreamSetAttribute_typed
  end interface hipStreamSetAttribute

  interface hipStreamGetAttribute
    !---------------------------------------------
    ! hipStreamGetAttribute
    !---------------------------------------------
    !> @brief queries stream attribute.
    !> @param[in] stream - Stream to geet attributes from
    !> @param[in] attr   - Attribute ID for the attribute to query
    !> value  - Attribute value output
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidResourceHandle`
    function hipStreamGetAttribute_raw(stream, attr, value_out) &
       result(StreamGetAttribute_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamGetAttribute")
#else
       bind(C, name="hipStreamGetAttribute")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: attr
       type(c_ptr), value :: value_out
       integer(c_int) :: StreamGetAttribute_raw
    end function hipStreamGetAttribute_raw

    module procedure hipStreamGetAttribute_typed
  end interface hipStreamGetAttribute

  interface hipStreamCopyAttributes
    !---------------------------------------------
    ! hipStreamCopyAttributes
    !---------------------------------------------
    !> @brief Copies attributes from source stream to destination stream.
    !> @param[in] dst - Destination stream
    !> @param[in] src - Source stream
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipStreamCopyAttributes_raw(dst, src) &
       result(StreamCopyAttributes_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamCopyAttributes")
#else
       bind(C, name="hipStreamCopyAttributes")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_int) :: StreamCopyAttributes_raw
    end function hipStreamCopyAttributes_raw

    module procedure hipStreamCopyAttributes_typed
  end interface hipStreamCopyAttributes

  interface hipStreamWaitValue32
    !---------------------------------------------
    ! hipStreamWaitValue32
    !---------------------------------------------
    !> @brief Enqueues a wait command to the stream.[BETA]
    !>
    !> @param [in] stream - Stream identifier
    !> @param [in] ptr    - Pointer to memory object allocated using `hipMallocSignalMemory` flag
    !> @param [in] value  - Value to be used in compare operation
    !> @param [in] flags - Defines the compare operation, supported values are
    !> `hipStreamWaitValueGte`
    !> `hipStreamWaitValueEq`, `hipStreamWaitValueAnd` and `hipStreamWaitValueNor`
    !> @param [in] mask   - Mask to be applied on value at memory before it is compared with value,
    !> default value is set to enable every bit
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> Enqueues a wait command to the stream, all operations enqueued on this stream after this,
    !> will
    !> not execute until the defined wait condition is true.
    !>
    !> `hipStreamWaitValueGte`: waits until *ptr&mask >= value
    !>
    !> `hipStreamWaitValueEq` : waits until *ptr&mask == value
    !>
    !> `hipStreamWaitValueAnd`: waits until ((*ptr&mask) & value) != 0
    !>
    !> `hipStreamWaitValueNor`: waits until ~((*ptr&mask) | (value&mask)) != 0
    !>
    !> @note when using `hipStreamWaitValueNor`, mask is applied on both 'value' and '*ptr'.
    !>
    !> @note Support for `hipStreamWaitValue32` can be queried using 'hipDeviceGetAttribute()' and
    !> 'hipDeviceAttributeCanUseStreamWaitValue' flag.
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @see hipExtMallocWithFlags, hipFree, hipStreamWaitValue64, hipStreamWriteValue64,
    !> hipStreamWriteValue32, hipDeviceGetAttribute
    function hipStreamWaitValue32_raw(stream, ptr, value, flags, mask) &
       result(StreamWaitValue32_raw) &
       bind(C, name="hipStreamWaitValue32")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: ptr
       integer(c_int), value :: value
       integer(c_int), value :: flags
       integer(c_int), value :: mask
       integer(c_int) :: StreamWaitValue32_raw
    end function hipStreamWaitValue32_raw

    module procedure hipStreamWaitValue32_typed
  end interface hipStreamWaitValue32

  interface hipStreamWaitValue64
    !---------------------------------------------
    ! hipStreamWaitValue64
    !---------------------------------------------
    !> @brief Enqueues a wait command to the stream.[BETA]
    !>
    !> @param [in] stream - Stream identifier
    !> @param [in] ptr    - Pointer to memory object allocated using 'hipMallocSignalMemory' flag
    !> @param [in] value  - Value to be used in compare operation
    !> @param [in] flags - Defines the compare operation, supported values are
    !> `hipStreamWaitValueGte`
    !> `hipStreamWaitValueEq`, `hipStreamWaitValueAnd` and `hipStreamWaitValueNor`.
    !> @param [in] mask   - Mask to be applied on value at memory before it is compared with value
    !> default value is set to enable every bit
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> Enqueues a wait command to the stream, all operations enqueued on this stream after this,
    !> will
    !> not execute until the defined wait condition is true.
    !>
    !> `hipStreamWaitValueGte`: waits until *ptr&mask >= value
    !>
    !> `hipStreamWaitValueEq` : waits until *ptr&mask == value
    !>
    !> `hipStreamWaitValueAnd`: waits until ((*ptr&mask) & value) != 0
    !>
    !> `hipStreamWaitValueNor`: waits until ~((*ptr&mask) | (value&mask)) != 0
    !>
    !> @note when using `hipStreamWaitValueNor`, mask is applied on both 'value' and '*ptr'.
    !>
    !> @note Support for hipStreamWaitValue64 can be queried using 'hipDeviceGetAttribute()' and
    !> 'hipDeviceAttributeCanUseStreamWaitValue' flag.
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @see hipExtMallocWithFlags, hipFree, hipStreamWaitValue32, hipStreamWriteValue64,
    !> hipStreamWriteValue32, hipDeviceGetAttribute
    function hipStreamWaitValue64_raw(stream, ptr, value, flags, mask) &
       result(StreamWaitValue64_raw) &
       bind(C, name="hipStreamWaitValue64")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: ptr
       integer(c_long), value :: value
       integer(c_int), value :: flags
       integer(c_long), value :: mask
       integer(c_int) :: StreamWaitValue64_raw
    end function hipStreamWaitValue64_raw

    module procedure hipStreamWaitValue64_typed
  end interface hipStreamWaitValue64

  interface hipStreamWriteValue32
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    function hipStreamWriteValue32_raw(stream, ptr, value, flags) &
       result(StreamWriteValue32_raw) &
       bind(C, name="hipStreamWriteValue32")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: ptr
       integer(c_int), value :: value
       integer(c_int), value :: flags
       integer(c_int) :: StreamWriteValue32_raw
    end function hipStreamWriteValue32_raw

    module procedure hipStreamWriteValue32_typed
  end interface hipStreamWriteValue32

  interface hipStreamWriteValue64
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    function hipStreamWriteValue64_raw(stream, ptr, value, flags) &
       result(StreamWriteValue64_raw) &
       bind(C, name="hipStreamWriteValue64")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: ptr
       integer(c_long), value :: value
       integer(c_int), value :: flags
       integer(c_int) :: StreamWriteValue64_raw
    end function hipStreamWriteValue64_raw

    module procedure hipStreamWriteValue64_typed
  end interface hipStreamWriteValue64

  interface hipStreamBatchMemOp
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> Batch operations to synchronize the stream via memory operations.
    !>
    !> @warning This API is marked as beta, meaning, while this is feature complete,
    !> it is still open to changes and may have outstanding issues.
    !>
    !> @see hipStreamWriteValue32, hipStreamWaitValue32,
    !> hipStreamWaitValue64. hipStreamWriteValue64
    function hipStreamBatchMemOp_raw(stream, count, paramArray, flags) &
       result(StreamBatchMemOp_raw) &
       bind(C, name="hipStreamBatchMemOp")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: count
       type(c_ptr), value :: paramArray
       integer(c_int), value :: flags
       integer(c_int) :: StreamBatchMemOp_raw
    end function hipStreamBatchMemOp_raw

    module procedure hipStreamBatchMemOp_typed
  end interface hipStreamBatchMemOp

  interface hipGraphAddBatchMemOpNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning This API is marked as beta, meaning, while this is feature complete,
    !> it is still open to changes and may have outstanding issues.
    !>
    !> @see hipStreamWriteValue32, hipStreamWaitValue32,
    !> hipStreamWaitValue64. hipStreamWriteValue64, hipStreamBatchMemOp
    function hipGraphAddBatchMemOpNode_raw(phGraphNode, hGraph, dependencies, numDependencies, &
                                           nodeParams) &
       result(GraphAddBatchMemOpNode_raw) &
       bind(C, name="hipGraphAddBatchMemOpNode")
       import :: c_ptr, c_long, hipBatchMemOpNodeParams, c_int
       type(c_ptr) :: phGraphNode
       type(c_ptr), value :: hGraph
       type(c_ptr) :: dependencies
       integer(c_long), value :: numDependencies
       type(hipBatchMemOpNodeParams) :: nodeParams
       integer(c_int) :: GraphAddBatchMemOpNode_raw
    end function hipGraphAddBatchMemOpNode_raw

    module procedure hipGraphAddBatchMemOpNode_typed
  end interface hipGraphAddBatchMemOpNode

  interface hipGraphBatchMemOpNodeGetParams
    !---------------------------------------------
    ! hipGraphBatchMemOpNodeGetParams
    !---------------------------------------------
    !> @brief Returns a batch mem op node's parameters.[BETA]
    !>
    !> @param [in] hNode           - Node to get the parameters for
    !> @param [in] nodeParams_out  - Pointer to return the parameters
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    function hipGraphBatchMemOpNodeGetParams_raw(hNode, nodeParams_out) &
       result(GraphBatchMemOpNodeGetParams_raw) &
       bind(C, name="hipGraphBatchMemOpNodeGetParams")
       import :: c_ptr, hipBatchMemOpNodeParams, c_int
       type(c_ptr), value :: hNode
       type(hipBatchMemOpNodeParams) :: nodeParams_out
       integer(c_int) :: GraphBatchMemOpNodeGetParams_raw
    end function hipGraphBatchMemOpNodeGetParams_raw

    module procedure hipGraphBatchMemOpNodeGetParams_typed
  end interface hipGraphBatchMemOpNodeGetParams

  interface hipGraphBatchMemOpNodeSetParams
    !---------------------------------------------
    ! hipGraphBatchMemOpNodeSetParams
    !---------------------------------------------
    !> @brief Sets the batch mem op node's parameters.[BETA]
    !>
    !> @param [in] hNode       - Node to set the parameters for
    !> @param [in] nodeParams  - Parameters to copy
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> Sets the parameters of batch mem op node hNode to nodeParams.
    !>
    !> @warning This API is marked as beta, meaning, while this is feature complete,
    !> it is still open to changes and may have outstanding issues.
    !>
    !> @see hipStreamWriteValue32, hipStreamWaitValue32,
    !> hipStreamWaitValue64. hipStreamWriteValue64, hipGraphBatchMemOpNodeGetParams
    function hipGraphBatchMemOpNodeSetParams_raw(hNode, nodeParams) &
       result(GraphBatchMemOpNodeSetParams_raw) &
       bind(C, name="hipGraphBatchMemOpNodeSetParams")
       import :: c_ptr, hipBatchMemOpNodeParams, c_int
       type(c_ptr), value :: hNode
       type(hipBatchMemOpNodeParams) :: nodeParams
       integer(c_int) :: GraphBatchMemOpNodeSetParams_raw
    end function hipGraphBatchMemOpNodeSetParams_raw

    module procedure hipGraphBatchMemOpNodeSetParams_typed
  end interface hipGraphBatchMemOpNodeSetParams

  interface hipGraphExecBatchMemOpNodeSetParams
    !---------------------------------------------
    ! hipGraphExecBatchMemOpNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a batch mem op node in the given graphExec.[BETA]
    !>
    !> @param [in] hGraphExec  - The executable graph in which to set the specified node
    !> @param [in] hNode - Batch mem op node from the graph from which graphExec was instantiated
    !> @param [in] nodeParams  - Updated Parameters to set
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
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
    function hipGraphExecBatchMemOpNodeSetParams_raw(hGraphExec, hNode, nodeParams) &
       result(GraphExecBatchMemOpNodeSetParams_raw) &
       bind(C, name="hipGraphExecBatchMemOpNodeSetParams")
       import :: c_ptr, hipBatchMemOpNodeParams, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(hipBatchMemOpNodeParams) :: nodeParams
       integer(c_int) :: GraphExecBatchMemOpNodeSetParams_raw
    end function hipGraphExecBatchMemOpNodeSetParams_raw

    module procedure hipGraphExecBatchMemOpNodeSetParams_typed
  end interface hipGraphExecBatchMemOpNodeSetParams

  interface hipEventCreateWithFlags
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
    !> @param[in] flags     Flags to control event behavior.  Valid values are `hipEventDefault`,
    !> `hipEventBlockingSync`, `hipEventDisableTiming`, `hipEventInterprocess`
    !> `hipEventDefault` : Default flag.  The event will use active synchronization and will support
    !> timing. Blocking synchronization provides lowest possible latency at the expense of
    !> dedicating a
    !> CPU to poll on the event.
    !> `hipEventBlockingSync` : The event will use blocking synchronization : if hipEventSynchronize
    !> is
    !> called on this event, the thread will block until the event completes. This can increase
    !> latency
    !> for the synchroniation but can result in lower power and more resources for other CPU
    !> threads.
    !> `hipEventDisableTiming` : Disable recording of timing information. Events created with this
    !> flag
    !> would not record profiling data and provide best performance if used for synchronization.
    !> `hipEventInterprocess` : The event can be used as an interprocess event.
    !> hipEventDisableTiming
    !> flag also must be set when hipEventInterprocess flag is set.
    !> `hipEventDisableSystemFence` : Disable acquire and release system scope fence. This may
    !> improve performance but device memory may not be visible to the host and other devices
    !> if this flag is set.
    !>
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`,
    !> `hipErrorLaunchFailure`, `hipErrorOutOfMemory`
    !>
    !> @see hipEventCreate, hipEventSynchronize, hipEventDestroy, hipEventElapsedTime
    function hipEventCreateWithFlags_raw(event, flags) &
       result(EventCreateWithFlags_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventCreateWithFlags")
#else
       bind(C, name="hipEventCreateWithFlags")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: event
       integer(c_int), value :: flags
       integer(c_int) :: EventCreateWithFlags_raw
    end function hipEventCreateWithFlags_raw

    module procedure hipEventCreateWithFlags_typed
  end interface hipEventCreateWithFlags

  interface hipEventCreate
    !---------------------------------------------
    ! hipEventCreate
    !---------------------------------------------
    !> Create an event
    !>
    !> @param[in,out] event Returns the newly created event.
    !>
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`,
    !> `hipErrorLaunchFailure`, `hipErrorOutOfMemory`
    !>
    !> @see hipEventCreateWithFlags, hipEventRecord, hipEventQuery, hipEventSynchronize,
    !> hipEventDestroy, hipEventElapsedTime
    function hipEventCreate_raw(event) &
       result(EventCreate_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventCreate")
#else
       bind(C, name="hipEventCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: event
       integer(c_int) :: EventCreate_raw
    end function hipEventCreate_raw

    module procedure hipEventCreate_typed
  end interface hipEventCreate

  interface hipEventRecordWithFlags
    !---------------------------------------------
    ! hipEventRecordWithFlags
    !---------------------------------------------
    !> @brief Record an event in the specified stream.
    !>
    !> @param[in] event event to record.
    !> @param[in] stream stream in which to record event.
    !> @param[in] flags parameter for operations
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidHandle`, `hipErrorLaunchFailure`
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
    !> `hipSuccess` is returned, meaning no pending event in the stream.
    !>
    !> @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventSynchronize,
    !> hipEventDestroy, hipEventElapsedTime
    function hipEventRecordWithFlags_raw(event, stream, flags) &
       result(EventRecordWithFlags_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventRecordWithFlags")
#else
       bind(C, name="hipEventRecordWithFlags")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       type(c_ptr), value :: stream
       integer(c_int), value :: flags
       integer(c_int) :: EventRecordWithFlags_raw
    end function hipEventRecordWithFlags_raw

    module procedure hipEventRecordWithFlags_typed
  end interface hipEventRecordWithFlags

  interface hipEventRecord
    !---------------------------------------------
    ! hipEventRecord
    !---------------------------------------------
    function hipEventRecord_raw(event, stream) &
       result(EventRecord_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventRecord")
#else
       bind(C, name="hipEventRecord")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       type(c_ptr), value :: stream
       integer(c_int) :: EventRecord_raw
    end function hipEventRecord_raw

    module procedure hipEventRecord_typed
  end interface hipEventRecord

  interface hipEventDestroy
    !---------------------------------------------
    ! hipEventDestroy
    !---------------------------------------------
    !> @brief Destroy the specified event.
    !>
    !> @param[in] event Event to destroy.
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`,
    !> `hipErrorLaunchFailure`
    !>
    !> Releases memory associated with the event.  If the event is recording but has not completed
    !> recording when hipEventDestroy() is called, the function will return immediately and the
    !> completion_future resources will be released later, when the hipDevice is synchronized.
    !>
    !> @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventSynchronize,
    !> hipEventRecord,
    !> hipEventElapsedTime
    !>
    !> @returns `hipSuccess`
    function hipEventDestroy_raw(event) &
       result(EventDestroy_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventDestroy")
#else
       bind(C, name="hipEventDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       integer(c_int) :: EventDestroy_raw
    end function hipEventDestroy_raw

    module procedure hipEventDestroy_typed
  end interface hipEventDestroy

  interface hipEventSynchronize
    !---------------------------------------------
    ! hipEventSynchronize
    !---------------------------------------------
    !> @brief Wait for an event to complete.
    !>
    !> This function will block until the event is ready, waiting for all previous work in the
    !> stream
    !> specified when event was recorded with hipEventRecord().
    !>
    !> If hipEventRecord() has not been called on @p event, this function returns `hipSuccess` when
    !> no
    !> event is captured.
    !>
    !>
    !> @param[in] event Event on which to wait.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidHandle`, `hipErrorLaunchFailure`
    !>
    !> @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventDestroy, hipEventRecord,
    !> hipEventElapsedTime
    function hipEventSynchronize_raw(event) &
       result(EventSynchronize_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventSynchronize")
#else
       bind(C, name="hipEventSynchronize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       integer(c_int) :: EventSynchronize_raw
    end function hipEventSynchronize_raw

    module procedure hipEventSynchronize_typed
  end interface hipEventSynchronize

  interface hipEventElapsedTime
    !---------------------------------------------
    ! hipEventElapsedTime
    !---------------------------------------------
    !> @brief Return the elapsed time between two events.
    !>
    !> @param[out] ms : Return time between start and stop in ms.
    !> @param[in]   start : Start event.
    !> @param[in]   stop  : Stop event.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotReady`, `hipErrorInvalidHandle`,
    !> `hipErrorNotInitialized`, `hipErrorLaunchFailure`
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
    !> If hipEventRecord() has not been called on either event, then `hipErrorInvalidHandle` is
    !> returned. If hipEventRecord() has been called on both events, but the timestamp has not yet
    !> been
    !> recorded on one or both events (that is, hipEventQuery() would return `hipErrorNotReady` on
    !> at
    !> least one of the events), then `hipErrorNotReady` is returned.
    !>
    !> @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventDestroy, hipEventRecord,
    !> hipEventSynchronize
    function hipEventElapsedTime_raw(ms, start, stop) &
       result(EventElapsedTime_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventElapsedTime")
#else
       bind(C, name="hipEventElapsedTime")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: ms
       type(c_ptr), value :: start
       type(c_ptr), value :: stop
       integer(c_int) :: EventElapsedTime_raw
    end function hipEventElapsedTime_raw

    module procedure hipEventElapsedTime_native
    module procedure hipEventElapsedTime_typed
  end interface hipEventElapsedTime

  interface hipEventQuery
    !---------------------------------------------
    ! hipEventQuery
    !---------------------------------------------
    !> @brief Query event status
    !>
    !> @param[in] event Event to query.
    !> @returns `hipSuccess`, `hipErrorNotReady`, `hipErrorInvalidHandle`, `hipErrorInvalidValue`,
    !> `hipErrorNotInitialized`, `hipErrorLaunchFailure`
    !>
    !> Query the status of the specified event.  This function will return `hipSuccess` if all
    !> commands in the appropriate stream (specified to hipEventRecord()) have completed.  If any
    !> execution has not completed, then `hipErrorNotReady` is returned.
    !>
    !> @note This API returns `hipSuccess`, if hipEventRecord() is not called before this API.
    !>
    !> @see hipEventCreate, hipEventCreateWithFlags, hipEventRecord, hipEventDestroy,
    !> hipEventSynchronize, hipEventElapsedTime
    function hipEventQuery_raw(event) &
       result(EventQuery_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaEventQuery")
#else
       bind(C, name="hipEventQuery")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       integer(c_int) :: EventQuery_raw
    end function hipEventQuery_raw

    module procedure hipEventQuery_typed
  end interface hipEventQuery

  interface hipDrvPointerGetAttributes
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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @see hipPointerGetAttribute
    function hipDrvPointerGetAttributes_raw(numAttributes, attributes, data, ptr) &
       result(DrvPointerGetAttributes_raw) &
       bind(C, name="hipDrvPointerGetAttributes")
       import :: c_int, c_ptr
       integer(c_int), value :: numAttributes
       type(c_ptr), value :: attributes
       type(c_ptr) :: data
       type(c_ptr), value :: ptr
       integer(c_int) :: DrvPointerGetAttributes_raw
    end function hipDrvPointerGetAttributes_raw

    module procedure hipDrvPointerGetAttributes_native
  end interface hipDrvPointerGetAttributes

  interface hipImportExternalSemaphore
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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    !>
    !> @see
    !>
    !> @note  This API is currently not supported on Linux.
    function hipImportExternalSemaphore_raw(extSem_out, semHandleDesc) &
       result(ImportExternalSemaphore_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaImportExternalSemaphore")
#else
       bind(C, name="hipImportExternalSemaphore")
#endif
       import :: c_ptr, hipExternalSemaphoreHandleDesc, c_int
       type(c_ptr) :: extSem_out
       type(hipExternalSemaphoreHandleDesc) :: semHandleDesc
       integer(c_int) :: ImportExternalSemaphore_raw
    end function hipImportExternalSemaphore_raw

    module procedure hipImportExternalSemaphore_typed
  end interface hipImportExternalSemaphore

  interface hipSignalExternalSemaphoresAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    !>
    !> @see
    !>
    !> @note  This API is currently not supported on Linux.
    function hipSignalExternalSemaphoresAsync_raw(extSemArray, paramsArray, numExtSems, stream) &
       result(SignalExternalSemaphoresAsync_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaSignalExternalSemaphoresAsync")
#else
       bind(C, name="hipSignalExternalSemaphoresAsync")
#endif
       import :: c_ptr, hipExternalSemaphoreSignalParams, c_int
       type(c_ptr) :: extSemArray
       type(hipExternalSemaphoreSignalParams) :: paramsArray
       integer(c_int), value :: numExtSems
       type(c_ptr), value :: stream
       integer(c_int) :: SignalExternalSemaphoresAsync_raw
    end function hipSignalExternalSemaphoresAsync_raw

    module procedure hipSignalExternalSemaphoresAsync_typed
  end interface hipSignalExternalSemaphoresAsync

  interface hipWaitExternalSemaphoresAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    !>
    !> @see
    !>
    !> @note  This API is currently not supported on Linux.
    function hipWaitExternalSemaphoresAsync_raw(extSemArray, paramsArray, numExtSems, stream) &
       result(WaitExternalSemaphoresAsync_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaWaitExternalSemaphoresAsync")
#else
       bind(C, name="hipWaitExternalSemaphoresAsync")
#endif
       import :: c_ptr, hipExternalSemaphoreWaitParams, c_int
       type(c_ptr) :: extSemArray
       type(hipExternalSemaphoreWaitParams) :: paramsArray
       integer(c_int), value :: numExtSems
       type(c_ptr), value :: stream
       integer(c_int) :: WaitExternalSemaphoresAsync_raw
    end function hipWaitExternalSemaphoresAsync_raw

    module procedure hipWaitExternalSemaphoresAsync_typed
  end interface hipWaitExternalSemaphoresAsync

  interface hipDestroyExternalSemaphore
    !---------------------------------------------
    ! hipDestroyExternalSemaphore
    !---------------------------------------------
    !> @brief Destroys an external semaphore object and releases any references to the underlying
    !> resource. Any outstanding signals or waits must have completed before the semaphore is
    !> destroyed.
    !>
    !> @param[in] extSem handle to an external memory object
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    !>
    !> @see
    !>
    !> @note  This API is currently not supported on Linux.
    function hipDestroyExternalSemaphore_raw(extSem) &
       result(DestroyExternalSemaphore_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDestroyExternalSemaphore")
#else
       bind(C, name="hipDestroyExternalSemaphore")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: extSem
       integer(c_int) :: DestroyExternalSemaphore_raw
    end function hipDestroyExternalSemaphore_raw

    module procedure hipDestroyExternalSemaphore_typed
  end interface hipDestroyExternalSemaphore

  interface hipImportExternalMemory
    !---------------------------------------------
    ! hipImportExternalMemory
    !---------------------------------------------
    !> @brief Imports an external memory object.
    !>
    !> @param[out] extMem_out  Returned handle to an external memory object
    !> @param[in]  memHandleDesc Memory import handle descriptor
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    !>
    !> @see
    function hipImportExternalMemory_raw(extMem_out, memHandleDesc) &
       result(ImportExternalMemory_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaImportExternalMemory")
#else
       bind(C, name="hipImportExternalMemory")
#endif
       import :: c_ptr, hipExternalMemoryHandleDesc, c_int
       type(c_ptr) :: extMem_out
       type(hipExternalMemoryHandleDesc) :: memHandleDesc
       integer(c_int) :: ImportExternalMemory_raw
    end function hipImportExternalMemory_raw

    module procedure hipImportExternalMemory_typed
  end interface hipImportExternalMemory

  interface hipExternalMemoryGetMappedBuffer
    !---------------------------------------------
    ! hipExternalMemoryGetMappedBuffer
    !---------------------------------------------
    !> @brief Maps a buffer onto an imported memory object.
    !>
    !> @param[out] devPtr Returned device pointer to buffer
    !> @param[in]  extMem  Handle to external memory object
    !> @param[in]  bufferDesc  Buffer descriptor
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    !>
    !> @see
    function hipExternalMemoryGetMappedBuffer_raw(devPtr, extMem, bufferDesc) &
       result(ExternalMemoryGetMappedBuffer_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaExternalMemoryGetMappedBuffer")
#else
       bind(C, name="hipExternalMemoryGetMappedBuffer")
#endif
       import :: c_ptr, hipExternalMemoryBufferDesc, c_int
       type(c_ptr) :: devPtr
       type(c_ptr), value :: extMem
       type(hipExternalMemoryBufferDesc) :: bufferDesc
       integer(c_int) :: ExternalMemoryGetMappedBuffer_raw
    end function hipExternalMemoryGetMappedBuffer_raw

    module procedure hipExternalMemoryGetMappedBuffer_typed
  end interface hipExternalMemoryGetMappedBuffer

  interface hipDestroyExternalMemory
    !---------------------------------------------
    ! hipDestroyExternalMemory
    !---------------------------------------------
    !> @brief Destroys an external memory object.
    !>
    !> @param[in] extMem  External memory object to be destroyed
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
    !>
    !> @see
    function hipDestroyExternalMemory_raw(extMem) &
       result(DestroyExternalMemory_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDestroyExternalMemory")
#else
       bind(C, name="hipDestroyExternalMemory")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: extMem
       integer(c_int) :: DestroyExternalMemory_raw
    end function hipDestroyExternalMemory_raw

    module procedure hipDestroyExternalMemory_typed
  end interface hipDestroyExternalMemory

  interface hipExternalMemoryGetMappedMipmappedArray
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidResourceHandle`
    !>
    !> @see hipImportExternalMemory, hipDestroyExternalMemory, hipExternalMemoryGetMappedBuffer,
    !> hipFreeMipmappedArray
    function hipExternalMemoryGetMappedMipmappedArray_raw(mipmap, extMem, mipmapDesc) &
       result(ExternalMemoryGetMappedMipmappedArray_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaExternalMemoryGetMappedMipmappedArray")
#else
       bind(C, name="hipExternalMemoryGetMappedMipmappedArray")
#endif
       import :: c_ptr, hipExternalMemoryMipmappedArrayDesc, c_int
       type(c_ptr) :: mipmap
       type(c_ptr), value :: extMem
       type(hipExternalMemoryMipmappedArrayDesc) :: mipmapDesc
       integer(c_int) :: ExternalMemoryGetMappedMipmappedArray_raw
    end function hipExternalMemoryGetMappedMipmappedArray_raw

    module procedure hipExternalMemoryGetMappedMipmappedArray_typed
  end interface hipExternalMemoryGetMappedMipmappedArray

  interface hipMemPrefetchAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPrefetchAsync_raw(dev_ptr, count, device, stream) &
       result(MemPrefetchAsync_raw) &
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
       integer(c_int) :: MemPrefetchAsync_raw
    end function hipMemPrefetchAsync_raw

    module procedure hipMemPrefetchAsync_typed
  end interface hipMemPrefetchAsync

  interface hipMemPrefetchAsync_v2
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPrefetchAsync_v2_raw(dev_ptr, count, location, flags, stream) &
       result(MemPrefetchAsync_v2_raw) &
       bind(C, name="hipMemPrefetchAsync_v2")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dev_ptr
       integer(c_long), value :: count
       type(c_ptr), value :: location
       integer(c_int), value :: flags
       type(c_ptr), value :: stream
       integer(c_int) :: MemPrefetchAsync_v2_raw
    end function hipMemPrefetchAsync_v2_raw

    module procedure hipMemPrefetchAsync_v2_typed
  end interface hipMemPrefetchAsync_v2

  interface hipMemRangeGetAttributes
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemRangeGetAttributes_raw(data, data_sizes, attributes, num_attributes, dev_ptr, &
                                          count) &
       result(MemRangeGetAttributes_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemRangeGetAttributes")
#else
       bind(C, name="hipMemRangeGetAttributes")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: data
       type(c_ptr), value :: data_sizes
       type(c_ptr), value :: attributes
       integer(c_long), value :: num_attributes
       type(c_ptr), value :: dev_ptr
       integer(c_long), value :: count
       integer(c_int) :: MemRangeGetAttributes_raw
    end function hipMemRangeGetAttributes_raw

    module procedure hipMemRangeGetAttributes_native
  end interface hipMemRangeGetAttributes

  interface hipStreamAttachMemAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning This API is under development. Currently it is a no-operation (NOP)
    !> function on AMD GPUs and returns `hipSuccess`.
    function hipStreamAttachMemAsync_raw(stream, dev_ptr, length, flags) &
       result(StreamAttachMemAsync_raw) &
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
       integer(c_int) :: StreamAttachMemAsync_raw
    end function hipStreamAttachMemAsync_raw

    module procedure hipStreamAttachMemAsync_typed
  end interface hipStreamAttachMemAsync

  interface hipMallocAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`, `hipErrorOutOfMemory`
    !>
    !> @see hipMallocFromPoolAsync, hipFreeAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMallocAsync_raw(dev_ptr, size, stream) &
       result(MallocAsync_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMallocAsync")
#else
       bind(C, name="hipMallocAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: dev_ptr
       integer(c_long), value :: size
       type(c_ptr), value :: stream
       integer(c_int) :: MallocAsync_raw
    end function hipMallocAsync_raw

    module procedure hipMallocAsync_typed
  end interface hipMallocAsync

  interface hipFreeAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipFreeAsync_raw(dev_ptr, stream) &
       result(FreeAsync_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaFreeAsync")
#else
       bind(C, name="hipFreeAsync")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: dev_ptr
       type(c_ptr), value :: stream
       integer(c_int) :: FreeAsync_raw
    end function hipFreeAsync_raw

    module procedure hipFreeAsync_typed
  end interface hipFreeAsync

  interface hipMemPoolTrimTo
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolTrimTo_raw(mem_pool, min_bytes_to_hold) &
       result(MemPoolTrimTo_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPoolTrimTo")
#else
       bind(C, name="hipMemPoolTrimTo")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: mem_pool
       integer(c_long), value :: min_bytes_to_hold
       integer(c_int) :: MemPoolTrimTo_raw
    end function hipMemPoolTrimTo_raw

    module procedure hipMemPoolTrimTo_typed
  end interface hipMemPoolTrimTo

  interface hipMemPoolSetAttribute
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolSetAttribute_raw(mem_pool, attr, value) &
       result(MemPoolSetAttribute_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPoolSetAttribute")
#else
       bind(C, name="hipMemPoolSetAttribute")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: mem_pool
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: MemPoolSetAttribute_raw
    end function hipMemPoolSetAttribute_raw

    module procedure hipMemPoolSetAttribute_typed
  end interface hipMemPoolSetAttribute

  interface hipMemPoolGetAttribute
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
    !> @returns  `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync,
    !> hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess,
    !> hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolGetAttribute_raw(mem_pool, attr, value) &
       result(MemPoolGetAttribute_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPoolGetAttribute")
#else
       bind(C, name="hipMemPoolGetAttribute")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: mem_pool
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: MemPoolGetAttribute_raw
    end function hipMemPoolGetAttribute_raw

    module procedure hipMemPoolGetAttribute_typed
  end interface hipMemPoolGetAttribute

  interface hipMemPoolSetAccess
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
    !> @returns  `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolSetAccess_raw(mem_pool, desc_list, count) &
       result(MemPoolSetAccess_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPoolSetAccess")
#else
       bind(C, name="hipMemPoolSetAccess")
#endif
       import :: c_ptr, hipMemAccessDesc, c_long, c_int
       type(c_ptr), value :: mem_pool
       type(hipMemAccessDesc) :: desc_list
       integer(c_long), value :: count
       integer(c_int) :: MemPoolSetAccess_raw
    end function hipMemPoolSetAccess_raw

    module procedure hipMemPoolSetAccess_typed
  end interface hipMemPoolSetAccess

  interface hipMemPoolGetAccess
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolGetAccess_raw(flags, mem_pool, location) &
       result(MemPoolGetAccess_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPoolGetAccess")
#else
       bind(C, name="hipMemPoolGetAccess")
#endif
       import :: c_ptr, hipMemLocation, c_int
       type(c_ptr), value :: flags
       type(c_ptr), value :: mem_pool
       type(hipMemLocation) :: location
       integer(c_int) :: MemPoolGetAccess_raw
    end function hipMemPoolGetAccess_raw

    module procedure hipMemPoolGetAccess_native
    module procedure hipMemPoolGetAccess_typed
  end interface hipMemPoolGetAccess

  interface hipMemPoolCreate
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipMemPoolDestroy, hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute,
    !> hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolCreate_raw(mem_pool, pool_props) &
       result(MemPoolCreate_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPoolCreate")
#else
       bind(C, name="hipMemPoolCreate")
#endif
       import :: c_ptr, hipMemPoolProps, c_int
       type(c_ptr) :: mem_pool
       type(hipMemPoolProps) :: pool_props
       integer(c_int) :: MemPoolCreate_raw
    end function hipMemPoolCreate_raw

    module procedure hipMemPoolCreate_typed
  end interface hipMemPoolCreate

  interface hipMemPoolDestroy
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
    !> hipMemPoolCreate hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute,
    !> hipMemPoolSetAccess, hipMemPoolGetAccess
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolDestroy_raw(mem_pool) &
       result(MemPoolDestroy_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPoolDestroy")
#else
       bind(C, name="hipMemPoolDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: mem_pool
       integer(c_int) :: MemPoolDestroy_raw
    end function hipMemPoolDestroy_raw

    module procedure hipMemPoolDestroy_typed
  end interface hipMemPoolDestroy

  interface hipMallocFromPoolAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`, `hipErrorOutOfMemory`
    !>
    !> @see hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute, hipMemPoolCreate
    !> hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess,
    !> hipMemPoolGetAccess,
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMallocFromPoolAsync_raw(dev_ptr, size, mem_pool, stream) &
       result(MallocFromPoolAsync_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMallocFromPoolAsync")
#else
       bind(C, name="hipMallocFromPoolAsync")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: dev_ptr
       integer(c_long), value :: size
       type(c_ptr), value :: mem_pool
       type(c_ptr), value :: stream
       integer(c_int) :: MallocFromPoolAsync_raw
    end function hipMallocFromPoolAsync_raw

    module procedure hipMallocFromPoolAsync_typed
  end interface hipMallocFromPoolAsync

  interface hipMemPoolExportToShareableHandle
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorOutOfMemory`
    !>
    !> @see hipMemPoolImportFromShareableHandle
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolExportToShareableHandle_raw(shared_handle, mem_pool, handle_type, flags) &
       result(MemPoolExportToShareableHandle_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPoolExportToShareableHandle")
#else
       bind(C, name="hipMemPoolExportToShareableHandle")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: shared_handle
       type(c_ptr), value :: mem_pool
       integer(c_int), value :: handle_type
       integer(c_int), value :: flags
       integer(c_int) :: MemPoolExportToShareableHandle_raw
    end function hipMemPoolExportToShareableHandle_raw

    module procedure hipMemPoolExportToShareableHandle_typed
  end interface hipMemPoolExportToShareableHandle

  interface hipMemPoolImportFromShareableHandle
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorOutOfMemory`
    !>
    !> @see hipMemPoolExportToShareableHandle
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolImportFromShareableHandle_raw(mem_pool, shared_handle, handle_type, flags) &
       result(MemPoolImportFromShareableHandle_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPoolImportFromShareableHandle")
#else
       bind(C, name="hipMemPoolImportFromShareableHandle")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: mem_pool
       type(c_ptr), value :: shared_handle
       integer(c_int), value :: handle_type
       integer(c_int), value :: flags
       integer(c_int) :: MemPoolImportFromShareableHandle_raw
    end function hipMemPoolImportFromShareableHandle_raw

    module procedure hipMemPoolImportFromShareableHandle_typed
  end interface hipMemPoolImportFromShareableHandle

  interface hipMemPoolImportPointer
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`,
    !> `hipErrorOutOfMemory`
    !>
    !> @see hipMemPoolExportPointer
    !>
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemPoolImportPointer_raw(dev_ptr, mem_pool, export_data) &
       result(MemPoolImportPointer_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemPoolImportPointer")
#else
       bind(C, name="hipMemPoolImportPointer")
#endif
       import :: c_ptr, hipMemPoolPtrExportData, c_int
       type(c_ptr) :: dev_ptr
       type(c_ptr), value :: mem_pool
       type(hipMemPoolPtrExportData) :: export_data
       integer(c_int) :: MemPoolImportPointer_raw
    end function hipMemPoolImportPointer_raw

    module procedure hipMemPoolImportPointer_typed
  end interface hipMemPoolImportPointer

  interface hipMemcpyWithStream
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorUnknown`,
    !> `hipErrorContextIsDestroyed`
    !>
    !> @see hipMemcpy, hipStreamCreate, hipStreamSynchronize, hipStreamDestroy, hipSetDevice,
    !> hipLaunchKernelGGL
    function hipMemcpyWithStream_raw(dst, src, sizeBytes, kind, stream) &
       result(MemcpyWithStream_raw) &
       bind(C, name="hipMemcpyWithStream")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyWithStream_raw
    end function hipMemcpyWithStream_raw

    module procedure hipMemcpyWithStream_typed
  end interface hipMemcpyWithStream

  interface hipMemcpyHtoDAsync
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
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue`
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyHtoDAsync_raw(dst, src, sizeBytes, stream) &
       result(MemcpyHtoDAsync_raw) &
       bind(C, name="hipMemcpyHtoDAsync")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyHtoDAsync_raw
    end function hipMemcpyHtoDAsync_raw

    module procedure hipMemcpyHtoDAsync_typed
  end interface hipMemcpyHtoDAsync

  interface hipMemcpyDtoHAsync
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
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue`
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyDtoHAsync_raw(dst, src, sizeBytes, stream) &
       result(MemcpyDtoHAsync_raw) &
       bind(C, name="hipMemcpyDtoHAsync")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyDtoHAsync_raw
    end function hipMemcpyDtoHAsync_raw

    module procedure hipMemcpyDtoHAsync_typed
  end interface hipMemcpyDtoHAsync

  interface hipMemcpyDtoDAsync
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
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue`
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyDtoDAsync_raw(dst, src, sizeBytes, stream) &
       result(MemcpyDtoDAsync_raw) &
       bind(C, name="hipMemcpyDtoDAsync")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyDtoDAsync_raw
    end function hipMemcpyDtoDAsync_raw

    module procedure hipMemcpyDtoDAsync_typed
  end interface hipMemcpyDtoDAsync

  interface hipMemcpyAtoHAsync
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
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue`
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyAtoHAsync_raw(dstHost, srcArray, srcOffset, ByteCount, stream) &
       result(MemcpyAtoHAsync_raw) &
       bind(C, name="hipMemcpyAtoHAsync")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dstHost
       type(c_ptr), value :: srcArray
       integer(c_long), value :: srcOffset
       integer(c_long), value :: ByteCount
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyAtoHAsync_raw
    end function hipMemcpyAtoHAsync_raw

    module procedure hipMemcpyAtoHAsync_typed
  end interface hipMemcpyAtoHAsync

  interface hipMemcpyHtoAAsync
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
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidValue`
    !>
    !> @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
    !> hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
    !> hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
    !> hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
    !> hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
    !> hipMemHostAlloc, hipMemHostGetDevicePointer
    function hipMemcpyHtoAAsync_raw(dstArray, dstOffset, srcHost, ByteCount, stream) &
       result(MemcpyHtoAAsync_raw) &
       bind(C, name="hipMemcpyHtoAAsync")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dstArray
       integer(c_long), value :: dstOffset
       type(c_ptr), value :: srcHost
       integer(c_long), value :: ByteCount
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyHtoAAsync_raw
    end function hipMemcpyHtoAAsync_raw

    module procedure hipMemcpyHtoAAsync_typed
  end interface hipMemcpyHtoAAsync

  interface hipModuleGetGlobal
    !---------------------------------------------
    ! hipModuleGetGlobal
    !---------------------------------------------
    !> @brief Returns a global pointer from a module.
    !> @ingroup Module
    !>
    !> Returns in *dptr and *bytes the pointer and size of the global of name name located in module
    !> hmod. If no variable of that name exists, it returns hipErrorNotFound. Both parameters dptr
    !> and
    !> bytes are optional. If one of them is NULL, it is ignored and hipSuccess is returned.
    !>
    !> @param[out]  dptr  Returns global device pointer
    !> @param[out]  bytes Returns global size in bytes
    !> @param[in]   hmod  Module to retrieve global from
    !> @param[in]   name  Name of global to retrieve
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotFound`, `hipErrorInvalidContext`
    function hipModuleGetGlobal_raw(dptr, bytes, hmod, name) &
       result(ModuleGetGlobal_raw) &
       bind(C, name="hipModuleGetGlobal")
       import :: c_ptr, c_int
       type(c_ptr) :: dptr
       type(c_ptr), value :: bytes
       type(c_ptr), value :: hmod
       type(c_ptr), value :: name
       integer(c_int) :: ModuleGetGlobal_raw
    end function hipModuleGetGlobal_raw

    module procedure hipModuleGetGlobal_typed
    module procedure hipModuleGetGlobal_cstr
  end interface hipModuleGetGlobal

  interface hipGetProcAddress
    !---------------------------------------------
    ! hipGetProcAddress
    !---------------------------------------------
    !> @brief Gets the pointer of requested HIP driver function.
    !>
    !> @param[in] symbol  The Symbol name of the driver function to request.
    !> @param[out] pfn  Output pointer to the requested driver function.
    !> @param[in] hipVersion  The HIP version for the requested driver function symbol.
    !> HIP version is defined as 100*version_major + version_minor. For example, in HIP 6.1, the
    !> hipversion is 601, for the symbol function "hipGetDeviceProperties", the specified hipVersion
    !> 601
    !> is greater or equal to the version 600, the symbol function will be handle properly as
    !> backend
    !> compatible function.
    !>
    !> @param[in] flags  Currently only default flag is suppported.
    !> @param[out] symbolStatus Optional enumeration for returned status of searching for symbol
    !> driver
    !> function based on the input hipVersion.
    !>
    !> Returns hipSuccess if the returned pfn is addressed to the pointer of found driver function.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`.
    function hipGetProcAddress_raw(symbol, pfn, hipVersion, flags, symbolStatus) &
       result(GetProcAddress_raw) &
       bind(C, name="hipGetProcAddress")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: symbol
       type(c_ptr) :: pfn
       integer(c_int), value :: hipVersion
       integer(c_long), value :: flags
       type(c_ptr), value :: symbolStatus
       integer(c_int) :: GetProcAddress_raw
    end function hipGetProcAddress_raw

    module procedure hipGetProcAddress_native
    module procedure hipGetProcAddress_cstr
  end interface hipGetProcAddress

  interface hipMemcpyToSymbolAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipMemcpyToSymbolAsync_raw(symbol, src, sizeBytes, offset, kind, stream) &
       result(MemcpyToSymbolAsync_raw) &
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
       integer(c_int) :: MemcpyToSymbolAsync_raw
    end function hipMemcpyToSymbolAsync_raw

    module procedure hipMemcpyToSymbolAsync_typed
  end interface hipMemcpyToSymbolAsync

  interface hipMemcpyFromSymbolAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipMemcpyFromSymbolAsync_raw(dst, symbol, sizeBytes, offset, kind, stream) &
       result(MemcpyFromSymbolAsync_raw) &
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
       integer(c_int) :: MemcpyFromSymbolAsync_raw
    end function hipMemcpyFromSymbolAsync_raw

    module procedure hipMemcpyFromSymbolAsync_typed
  end interface hipMemcpyFromSymbolAsync

  interface hipMemsetD8Async
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
    function hipMemsetD8Async_raw(dest, value, count, stream) &
       result(MemsetD8Async_raw) &
       bind(C, name="hipMemsetD8Async")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dest
       type(c_ptr), value :: value
       integer(c_long), value :: count
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD8Async_raw
    end function hipMemsetD8Async_raw

    module procedure hipMemsetD8Async_typed
  end interface hipMemsetD8Async

  interface hipMemsetD16Async
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
    function hipMemsetD16Async_raw(dest, value, count, stream) &
       result(MemsetD16Async_raw) &
       bind(C, name="hipMemsetD16Async")
       import :: c_ptr, c_short, c_long, c_int
       type(c_ptr), value :: dest
       integer(c_short), value :: value
       integer(c_long), value :: count
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD16Async_raw
    end function hipMemsetD16Async_raw

    module procedure hipMemsetD16Async_typed
  end interface hipMemsetD16Async

  interface hipMemsetAsync
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
    !> @return `hipSuccess`, `hipErrorInvalidValue`
    function hipMemsetAsync_raw(dst, value, sizeBytes, stream) &
       result(MemsetAsync_raw) &
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
       integer(c_int) :: MemsetAsync_raw
    end function hipMemsetAsync_raw

    module procedure hipMemsetAsync_typed
  end interface hipMemsetAsync

  interface hipMemsetD32Async
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
    !> @return `hipSuccess`, `hipErrorInvalidValue`
    function hipMemsetD32Async_raw(dst, value, count, stream) &
       result(MemsetD32Async_raw) &
       bind(C, name="hipMemsetD32Async")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dst
       integer(c_int), value :: value
       integer(c_long), value :: count
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD32Async_raw
    end function hipMemsetD32Async_raw

    module procedure hipMemsetD32Async_typed
  end interface hipMemsetD32Async

  interface hipMemset2DAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipMemset2DAsync_raw(dst, pitch, value, width, height, stream) &
       result(Memset2DAsync_raw) &
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
       integer(c_int) :: Memset2DAsync_raw
    end function hipMemset2DAsync_raw

    module procedure hipMemset2DAsync_typed
  end interface hipMemset2DAsync

  interface hipMemset3DAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipMemset3DAsync_raw(pitchedDevPtr, value, extent, stream) &
       result(Memset3DAsync_raw) &
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
       integer(c_int) :: Memset3DAsync_raw
    end function hipMemset3DAsync_raw

    module procedure hipMemset3DAsync_typed
  end interface hipMemset3DAsync

  interface hipMemsetD2D8Async
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipMemsetD2D8Async_raw(dst, dstPitch, value, width, height, stream) &
       result(MemsetD2D8Async_raw) &
       bind(C, name="hipMemsetD2D8Async")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dstPitch
       type(c_ptr), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD2D8Async_raw
    end function hipMemsetD2D8Async_raw

    module procedure hipMemsetD2D8Async_typed
  end interface hipMemsetD2D8Async

  interface hipMemsetD2D16Async
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipMemsetD2D16Async_raw(dst, dstPitch, value, width, height, stream) &
       result(MemsetD2D16Async_raw) &
       bind(C, name="hipMemsetD2D16Async")
       import :: c_ptr, c_long, c_short, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dstPitch
       integer(c_short), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD2D16Async_raw
    end function hipMemsetD2D16Async_raw

    module procedure hipMemsetD2D16Async_typed
  end interface hipMemsetD2D16Async

  interface hipMemsetD2D32Async
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipMemsetD2D32Async_raw(dst, dstPitch, value, width, height, stream) &
       result(MemsetD2D32Async_raw) &
       bind(C, name="hipMemsetD2D32Async")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: dstPitch
       integer(c_int), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetD2D32Async_raw
    end function hipMemsetD2D32Async_raw

    module procedure hipMemsetD2D32Async_typed
  end interface hipMemsetD2D32Async

  interface hipArrayGetInfo
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue` `hipErrorInvalidHandle`
    !>
    !> @see hipArrayGetDescriptor, hipArray3DGetDescriptor
    function hipArrayGetInfo_raw(desc, extent, flags, array) &
       result(ArrayGetInfo_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaArrayGetInfo")
#else
       bind(C, name="hipArrayGetInfo")
#endif
       import :: hipChannelFormatDesc, hipExtent, c_ptr, c_int
       type(hipChannelFormatDesc) :: desc
       type(hipExtent) :: extent
       type(c_ptr), value :: flags
       type(c_ptr), value :: array
       integer(c_int) :: ArrayGetInfo_raw
    end function hipArrayGetInfo_raw

    module procedure hipArrayGetInfo_native
  end interface hipArrayGetInfo

  interface hipMemcpyParam2DAsync
    !---------------------------------------------
    ! hipMemcpyParam2DAsync
    !---------------------------------------------
    !> @brief Copies memory for 2D arrays.
    !> @param[in]   pCopy Parameters for the memory copy
    !> @param[in]   stream Stream to use
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
    !>
    !> @see hipMemcpy, hipMemcpy2D, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray,
    !> hipMemcpyToSymbol, hipMemcpyAsync
    function hipMemcpyParam2DAsync_raw(pCopy, stream) &
       result(MemcpyParam2DAsync_raw) &
       bind(C, name="hipMemcpyParam2DAsync")
       import :: hip_Memcpy2D, c_ptr, c_int
       type(hip_Memcpy2D) :: pCopy
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyParam2DAsync_raw
    end function hipMemcpyParam2DAsync_raw

    module procedure hipMemcpyParam2DAsync_typed
  end interface hipMemcpyParam2DAsync

  interface hipMemcpy2DAsync
    !---------------------------------------------
    ! hipMemcpy2DAsync
    !---------------------------------------------
    !> @brief Copies data between host and device asynchronously.
    !>
    !> hipMemcpy2DAsync supports memory matrix copy from the pointed area src to the pointed area
    !> dst.
    !> The copy direction is defined by kind which must be one of `hipMemcpyHostToDevice`,
    !> `hipMemcpyDeviceToHost`, `hipMemcpyDeviceToDevice` or `hipMemcpyDefault`.
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
    !>
    !> @see hipMemcpy, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy2DAsync_raw(dst, dpitch, src, spitch, width, height, kind, stream) &
       result(Memcpy2DAsync_raw) &
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
       integer(c_int) :: Memcpy2DAsync_raw
    end function hipMemcpy2DAsync_raw

    module procedure hipMemcpy2DAsync_typed
  end interface hipMemcpy2DAsync

  interface hipMemcpy2DToArrayAsync
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
    !>
    !> @see hipMemcpy, hipMemcpyToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy2DToArrayAsync_raw(dst, wOffset, hOffset, src, spitch, width, height, kind, &
                                         stream) &
       result(Memcpy2DToArrayAsync_raw) &
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
       integer(c_int) :: Memcpy2DToArrayAsync_raw
    end function hipMemcpy2DToArrayAsync_raw

    module procedure hipMemcpy2DToArrayAsync_typed
  end interface hipMemcpy2DToArrayAsync

  interface hipMemcpy2DFromArrayAsync
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
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy2DFromArrayAsync_raw(dst, dpitch, src, wOffset, hOffset, width, height, &
                                           kind, stream) &
       result(Memcpy2DFromArrayAsync_raw) &
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
       integer(c_int) :: Memcpy2DFromArrayAsync_raw
    end function hipMemcpy2DFromArrayAsync_raw

    module procedure hipMemcpy2DFromArrayAsync_typed
  end interface hipMemcpy2DFromArrayAsync

  interface hipMemcpy3DAsync
    !---------------------------------------------
    ! hipMemcpy3DAsync
    !---------------------------------------------
    !> @brief Copies data between host and device asynchronously.
    !>
    !> @param[in]   p        3D memory copy parameters
    !> @param[in]   stream   Stream to use
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipMemcpy3DAsync_raw(p, stream) &
       result(Memcpy3DAsync_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy3DAsync")
#else
       bind(C, name="hipMemcpy3DAsync")
#endif
       import :: hipMemcpy3DParms, c_ptr, c_int
       type(hipMemcpy3DParms) :: p
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy3DAsync_raw
    end function hipMemcpy3DAsync_raw

    module procedure hipMemcpy3DAsync_typed
  end interface hipMemcpy3DAsync

  interface hipDrvMemcpy3DAsync
    !---------------------------------------------
    ! hipDrvMemcpy3DAsync
    !---------------------------------------------
    !> @brief Copies data between host and device asynchronously.
    !>
    !> @param[in]   pCopy    3D memory copy parameters
    !> @param[in]   stream   Stream to use
    !> @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
    !> `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
    !>
    !> @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
    !> hipMemcpyAsync
    function hipDrvMemcpy3DAsync_raw(pCopy, stream) &
       result(DrvMemcpy3DAsync_raw) &
       bind(C, name="hipDrvMemcpy3DAsync")
       import :: HIP_MEMCPY3D, c_ptr, c_int
       type(HIP_MEMCPY3D) :: pCopy
       type(c_ptr), value :: stream
       integer(c_int) :: DrvMemcpy3DAsync_raw
    end function hipDrvMemcpy3DAsync_raw

    module procedure hipDrvMemcpy3DAsync_typed
  end interface hipDrvMemcpy3DAsync

  interface hipMemcpyBatchAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipMemcpyBatchAsync_raw(dsts, srcs, sizes, count, attrs, attrsIdxs, numAttrs, &
                                     failIdx, stream) &
       result(MemcpyBatchAsync_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpyBatchAsync")
#else
       bind(C, name="hipMemcpyBatchAsync")
#endif
       import :: c_ptr, c_long, hipMemcpyAttributes, c_int
       type(c_ptr) :: dsts
       type(c_ptr) :: srcs
       type(c_ptr), value :: sizes
       integer(c_long), value :: count
       type(hipMemcpyAttributes) :: attrs
       type(c_ptr), value :: attrsIdxs
       integer(c_long), value :: numAttrs
       type(c_ptr), value :: failIdx
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyBatchAsync_raw
    end function hipMemcpyBatchAsync_raw

    module procedure hipMemcpyBatchAsync_typed
  end interface hipMemcpyBatchAsync

  interface hipMemcpy3DBatchAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipMemcpy3DBatchAsync_raw(numOps, opList, failIdx, flags, stream) &
       result(Memcpy3DBatchAsync_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy3DBatchAsync")
#else
       bind(C, name="hipMemcpy3DBatchAsync")
#endif
       import :: c_long, hipMemcpy3DBatchOp, c_ptr, c_int64_t, c_int
       integer(c_long), value :: numOps
       type(hipMemcpy3DBatchOp) :: opList
       type(c_ptr), value :: failIdx
       integer(c_int64_t), value :: flags
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy3DBatchAsync_raw
    end function hipMemcpy3DBatchAsync_raw

    module procedure hipMemcpy3DBatchAsync_typed
  end interface hipMemcpy3DBatchAsync

  interface hipMemcpy3DPeerAsync
    !---------------------------------------------
    ! hipMemcpy3DPeerAsync
    !---------------------------------------------
    !> @brief Performs 3D memory copies between devices asynchronously
    !>
    !> @param [in] p  - Parameters for memory copy
    !> @param [in] stream - Stream to enqueue operation in.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, hipErrorInvalidDevice
    function hipMemcpy3DPeerAsync_raw(p, stream) &
       result(Memcpy3DPeerAsync_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaMemcpy3DPeerAsync")
#else
       bind(C, name="hipMemcpy3DPeerAsync")
#endif
       import :: hipMemcpy3DPeerParms, c_ptr, c_int
       type(hipMemcpy3DPeerParms) :: p
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy3DPeerAsync_raw
    end function hipMemcpy3DPeerAsync_raw

    module procedure hipMemcpy3DPeerAsync_typed
  end interface hipMemcpy3DPeerAsync

  interface hipDeviceCanAccessPeer
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
    !> Returns `hipErrorInvalidDevice` if deviceId or peerDeviceId are not valid devices
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`
    function hipDeviceCanAccessPeer_raw(canAccessPeer, deviceId, peerDeviceId) &
       result(DeviceCanAccessPeer_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaDeviceCanAccessPeer")
#else
       bind(C, name="hipDeviceCanAccessPeer")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: canAccessPeer
       integer(c_int), value :: deviceId
       integer(c_int), value :: peerDeviceId
       integer(c_int) :: DeviceCanAccessPeer_raw
    end function hipDeviceCanAccessPeer_raw

    module procedure hipDeviceCanAccessPeer_native
  end interface hipDeviceCanAccessPeer

  interface hipMemcpyPeerAsync
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDevice`
    function hipMemcpyPeerAsync_raw(dst, dstDeviceId, src, srcDevice, sizeBytes, stream) &
       result(MemcpyPeerAsync_raw) &
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
       integer(c_int) :: MemcpyPeerAsync_raw
    end function hipMemcpyPeerAsync_raw

    module procedure hipMemcpyPeerAsync_typed
  end interface hipMemcpyPeerAsync

  interface hipCtxCreate
    !---------------------------------------------
    ! hipCtxCreate
    !---------------------------------------------
    !> @brief Create a context and set it as current/default context
    !>
    !> @param [out] ctx  Context to create
    !> @param [in] flags  Context creation flags
    !> @param [in] device  device handle
    !>
    !> @returns `hipSuccess`
    !>
    !> @see hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent, hipCtxPushCurrent,
    !> hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxCreate_raw(ctx, flags, device) &
       result(CtxCreate_raw) &
       bind(C, name="hipCtxCreate")
       import :: c_ptr, c_int
       type(c_ptr) :: ctx
       integer(c_int), value :: flags
       integer(c_int), value :: device
       integer(c_int) :: CtxCreate_raw
    end function hipCtxCreate_raw

    module procedure hipCtxCreate_typed
  end interface hipCtxCreate

  interface hipCtxDestroy
    !---------------------------------------------
    ! hipCtxDestroy
    !---------------------------------------------
    !> @brief Destroy a HIP context [Deprecated]
    !>
    !> @param [in] ctx Context to destroy
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @see hipCtxCreate, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,hipCtxSetCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize , hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxDestroy_raw(ctx) &
       result(CtxDestroy_raw) &
       bind(C, name="hipCtxDestroy")
       import :: c_ptr, c_int
       type(c_ptr), value :: ctx
       integer(c_int) :: CtxDestroy_raw
    end function hipCtxDestroy_raw

    module procedure hipCtxDestroy_typed
  end interface hipCtxDestroy

  interface hipCtxPopCurrent
    !---------------------------------------------
    ! hipCtxPopCurrent
    !---------------------------------------------
    !> @brief Pop the current/default context and return the popped context [Deprecated]
    !>
    !> @param [out] ctx  The current context to pop
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidContext`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxSetCurrent, hipCtxGetCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxPopCurrent_raw(ctx) &
       result(CtxPopCurrent_raw) &
       bind(C, name="hipCtxPopCurrent")
       import :: c_ptr, c_int
       type(c_ptr) :: ctx
       integer(c_int) :: CtxPopCurrent_raw
    end function hipCtxPopCurrent_raw

    module procedure hipCtxPopCurrent_typed
  end interface hipCtxPopCurrent

  interface hipCtxPushCurrent
    !---------------------------------------------
    ! hipCtxPushCurrent
    !---------------------------------------------
    !> @brief Push the context to be set as current/ default context [Deprecated]
    !>
    !> @param [in] ctx  The current context to push
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidContext`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize , hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxPushCurrent_raw(ctx) &
       result(CtxPushCurrent_raw) &
       bind(C, name="hipCtxPushCurrent")
       import :: c_ptr, c_int
       type(c_ptr), value :: ctx
       integer(c_int) :: CtxPushCurrent_raw
    end function hipCtxPushCurrent_raw

    module procedure hipCtxPushCurrent_typed
  end interface hipCtxPushCurrent

  interface hipCtxSetCurrent
    !---------------------------------------------
    ! hipCtxSetCurrent
    !---------------------------------------------
    !> @brief Set the passed context as current/default [Deprecated]
    !>
    !> @param [in] ctx The context to set as current
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidContext`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize , hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxSetCurrent_raw(ctx) &
       result(CtxSetCurrent_raw) &
       bind(C, name="hipCtxSetCurrent")
       import :: c_ptr, c_int
       type(c_ptr), value :: ctx
       integer(c_int) :: CtxSetCurrent_raw
    end function hipCtxSetCurrent_raw

    module procedure hipCtxSetCurrent_typed
  end interface hipCtxSetCurrent

  interface hipCtxGetCurrent
    !---------------------------------------------
    ! hipCtxGetCurrent
    !---------------------------------------------
    !> @brief Get the handle of the current/ default context [Deprecated]
    !>
    !> @param [out] ctx  The context to get as current
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidContext`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetDevice, hipCtxGetFlags, hipCtxPopCurrent,
    !> hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxGetCurrent_raw(ctx) &
       result(CtxGetCurrent_raw) &
       bind(C, name="hipCtxGetCurrent")
       import :: c_ptr, c_int
       type(c_ptr) :: ctx
       integer(c_int) :: CtxGetCurrent_raw
    end function hipCtxGetCurrent_raw

    module procedure hipCtxGetCurrent_typed
  end interface hipCtxGetCurrent

  interface hipCtxGetApiVersion
    !---------------------------------------------
    ! hipCtxGetApiVersion
    !---------------------------------------------
    !> @brief Returns the approximate HIP api version.
    !>
    !> @param [in]  ctx Context to check [Deprecated]
    !> @param [out] apiVersion API version to get
    !>
    !> @returns `hipSuccess`
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
    function hipCtxGetApiVersion_raw(ctx, apiVersion) &
       result(CtxGetApiVersion_raw) &
       bind(C, name="hipCtxGetApiVersion")
       import :: c_ptr, c_int
       type(c_ptr), value :: ctx
       type(c_ptr), value :: apiVersion
       integer(c_int) :: CtxGetApiVersion_raw
    end function hipCtxGetApiVersion_raw

    module procedure hipCtxGetApiVersion_native
    module procedure hipCtxGetApiVersion_typed
  end interface hipCtxGetApiVersion

  interface hipCtxGetCacheConfig
    !---------------------------------------------
    ! hipCtxGetCacheConfig
    !---------------------------------------------
    !> @brief Get Cache configuration for a specific function [Deprecated]
    !>
    !> @param [out] cacheConfig  Cache configuration
    !>
    !> @returns `hipSuccess`
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
    function hipCtxGetCacheConfig_raw(cacheConfig) &
       result(CtxGetCacheConfig_raw) &
       bind(C, name="hipCtxGetCacheConfig")
       import :: c_ptr, c_int
       type(c_ptr), value :: cacheConfig
       integer(c_int) :: CtxGetCacheConfig_raw
    end function hipCtxGetCacheConfig_raw

    module procedure hipCtxGetCacheConfig_native
  end interface hipCtxGetCacheConfig

  interface hipCtxGetSharedMemConfig
    !---------------------------------------------
    ! hipCtxGetSharedMemConfig
    !---------------------------------------------
    !> @brief Get Shared memory bank configuration [Deprecated]
    !>
    !> @param [out] pConfig  Pointer of shared memory configuration
    !>
    !> @return `hipSuccess`
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
    function hipCtxGetSharedMemConfig_raw(pConfig) &
       result(CtxGetSharedMemConfig_raw) &
       bind(C, name="hipCtxGetSharedMemConfig")
       import :: c_ptr, c_int
       type(c_ptr), value :: pConfig
       integer(c_int) :: CtxGetSharedMemConfig_raw
    end function hipCtxGetSharedMemConfig_raw

    module procedure hipCtxGetSharedMemConfig_native
  end interface hipCtxGetSharedMemConfig

  interface hipCtxGetFlags
    !---------------------------------------------
    ! hipCtxGetFlags
    !---------------------------------------------
    !> @brief Return flags used for creating default context [Deprecated]
    !>
    !> @param [out] flags  Pointer of flags
    !>
    !> @returns `hipSuccess`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxPopCurrent, hipCtxGetCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxGetFlags_raw(flags) &
       result(CtxGetFlags_raw) &
       bind(C, name="hipCtxGetFlags")
       import :: c_ptr, c_int
       type(c_ptr), value :: flags
       integer(c_int) :: CtxGetFlags_raw
    end function hipCtxGetFlags_raw

    module procedure hipCtxGetFlags_native
  end interface hipCtxGetFlags

  interface hipCtxEnablePeerAccess
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
    !> @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`,
    !> `hipErrorPeerAccessAlreadyEnabled`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !> @warning PeerToPeer support is experimental.
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxEnablePeerAccess_raw(peerCtx, flags) &
       result(CtxEnablePeerAccess_raw) &
       bind(C, name="hipCtxEnablePeerAccess")
       import :: c_ptr, c_int
       type(c_ptr), value :: peerCtx
       integer(c_int), value :: flags
       integer(c_int) :: CtxEnablePeerAccess_raw
    end function hipCtxEnablePeerAccess_raw

    module procedure hipCtxEnablePeerAccess_typed
  end interface hipCtxEnablePeerAccess

  interface hipCtxDisablePeerAccess
    !---------------------------------------------
    ! hipCtxDisablePeerAccess
    !---------------------------------------------
    !> @brief Disable direct access from current context's virtual address space to memory
    !> allocations
    !> physically located on a peer context.Disables direct access to memory allocations in a peer
    !> context and unregisters any registered allocations [Deprecated]
    !>
    !> Returns `hipErrorPeerAccessNotEnabled` if direct access to memory on peerDevice has not yet
    !> been
    !> enabled from the current device.
    !>
    !> @param [in] peerCtx  Peer context to be disabled
    !>
    !> @returns `hipSuccess`, `hipErrorPeerAccessNotEnabled`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !> @warning PeerToPeer support is experimental.
    !>
    !> @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
    !> the
    !> NVIDIA platform.
    function hipCtxDisablePeerAccess_raw(peerCtx) &
       result(CtxDisablePeerAccess_raw) &
       bind(C, name="hipCtxDisablePeerAccess")
       import :: c_ptr, c_int
       type(c_ptr), value :: peerCtx
       integer(c_int) :: CtxDisablePeerAccess_raw
    end function hipCtxDisablePeerAccess_raw

    module procedure hipCtxDisablePeerAccess_typed
  end interface hipCtxDisablePeerAccess

  interface hipDevicePrimaryCtxGetState
    !---------------------------------------------
    ! hipDevicePrimaryCtxGetState
    !---------------------------------------------
    !> @brief Get the state of the primary context [Deprecated]
    !>
    !> @param [in] dev  Device to get primary context flags for
    !> @param [out] flags  Pointer to store flags
    !> @param [out] active  Pointer to store context state; 0 = inactive, 1 = active
    !>
    !> @returns `hipSuccess`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
    !> NVIDIA platform.
    function hipDevicePrimaryCtxGetState_raw(dev, flags, active) &
       result(DevicePrimaryCtxGetState_raw) &
       bind(C, name="hipDevicePrimaryCtxGetState")
       import :: c_int, c_ptr
       integer(c_int), value :: dev
       type(c_ptr), value :: flags
       type(c_ptr), value :: active
       integer(c_int) :: DevicePrimaryCtxGetState_raw
    end function hipDevicePrimaryCtxGetState_raw

    module procedure hipDevicePrimaryCtxGetState_native
  end interface hipDevicePrimaryCtxGetState

  interface hipDevicePrimaryCtxRetain
    !---------------------------------------------
    ! hipDevicePrimaryCtxRetain
    !---------------------------------------------
    !> @brief Retain the primary context on the GPU [Deprecated]
    !>
    !> @param [out] pctx  Returned context handle of the new context
    !> @param [in] dev  Device which primary context is released
    !>
    !> @returns `hipSuccess`
    !>
    !> @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
    !> hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
    !>
    !> @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
    !> NVIDIA platform.
    function hipDevicePrimaryCtxRetain_raw(pctx, dev) &
       result(DevicePrimaryCtxRetain_raw) &
       bind(C, name="hipDevicePrimaryCtxRetain")
       import :: c_ptr, c_int
       type(c_ptr) :: pctx
       integer(c_int), value :: dev
       integer(c_int) :: DevicePrimaryCtxRetain_raw
    end function hipDevicePrimaryCtxRetain_raw

    module procedure hipDevicePrimaryCtxRetain_typed
  end interface hipDevicePrimaryCtxRetain

  interface hipModuleLoadFatBinary
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`,
    !> `hipErrorFileNotFound`,
    !> `hipErrorOutOfMemory`, `hipErrorSharedObjectInitFailed`, `hipErrorNotInitialized`
    function hipModuleLoadFatBinary_raw(module_, fatbin) &
       result(ModuleLoadFatBinary_raw) &
       bind(C, name="hipModuleLoadFatBinary")
       import :: c_ptr, c_int
       type(c_ptr) :: module_
       type(c_ptr), value :: fatbin
       integer(c_int) :: ModuleLoadFatBinary_raw
    end function hipModuleLoadFatBinary_raw

    module procedure hipModuleLoadFatBinary_typed
  end interface hipModuleLoadFatBinary

  interface hipModuleLoad
    !---------------------------------------------
    ! hipModuleLoad
    !---------------------------------------------
    !> @brief Loads code object from file into a module the currrent context.
    !>
    !> @param [in] fname  Filename of code object to load
    !>
    !> @param [out] module  Module
    !>
    !> @warning File/memory resources allocated in this function are released only in
    !> hipModuleUnload.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`,
    !> `hipErrorFileNotFound`,
    !> `hipErrorOutOfMemory`, `hipErrorSharedObjectInitFailed`, `hipErrorNotInitialized`
    function hipModuleLoad_raw(module_, fname) &
       result(ModuleLoad_raw) &
       bind(C, name="hipModuleLoad")
       import :: c_ptr, c_int
       type(c_ptr) :: module_
       type(c_ptr), value :: fname
       integer(c_int) :: ModuleLoad_raw
    end function hipModuleLoad_raw

    module procedure hipModuleLoad_typed
    module procedure hipModuleLoad_cstr
  end interface hipModuleLoad

  interface hipModuleUnload
    !---------------------------------------------
    ! hipModuleUnload
    !---------------------------------------------
    !> @brief Frees the module
    !>
    !> @param [in] module  Module to free
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidResourceHandle`
    !>
    !> The module is freed, and the code objects associated with it are destroyed.
    function hipModuleUnload_raw(module_) &
       result(ModuleUnload_raw) &
       bind(C, name="hipModuleUnload")
       import :: c_ptr, c_int
       type(c_ptr), value :: module_
       integer(c_int) :: ModuleUnload_raw
    end function hipModuleUnload_raw

    module procedure hipModuleUnload_typed
  end interface hipModuleUnload

  interface hipModuleGetFunction
    !---------------------------------------------
    ! hipModuleGetFunction
    !---------------------------------------------
    !> @brief Function with kname will be extracted if present in module
    !>
    !> @param [in] module  Module to get function from
    !> @param [in] kname  Pointer to the name of function
    !> @param [out] function  Pointer to function handle
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`,
    !> `hipErrorNotInitialized`,
    !> `hipErrorNotFound`,
    function hipModuleGetFunction_raw(function_, module_, kname) &
       result(ModuleGetFunction_raw) &
       bind(C, name="hipModuleGetFunction")
       import :: c_ptr, c_int
       type(c_ptr) :: function_
       type(c_ptr), value :: module_
       type(c_ptr), value :: kname
       integer(c_int) :: ModuleGetFunction_raw
    end function hipModuleGetFunction_raw

    module procedure hipModuleGetFunction_typed
    module procedure hipModuleGetFunction_cstr
  end interface hipModuleGetFunction

  interface hipModuleGetFunctionCount
    !---------------------------------------------
    ! hipModuleGetFunctionCount
    !---------------------------------------------
    !> @brief Returns the number of functions within a module.
    !>
    !> @param [in] mod  Module to get function count from
    !> @param [out] count  function count from module
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`,
    !> `hipErrorNotInitialized`,
    !> `hipErrorNotFound`,
    function hipModuleGetFunctionCount_raw(count, mod) &
       result(ModuleGetFunctionCount_raw) &
       bind(C, name="hipModuleGetFunctionCount")
       import :: c_ptr, c_int
       type(c_ptr), value :: count
       type(c_ptr), value :: mod
       integer(c_int) :: ModuleGetFunctionCount_raw
    end function hipModuleGetFunctionCount_raw

    module procedure hipModuleGetFunctionCount_native
    module procedure hipModuleGetFunctionCount_typed
  end interface hipModuleGetFunctionCount

  interface hipLibraryLoadData
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
    !> @return `hipSuccess`, `hipErrorInvalidValue`,
    function hipLibraryLoadData_raw(library, code, jitOptions, jitOptionsValues, numJitOptions, &
                                    libraryOptions, libraryOptionValues, numLibraryOptions) &
       result(LibraryLoadData_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaLibraryLoadData")
#else
       bind(C, name="hipLibraryLoadData")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: library
       type(c_ptr), value :: code
       type(c_ptr), value :: jitOptions
       type(c_ptr) :: jitOptionsValues
       integer(c_int), value :: numJitOptions
       type(c_ptr), value :: libraryOptions
       type(c_ptr) :: libraryOptionValues
       integer(c_int), value :: numLibraryOptions
       integer(c_int) :: LibraryLoadData_raw
    end function hipLibraryLoadData_raw

    module procedure hipLibraryLoadData_native
  end interface hipLibraryLoadData

  interface hipLibraryLoadFromFile
    !---------------------------------------------
    ! hipLibraryLoadFromFile
    !---------------------------------------------
    !> @brief Load hip Library from file
    !>
    !> @param [out] library Output Library
    !> @param [in] fileName file which contains code object
    !> @param [in] jitOptions JIT options, CUDA only
    !> @param [in] jitOptionsValues JIT options values, CUDA only
    !> @param [in] numJitOptions Number of JIT options
    !> @param [in] libraryOptions Library options
    !> @param [in] libraryOptionValues Library options values
    !> @param [in] numLibraryOptions Number of library options
    !> @return `hipSuccess`, `hipErrorInvalidValue`
    function hipLibraryLoadFromFile_raw(library, fileName, jitOptions, jitOptionsValues, &
                                        numJitOptions, libraryOptions, libraryOptionValues, &
                                        numLibraryOptions) &
       result(LibraryLoadFromFile_raw) &
       bind(C, name="hipLibraryLoadFromFile")
       import :: c_ptr, c_int
       type(c_ptr) :: library
       type(c_ptr), value :: fileName
       type(c_ptr), value :: jitOptions
       type(c_ptr) :: jitOptionsValues
       integer(c_int), value :: numJitOptions
       type(c_ptr), value :: libraryOptions
       type(c_ptr) :: libraryOptionValues
       integer(c_int), value :: numLibraryOptions
       integer(c_int) :: LibraryLoadFromFile_raw
    end function hipLibraryLoadFromFile_raw

    module procedure hipLibraryLoadFromFile_native
    module procedure hipLibraryLoadFromFile_cstr
  end interface hipLibraryLoadFromFile

  interface hipLibraryGetKernel
    !---------------------------------------------
    ! hipLibraryGetKernel
    !---------------------------------------------
    !> @brief Get Kernel object from library
    !>
    !> @param [out] pKernel Output kernel object
    !> @param [in] library Input hip library
    !> @param [in] name kernel name to be searched for
    !> @return `hipSuccess`, `hipErrorInvalidValue`
    function hipLibraryGetKernel_raw(pKernel, library, name) &
       result(LibraryGetKernel_raw) &
       bind(C, name="hipLibraryGetKernel")
       import :: c_ptr, c_int
       type(c_ptr) :: pKernel
       type(c_ptr), value :: library
       type(c_ptr), value :: name
       integer(c_int) :: LibraryGetKernel_raw
    end function hipLibraryGetKernel_raw

    module procedure hipLibraryGetKernel_cstr
  end interface hipLibraryGetKernel

  interface hipLibraryGetKernelCount
    !---------------------------------------------
    ! hipLibraryGetKernelCount
    !---------------------------------------------
    !> @brief Get Kernel count in library
    !>
    !> @param [out] count Count of kernels in library
    !> @param [in] library Input created hip library
    !> @return `hipSuccess`, `hipErrorInvalidValue`
    function hipLibraryGetKernelCount_raw(count, library) &
       result(LibraryGetKernelCount_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaLibraryGetKernelCount")
#else
       bind(C, name="hipLibraryGetKernelCount")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: count
       type(c_ptr), value :: library
       integer(c_int) :: LibraryGetKernelCount_raw
    end function hipLibraryGetKernelCount_raw

    module procedure hipLibraryGetKernelCount_native
  end interface hipLibraryGetKernelCount

  interface hipFuncGetAttribute
    !---------------------------------------------
    ! hipFuncGetAttribute
    !---------------------------------------------
    !> @brief Find out a specific attribute for a given function.
    !> @ingroup Execution
    !> @param [out] value  Pointer to the value
    !> @param [in]  attrib  Attributes of the given funtion
    !> @param [in]  hfunc  Function to get attributes from
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDeviceFunction`
    function hipFuncGetAttribute_raw(value, attrib, hfunc) &
       result(FuncGetAttribute_raw) &
       bind(C, name="hipFuncGetAttribute")
       import :: c_ptr, c_int
       type(c_ptr), value :: value
       integer(c_int), value :: attrib
       type(c_ptr), value :: hfunc
       integer(c_int) :: FuncGetAttribute_raw
    end function hipFuncGetAttribute_raw

    module procedure hipFuncGetAttribute_native
    module procedure hipFuncGetAttribute_typed
  end interface hipFuncGetAttribute

  interface hipGetFuncBySymbol
    !---------------------------------------------
    ! hipGetFuncBySymbol
    !---------------------------------------------
    !> @brief Gets pointer to device entry function that matches entry function symbolPtr.
    !>
    !> @param [out] functionPtr  Device entry function
    !> @param [in]  symbolPtr  Pointer to device entry function to search for
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidDeviceFunction`
    function hipGetFuncBySymbol_raw(functionPtr, symbolPtr) &
       result(GetFuncBySymbol_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGetFuncBySymbol")
#else
       bind(C, name="hipGetFuncBySymbol")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: functionPtr
       type(c_ptr), value :: symbolPtr
       integer(c_int) :: GetFuncBySymbol_raw
    end function hipGetFuncBySymbol_raw

    module procedure hipGetFuncBySymbol_typed
  end interface hipGetFuncBySymbol

  interface hipGetDriverEntryPoint
    !---------------------------------------------
    ! hipGetDriverEntryPoint
    !---------------------------------------------
    !> @brief Gets function pointer of a requested HIP API
    !>
    !> @param [in]  symbol  The API base name
    !> @param [out] funcPtr  Pointer to the requested function
    !> @param [in]  flags  Flags for the search
    !> @param [out] driverStatus  Optional returned status of the search
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGetDriverEntryPoint_raw(symbol, funcPtr, flags, driverStatus) &
       result(GetDriverEntryPoint_raw) &
       bind(C, name="hipGetDriverEntryPoint")
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr), value :: symbol
       type(c_ptr) :: funcPtr
       integer(c_int64_t), value :: flags
       type(c_ptr), value :: driverStatus
       integer(c_int) :: GetDriverEntryPoint_raw
    end function hipGetDriverEntryPoint_raw

    module procedure hipGetDriverEntryPoint_native
    module procedure hipGetDriverEntryPoint_cstr
  end interface hipGetDriverEntryPoint

  interface hipModuleGetTexRef
    !---------------------------------------------
    ! hipModuleGetTexRef
    !---------------------------------------------
    !> @brief returns the handle of the texture reference with the name from the module.
    !>
    !> @param [in] hmod  Module
    !> @param [in] name  Pointer of name of texture reference
    !> @param [out] texRef  Pointer of texture reference
    !>
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorNotFound`, `hipErrorInvalidValue`
    function hipModuleGetTexRef_raw(texRef, hmod, name) &
       result(ModuleGetTexRef_raw) &
       bind(C, name="hipModuleGetTexRef")
       import :: c_ptr, c_int
       type(c_ptr) :: texRef
       type(c_ptr), value :: hmod
       type(c_ptr), value :: name
       integer(c_int) :: ModuleGetTexRef_raw
    end function hipModuleGetTexRef_raw

    module procedure hipModuleGetTexRef_typed
    module procedure hipModuleGetTexRef_cstr
  end interface hipModuleGetTexRef

  interface hipModuleLoadData
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
    function hipModuleLoadData_raw(module_, image) &
       result(ModuleLoadData_raw) &
       bind(C, name="hipModuleLoadData")
       import :: c_ptr, c_int
       type(c_ptr) :: module_
       type(c_ptr), value :: image
       integer(c_int) :: ModuleLoadData_raw
    end function hipModuleLoadData_raw

    module procedure hipModuleLoadData_typed
  end interface hipModuleLoadData

  interface hipModuleLoadDataEx
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
    function hipModuleLoadDataEx_raw(module_, image, numOptions, options, optionValues) &
       result(ModuleLoadDataEx_raw) &
       bind(C, name="hipModuleLoadDataEx")
       import :: c_ptr, c_int
       type(c_ptr) :: module_
       type(c_ptr), value :: image
       integer(c_int), value :: numOptions
       type(c_ptr), value :: options
       type(c_ptr) :: optionValues
       integer(c_int) :: ModuleLoadDataEx_raw
    end function hipModuleLoadDataEx_raw

    module procedure hipModuleLoadDataEx_native
    module procedure hipModuleLoadDataEx_typed
  end interface hipModuleLoadDataEx

  interface hipLinkAddData
    !---------------------------------------------
    ! hipLinkAddData
    !---------------------------------------------
    !> @brief Adds bitcode data to be linked with options.
    !> @param [in] state hip link state
    !> @param [in] type  Type of the input data or bitcode
    !> @param [in] data  Input data which is null terminated
    !> @param [in] size  Size of the input data
    !> @param [in] name  Optional name for this input
    !> @param [in] numOptions  Size of the options
    !> @param [in] options  Array of options applied to this input
    !> @param [in] optionValues  Array of option values cast to void*
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidHandle`
    !>
    !> If adding the file fails, it will
    !> @return `hipErrorInvalidConfiguration`
    !>
    !> @see hipError_t
    function hipLinkAddData_raw(state, type, data, size, name, numOptions, options, optionValues) &
       result(LinkAddData_raw) &
       bind(C, name="hipLinkAddData")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: state
       integer(c_int), value :: type
       type(c_ptr), value :: data
       integer(c_long), value :: size
       type(c_ptr), value :: name
       integer(c_int), value :: numOptions
       type(c_ptr), value :: options
       type(c_ptr) :: optionValues
       integer(c_int) :: LinkAddData_raw
    end function hipLinkAddData_raw

    module procedure hipLinkAddData_native
    module procedure hipLinkAddData_cstr
  end interface hipLinkAddData

  interface hipLinkAddFile
    !---------------------------------------------
    ! hipLinkAddFile
    !---------------------------------------------
    !> @brief Adds a file with bitcode to be linked with options.
    !> @param [in] state hip link state
    !> @param [in] type  Type of the input data or bitcode
    !> @param [in] path  Path to the input file where bitcode is present
    !> @param [in] numOptions  Size of the options
    !> @param [in] options  Array of options applied to this input
    !> @param [in] optionValues  Array of option values cast to void*
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> If adding the file fails, it will
    !> @return `hipErrorInvalidConfiguration`
    !>
    !> @see hipError_t
    function hipLinkAddFile_raw(state, type, path, numOptions, options, optionValues) &
       result(LinkAddFile_raw) &
       bind(C, name="hipLinkAddFile")
       import :: c_ptr, c_int
       type(c_ptr), value :: state
       integer(c_int), value :: type
       type(c_ptr), value :: path
       integer(c_int), value :: numOptions
       type(c_ptr), value :: options
       type(c_ptr) :: optionValues
       integer(c_int) :: LinkAddFile_raw
    end function hipLinkAddFile_raw

    module procedure hipLinkAddFile_native
    module procedure hipLinkAddFile_cstr
  end interface hipLinkAddFile

  interface hipLinkCreate
    !---------------------------------------------
    ! hipLinkCreate
    !---------------------------------------------
    !> @brief Creates a linker instance with options.
    !> @param [in] numOptions  Number of options
    !> @param [in] options  Array of options
    !> @param [in] optionValues  Array of option values cast to void*
    !> @param [out] stateOut  hip link state created upon success
    !>
    !> @returns `hipSuccess` `hipErrorInvalidValue` `hipErrorInvalidConfiguration`
    !>
    !> @see hipSuccess
    function hipLinkCreate_raw(numOptions, options, optionValues, stateOut) &
       result(LinkCreate_raw) &
       bind(C, name="hipLinkCreate")
       import :: c_int, c_ptr
       integer(c_int), value :: numOptions
       type(c_ptr), value :: options
       type(c_ptr) :: optionValues
       type(c_ptr) :: stateOut
       integer(c_int) :: LinkCreate_raw
    end function hipLinkCreate_raw

    module procedure hipLinkCreate_native
  end interface hipLinkCreate

  interface hipModuleLaunchKernel
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
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`
    function hipModuleLaunchKernel_raw(f, gridDimX, gridDimY, gridDimZ, blockDimX, blockDimY, &
                                       blockDimZ, sharedMemBytes, stream, kernelParams, extra) &
       result(ModuleLaunchKernel_raw) &
       bind(C, name="hipModuleLaunchKernel")
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
       integer(c_int) :: ModuleLaunchKernel_raw
    end function hipModuleLaunchKernel_raw

    module procedure hipModuleLaunchKernel_typed
  end interface hipModuleLaunchKernel

  interface hipModuleLaunchCooperativeKernel
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
    !> size \f$ gridDim \cdot blockDim &ge; 2^{32} \f$.
    !>
    !> @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
    !> `hipErrorInvalidContext`,
    !> `hipErrorInvalidHandle`, `hipErrorInvalidImage`, `hipErrorInvalidValue`,
    !> `hipErrorInvalidConfiguration`, `hipErrorLaunchFailure`, `hipErrorLaunchOutOfResources`,
    !> `hipErrorLaunchTimeOut`, `hipErrorCooperativeLaunchTooLarge`,
    !> `hipErrorSharedObjectInitFailed`
    function hipModuleLaunchCooperativeKernel_raw(f, gridDimX, gridDimY, gridDimZ, blockDimX, &
                                                  blockDimY, blockDimZ, sharedMemBytes, stream, &
                                                  kernelParams) &
       result(ModuleLaunchCooperativeKernel_raw) &
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
       integer(c_int) :: ModuleLaunchCooperativeKernel_raw
    end function hipModuleLaunchCooperativeKernel_raw

    module procedure hipModuleLaunchCooperativeKernel_typed
  end interface hipModuleLaunchCooperativeKernel

  interface hipLaunchCooperativeKernel
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
    !> size \f$ gridDim \cdot blockDim &ge; 2^{32} \f$.
    !>
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`,
    !> `hipErrorCooperativeLaunchTooLarge`
    function hipLaunchCooperativeKernel_raw(f, gridDim, blockDimX, kernelParams, sharedMemBytes, &
                                            stream) &
       result(LaunchCooperativeKernel_raw) &
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
       integer(c_int) :: LaunchCooperativeKernel_raw
    end function hipLaunchCooperativeKernel_raw

    module procedure hipLaunchCooperativeKernel_typed
  end interface hipLaunchCooperativeKernel

  interface hipDrvLaunchKernelEx
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
    !> @returns `hipSuccess` if the kernel is launched successfully, otherwise an appropriate error
    !> code.
    function hipDrvLaunchKernelEx_raw(config, f, params, extra) &
       result(DrvLaunchKernelEx_raw) &
       bind(C, name="hipDrvLaunchKernelEx")
       import :: HIP_LAUNCH_CONFIG, c_ptr, c_int
       type(HIP_LAUNCH_CONFIG) :: config
       type(c_ptr), value :: f
       type(c_ptr) :: params
       type(c_ptr) :: extra
       integer(c_int) :: DrvLaunchKernelEx_raw
    end function hipDrvLaunchKernelEx_raw

    module procedure hipDrvLaunchKernelEx_typed
  end interface hipDrvLaunchKernelEx

  interface hipModuleOccupancyMaxPotentialBlockSize
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipModuleOccupancyMaxPotentialBlockSize_raw(gridSize, blockSize, f, &
                                                         dynSharedMemPerBlk, blockSizeLimit) &
       result(ModuleOccupancyMaxPotentialBlockSize_raw) &
       bind(C, name="hipModuleOccupancyMaxPotentialBlockSize")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: gridSize
       type(c_ptr), value :: blockSize
       type(c_ptr), value :: f
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int), value :: blockSizeLimit
       integer(c_int) :: ModuleOccupancyMaxPotentialBlockSize_raw
    end function hipModuleOccupancyMaxPotentialBlockSize_raw

    module procedure hipModuleOccupancyMaxPotentialBlockSize_native
    module procedure hipModuleOccupancyMaxPotentialBlockSize_typed
  end interface hipModuleOccupancyMaxPotentialBlockSize

  interface hipModuleOccupancyMaxPotentialBlockSizeWithFlags
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_raw(gridSize, blockSize, f, &
                                                                  dynSharedMemPerBlk, &
                                                                  blockSizeLimit, flags) &
       result(ModuleOccupancyMaxPotentialBlockSizeWithFlags_raw) &
       bind(C, name="hipModuleOccupancyMaxPotentialBlockSizeWithFlags")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: gridSize
       type(c_ptr), value :: blockSize
       type(c_ptr), value :: f
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int), value :: blockSizeLimit
       integer(c_int), value :: flags
       integer(c_int) :: ModuleOccupancyMaxPotentialBlockSizeWithFlags_raw
    end function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_raw

    module procedure hipModuleOccupancyMaxPotentialBlockSizeWithFlags_native
    module procedure hipModuleOccupancyMaxPotentialBlockSizeWithFlags_typed
  end interface hipModuleOccupancyMaxPotentialBlockSizeWithFlags

  interface hipModuleOccupancyMaxActiveBlocksPerMultiprocessor
    !---------------------------------------------
    ! hipModuleOccupancyMaxActiveBlocksPerMultiprocessor
    !---------------------------------------------
    !> @brief Returns occupancy for a device function.
    !>
    !> @param [out] numBlocks        Returned occupancy
    !> @param [in]  f                Kernel function (hipFunction) for which occupancy is calulated
    !> @param [in]  blockSize        Block size the kernel is intended to be launched with
    !> @param [in] dynSharedMemPerBlk Dynamic shared memory usage (in bytes) intended for each block
    !> @returns  `hipSuccess`, `hipErrorInvalidValue`
    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_raw(numBlocks, f, blockSize, &
                                                                    dynSharedMemPerBlk) &
       result(ModuleOccupancyMaxActiveBlocksPerMultiprocessor_raw) &
       bind(C, name="hipModuleOccupancyMaxActiveBlocksPerMultiprocessor")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: numBlocks
       type(c_ptr), value :: f
       integer(c_int), value :: blockSize
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int) :: ModuleOccupancyMaxActiveBlocksPerMultiprocessor_raw
    end function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_raw

    module procedure hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_native
    module procedure hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_typed
  end interface hipModuleOccupancyMaxActiveBlocksPerMultiprocessor

  interface hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
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
    !> @returns  `hipSuccess`, `hipErrorInvalidValue`
    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_raw(numBlocks, f, &
                                                                             blockSize, &
                                                                             dynSharedMemPerBlk, &
                                                                             flags) &
       result(ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_raw) &
       bind(C, name="hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: numBlocks
       type(c_ptr), value :: f
       integer(c_int), value :: blockSize
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int), value :: flags
       integer(c_int) :: ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_raw
    end function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_raw

    module procedure hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFl_native
    module procedure hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFla_typed
  end interface hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags

  interface hipOccupancyMaxActiveBlocksPerMultiprocessor
    !---------------------------------------------
    ! hipOccupancyMaxActiveBlocksPerMultiprocessor
    !---------------------------------------------
    !> @brief Returns occupancy for a device function.
    !>
    !> @param [out] numBlocks        Returned occupancy
    !> @param [in]  f                Kernel function for which occupancy is calulated
    !> @param [in]  blockSize        Block size the kernel is intended to be launched with
    !> @param [in] dynSharedMemPerBlk Dynamic shared memory usage (in bytes) intended for each block
    !> @returns  `hipSuccess`, `hipErrorInvalidDeviceFunction`, `hipErrorInvalidValue`
    function hipOccupancyMaxActiveBlocksPerMultiprocessor_raw(numBlocks, f, blockSize, &
                                                              dynSharedMemPerBlk) &
       result(OccupancyMaxActiveBlocksPerMultiprocessor_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaOccupancyMaxActiveBlocksPerMultiprocessor")
#else
       bind(C, name="hipOccupancyMaxActiveBlocksPerMultiprocessor")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: numBlocks
       type(c_ptr), value :: f
       integer(c_int), value :: blockSize
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int) :: OccupancyMaxActiveBlocksPerMultiprocessor_raw
    end function hipOccupancyMaxActiveBlocksPerMultiprocessor_raw

    module procedure hipOccupancyMaxActiveBlocksPerMultiprocessor_native
  end interface hipOccupancyMaxActiveBlocksPerMultiprocessor

  interface hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
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
    !> @returns  `hipSuccess`, `hipErrorInvalidDeviceFunction`, `hipErrorInvalidValue`
    function hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_raw(numBlocks, f, blockSize, &
                                                                       dynSharedMemPerBlk, flags) &
       result(OccupancyMaxActiveBlocksPerMultiprocessorWithFlags_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
#else
       bind(C, name="hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: numBlocks
       type(c_ptr), value :: f
       integer(c_int), value :: blockSize
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int), value :: flags
       integer(c_int) :: OccupancyMaxActiveBlocksPerMultiprocessorWithFlags_raw
    end function hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_raw

    module procedure hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_native
  end interface hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags

  interface hipOccupancyMaxPotentialBlockSize
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipOccupancyMaxPotentialBlockSize_raw(gridSize, blockSize, f, dynSharedMemPerBlk, &
                                                   blockSizeLimit) &
       result(OccupancyMaxPotentialBlockSize_raw) &
       bind(C, name="hipOccupancyMaxPotentialBlockSize")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: gridSize
       type(c_ptr), value :: blockSize
       type(c_ptr), value :: f
       integer(c_long), value :: dynSharedMemPerBlk
       integer(c_int), value :: blockSizeLimit
       integer(c_int) :: OccupancyMaxPotentialBlockSize_raw
    end function hipOccupancyMaxPotentialBlockSize_raw

    module procedure hipOccupancyMaxPotentialBlockSize_native
  end interface hipOccupancyMaxPotentialBlockSize

  interface hipConfigureCall
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
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`
    function hipConfigureCall_raw(gridDim, blockDim, sharedMem, stream) &
       result(ConfigureCall_raw) &
       bind(C, name="hipConfigureCall")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: gridDim
       type(c_ptr), value :: blockDim
       integer(c_long), value :: sharedMem
       type(c_ptr), value :: stream
       integer(c_int) :: ConfigureCall_raw
    end function hipConfigureCall_raw

    module procedure hipConfigureCall_typed
  end interface hipConfigureCall

  interface hipLaunchKernel
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipLaunchKernel_raw(function_address, numBlocks, dimBlocks, args, sharedMemBytes, &
                                 stream) &
       result(LaunchKernel_raw) &
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
       integer(c_int) :: LaunchKernel_raw
    end function hipLaunchKernel_raw

    module procedure hipLaunchKernel_typed
  end interface hipLaunchKernel

  interface hipLaunchHostFunc
    !---------------------------------------------
    ! hipLaunchHostFunc
    !---------------------------------------------
    !> @brief Enqueues a host function call in a stream.
    !>
    !> @param [in] stream - The stream to enqueue work in.
    !> @param [in] fn - The function to call once enqueued preceeding operations are complete.
    !> @param [in] userData - User-specified data to be passed to the function.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidResourceHandle`, `hipErrorInvalidValue`,
    !> `hipErrorNotSupported`
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
    function hipLaunchHostFunc_raw(stream, fn, userData) &
       result(LaunchHostFunc_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaLaunchHostFunc")
#else
       bind(C, name="hipLaunchHostFunc")
#endif
       import :: c_ptr, c_funptr, c_int
       type(c_ptr), value :: stream
       type(c_funptr), value :: fn
       type(c_ptr), value :: userData
       integer(c_int) :: LaunchHostFunc_raw
    end function hipLaunchHostFunc_raw

    module procedure hipLaunchHostFunc_typed
  end interface hipLaunchHostFunc

  interface hipExtLaunchKernel
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
    !> @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`.
    function hipExtLaunchKernel_raw(function_address, numBlocks, dimBlocks, args, sharedMemBytes, &
                                    stream, startEvent, stopEvent, flags) &
       result(ExtLaunchKernel_raw) &
       bind(C, name="hipExtLaunchKernel")
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
       integer(c_int) :: ExtLaunchKernel_raw
    end function hipExtLaunchKernel_raw

    module procedure hipExtLaunchKernel_typed
  end interface hipExtLaunchKernel

  interface hipTexRefGetBorderColor
    !---------------------------------------------
    ! hipTexRefGetBorderColor
    !---------------------------------------------
    !> @brief Gets the border color used by a texture reference [Deprecated]
    !>
    !> @param [out] pBorderColor  Returned Type and Value of RGBA color.
    !> @param [in] texRef  Texture reference.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !> @warning This API is deprecated.
    function hipTexRefGetBorderColor_raw(pBorderColor, texRef) &
       result(TexRefGetBorderColor_raw) &
       bind(C, name="hipTexRefGetBorderColor")
       import :: c_ptr, textureReference, c_int
       type(c_ptr), value :: pBorderColor
       type(textureReference) :: texRef
       integer(c_int) :: TexRefGetBorderColor_raw
    end function hipTexRefGetBorderColor_raw

    module procedure hipTexRefGetBorderColor_native
  end interface hipTexRefGetBorderColor

  interface hipTexRefGetAddressMode
    !---------------------------------------------
    ! hipTexRefGetAddressMode
    !---------------------------------------------
    !> @brief Gets the address mode for a texture reference [Deprecated]
    !>
    !> @param [out] pam  Pointer of address mode.
    !> @param [in] texRef  Pointer of texture reference.
    !> @param [in] dim  Dimension.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetAddressMode_raw(pam, texRef, dim) &
       result(TexRefGetAddressMode_raw) &
       bind(C, name="hipTexRefGetAddressMode")
       import :: c_ptr, textureReference, c_int
       type(c_ptr), value :: pam
       type(textureReference) :: texRef
       integer(c_int), value :: dim
       integer(c_int) :: TexRefGetAddressMode_raw
    end function hipTexRefGetAddressMode_raw

    module procedure hipTexRefGetAddressMode_native
  end interface hipTexRefGetAddressMode

  interface hipTexRefGetFilterMode
    !---------------------------------------------
    ! hipTexRefGetFilterMode
    !---------------------------------------------
    !> @brief Gets filter mode for a texture reference [Deprecated]
    !>
    !> @param [out] pfm  Pointer of filter mode.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetFilterMode_raw(pfm, texRef) &
       result(TexRefGetFilterMode_raw) &
       bind(C, name="hipTexRefGetFilterMode")
       import :: c_ptr, textureReference, c_int
       type(c_ptr), value :: pfm
       type(textureReference) :: texRef
       integer(c_int) :: TexRefGetFilterMode_raw
    end function hipTexRefGetFilterMode_raw

    module procedure hipTexRefGetFilterMode_native
  end interface hipTexRefGetFilterMode

  interface hipTexRefGetFlags
    !---------------------------------------------
    ! hipTexRefGetFlags
    !---------------------------------------------
    !> @brief Gets flags for a texture reference [Deprecated]
    !>
    !> @param [out] pFlags  Pointer of flags.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetFlags_raw(pFlags, texRef) &
       result(TexRefGetFlags_raw) &
       bind(C, name="hipTexRefGetFlags")
       import :: c_ptr, textureReference, c_int
       type(c_ptr), value :: pFlags
       type(textureReference) :: texRef
       integer(c_int) :: TexRefGetFlags_raw
    end function hipTexRefGetFlags_raw

    module procedure hipTexRefGetFlags_native
  end interface hipTexRefGetFlags

  interface hipTexRefGetFormat
    !---------------------------------------------
    ! hipTexRefGetFormat
    !---------------------------------------------
    !> @brief Gets texture format for a texture reference [Deprecated]
    !>
    !> @param [out] pFormat  Pointer of the format.
    !> @param [out] pNumChannels  Pointer of number of channels.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetFormat_raw(pFormat, pNumChannels, texRef) &
       result(TexRefGetFormat_raw) &
       bind(C, name="hipTexRefGetFormat")
       import :: c_ptr, textureReference, c_int
       type(c_ptr), value :: pFormat
       type(c_ptr), value :: pNumChannels
       type(textureReference) :: texRef
       integer(c_int) :: TexRefGetFormat_raw
    end function hipTexRefGetFormat_raw

    module procedure hipTexRefGetFormat_native
  end interface hipTexRefGetFormat

  interface hipTexRefGetMaxAnisotropy
    !---------------------------------------------
    ! hipTexRefGetMaxAnisotropy
    !---------------------------------------------
    !> @brief Gets the maximum anisotropy for a texture reference [Deprecated]
    !>
    !> @param [out] pmaxAnsio  Pointer of the maximum anisotropy.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetMaxAnisotropy_raw(pmaxAnsio, texRef) &
       result(TexRefGetMaxAnisotropy_raw) &
       bind(C, name="hipTexRefGetMaxAnisotropy")
       import :: c_ptr, textureReference, c_int
       type(c_ptr), value :: pmaxAnsio
       type(textureReference) :: texRef
       integer(c_int) :: TexRefGetMaxAnisotropy_raw
    end function hipTexRefGetMaxAnisotropy_raw

    module procedure hipTexRefGetMaxAnisotropy_native
  end interface hipTexRefGetMaxAnisotropy

  interface hipTexRefGetMipmapFilterMode
    !---------------------------------------------
    ! hipTexRefGetMipmapFilterMode
    !---------------------------------------------
    !> @brief Gets the mipmap filter mode for a texture reference [Deprecated]
    !>
    !> @param [out] pfm  Pointer of the mipmap filter mode.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetMipmapFilterMode_raw(pfm, texRef) &
       result(TexRefGetMipmapFilterMode_raw) &
       bind(C, name="hipTexRefGetMipmapFilterMode")
       import :: c_ptr, textureReference, c_int
       type(c_ptr), value :: pfm
       type(textureReference) :: texRef
       integer(c_int) :: TexRefGetMipmapFilterMode_raw
    end function hipTexRefGetMipmapFilterMode_raw

    module procedure hipTexRefGetMipmapFilterMode_native
  end interface hipTexRefGetMipmapFilterMode

  interface hipTexRefGetMipmapLevelBias
    !---------------------------------------------
    ! hipTexRefGetMipmapLevelBias
    !---------------------------------------------
    !> @brief Gets the mipmap level bias for a texture reference [Deprecated]
    !>
    !> @param [out] pbias  Pointer of the mipmap level bias.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetMipmapLevelBias_raw(pbias, texRef) &
       result(TexRefGetMipmapLevelBias_raw) &
       bind(C, name="hipTexRefGetMipmapLevelBias")
       import :: c_ptr, textureReference, c_int
       type(c_ptr), value :: pbias
       type(textureReference) :: texRef
       integer(c_int) :: TexRefGetMipmapLevelBias_raw
    end function hipTexRefGetMipmapLevelBias_raw

    module procedure hipTexRefGetMipmapLevelBias_native
  end interface hipTexRefGetMipmapLevelBias

  interface hipTexRefGetMipmapLevelClamp
    !---------------------------------------------
    ! hipTexRefGetMipmapLevelClamp
    !---------------------------------------------
    !> @brief Gets the minimum and maximum mipmap level clamps for a texture reference [Deprecated]
    !>
    !> @param [out] pminMipmapLevelClamp  Pointer of the minimum mipmap level clamp.
    !> @param [out] pmaxMipmapLevelClamp  Pointer of the maximum mipmap level clamp.
    !> @param [in] texRef  Pointer of texture reference.
    !>
    !> @returns `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefGetMipmapLevelClamp_raw(pminMipmapLevelClamp, pmaxMipmapLevelClamp, texRef) &
       result(TexRefGetMipmapLevelClamp_raw) &
       bind(C, name="hipTexRefGetMipmapLevelClamp")
       import :: c_ptr, textureReference, c_int
       type(c_ptr), value :: pminMipmapLevelClamp
       type(c_ptr), value :: pmaxMipmapLevelClamp
       type(textureReference) :: texRef
       integer(c_int) :: TexRefGetMipmapLevelClamp_raw
    end function hipTexRefGetMipmapLevelClamp_raw

    module procedure hipTexRefGetMipmapLevelClamp_native
  end interface hipTexRefGetMipmapLevelClamp

  interface hipTexRefSetBorderColor
    !---------------------------------------------
    ! hipTexRefSetBorderColor
    !---------------------------------------------
    !> @brief Sets border color for a texture reference [Deprecated]
    !>
    !> @param [in] texRef  Pointer of texture reference.
    !> @param [in] pBorderColor  Pointer of border color.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !>
    !> @warning This API is deprecated.
    function hipTexRefSetBorderColor_raw(texRef, pBorderColor) &
       result(TexRefSetBorderColor_raw) &
       bind(C, name="hipTexRefSetBorderColor")
       import :: textureReference, c_ptr, c_int
       type(textureReference) :: texRef
       type(c_ptr), value :: pBorderColor
       integer(c_int) :: TexRefSetBorderColor_raw
    end function hipTexRefSetBorderColor_raw

    module procedure hipTexRefSetBorderColor_native
  end interface hipTexRefSetBorderColor

  interface hipKernelNameRef
    !---------------------------------------------
    ! hipKernelNameRef
    !---------------------------------------------
    !> @brief Returns kernel name reference by function name.
    !>
    !> @param [in] f Name of function
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipKernelNameRef_raw(f) &
       result(KernelNameRef_raw) &
       bind(C, name="hipKernelNameRef")
       import :: c_ptr, c_char
       type(c_ptr), value :: f
       character(c_char) :: KernelNameRef_raw
    end function hipKernelNameRef_raw

    module procedure hipKernelNameRef_typed
  end interface hipKernelNameRef

  interface hipKernelNameRefByPtr
    !---------------------------------------------
    ! hipKernelNameRefByPtr
    !---------------------------------------------
    !> @brief Retrives kernel for a given host pointer, unless stated otherwise.
    !>
    !> @param [in] hostFunction Pointer of host function.
    !> @param [in] stream Stream the kernel is executed on.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipKernelNameRefByPtr_raw(hostFunction, stream) &
       result(KernelNameRefByPtr_raw) &
       bind(C, name="hipKernelNameRefByPtr")
       import :: c_ptr, c_char
       type(c_ptr), value :: hostFunction
       type(c_ptr), value :: stream
       character(c_char) :: KernelNameRefByPtr_raw
    end function hipKernelNameRefByPtr_raw

    module procedure hipKernelNameRefByPtr_typed
  end interface hipKernelNameRefByPtr

  interface hipGetStreamDeviceId
    !---------------------------------------------
    ! hipGetStreamDeviceId
    !---------------------------------------------
    !> @brief Returns device ID on the stream.
    !>
    !> @param [in] stream Stream of device executed on.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGetStreamDeviceId_raw(stream) &
       result(GetStreamDeviceId_raw) &
       bind(C, name="hipGetStreamDeviceId")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: GetStreamDeviceId_raw
    end function hipGetStreamDeviceId_raw

    module procedure hipGetStreamDeviceId_typed
  end interface hipGetStreamDeviceId

  interface hipStreamBeginCapture
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipStreamBeginCapture_raw(stream, mode) &
       result(StreamBeginCapture_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamBeginCapture")
#else
       bind(C, name="hipStreamBeginCapture")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: mode
       integer(c_int) :: StreamBeginCapture_raw
    end function hipStreamBeginCapture_raw

    module procedure hipStreamBeginCapture_typed
  end interface hipStreamBeginCapture

  interface hipStreamBeginCaptureToGraph
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning param "const hipGraphEdgeData* dependencyData" is currently not supported and has to
    !> be
    !> passed as nullptr. This API is marked as beta, meaning, while this is feature complete, it is
    !> still
    !> open to changes and may have outstanding issues.
    function hipStreamBeginCaptureToGraph_raw(stream, graph, dependencies, dependencyData, &
                                              numDependencies, mode) &
       result(StreamBeginCaptureToGraph_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamBeginCaptureToGraph")
#else
       bind(C, name="hipStreamBeginCaptureToGraph")
#endif
       import :: c_ptr, hipGraphEdgeData, c_long, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: graph
       type(c_ptr) :: dependencies
       type(hipGraphEdgeData) :: dependencyData
       integer(c_long), value :: numDependencies
       integer(c_int), value :: mode
       integer(c_int) :: StreamBeginCaptureToGraph_raw
    end function hipStreamBeginCaptureToGraph_raw

    module procedure hipStreamBeginCaptureToGraph_typed
  end interface hipStreamBeginCaptureToGraph

  interface hipStreamEndCapture
    !---------------------------------------------
    ! hipStreamEndCapture
    !---------------------------------------------
    !> @brief Ends capture on a stream, returning the captured graph.
    !>
    !> @param [in] stream - Stream to end capture.
    !> @param [out] pGraph - Captured graph.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipStreamEndCapture_raw(stream, pGraph) &
       result(StreamEndCapture_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamEndCapture")
#else
       bind(C, name="hipStreamEndCapture")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr) :: pGraph
       integer(c_int) :: StreamEndCapture_raw
    end function hipStreamEndCapture_raw

    module procedure hipStreamEndCapture_typed
  end interface hipStreamEndCapture

  interface hipStreamGetCaptureInfo
    !---------------------------------------------
    ! hipStreamGetCaptureInfo
    !---------------------------------------------
    !> @brief Get capture status of a stream.
    !>
    !> @param [in] stream - Stream of which to get capture status from.
    !> @param [out] pCaptureStatus - Returns current capture status.
    !> @param [out] pId - Unique capture ID.
    !>
    !> @returns `hipSuccess`, `hipErrorStreamCaptureImplicit`
    function hipStreamGetCaptureInfo_raw(stream, pCaptureStatus, pId) &
       result(StreamGetCaptureInfo_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamGetCaptureInfo")
#else
       bind(C, name="hipStreamGetCaptureInfo")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: pCaptureStatus
       type(c_ptr), value :: pId
       integer(c_int) :: StreamGetCaptureInfo_raw
    end function hipStreamGetCaptureInfo_raw

    module procedure hipStreamGetCaptureInfo_native
    module procedure hipStreamGetCaptureInfo_typed
  end interface hipStreamGetCaptureInfo

  interface hipStreamGetCaptureInfo_v2
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorStreamCaptureImplicit`
    function hipStreamGetCaptureInfo_v2_raw(stream, captureStatus_out, id_out, graph_out, &
                                            dependencies_out, numDependencies_out) &
       result(StreamGetCaptureInfo_v2_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamGetCaptureInfo_v2")
#else
       bind(C, name="hipStreamGetCaptureInfo_v2")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: captureStatus_out
       type(c_ptr), value :: id_out
       type(c_ptr) :: graph_out
       type(c_ptr) :: dependencies_out
       type(c_ptr), value :: numDependencies_out
       integer(c_int) :: StreamGetCaptureInfo_v2_raw
    end function hipStreamGetCaptureInfo_v2_raw

    module procedure hipStreamGetCaptureInfo_v2_native
    module procedure hipStreamGetCaptureInfo_v2_typed
  end interface hipStreamGetCaptureInfo_v2

  interface hipStreamIsCapturing
    !---------------------------------------------
    ! hipStreamIsCapturing
    !---------------------------------------------
    !> @brief Get stream's capture state
    !>
    !> @param [in] stream - Stream of which to get capture status from.
    !> @param [out] pCaptureStatus - Returns current capture status.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorStreamCaptureImplicit`
    function hipStreamIsCapturing_raw(stream, pCaptureStatus) &
       result(StreamIsCapturing_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaStreamIsCapturing")
#else
       bind(C, name="hipStreamIsCapturing")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: pCaptureStatus
       integer(c_int) :: StreamIsCapturing_raw
    end function hipStreamIsCapturing_raw

    module procedure hipStreamIsCapturing_native
    module procedure hipStreamIsCapturing_typed
  end interface hipStreamIsCapturing

  interface hipStreamUpdateCaptureDependencies
    !---------------------------------------------
    ! hipStreamUpdateCaptureDependencies
    !---------------------------------------------
    !> @brief Update the set of dependencies in a capturing stream
    !>
    !> @param [in] stream  Stream that is being captured.
    !> @param [in] dependencies  Pointer to an array of nodes to add/replace.
    !> @param [in] numDependencies  Size of the dependencies array.
    !> @param [in] flags  Flag to update dependency set. Should be one of the values
    !> in enum `hipStreamUpdateCaptureDependenciesFlags`.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorIllegalState`
    function hipStreamUpdateCaptureDependencies_raw(stream, dependencies, numDependencies, flags) &
       result(StreamUpdateCaptureDependencies_raw) &
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
       integer(c_int) :: StreamUpdateCaptureDependencies_raw
    end function hipStreamUpdateCaptureDependencies_raw

    module procedure hipStreamUpdateCaptureDependencies_typed
  end interface hipStreamUpdateCaptureDependencies

  interface hipThreadExchangeStreamCaptureMode
    !---------------------------------------------
    ! hipThreadExchangeStreamCaptureMode
    !---------------------------------------------
    !> @brief Swaps the stream capture mode of a thread.
    !>
    !> @param [in] mode - Pointer to mode value to swap with the current mode.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipThreadExchangeStreamCaptureMode_raw(mode) &
       result(ThreadExchangeStreamCaptureMode_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaThreadExchangeStreamCaptureMode")
#else
       bind(C, name="hipThreadExchangeStreamCaptureMode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: mode
       integer(c_int) :: ThreadExchangeStreamCaptureMode_raw
    end function hipThreadExchangeStreamCaptureMode_raw

    module procedure hipThreadExchangeStreamCaptureMode_native
  end interface hipThreadExchangeStreamCaptureMode

  interface hipGraphCreate
    !---------------------------------------------
    ! hipGraphCreate
    !---------------------------------------------
    !> @brief Creates a graph
    !>
    !> @param [out] pGraph - pointer to graph to create.
    !> @param [in] flags - flags for graph creation, must be 0.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorMemoryAllocation`
    function hipGraphCreate_raw(pGraph, flags) &
       result(GraphCreate_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphCreate")
#else
       bind(C, name="hipGraphCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pGraph
       integer(c_int), value :: flags
       integer(c_int) :: GraphCreate_raw
    end function hipGraphCreate_raw

    module procedure hipGraphCreate_typed
  end interface hipGraphCreate

  interface hipGraphDestroy
    !---------------------------------------------
    ! hipGraphDestroy
    !---------------------------------------------
    !> @brief Destroys a graph
    !>
    !> @param [in] graph - instance of graph to destroy.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphDestroy_raw(graph) &
       result(GraphDestroy_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphDestroy")
#else
       bind(C, name="hipGraphDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       integer(c_int) :: GraphDestroy_raw
    end function hipGraphDestroy_raw

    module procedure hipGraphDestroy_typed
  end interface hipGraphDestroy

  interface hipGraphAddDependencies
    !---------------------------------------------
    ! hipGraphAddDependencies
    !---------------------------------------------
    !> @brief Adds dependency edges to a graph.
    !>
    !> @param [in] graph - Instance of the graph to add dependencies to.
    !> @param [in] from - Pointer to the graph nodes with dependencies to add from.
    !> @param [in] to - Pointer to the graph nodes to add dependencies to.
    !> @param [in] numDependencies - Number of dependencies to add.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddDependencies_raw(graph, from, to, numDependencies) &
       result(GraphAddDependencies_raw) &
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
       integer(c_int) :: GraphAddDependencies_raw
    end function hipGraphAddDependencies_raw

    module procedure hipGraphAddDependencies_typed
  end interface hipGraphAddDependencies

  interface hipGraphRemoveDependencies
    !---------------------------------------------
    ! hipGraphRemoveDependencies
    !---------------------------------------------
    !> @brief Removes dependency edges from a graph.
    !>
    !> @param [in] graph - Instance of the graph to remove dependencies from.
    !> @param [in] from - Array of nodes that provide the dependencies.
    !> @param [in] to - Array of dependent nodes.
    !> @param [in] numDependencies - Number of dependencies to remove.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphRemoveDependencies_raw(graph, from, to, numDependencies) &
       result(GraphRemoveDependencies_raw) &
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
       integer(c_int) :: GraphRemoveDependencies_raw
    end function hipGraphRemoveDependencies_raw

    module procedure hipGraphRemoveDependencies_typed
  end interface hipGraphRemoveDependencies

  interface hipGraphGetEdges
    !---------------------------------------------
    ! hipGraphGetEdges
    !---------------------------------------------
    !> @brief Returns a graph's dependency edges.
    !>
    !> @param [in] graph - Instance of the graph to get the edges from.
    !> @param [out] from - Pointer to the graph nodes to return edge endpoints.
    !> @param [out] to - Pointer to the graph nodes to return edge endpoints.
    !> @param [out] numEdges - Returns number of edges.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> from and to may both be NULL, in which case this function only returns the number of edges in
    !> numEdges. Otherwise, numEdges entries will be filled in. If numEdges is higher than the
    !> actual
    !> number of edges, the remaining entries in from and to will be set to NULL, and the number of
    !> edges actually returned will be written to numEdges.
    function hipGraphGetEdges_raw(graph, from, to, numEdges) &
       result(GraphGetEdges_raw) &
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
       integer(c_int) :: GraphGetEdges_raw
    end function hipGraphGetEdges_raw

    module procedure hipGraphGetEdges_typed
  end interface hipGraphGetEdges

  interface hipGraphGetNodes
    !---------------------------------------------
    ! hipGraphGetNodes
    !---------------------------------------------
    !> @brief Returns a graph's nodes.
    !>
    !> @param [in] graph - Instance of graph to get the nodes from.
    !> @param [out] nodes - Pointer to return the  graph nodes.
    !> @param [out] numNodes - Returns the number of graph nodes.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> nodes may be NULL, in which case this function will return the number of nodes in numNodes.
    !> Otherwise, numNodes entries will be filled in. If numNodes is higher than the actual number
    !> of
    !> nodes, the remaining entries in nodes will be set to NULL, and the number of nodes actually
    !> obtained will be returned in numNodes.
    function hipGraphGetNodes_raw(graph, nodes, numNodes) &
       result(GraphGetNodes_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphGetNodes")
#else
       bind(C, name="hipGraphGetNodes")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       type(c_ptr) :: nodes
       type(c_ptr), value :: numNodes
       integer(c_int) :: GraphGetNodes_raw
    end function hipGraphGetNodes_raw

    module procedure hipGraphGetNodes_typed
  end interface hipGraphGetNodes

  interface hipGraphGetRootNodes
    !---------------------------------------------
    ! hipGraphGetRootNodes
    !---------------------------------------------
    !> @brief Returns a graph's root nodes.
    !>
    !> @param [in] graph - Instance of the graph to get the nodes from.
    !> @param [out] pRootNodes - Pointer to return the graph's root nodes.
    !> @param [out] pNumRootNodes - Returns the number of graph's root nodes.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> pRootNodes may be NULL, in which case this function will return the number of root nodes in
    !> pNumRootNodes. Otherwise, pNumRootNodes entries will be filled in. If pNumRootNodes is higher
    !> than the actual number of root nodes, the remaining entries in pRootNodes will be set to
    !> NULL,
    !> and the number of nodes actually obtained will be returned in pNumRootNodes.
    function hipGraphGetRootNodes_raw(graph, pRootNodes, pNumRootNodes) &
       result(GraphGetRootNodes_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphGetRootNodes")
#else
       bind(C, name="hipGraphGetRootNodes")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       type(c_ptr) :: pRootNodes
       type(c_ptr), value :: pNumRootNodes
       integer(c_int) :: GraphGetRootNodes_raw
    end function hipGraphGetRootNodes_raw

    module procedure hipGraphGetRootNodes_typed
  end interface hipGraphGetRootNodes

  interface hipGraphNodeGetDependencies
    !---------------------------------------------
    ! hipGraphNodeGetDependencies
    !---------------------------------------------
    !> @brief Returns a node's dependencies.
    !>
    !> @param [in] node - Graph node to get the dependencies from.
    !> @param [out] pDependencies - Pointer to return the dependencies.
    !> @param [out] pNumDependencies -  Returns the number of graph node dependencies.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> pDependencies may be NULL, in which case this function will return the number of dependencies
    !> in
    !> pNumDependencies. Otherwise, pNumDependencies entries will be filled in. If pNumDependencies
    !> is
    !> higher than the actual number of dependencies, the remaining entries in pDependencies will be
    !> set
    !> to NULL, and the number of nodes actually obtained will be returned in pNumDependencies.
    function hipGraphNodeGetDependencies_raw(node, pDependencies, pNumDependencies) &
       result(GraphNodeGetDependencies_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphNodeGetDependencies")
#else
       bind(C, name="hipGraphNodeGetDependencies")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr) :: pDependencies
       type(c_ptr), value :: pNumDependencies
       integer(c_int) :: GraphNodeGetDependencies_raw
    end function hipGraphNodeGetDependencies_raw

    module procedure hipGraphNodeGetDependencies_typed
  end interface hipGraphNodeGetDependencies

  interface hipGraphNodeGetDependentNodes
    !---------------------------------------------
    ! hipGraphNodeGetDependentNodes
    !---------------------------------------------
    !> @brief Returns a node's dependent nodes.
    !>
    !> @param [in] node - Graph node to get the dependent nodes from.
    !> @param [out] pDependentNodes - Pointer to return the graph dependent nodes.
    !> @param [out] pNumDependentNodes - Returns the number of graph node dependent nodes.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> pDependentNodes may be NULL, in which case this function will return the number of dependent
    !> nodes in pNumDependentNodes. Otherwise, pNumDependentNodes entries will be filled in. If
    !> pNumDependentNodes is higher than the actual number of dependent nodes, the remaining entries
    !> in
    !> pDependentNodes will be set to NULL, and the number of nodes actually obtained will be
    !> returned
    !> in pNumDependentNodes.
    function hipGraphNodeGetDependentNodes_raw(node, pDependentNodes, pNumDependentNodes) &
       result(GraphNodeGetDependentNodes_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphNodeGetDependentNodes")
#else
       bind(C, name="hipGraphNodeGetDependentNodes")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr) :: pDependentNodes
       type(c_ptr), value :: pNumDependentNodes
       integer(c_int) :: GraphNodeGetDependentNodes_raw
    end function hipGraphNodeGetDependentNodes_raw

    module procedure hipGraphNodeGetDependentNodes_typed
  end interface hipGraphNodeGetDependentNodes

  interface hipGraphNodeGetType
    !---------------------------------------------
    ! hipGraphNodeGetType
    !---------------------------------------------
    !> @brief Returns a node's type.
    !>
    !> @param [in] node - Node to get type of.
    !> @param [out] pType - Returns the node's type.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphNodeGetType_raw(node, pType) &
       result(GraphNodeGetType_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphNodeGetType")
#else
       bind(C, name="hipGraphNodeGetType")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: pType
       integer(c_int) :: GraphNodeGetType_raw
    end function hipGraphNodeGetType_raw

    module procedure hipGraphNodeGetType_native
    module procedure hipGraphNodeGetType_typed
  end interface hipGraphNodeGetType

  interface hipGraphDestroyNode
    !---------------------------------------------
    ! hipGraphDestroyNode
    !---------------------------------------------
    !> @brief Remove a node from the graph.
    !>
    !> @param [in] node - graph node to remove
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphDestroyNode_raw(node) &
       result(GraphDestroyNode_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphDestroyNode")
#else
       bind(C, name="hipGraphDestroyNode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       integer(c_int) :: GraphDestroyNode_raw
    end function hipGraphDestroyNode_raw

    module procedure hipGraphDestroyNode_typed
  end interface hipGraphDestroyNode

  interface hipGraphClone
    !---------------------------------------------
    ! hipGraphClone
    !---------------------------------------------
    !> @brief Clones a graph.
    !>
    !> @param [out] pGraphClone - Returns newly created cloned graph.
    !> @param [in] originalGraph - original graph to clone from.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorMemoryAllocation`
    function hipGraphClone_raw(pGraphClone, originalGraph) &
       result(GraphClone_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphClone")
#else
       bind(C, name="hipGraphClone")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pGraphClone
       type(c_ptr), value :: originalGraph
       integer(c_int) :: GraphClone_raw
    end function hipGraphClone_raw

    module procedure hipGraphClone_typed
  end interface hipGraphClone

  interface hipGraphNodeFindInClone
    !---------------------------------------------
    ! hipGraphNodeFindInClone
    !---------------------------------------------
    !> @brief Finds a cloned version of a node.
    !>
    !> @param [out] pNode - Returns the cloned node.
    !> @param [in] originalNode - original node handle.
    !> @param [in] clonedGraph - Cloned graph to query.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphNodeFindInClone_raw(pNode, originalNode, clonedGraph) &
       result(GraphNodeFindInClone_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphNodeFindInClone")
#else
       bind(C, name="hipGraphNodeFindInClone")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: pNode
       type(c_ptr), value :: originalNode
       type(c_ptr), value :: clonedGraph
       integer(c_int) :: GraphNodeFindInClone_raw
    end function hipGraphNodeFindInClone_raw

    module procedure hipGraphNodeFindInClone_typed
  end interface hipGraphNodeFindInClone

  interface hipGraphInstantiate
    !---------------------------------------------
    ! hipGraphInstantiate
    !---------------------------------------------
    !> @brief Creates an executable graph from a graph
    !>
    !> @param [out] pGraphExec - Pointer to instantiated executable graph.
    !> @param [in] graph - Instance of graph to instantiate.
    !> @param [out] pErrorNode - Pointer to error node. In case an error occured during
    !> graph instantiation, it could modify the corresponding node.
    !> @param [out] pLogBuffer - Pointer to log buffer.
    !> @param [out] bufferSize - Size of the log buffer.
    !>
    !> @returns `hipSuccess`, `hipErrorOutOfMemory`
    function hipGraphInstantiate_raw(pGraphExec, graph, pErrorNode, pLogBuffer, bufferSize) &
       result(GraphInstantiate_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphInstantiate")
#else
       bind(C, name="hipGraphInstantiate")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphExec
       type(c_ptr), value :: graph
       type(c_ptr) :: pErrorNode
       type(c_ptr), value :: pLogBuffer
       integer(c_long), value :: bufferSize
       integer(c_int) :: GraphInstantiate_raw
    end function hipGraphInstantiate_raw

    module procedure hipGraphInstantiate_typed
  end interface hipGraphInstantiate

  interface hipGraphInstantiateWithFlags
    !---------------------------------------------
    ! hipGraphInstantiateWithFlags
    !---------------------------------------------
    !> @brief Creates an executable graph from a graph.
    !>
    !> @param [out] pGraphExec - Pointer to instantiated executable graph.
    !> @param [in] graph - Instance of graph to instantiate.
    !> @param [in] flags - Flags to control instantiation.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    !>
    !> @warning This API does not support any of flag and is behaving as hipGraphInstantiate.
    function hipGraphInstantiateWithFlags_raw(pGraphExec, graph, flags) &
       result(GraphInstantiateWithFlags_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphInstantiateWithFlags")
#else
       bind(C, name="hipGraphInstantiateWithFlags")
#endif
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr) :: pGraphExec
       type(c_ptr), value :: graph
       integer(c_int64_t), value :: flags
       integer(c_int) :: GraphInstantiateWithFlags_raw
    end function hipGraphInstantiateWithFlags_raw

    module procedure hipGraphInstantiateWithFlags_typed
  end interface hipGraphInstantiateWithFlags

  interface hipGraphInstantiateWithParams
    !---------------------------------------------
    ! hipGraphInstantiateWithParams
    !---------------------------------------------
    !> @brief Creates an executable graph from a graph.
    !>
    !> @param [out] pGraphExec - Pointer to instantiated executable graph.
    !> @param [in] graph - Instance of graph to instantiate.
    !> @param [in] instantiateParams - Graph instantiation Params
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphInstantiateWithParams_raw(pGraphExec, graph, instantiateParams) &
       result(GraphInstantiateWithParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphInstantiateWithParams")
#else
       bind(C, name="hipGraphInstantiateWithParams")
#endif
       import :: c_ptr, hipGraphInstantiateParams, c_int
       type(c_ptr) :: pGraphExec
       type(c_ptr), value :: graph
       type(hipGraphInstantiateParams) :: instantiateParams
       integer(c_int) :: GraphInstantiateWithParams_raw
    end function hipGraphInstantiateWithParams_raw

    module procedure hipGraphInstantiateWithParams_typed
  end interface hipGraphInstantiateWithParams

  interface hipGraphLaunch
    !---------------------------------------------
    ! hipGraphLaunch
    !---------------------------------------------
    !> @brief Launches an executable graph in the specified stream.
    !>
    !> @param [in] graphExec - Instance of executable graph to launch.
    !> @param [in] stream - Instance of stream in which to launch executable graph.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphLaunch_raw(graphExec, stream) &
       result(GraphLaunch_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphLaunch")
#else
       bind(C, name="hipGraphLaunch")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graphExec
       type(c_ptr), value :: stream
       integer(c_int) :: GraphLaunch_raw
    end function hipGraphLaunch_raw

    module procedure hipGraphLaunch_typed
  end interface hipGraphLaunch

  interface hipGraphUpload
    !---------------------------------------------
    ! hipGraphUpload
    !---------------------------------------------
    !> @brief Uploads an executable graph to a stream
    !>
    !> @param [in] graphExec - Instance of executable graph to be uploaded.
    !> @param [in] stream - Instance of stream to which the executable graph is uploaded to.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphUpload_raw(graphExec, stream) &
       result(GraphUpload_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphUpload")
#else
       bind(C, name="hipGraphUpload")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graphExec
       type(c_ptr), value :: stream
       integer(c_int) :: GraphUpload_raw
    end function hipGraphUpload_raw

    module procedure hipGraphUpload_typed
  end interface hipGraphUpload

  interface hipGraphAddNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`.
    function hipGraphAddNode_raw(pGraphNode, graph, pDependencies, numDependencies, nodeParams) &
       result(GraphAddNode_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddNode")
#else
       bind(C, name="hipGraphAddNode")
#endif
       import :: c_ptr, c_long, hipGraphNodeParams, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(hipGraphNodeParams) :: nodeParams
       integer(c_int) :: GraphAddNode_raw
    end function hipGraphAddNode_raw

    module procedure hipGraphAddNode_typed
  end interface hipGraphAddNode

  interface hipGraphExecGetFlags
    !---------------------------------------------
    ! hipGraphExecGetFlags
    !---------------------------------------------
    !> @brief Return the flags of an executable graph.
    !>
    !> @param [in] graphExec - Executable graph to get the flags from.
    !> @param [out] flags - Flags used to instantiate this executable graph.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`.
    function hipGraphExecGetFlags_raw(graphExec, flags) &
       result(GraphExecGetFlags_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecGetFlags")
#else
       bind(C, name="hipGraphExecGetFlags")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graphExec
       type(c_ptr), value :: flags
       integer(c_int) :: GraphExecGetFlags_raw
    end function hipGraphExecGetFlags_raw

    module procedure hipGraphExecGetFlags_native
    module procedure hipGraphExecGetFlags_typed
  end interface hipGraphExecGetFlags

  interface hipGraphNodeSetParams
    !---------------------------------------------
    ! hipGraphNodeSetParams
    !---------------------------------------------
    !> @brief Updates parameters of a graph's node.
    !>
    !> @param [in] node - Instance of the node to set parameters for.
    !> @param [in] nodeParams - Pointer to the parameters to be set.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDeviceFunction`,
    !> `hipErrorNotSupported`.
    function hipGraphNodeSetParams_raw(node, nodeParams) &
       result(GraphNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphNodeSetParams")
#else
       bind(C, name="hipGraphNodeSetParams")
#endif
       import :: c_ptr, hipGraphNodeParams, c_int
       type(c_ptr), value :: node
       type(hipGraphNodeParams) :: nodeParams
       integer(c_int) :: GraphNodeSetParams_raw
    end function hipGraphNodeSetParams_raw

    module procedure hipGraphNodeSetParams_typed
  end interface hipGraphNodeSetParams

  interface hipGraphExecNodeSetParams
    !---------------------------------------------
    ! hipGraphExecNodeSetParams
    !---------------------------------------------
    !> @brief Updates parameters of an executable graph's node.
    !>
    !> @param [in] graphExec - Instance of the executable graph.
    !> @param [in] node - Instance of the node to set parameters to.
    !> @param [in] nodeParams - Pointer to the parameters to be set.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDeviceFunction`,
    !> `hipErrorNotSupported`.
    function hipGraphExecNodeSetParams_raw(graphExec, node, nodeParams) &
       result(GraphExecNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecNodeSetParams")
#else
       bind(C, name="hipGraphExecNodeSetParams")
#endif
       import :: c_ptr, hipGraphNodeParams, c_int
       type(c_ptr), value :: graphExec
       type(c_ptr), value :: node
       type(hipGraphNodeParams) :: nodeParams
       integer(c_int) :: GraphExecNodeSetParams_raw
    end function hipGraphExecNodeSetParams_raw

    module procedure hipGraphExecNodeSetParams_typed
  end interface hipGraphExecNodeSetParams

  interface hipGraphExecDestroy
    !---------------------------------------------
    ! hipGraphExecDestroy
    !---------------------------------------------
    !> @brief Destroys an executable graph
    !>
    !> @param [in] graphExec - Instance of executable graph to destroy.
    !>
    !> @returns `hipSuccess`.
    function hipGraphExecDestroy_raw(graphExec) &
       result(GraphExecDestroy_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecDestroy")
#else
       bind(C, name="hipGraphExecDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graphExec
       integer(c_int) :: GraphExecDestroy_raw
    end function hipGraphExecDestroy_raw

    module procedure hipGraphExecDestroy_typed
  end interface hipGraphExecDestroy

  interface hipGraphExecUpdate
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
    !> @returns `hipSuccess`, `hipErrorGraphExecUpdateFailure`
    function hipGraphExecUpdate_raw(hGraphExec, hGraph, hErrorNode_out, updateResult_out) &
       result(GraphExecUpdate_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecUpdate")
#else
       bind(C, name="hipGraphExecUpdate")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hGraph
       type(c_ptr) :: hErrorNode_out
       type(c_ptr), value :: updateResult_out
       integer(c_int) :: GraphExecUpdate_raw
    end function hipGraphExecUpdate_raw

    module procedure hipGraphExecUpdate_native
    module procedure hipGraphExecUpdate_typed
  end interface hipGraphExecUpdate

  interface hipGraphAddKernelNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDeviceFunction`
    function hipGraphAddKernelNode_raw(pGraphNode, graph, pDependencies, numDependencies, &
                                       pNodeParams) &
       result(GraphAddKernelNode_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddKernelNode")
#else
       bind(C, name="hipGraphAddKernelNode")
#endif
       import :: c_ptr, c_long, hipKernelNodeParams, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(hipKernelNodeParams) :: pNodeParams
       integer(c_int) :: GraphAddKernelNode_raw
    end function hipGraphAddKernelNode_raw

    module procedure hipGraphAddKernelNode_typed
  end interface hipGraphAddKernelNode

  interface hipGraphKernelNodeGetParams
    !---------------------------------------------
    ! hipGraphKernelNodeGetParams
    !---------------------------------------------
    !> @brief Gets kernel node's parameters.
    !>
    !> @param [in] node - instance of the node to get parameters from.
    !> @param [out] pNodeParams - pointer to the parameters
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphKernelNodeGetParams_raw(node, pNodeParams) &
       result(GraphKernelNodeGetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphKernelNodeGetParams")
#else
       bind(C, name="hipGraphKernelNodeGetParams")
#endif
       import :: c_ptr, hipKernelNodeParams, c_int
       type(c_ptr), value :: node
       type(hipKernelNodeParams) :: pNodeParams
       integer(c_int) :: GraphKernelNodeGetParams_raw
    end function hipGraphKernelNodeGetParams_raw

    module procedure hipGraphKernelNodeGetParams_typed
  end interface hipGraphKernelNodeGetParams

  interface hipGraphKernelNodeSetParams
    !---------------------------------------------
    ! hipGraphKernelNodeSetParams
    !---------------------------------------------
    !> @brief Sets a kernel node's parameters.
    !>
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - const pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphKernelNodeSetParams_raw(node, pNodeParams) &
       result(GraphKernelNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphKernelNodeSetParams")
#else
       bind(C, name="hipGraphKernelNodeSetParams")
#endif
       import :: c_ptr, hipKernelNodeParams, c_int
       type(c_ptr), value :: node
       type(hipKernelNodeParams) :: pNodeParams
       integer(c_int) :: GraphKernelNodeSetParams_raw
    end function hipGraphKernelNodeSetParams_raw

    module procedure hipGraphKernelNodeSetParams_typed
  end interface hipGraphKernelNodeSetParams

  interface hipGraphExecKernelNodeSetParams
    !---------------------------------------------
    ! hipGraphExecKernelNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a kernel node in the given graphExec.
    !>
    !> @param [in] hGraphExec - Instance of the executable graph with the node.
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - const pointer to the kernel node parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecKernelNodeSetParams_raw(hGraphExec, node, pNodeParams) &
       result(GraphExecKernelNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecKernelNodeSetParams")
#else
       bind(C, name="hipGraphExecKernelNodeSetParams")
#endif
       import :: c_ptr, hipKernelNodeParams, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(hipKernelNodeParams) :: pNodeParams
       integer(c_int) :: GraphExecKernelNodeSetParams_raw
    end function hipGraphExecKernelNodeSetParams_raw

    module procedure hipGraphExecKernelNodeSetParams_typed
  end interface hipGraphExecKernelNodeSetParams

  interface hipDrvGraphAddMemcpyNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipDrvGraphAddMemcpyNode_raw(phGraphNode, hGraph, dependencies, numDependencies, &
                                          copyParams, ctx) &
       result(DrvGraphAddMemcpyNode_raw) &
       bind(C, name="hipDrvGraphAddMemcpyNode")
       import :: c_ptr, c_long, HIP_MEMCPY3D, c_int
       type(c_ptr) :: phGraphNode
       type(c_ptr), value :: hGraph
       type(c_ptr) :: dependencies
       integer(c_long), value :: numDependencies
       type(HIP_MEMCPY3D) :: copyParams
       type(c_ptr), value :: ctx
       integer(c_int) :: DrvGraphAddMemcpyNode_raw
    end function hipDrvGraphAddMemcpyNode_raw

    module procedure hipDrvGraphAddMemcpyNode_typed
  end interface hipDrvGraphAddMemcpyNode

  interface hipGraphAddMemcpyNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddMemcpyNode_raw(pGraphNode, graph, pDependencies, numDependencies, &
                                       pCopyParams) &
       result(GraphAddMemcpyNode_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddMemcpyNode")
#else
       bind(C, name="hipGraphAddMemcpyNode")
#endif
       import :: c_ptr, c_long, hipMemcpy3DParms, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(hipMemcpy3DParms) :: pCopyParams
       integer(c_int) :: GraphAddMemcpyNode_raw
    end function hipGraphAddMemcpyNode_raw

    module procedure hipGraphAddMemcpyNode_typed
  end interface hipGraphAddMemcpyNode

  interface hipGraphMemcpyNodeGetParams
    !---------------------------------------------
    ! hipGraphMemcpyNodeGetParams
    !---------------------------------------------
    !> @brief Gets a memcpy node's parameters.
    !>
    !> @param [in] node - instance of the node to get parameters from.
    !> @param [out] pNodeParams - pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphMemcpyNodeGetParams_raw(node, pNodeParams) &
       result(GraphMemcpyNodeGetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemcpyNodeGetParams")
#else
       bind(C, name="hipGraphMemcpyNodeGetParams")
#endif
       import :: c_ptr, hipMemcpy3DParms, c_int
       type(c_ptr), value :: node
       type(hipMemcpy3DParms) :: pNodeParams
       integer(c_int) :: GraphMemcpyNodeGetParams_raw
    end function hipGraphMemcpyNodeGetParams_raw

    module procedure hipGraphMemcpyNodeGetParams_typed
  end interface hipGraphMemcpyNodeGetParams

  interface hipGraphMemcpyNodeSetParams
    !---------------------------------------------
    ! hipGraphMemcpyNodeSetParams
    !---------------------------------------------
    !> @brief Sets a memcpy node's parameters.
    !>
    !> @param [in] node - instance of the node to set parameters to.
    !> @param [in] pNodeParams - const pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphMemcpyNodeSetParams_raw(node, pNodeParams) &
       result(GraphMemcpyNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemcpyNodeSetParams")
#else
       bind(C, name="hipGraphMemcpyNodeSetParams")
#endif
       import :: c_ptr, hipMemcpy3DParms, c_int
       type(c_ptr), value :: node
       type(hipMemcpy3DParms) :: pNodeParams
       integer(c_int) :: GraphMemcpyNodeSetParams_raw
    end function hipGraphMemcpyNodeSetParams_raw

    module procedure hipGraphMemcpyNodeSetParams_typed
  end interface hipGraphMemcpyNodeSetParams

  interface hipGraphKernelNodeSetAttribute
    !---------------------------------------------
    ! hipGraphKernelNodeSetAttribute
    !---------------------------------------------
    !> @brief Sets a node's attribute.
    !>
    !> @param [in] hNode - Instance of the node to set parameters of.
    !> @param [in] attr - The attribute type to be set.
    !> @param [in] value - const pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphKernelNodeSetAttribute_raw(hNode, attr, value) &
       result(GraphKernelNodeSetAttribute_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphKernelNodeSetAttribute")
#else
       bind(C, name="hipGraphKernelNodeSetAttribute")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: GraphKernelNodeSetAttribute_raw
    end function hipGraphKernelNodeSetAttribute_raw

    module procedure hipGraphKernelNodeSetAttribute_typed
  end interface hipGraphKernelNodeSetAttribute

  interface hipGraphKernelNodeGetAttribute
    !---------------------------------------------
    ! hipGraphKernelNodeGetAttribute
    !---------------------------------------------
    !> @brief Gets a node's attribute.
    !>
    !> @param [in] hNode - Instance of the node to set parameters of.
    !> @param [in] attr - The attribute type to be set.
    !> @param [in] value - const pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphKernelNodeGetAttribute_raw(hNode, attr, value) &
       result(GraphKernelNodeGetAttribute_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphKernelNodeGetAttribute")
#else
       bind(C, name="hipGraphKernelNodeGetAttribute")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hNode
       integer(c_int), value :: attr
       type(c_ptr), value :: value
       integer(c_int) :: GraphKernelNodeGetAttribute_raw
    end function hipGraphKernelNodeGetAttribute_raw

    module procedure hipGraphKernelNodeGetAttribute_typed
  end interface hipGraphKernelNodeGetAttribute

  interface hipGraphExecMemcpyNodeSetParams
    !---------------------------------------------
    ! hipGraphExecMemcpyNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters of a memcpy node in the given graphExec.
    !>
    !> @param [in] hGraphExec - Instance of the executable graph with the node.
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - const pointer to the kernel node parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecMemcpyNodeSetParams_raw(hGraphExec, node, pNodeParams) &
       result(GraphExecMemcpyNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecMemcpyNodeSetParams")
#else
       bind(C, name="hipGraphExecMemcpyNodeSetParams")
#endif
       import :: c_ptr, hipMemcpy3DParms, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(hipMemcpy3DParms) :: pNodeParams
       integer(c_int) :: GraphExecMemcpyNodeSetParams_raw
    end function hipGraphExecMemcpyNodeSetParams_raw

    module procedure hipGraphExecMemcpyNodeSetParams_typed
  end interface hipGraphExecMemcpyNodeSetParams

  interface hipGraphAddMemcpyNode1D
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddMemcpyNode1D_raw(pGraphNode, graph, pDependencies, numDependencies, dst, &
                                         src, count, kind) &
       result(GraphAddMemcpyNode1D_raw) &
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
       integer(c_int) :: GraphAddMemcpyNode1D_raw
    end function hipGraphAddMemcpyNode1D_raw

    module procedure hipGraphAddMemcpyNode1D_typed
  end interface hipGraphAddMemcpyNode1D

  interface hipGraphMemcpyNodeSetParams1D
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphMemcpyNodeSetParams1D_raw(node, dst, src, count, kind) &
       result(GraphMemcpyNodeSetParams1D_raw) &
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
       integer(c_int) :: GraphMemcpyNodeSetParams1D_raw
    end function hipGraphMemcpyNodeSetParams1D_raw

    module procedure hipGraphMemcpyNodeSetParams1D_typed
  end interface hipGraphMemcpyNodeSetParams1D

  interface hipGraphExecMemcpyNodeSetParams1D
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecMemcpyNodeSetParams1D_raw(hGraphExec, node, dst, src, count, kind) &
       result(GraphExecMemcpyNodeSetParams1D_raw) &
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
       integer(c_int) :: GraphExecMemcpyNodeSetParams1D_raw
    end function hipGraphExecMemcpyNodeSetParams1D_raw

    module procedure hipGraphExecMemcpyNodeSetParams1D_typed
  end interface hipGraphExecMemcpyNodeSetParams1D

  interface hipGraphAddMemcpyNodeFromSymbol
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddMemcpyNodeFromSymbol_raw(pGraphNode, graph, pDependencies, &
                                                 numDependencies, dst, symbol, count, offset, &
                                                 kind) &
       result(GraphAddMemcpyNodeFromSymbol_raw) &
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
       integer(c_int) :: GraphAddMemcpyNodeFromSymbol_raw
    end function hipGraphAddMemcpyNodeFromSymbol_raw

    module procedure hipGraphAddMemcpyNodeFromSymbol_typed
  end interface hipGraphAddMemcpyNodeFromSymbol

  interface hipGraphMemcpyNodeSetParamsFromSymbol
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphMemcpyNodeSetParamsFromSymbol_raw(node, dst, symbol, count, offset, kind) &
       result(GraphMemcpyNodeSetParamsFromSymbol_raw) &
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
       integer(c_int) :: GraphMemcpyNodeSetParamsFromSymbol_raw
    end function hipGraphMemcpyNodeSetParamsFromSymbol_raw

    module procedure hipGraphMemcpyNodeSetParamsFromSymbol_typed
  end interface hipGraphMemcpyNodeSetParamsFromSymbol

  interface hipGraphExecMemcpyNodeSetParamsFromSymbol
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecMemcpyNodeSetParamsFromSymbol_raw(hGraphExec, node, dst, symbol, count, &
                                                           offset, kind) &
       result(GraphExecMemcpyNodeSetParamsFromSymbol_raw) &
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
       integer(c_int) :: GraphExecMemcpyNodeSetParamsFromSymbol_raw
    end function hipGraphExecMemcpyNodeSetParamsFromSymbol_raw

    module procedure hipGraphExecMemcpyNodeSetParamsFromSymbol_typed
  end interface hipGraphExecMemcpyNodeSetParamsFromSymbol

  interface hipGraphAddMemcpyNodeToSymbol
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddMemcpyNodeToSymbol_raw(pGraphNode, graph, pDependencies, numDependencies, &
                                               symbol, src, count, offset, kind) &
       result(GraphAddMemcpyNodeToSymbol_raw) &
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
       integer(c_int) :: GraphAddMemcpyNodeToSymbol_raw
    end function hipGraphAddMemcpyNodeToSymbol_raw

    module procedure hipGraphAddMemcpyNodeToSymbol_typed
  end interface hipGraphAddMemcpyNodeToSymbol

  interface hipGraphMemcpyNodeSetParamsToSymbol
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphMemcpyNodeSetParamsToSymbol_raw(node, symbol, src, count, offset, kind) &
       result(GraphMemcpyNodeSetParamsToSymbol_raw) &
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
       integer(c_int) :: GraphMemcpyNodeSetParamsToSymbol_raw
    end function hipGraphMemcpyNodeSetParamsToSymbol_raw

    module procedure hipGraphMemcpyNodeSetParamsToSymbol_typed
  end interface hipGraphMemcpyNodeSetParamsToSymbol

  interface hipGraphExecMemcpyNodeSetParamsToSymbol
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecMemcpyNodeSetParamsToSymbol_raw(hGraphExec, node, symbol, src, count, &
                                                         offset, kind) &
       result(GraphExecMemcpyNodeSetParamsToSymbol_raw) &
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
       integer(c_int) :: GraphExecMemcpyNodeSetParamsToSymbol_raw
    end function hipGraphExecMemcpyNodeSetParamsToSymbol_raw

    module procedure hipGraphExecMemcpyNodeSetParamsToSymbol_typed
  end interface hipGraphExecMemcpyNodeSetParamsToSymbol

  interface hipGraphAddMemsetNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddMemsetNode_raw(pGraphNode, graph, pDependencies, numDependencies, &
                                       pMemsetParams) &
       result(GraphAddMemsetNode_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddMemsetNode")
#else
       bind(C, name="hipGraphAddMemsetNode")
#endif
       import :: c_ptr, c_long, hipMemsetParams, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(hipMemsetParams) :: pMemsetParams
       integer(c_int) :: GraphAddMemsetNode_raw
    end function hipGraphAddMemsetNode_raw

    module procedure hipGraphAddMemsetNode_typed
  end interface hipGraphAddMemsetNode

  interface hipGraphMemsetNodeGetParams
    !---------------------------------------------
    ! hipGraphMemsetNodeGetParams
    !---------------------------------------------
    !> @brief Gets a memset node's parameters.
    !>
    !> @param [in] node - Instance of the node to get parameters of.
    !> @param [out] pNodeParams - Pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphMemsetNodeGetParams_raw(node, pNodeParams) &
       result(GraphMemsetNodeGetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemsetNodeGetParams")
#else
       bind(C, name="hipGraphMemsetNodeGetParams")
#endif
       import :: c_ptr, hipMemsetParams, c_int
       type(c_ptr), value :: node
       type(hipMemsetParams) :: pNodeParams
       integer(c_int) :: GraphMemsetNodeGetParams_raw
    end function hipGraphMemsetNodeGetParams_raw

    module procedure hipGraphMemsetNodeGetParams_typed
  end interface hipGraphMemsetNodeGetParams

  interface hipGraphMemsetNodeSetParams
    !---------------------------------------------
    ! hipGraphMemsetNodeSetParams
    !---------------------------------------------
    !> @brief Sets a memset node's parameters.
    !>
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - Pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphMemsetNodeSetParams_raw(node, pNodeParams) &
       result(GraphMemsetNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemsetNodeSetParams")
#else
       bind(C, name="hipGraphMemsetNodeSetParams")
#endif
       import :: c_ptr, hipMemsetParams, c_int
       type(c_ptr), value :: node
       type(hipMemsetParams) :: pNodeParams
       integer(c_int) :: GraphMemsetNodeSetParams_raw
    end function hipGraphMemsetNodeSetParams_raw

    module procedure hipGraphMemsetNodeSetParams_typed
  end interface hipGraphMemsetNodeSetParams

  interface hipGraphExecMemsetNodeSetParams
    !---------------------------------------------
    ! hipGraphExecMemsetNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a memset node in the given graphExec.
    !>
    !> @param [in] hGraphExec - Instance of the executable graph with the node.
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - Pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecMemsetNodeSetParams_raw(hGraphExec, node, pNodeParams) &
       result(GraphExecMemsetNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecMemsetNodeSetParams")
#else
       bind(C, name="hipGraphExecMemsetNodeSetParams")
#endif
       import :: c_ptr, hipMemsetParams, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(hipMemsetParams) :: pNodeParams
       integer(c_int) :: GraphExecMemsetNodeSetParams_raw
    end function hipGraphExecMemsetNodeSetParams_raw

    module procedure hipGraphExecMemsetNodeSetParams_typed
  end interface hipGraphExecMemsetNodeSetParams

  interface hipGraphAddHostNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddHostNode_raw(pGraphNode, graph, pDependencies, numDependencies, &
                                     pNodeParams) &
       result(GraphAddHostNode_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddHostNode")
#else
       bind(C, name="hipGraphAddHostNode")
#endif
       import :: c_ptr, c_long, hipHostNodeParams, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(hipHostNodeParams) :: pNodeParams
       integer(c_int) :: GraphAddHostNode_raw
    end function hipGraphAddHostNode_raw

    module procedure hipGraphAddHostNode_typed
  end interface hipGraphAddHostNode

  interface hipGraphHostNodeGetParams
    !---------------------------------------------
    ! hipGraphHostNodeGetParams
    !---------------------------------------------
    !> @brief Returns a host node's parameters.
    !>
    !> @param [in] node - Instance of the node to get parameters of.
    !> @param [out] pNodeParams - Pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphHostNodeGetParams_raw(node, pNodeParams) &
       result(GraphHostNodeGetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphHostNodeGetParams")
#else
       bind(C, name="hipGraphHostNodeGetParams")
#endif
       import :: c_ptr, hipHostNodeParams, c_int
       type(c_ptr), value :: node
       type(hipHostNodeParams) :: pNodeParams
       integer(c_int) :: GraphHostNodeGetParams_raw
    end function hipGraphHostNodeGetParams_raw

    module procedure hipGraphHostNodeGetParams_typed
  end interface hipGraphHostNodeGetParams

  interface hipGraphHostNodeSetParams
    !---------------------------------------------
    ! hipGraphHostNodeSetParams
    !---------------------------------------------
    !> @brief Sets a host node's parameters.
    !>
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - Pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphHostNodeSetParams_raw(node, pNodeParams) &
       result(GraphHostNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphHostNodeSetParams")
#else
       bind(C, name="hipGraphHostNodeSetParams")
#endif
       import :: c_ptr, hipHostNodeParams, c_int
       type(c_ptr), value :: node
       type(hipHostNodeParams) :: pNodeParams
       integer(c_int) :: GraphHostNodeSetParams_raw
    end function hipGraphHostNodeSetParams_raw

    module procedure hipGraphHostNodeSetParams_typed
  end interface hipGraphHostNodeSetParams

  interface hipGraphExecHostNodeSetParams
    !---------------------------------------------
    ! hipGraphExecHostNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a host node in the given graphExec.
    !>
    !> @param [in] hGraphExec - Instance of the executable graph with the node.
    !> @param [in] node - Instance of the node to set parameters of.
    !> @param [in] pNodeParams - Pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecHostNodeSetParams_raw(hGraphExec, node, pNodeParams) &
       result(GraphExecHostNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecHostNodeSetParams")
#else
       bind(C, name="hipGraphExecHostNodeSetParams")
#endif
       import :: c_ptr, hipHostNodeParams, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(hipHostNodeParams) :: pNodeParams
       integer(c_int) :: GraphExecHostNodeSetParams_raw
    end function hipGraphExecHostNodeSetParams_raw

    module procedure hipGraphExecHostNodeSetParams_typed
  end interface hipGraphExecHostNodeSetParams

  interface hipGraphAddChildGraphNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddChildGraphNode_raw(pGraphNode, graph, pDependencies, numDependencies, &
                                           childGraph) &
       result(GraphAddChildGraphNode_raw) &
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
       integer(c_int) :: GraphAddChildGraphNode_raw
    end function hipGraphAddChildGraphNode_raw

    module procedure hipGraphAddChildGraphNode_typed
  end interface hipGraphAddChildGraphNode

  interface hipGraphChildGraphNodeGetGraph
    !---------------------------------------------
    ! hipGraphChildGraphNodeGetGraph
    !---------------------------------------------
    !> @brief Gets a handle to the embedded graph of a child graph node.
    !>
    !> @param [in] node - Instance of the node to get child graph of.
    !> @param [out] pGraph - Pointer to get the graph.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphChildGraphNodeGetGraph_raw(node, pGraph) &
       result(GraphChildGraphNodeGetGraph_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphChildGraphNodeGetGraph")
#else
       bind(C, name="hipGraphChildGraphNodeGetGraph")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr) :: pGraph
       integer(c_int) :: GraphChildGraphNodeGetGraph_raw
    end function hipGraphChildGraphNodeGetGraph_raw

    module procedure hipGraphChildGraphNodeGetGraph_typed
  end interface hipGraphChildGraphNodeGetGraph

  interface hipGraphExecChildGraphNodeSetParams
    !---------------------------------------------
    ! hipGraphExecChildGraphNodeSetParams
    !---------------------------------------------
    !> @brief Updates node parameters in the child graph node in the given graphExec.
    !>
    !> @param [in] hGraphExec - instance of the executable graph with the node.
    !> @param [in] node - node from the graph which was used to instantiate graphExec.
    !> @param [in] childGraph - child graph with updated parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecChildGraphNodeSetParams_raw(hGraphExec, node, childGraph) &
       result(GraphExecChildGraphNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecChildGraphNodeSetParams")
#else
       bind(C, name="hipGraphExecChildGraphNodeSetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: node
       type(c_ptr), value :: childGraph
       integer(c_int) :: GraphExecChildGraphNodeSetParams_raw
    end function hipGraphExecChildGraphNodeSetParams_raw

    module procedure hipGraphExecChildGraphNodeSetParams_typed
  end interface hipGraphExecChildGraphNodeSetParams

  interface hipGraphAddEmptyNode
    !---------------------------------------------
    ! hipGraphAddEmptyNode
    !---------------------------------------------
    !> @brief Creates an empty node and adds it to a graph.
    !>
    !> @param [out] pGraphNode - Pointer to graph node that is created.
    !> @param [in] graph - Instance of the graph the node is added to.
    !> @param [in] pDependencies - const pointer to the node dependencies.
    !> @param [in] numDependencies - Number of dependencies.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddEmptyNode_raw(pGraphNode, graph, pDependencies, numDependencies) &
       result(GraphAddEmptyNode_raw) &
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
       integer(c_int) :: GraphAddEmptyNode_raw
    end function hipGraphAddEmptyNode_raw

    module procedure hipGraphAddEmptyNode_typed
  end interface hipGraphAddEmptyNode

  interface hipGraphAddEventRecordNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddEventRecordNode_raw(pGraphNode, graph, pDependencies, numDependencies, &
                                            event) &
       result(GraphAddEventRecordNode_raw) &
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
       integer(c_int) :: GraphAddEventRecordNode_raw
    end function hipGraphAddEventRecordNode_raw

    module procedure hipGraphAddEventRecordNode_typed
  end interface hipGraphAddEventRecordNode

  interface hipGraphEventRecordNodeGetEvent
    !---------------------------------------------
    ! hipGraphEventRecordNodeGetEvent
    !---------------------------------------------
    !> @brief Returns the event associated with an event record node.
    !>
    !> @param [in] node -  Instance of the node to get event of.
    !> @param [out] event_out - Pointer to return the event.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphEventRecordNodeGetEvent_raw(node, event_out) &
       result(GraphEventRecordNodeGetEvent_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphEventRecordNodeGetEvent")
#else
       bind(C, name="hipGraphEventRecordNodeGetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr) :: event_out
       integer(c_int) :: GraphEventRecordNodeGetEvent_raw
    end function hipGraphEventRecordNodeGetEvent_raw

    module procedure hipGraphEventRecordNodeGetEvent_typed
  end interface hipGraphEventRecordNodeGetEvent

  interface hipGraphEventRecordNodeSetEvent
    !---------------------------------------------
    ! hipGraphEventRecordNodeSetEvent
    !---------------------------------------------
    !> @brief Sets an event record node's event.
    !>
    !> @param [in] node - Instance of the node to set event to.
    !> @param [in] event - Pointer to the event.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphEventRecordNodeSetEvent_raw(node, event) &
       result(GraphEventRecordNodeSetEvent_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphEventRecordNodeSetEvent")
#else
       bind(C, name="hipGraphEventRecordNodeSetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: event
       integer(c_int) :: GraphEventRecordNodeSetEvent_raw
    end function hipGraphEventRecordNodeSetEvent_raw

    module procedure hipGraphEventRecordNodeSetEvent_typed
  end interface hipGraphEventRecordNodeSetEvent

  interface hipGraphExecEventRecordNodeSetEvent
    !---------------------------------------------
    ! hipGraphExecEventRecordNodeSetEvent
    !---------------------------------------------
    !> @brief Sets the event for an event record node in the given graphExec.
    !>
    !> @param [in] hGraphExec - instance of the executable graph with the node.
    !> @param [in] hNode - node from the graph which was used to instantiate graphExec.
    !> @param [in] event - pointer to the event.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecEventRecordNodeSetEvent_raw(hGraphExec, hNode, event) &
       result(GraphExecEventRecordNodeSetEvent_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecEventRecordNodeSetEvent")
#else
       bind(C, name="hipGraphExecEventRecordNodeSetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(c_ptr), value :: event
       integer(c_int) :: GraphExecEventRecordNodeSetEvent_raw
    end function hipGraphExecEventRecordNodeSetEvent_raw

    module procedure hipGraphExecEventRecordNodeSetEvent_typed
  end interface hipGraphExecEventRecordNodeSetEvent

  interface hipGraphAddEventWaitNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddEventWaitNode_raw(pGraphNode, graph, pDependencies, numDependencies, &
                                          event) &
       result(GraphAddEventWaitNode_raw) &
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
       integer(c_int) :: GraphAddEventWaitNode_raw
    end function hipGraphAddEventWaitNode_raw

    module procedure hipGraphAddEventWaitNode_typed
  end interface hipGraphAddEventWaitNode

  interface hipGraphEventWaitNodeGetEvent
    !---------------------------------------------
    ! hipGraphEventWaitNodeGetEvent
    !---------------------------------------------
    !> @brief Returns the event associated with an event wait node.
    !>
    !> @param [in] node -  Instance of the node to get event of.
    !> @param [out] event_out - Pointer to return the event.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphEventWaitNodeGetEvent_raw(node, event_out) &
       result(GraphEventWaitNodeGetEvent_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphEventWaitNodeGetEvent")
#else
       bind(C, name="hipGraphEventWaitNodeGetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr) :: event_out
       integer(c_int) :: GraphEventWaitNodeGetEvent_raw
    end function hipGraphEventWaitNodeGetEvent_raw

    module procedure hipGraphEventWaitNodeGetEvent_typed
  end interface hipGraphEventWaitNodeGetEvent

  interface hipGraphEventWaitNodeSetEvent
    !---------------------------------------------
    ! hipGraphEventWaitNodeSetEvent
    !---------------------------------------------
    !> @brief Sets an event wait node's event.
    !>
    !> @param [in] node - Instance of the node to set event of.
    !> @param [in] event - Pointer to the event.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphEventWaitNodeSetEvent_raw(node, event) &
       result(GraphEventWaitNodeSetEvent_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphEventWaitNodeSetEvent")
#else
       bind(C, name="hipGraphEventWaitNodeSetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: event
       integer(c_int) :: GraphEventWaitNodeSetEvent_raw
    end function hipGraphEventWaitNodeSetEvent_raw

    module procedure hipGraphEventWaitNodeSetEvent_typed
  end interface hipGraphEventWaitNodeSetEvent

  interface hipGraphExecEventWaitNodeSetEvent
    !---------------------------------------------
    ! hipGraphExecEventWaitNodeSetEvent
    !---------------------------------------------
    !> @brief Sets the event for an event record node in the given graphExec.
    !>
    !> @param [in] hGraphExec - instance of the executable graph with the node.
    !> @param [in] hNode - node from the graph which was used to instantiate graphExec.
    !> @param [in] event - pointer to the event.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecEventWaitNodeSetEvent_raw(hGraphExec, hNode, event) &
       result(GraphExecEventWaitNodeSetEvent_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecEventWaitNodeSetEvent")
#else
       bind(C, name="hipGraphExecEventWaitNodeSetEvent")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(c_ptr), value :: event
       integer(c_int) :: GraphExecEventWaitNodeSetEvent_raw
    end function hipGraphExecEventWaitNodeSetEvent_raw

    module procedure hipGraphExecEventWaitNodeSetEvent_typed
  end interface hipGraphExecEventWaitNodeSetEvent

  interface hipGraphAddMemAllocNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddMemAllocNode_raw(pGraphNode, graph, pDependencies, numDependencies, &
                                         pNodeParams) &
       result(GraphAddMemAllocNode_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddMemAllocNode")
#else
       bind(C, name="hipGraphAddMemAllocNode")
#endif
       import :: c_ptr, c_long, hipMemAllocNodeParams, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(hipMemAllocNodeParams) :: pNodeParams
       integer(c_int) :: GraphAddMemAllocNode_raw
    end function hipGraphAddMemAllocNode_raw

    module procedure hipGraphAddMemAllocNode_typed
  end interface hipGraphAddMemAllocNode

  interface hipGraphMemAllocNodeGetParams
    !---------------------------------------------
    ! hipGraphMemAllocNodeGetParams
    !---------------------------------------------
    !> @brief Returns parameters for memory allocation node
    !>
    !> @param [in] node         - Memory allocation node to query
    !> @param [out] pNodeParams - Parameters for the specified memory allocation node
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphMemAllocNodeGetParams_raw(node, pNodeParams) &
       result(GraphMemAllocNodeGetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemAllocNodeGetParams")
#else
       bind(C, name="hipGraphMemAllocNodeGetParams")
#endif
       import :: c_ptr, hipMemAllocNodeParams, c_int
       type(c_ptr), value :: node
       type(hipMemAllocNodeParams) :: pNodeParams
       integer(c_int) :: GraphMemAllocNodeGetParams_raw
    end function hipGraphMemAllocNodeGetParams_raw

    module procedure hipGraphMemAllocNodeGetParams_typed
  end interface hipGraphMemAllocNodeGetParams

  interface hipGraphAddMemFreeNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddMemFreeNode_raw(pGraphNode, graph, pDependencies, numDependencies, &
                                        dev_ptr) &
       result(GraphAddMemFreeNode_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddMemFreeNode")
#else
       bind(C, name="hipGraphAddMemFreeNode")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: dev_ptr
       integer(c_int) :: GraphAddMemFreeNode_raw
    end function hipGraphAddMemFreeNode_raw

    module procedure hipGraphAddMemFreeNode_typed
  end interface hipGraphAddMemFreeNode

  interface hipGraphMemFreeNodeGetParams
    !---------------------------------------------
    ! hipGraphMemFreeNodeGetParams
    !---------------------------------------------
    !> @brief Returns parameters for memory free node
    !>
    !> @param [in] node     - Memory free node to query
    !> @param [out] dev_ptr - Device pointer of the specified memory free node
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphMemFreeNodeGetParams_raw(node, dev_ptr) &
       result(GraphMemFreeNodeGetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphMemFreeNodeGetParams")
#else
       bind(C, name="hipGraphMemFreeNodeGetParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: node
       type(c_ptr), value :: dev_ptr
       integer(c_int) :: GraphMemFreeNodeGetParams_raw
    end function hipGraphMemFreeNodeGetParams_raw

    module procedure hipGraphMemFreeNodeGetParams_typed
  end interface hipGraphMemFreeNodeGetParams

  interface hipUserObjectCreate
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipUserObjectCreate_raw(object_out, ptr, destroy, initialRefcount, flags) &
       result(UserObjectCreate_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaUserObjectCreate")
#else
       bind(C, name="hipUserObjectCreate")
#endif
       import :: c_ptr, c_funptr, c_int
       type(c_ptr) :: object_out
       type(c_ptr), value :: ptr
       type(c_funptr), value :: destroy
       integer(c_int), value :: initialRefcount
       integer(c_int), value :: flags
       integer(c_int) :: UserObjectCreate_raw
    end function hipUserObjectCreate_raw

    module procedure hipUserObjectCreate_typed
  end interface hipUserObjectCreate

  interface hipUserObjectRelease
    !---------------------------------------------
    ! hipUserObjectRelease
    !---------------------------------------------
    !> @brief Release number of references to resource.
    !>
    !> @param [in] object - pointer to instace of userobj.
    !> @param [in] count - reference to resource to be retained.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipUserObjectRelease_raw(object, count) &
       result(UserObjectRelease_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaUserObjectRelease")
#else
       bind(C, name="hipUserObjectRelease")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: object
       integer(c_int), value :: count
       integer(c_int) :: UserObjectRelease_raw
    end function hipUserObjectRelease_raw

    module procedure hipUserObjectRelease_typed
  end interface hipUserObjectRelease

  interface hipUserObjectRetain
    !---------------------------------------------
    ! hipUserObjectRetain
    !---------------------------------------------
    !> @brief Retain number of references to resource.
    !>
    !> @param [in] object - pointer to instace of userobj.
    !> @param [in] count - reference to resource to be retained.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipUserObjectRetain_raw(object, count) &
       result(UserObjectRetain_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaUserObjectRetain")
#else
       bind(C, name="hipUserObjectRetain")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: object
       integer(c_int), value :: count
       integer(c_int) :: UserObjectRetain_raw
    end function hipUserObjectRetain_raw

    module procedure hipUserObjectRetain_typed
  end interface hipUserObjectRetain

  interface hipGraphRetainUserObject
    !---------------------------------------------
    ! hipGraphRetainUserObject
    !---------------------------------------------
    !> @brief Retain user object for graphs.
    !>
    !> @param [in] graph - pointer to graph to retain the user object for.
    !> @param [in] object - pointer to instace of userobj.
    !> @param [in] count - reference to resource to be retained.
    !> @param [in] flags - flags passed to API.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphRetainUserObject_raw(graph, object, count, flags) &
       result(GraphRetainUserObject_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphRetainUserObject")
#else
       bind(C, name="hipGraphRetainUserObject")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       type(c_ptr), value :: object
       integer(c_int), value :: count
       integer(c_int), value :: flags
       integer(c_int) :: GraphRetainUserObject_raw
    end function hipGraphRetainUserObject_raw

    module procedure hipGraphRetainUserObject_typed
  end interface hipGraphRetainUserObject

  interface hipGraphReleaseUserObject
    !---------------------------------------------
    ! hipGraphReleaseUserObject
    !---------------------------------------------
    !> @brief Release user object from graphs.
    !>
    !> @param [in] graph - pointer to graph to retain the user object for.
    !> @param [in] object - pointer to instace of userobj.
    !> @param [in] count - reference to resource to be retained.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphReleaseUserObject_raw(graph, object, count) &
       result(GraphReleaseUserObject_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphReleaseUserObject")
#else
       bind(C, name="hipGraphReleaseUserObject")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       type(c_ptr), value :: object
       integer(c_int), value :: count
       integer(c_int) :: GraphReleaseUserObject_raw
    end function hipGraphReleaseUserObject_raw

    module procedure hipGraphReleaseUserObject_typed
  end interface hipGraphReleaseUserObject

  interface hipGraphDebugDotPrint
    !---------------------------------------------
    ! hipGraphDebugDotPrint
    !---------------------------------------------
    !> @brief Write a DOT file describing graph structure.
    !>
    !> @param [in] graph - graph object for which DOT file has to be generated.
    !> @param [in] path - path to write the DOT file.
    !> @param [in] flags - Flags from hipGraphDebugDotFlags to get additional node information.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorOperatingSystem`
    function hipGraphDebugDotPrint_raw(graph, path, flags) &
       result(GraphDebugDotPrint_raw) &
       bind(C, name="hipGraphDebugDotPrint")
       import :: c_ptr, c_int
       type(c_ptr), value :: graph
       type(c_ptr), value :: path
       integer(c_int), value :: flags
       integer(c_int) :: GraphDebugDotPrint_raw
    end function hipGraphDebugDotPrint_raw

    module procedure hipGraphDebugDotPrint_typed
    module procedure hipGraphDebugDotPrint_cstr
  end interface hipGraphDebugDotPrint

  interface hipGraphKernelNodeCopyAttributes
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
    !> For list of attributes see `hipKernelNodeAttrID`.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidContext`
    function hipGraphKernelNodeCopyAttributes_raw(hSrc, hDst) &
       result(GraphKernelNodeCopyAttributes_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphKernelNodeCopyAttributes")
#else
       bind(C, name="hipGraphKernelNodeCopyAttributes")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hSrc
       type(c_ptr), value :: hDst
       integer(c_int) :: GraphKernelNodeCopyAttributes_raw
    end function hipGraphKernelNodeCopyAttributes_raw

    module procedure hipGraphKernelNodeCopyAttributes_typed
  end interface hipGraphKernelNodeCopyAttributes

  interface hipGraphNodeSetEnabled
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`,
    function hipGraphNodeSetEnabled_raw(hGraphExec, hNode, isEnabled) &
       result(GraphNodeSetEnabled_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphNodeSetEnabled")
#else
       bind(C, name="hipGraphNodeSetEnabled")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       integer(c_int), value :: isEnabled
       integer(c_int) :: GraphNodeSetEnabled_raw
    end function hipGraphNodeSetEnabled_raw

    module procedure hipGraphNodeSetEnabled_typed
  end interface hipGraphNodeSetEnabled

  interface hipGraphNodeGetEnabled
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphNodeGetEnabled_raw(hGraphExec, hNode, isEnabled) &
       result(GraphNodeGetEnabled_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphNodeGetEnabled")
#else
       bind(C, name="hipGraphNodeGetEnabled")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(c_ptr), value :: isEnabled
       integer(c_int) :: GraphNodeGetEnabled_raw
    end function hipGraphNodeGetEnabled_raw

    module procedure hipGraphNodeGetEnabled_native
    module procedure hipGraphNodeGetEnabled_typed
  end interface hipGraphNodeGetEnabled

  interface hipGraphAddExternalSemaphoresWaitNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddExternalSemaphoresWaitNode_raw(pGraphNode, graph, pDependencies, &
                                                       numDependencies, nodeParams) &
       result(GraphAddExternalSemaphoresWaitNode_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddExternalSemaphoresWaitNode")
#else
       bind(C, name="hipGraphAddExternalSemaphoresWaitNode")
#endif
       import :: c_ptr, c_long, hipExternalSemaphoreWaitNodeParams, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
       integer(c_int) :: GraphAddExternalSemaphoresWaitNode_raw
    end function hipGraphAddExternalSemaphoresWaitNode_raw

    module procedure hipGraphAddExternalSemaphoresWaitNode_typed
  end interface hipGraphAddExternalSemaphoresWaitNode

  interface hipGraphAddExternalSemaphoresSignalNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphAddExternalSemaphoresSignalNode_raw(pGraphNode, graph, pDependencies, &
                                                         numDependencies, nodeParams) &
       result(GraphAddExternalSemaphoresSignalNode_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphAddExternalSemaphoresSignalNode")
#else
       bind(C, name="hipGraphAddExternalSemaphoresSignalNode")
#endif
       import :: c_ptr, c_long, hipExternalSemaphoreSignalNodeParams, c_int
       type(c_ptr) :: pGraphNode
       type(c_ptr), value :: graph
       type(c_ptr) :: pDependencies
       integer(c_long), value :: numDependencies
       type(hipExternalSemaphoreSignalNodeParams) :: nodeParams
       integer(c_int) :: GraphAddExternalSemaphoresSignalNode_raw
    end function hipGraphAddExternalSemaphoresSignalNode_raw

    module procedure hipGraphAddExternalSemaphoresSignalNode_typed
  end interface hipGraphAddExternalSemaphoresSignalNode

  interface hipGraphExternalSemaphoresSignalNodeSetParams
    !---------------------------------------------
    ! hipGraphExternalSemaphoresSignalNodeSetParams
    !---------------------------------------------
    !> @brief Updates node parameters in the external semaphore signal node.
    !>
    !> @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
    !> @param [in]  nodeParams  - Pointer to the params to be set.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExternalSemaphoresSignalNodeSetParams_raw(hNode, nodeParams) &
       result(GraphExternalSemaphoresSignalNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExternalSemaphoresSignalNodeSetParams")
#else
       bind(C, name="hipGraphExternalSemaphoresSignalNodeSetParams")
#endif
       import :: c_ptr, hipExternalSemaphoreSignalNodeParams, c_int
       type(c_ptr), value :: hNode
       type(hipExternalSemaphoreSignalNodeParams) :: nodeParams
       integer(c_int) :: GraphExternalSemaphoresSignalNodeSetParams_raw
    end function hipGraphExternalSemaphoresSignalNodeSetParams_raw

    module procedure hipGraphExternalSemaphoresSignalNodeSetParams_typed
  end interface hipGraphExternalSemaphoresSignalNodeSetParams

  interface hipGraphExternalSemaphoresWaitNodeSetParams
    !---------------------------------------------
    ! hipGraphExternalSemaphoresWaitNodeSetParams
    !---------------------------------------------
    !> @brief Updates node parameters in the external semaphore wait node.
    !>
    !> @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
    !> @param [in]  nodeParams  - Pointer to the params to be set.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExternalSemaphoresWaitNodeSetParams_raw(hNode, nodeParams) &
       result(GraphExternalSemaphoresWaitNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExternalSemaphoresWaitNodeSetParams")
#else
       bind(C, name="hipGraphExternalSemaphoresWaitNodeSetParams")
#endif
       import :: c_ptr, hipExternalSemaphoreWaitNodeParams, c_int
       type(c_ptr), value :: hNode
       type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
       integer(c_int) :: GraphExternalSemaphoresWaitNodeSetParams_raw
    end function hipGraphExternalSemaphoresWaitNodeSetParams_raw

    module procedure hipGraphExternalSemaphoresWaitNodeSetParams_typed
  end interface hipGraphExternalSemaphoresWaitNodeSetParams

  interface hipGraphExternalSemaphoresSignalNodeGetParams
    !---------------------------------------------
    ! hipGraphExternalSemaphoresSignalNodeGetParams
    !---------------------------------------------
    !> @brief Returns external semaphore signal node params.
    !>
    !> @param [in]   hNode       - Node from the graph from which graphExec was instantiated.
    !> @param [out]  params_out  - Pointer to params.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExternalSemaphoresSignalNodeGetParams_raw(hNode, params_out) &
       result(GraphExternalSemaphoresSignalNodeGetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExternalSemaphoresSignalNodeGetParams")
#else
       bind(C, name="hipGraphExternalSemaphoresSignalNodeGetParams")
#endif
       import :: c_ptr, hipExternalSemaphoreSignalNodeParams, c_int
       type(c_ptr), value :: hNode
       type(hipExternalSemaphoreSignalNodeParams) :: params_out
       integer(c_int) :: GraphExternalSemaphoresSignalNodeGetParams_raw
    end function hipGraphExternalSemaphoresSignalNodeGetParams_raw

    module procedure hipGraphExternalSemaphoresSignalNodeGetParams_typed
  end interface hipGraphExternalSemaphoresSignalNodeGetParams

  interface hipGraphExternalSemaphoresWaitNodeGetParams
    !---------------------------------------------
    ! hipGraphExternalSemaphoresWaitNodeGetParams
    !---------------------------------------------
    !> @brief Returns external semaphore wait node params.
    !>
    !> @param [in]   hNode       - Node from the graph from which graphExec was instantiated.
    !> @param [out]  params_out  - Pointer to params.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExternalSemaphoresWaitNodeGetParams_raw(hNode, params_out) &
       result(GraphExternalSemaphoresWaitNodeGetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExternalSemaphoresWaitNodeGetParams")
#else
       bind(C, name="hipGraphExternalSemaphoresWaitNodeGetParams")
#endif
       import :: c_ptr, hipExternalSemaphoreWaitNodeParams, c_int
       type(c_ptr), value :: hNode
       type(hipExternalSemaphoreWaitNodeParams) :: params_out
       integer(c_int) :: GraphExternalSemaphoresWaitNodeGetParams_raw
    end function hipGraphExternalSemaphoresWaitNodeGetParams_raw

    module procedure hipGraphExternalSemaphoresWaitNodeGetParams_typed
  end interface hipGraphExternalSemaphoresWaitNodeGetParams

  interface hipGraphExecExternalSemaphoresSignalNodeSetParams
    !---------------------------------------------
    ! hipGraphExecExternalSemaphoresSignalNodeSetParams
    !---------------------------------------------
    !> @brief Updates node parameters in the external semaphore signal node in the given graphExec.
    !>
    !> @param [in]  hGraphExec - The executable graph in which to set the specified node.
    !> @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
    !> @param [in]  nodeParams  - Pointer to the params to be set.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecExternalSemaphoresSignalNodeSetParams_raw(hGraphExec, hNode, nodeParams) &
       result(GraphExecExternalSemaphoresSignalNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecExternalSemaphoresSignalNodeSetParams")
#else
       bind(C, name="hipGraphExecExternalSemaphoresSignalNodeSetParams")
#endif
       import :: c_ptr, hipExternalSemaphoreSignalNodeParams, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(hipExternalSemaphoreSignalNodeParams) :: nodeParams
       integer(c_int) :: GraphExecExternalSemaphoresSignalNodeSetParams_raw
    end function hipGraphExecExternalSemaphoresSignalNodeSetParams_raw

    module procedure hipGraphExecExternalSemaphoresSignalNodeSetParams_typed
  end interface hipGraphExecExternalSemaphoresSignalNodeSetParams

  interface hipGraphExecExternalSemaphoresWaitNodeSetParams
    !---------------------------------------------
    ! hipGraphExecExternalSemaphoresWaitNodeSetParams
    !---------------------------------------------
    !> @brief Updates node parameters in the external semaphore wait node in the given graphExec.
    !>
    !> @param [in]  hGraphExec - The executable graph in which to set the specified node.
    !> @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
    !> @param [in]  nodeParams  - Pointer to the params to be set.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipGraphExecExternalSemaphoresWaitNodeSetParams_raw(hGraphExec, hNode, nodeParams) &
       result(GraphExecExternalSemaphoresWaitNodeSetParams_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphExecExternalSemaphoresWaitNodeSetParams")
#else
       bind(C, name="hipGraphExecExternalSemaphoresWaitNodeSetParams")
#endif
       import :: c_ptr, hipExternalSemaphoreWaitNodeParams, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
       integer(c_int) :: GraphExecExternalSemaphoresWaitNodeSetParams_raw
    end function hipGraphExecExternalSemaphoresWaitNodeSetParams_raw

    module procedure hipGraphExecExternalSemaphoresWaitNodeSetParams_typed
  end interface hipGraphExecExternalSemaphoresWaitNodeSetParams

  interface hipDrvGraphMemcpyNodeGetParams
    !---------------------------------------------
    ! hipDrvGraphMemcpyNodeGetParams
    !---------------------------------------------
    !> @brief Gets a memcpy node's parameters.
    !>
    !> @param [in] hNode - instance of the node to get parameters from.
    !> @param [out] nodeParams - pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipDrvGraphMemcpyNodeGetParams_raw(hNode, nodeParams) &
       result(DrvGraphMemcpyNodeGetParams_raw) &
       bind(C, name="hipDrvGraphMemcpyNodeGetParams")
       import :: c_ptr, HIP_MEMCPY3D, c_int
       type(c_ptr), value :: hNode
       type(HIP_MEMCPY3D) :: nodeParams
       integer(c_int) :: DrvGraphMemcpyNodeGetParams_raw
    end function hipDrvGraphMemcpyNodeGetParams_raw

    module procedure hipDrvGraphMemcpyNodeGetParams_typed
  end interface hipDrvGraphMemcpyNodeGetParams

  interface hipDrvGraphMemcpyNodeSetParams
    !---------------------------------------------
    ! hipDrvGraphMemcpyNodeSetParams
    !---------------------------------------------
    !> @brief Sets a memcpy node's parameters.
    !>
    !> @param [in] hNode - instance of the node to Set parameters for.
    !> @param [out] nodeParams - pointer to the parameters.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipDrvGraphMemcpyNodeSetParams_raw(hNode, nodeParams) &
       result(DrvGraphMemcpyNodeSetParams_raw) &
       bind(C, name="hipDrvGraphMemcpyNodeSetParams")
       import :: c_ptr, HIP_MEMCPY3D, c_int
       type(c_ptr), value :: hNode
       type(HIP_MEMCPY3D) :: nodeParams
       integer(c_int) :: DrvGraphMemcpyNodeSetParams_raw
    end function hipDrvGraphMemcpyNodeSetParams_raw

    module procedure hipDrvGraphMemcpyNodeSetParams_typed
  end interface hipDrvGraphMemcpyNodeSetParams

  interface hipDrvGraphAddMemsetNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipDrvGraphAddMemsetNode_raw(phGraphNode, hGraph, dependencies, numDependencies, &
                                          memsetParams, ctx) &
       result(DrvGraphAddMemsetNode_raw) &
       bind(C, name="hipDrvGraphAddMemsetNode")
       import :: c_ptr, c_long, hipMemsetParams, c_int
       type(c_ptr) :: phGraphNode
       type(c_ptr), value :: hGraph
       type(c_ptr) :: dependencies
       integer(c_long), value :: numDependencies
       type(hipMemsetParams) :: memsetParams
       type(c_ptr), value :: ctx
       integer(c_int) :: DrvGraphAddMemsetNode_raw
    end function hipDrvGraphAddMemsetNode_raw

    module procedure hipDrvGraphAddMemsetNode_typed
  end interface hipDrvGraphAddMemsetNode

  interface hipDrvGraphAddMemFreeNode
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
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipDrvGraphAddMemFreeNode_raw(phGraphNode, hGraph, dependencies, numDependencies, &
                                           dptr) &
       result(DrvGraphAddMemFreeNode_raw) &
       bind(C, name="hipDrvGraphAddMemFreeNode")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: phGraphNode
       type(c_ptr), value :: hGraph
       type(c_ptr) :: dependencies
       integer(c_long), value :: numDependencies
       type(c_ptr), value :: dptr
       integer(c_int) :: DrvGraphAddMemFreeNode_raw
    end function hipDrvGraphAddMemFreeNode_raw

    module procedure hipDrvGraphAddMemFreeNode_typed
  end interface hipDrvGraphAddMemFreeNode

  interface hipDrvGraphExecMemcpyNodeSetParams
    !---------------------------------------------
    ! hipDrvGraphExecMemcpyNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a memcpy node in the given graphExec.
    !>
    !> @param [in] hGraphExec - instance of the executable graph with the node.
    !> @param [in] hNode - instance of the node to set parameters to.
    !> @param [in] copyParams - const pointer to the memcpy node params.
    !> @param [in] ctx - cotext related to current device.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipDrvGraphExecMemcpyNodeSetParams_raw(hGraphExec, hNode, copyParams, ctx) &
       result(DrvGraphExecMemcpyNodeSetParams_raw) &
       bind(C, name="hipDrvGraphExecMemcpyNodeSetParams")
       import :: c_ptr, HIP_MEMCPY3D, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(HIP_MEMCPY3D) :: copyParams
       type(c_ptr), value :: ctx
       integer(c_int) :: DrvGraphExecMemcpyNodeSetParams_raw
    end function hipDrvGraphExecMemcpyNodeSetParams_raw

    module procedure hipDrvGraphExecMemcpyNodeSetParams_typed
  end interface hipDrvGraphExecMemcpyNodeSetParams

  interface hipDrvGraphExecMemsetNodeSetParams
    !---------------------------------------------
    ! hipDrvGraphExecMemsetNodeSetParams
    !---------------------------------------------
    !> @brief Sets the parameters for a memset node in the given graphExec.
    !>
    !> @param [in] hGraphExec - instance of the executable graph with the node.
    !> @param [in] hNode - instance of the node to set parameters to.
    !> @param [in] memsetParams - pointer to the parameters.
    !> @param [in] ctx - cotext related to current device.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`
    function hipDrvGraphExecMemsetNodeSetParams_raw(hGraphExec, hNode, memsetParams, ctx) &
       result(DrvGraphExecMemsetNodeSetParams_raw) &
       bind(C, name="hipDrvGraphExecMemsetNodeSetParams")
       import :: c_ptr, hipMemsetParams, c_int
       type(c_ptr), value :: hGraphExec
       type(c_ptr), value :: hNode
       type(hipMemsetParams) :: memsetParams
       type(c_ptr), value :: ctx
       integer(c_int) :: DrvGraphExecMemsetNodeSetParams_raw
    end function hipDrvGraphExecMemsetNodeSetParams_raw

    module procedure hipDrvGraphExecMemsetNodeSetParams_typed
  end interface hipDrvGraphExecMemsetNodeSetParams

  interface hipMemGetAccess
    !---------------------------------------------
    ! hipMemGetAccess
    !---------------------------------------------
    !> @brief Get the access flags set for the given location and ptr.
    !>
    !> @param [out] flags - flags for this location.
    !> @param [in] location - target location.
    !> @param [in] ptr - address to check the access flags.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !> @warning This API is marked as Beta. While this feature is complete, it can
    !> change and might have outstanding issues.
    !>
    !> @note  This API is implemented on Linux and is under development on Microsoft Windows.
    function hipMemGetAccess_raw(flags, location, ptr) &
       result(MemGetAccess_raw) &
       bind(C, name="hipMemGetAccess")
       import :: c_ptr, hipMemLocation, c_int
       type(c_ptr), value :: flags
       type(hipMemLocation) :: location
       type(c_ptr), value :: ptr
       integer(c_int) :: MemGetAccess_raw
    end function hipMemGetAccess_raw

    module procedure hipMemGetAccess_native
  end interface hipMemGetAccess

  interface hipMemMapArrayAsync
    !---------------------------------------------
    ! hipMemMapArrayAsync
    !---------------------------------------------
    !> @brief Maps or unmaps subregions of sparse HIP arrays and sparse HIP mipmapped arrays.
    !>
    !> @param [in] mapInfoList - list of hipArrayMapInfo.
    !> @param [in] count - number of hipArrayMapInfo in mapInfoList.
    !> @param [in] stream - stream identifier for the stream to use for map or unmap operations.
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
    !> @warning This API is under development. Currently it is not supported on AMD
    !> GPUs and returns `hipErrorNotSupported`.
    function hipMemMapArrayAsync_raw(mapInfoList, count, stream) &
       result(MemMapArrayAsync_raw) &
       bind(C, name="hipMemMapArrayAsync")
       import :: hipArrayMapInfo, c_int, c_ptr
       type(hipArrayMapInfo) :: mapInfoList
       integer(c_int), value :: count
       type(c_ptr), value :: stream
       integer(c_int) :: MemMapArrayAsync_raw
    end function hipMemMapArrayAsync_raw

    module procedure hipMemMapArrayAsync_typed
  end interface hipMemMapArrayAsync

  interface hipGraphicsMapResources
    !---------------------------------------------
    ! hipGraphicsMapResources
    !---------------------------------------------
    !> @brief Maps a graphics resource for access.
    !>
    !> @param [in] count - Number of resources to map.
    !> @param [in] resources - Pointer of resources to map.
    !> @param [in] stream - Stream for synchronization.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorUnknown`,
    !> `hipErrorInvalidResourceHandle`
    function hipGraphicsMapResources_raw(count, resources, stream) &
       result(GraphicsMapResources_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphicsMapResources")
#else
       bind(C, name="hipGraphicsMapResources")
#endif
       import :: c_int, c_ptr
       integer(c_int), value :: count
       type(c_ptr) :: resources
       type(c_ptr), value :: stream
       integer(c_int) :: GraphicsMapResources_raw
    end function hipGraphicsMapResources_raw

    module procedure hipGraphicsMapResources_typed
  end interface hipGraphicsMapResources

  interface hipGraphicsUnmapResources
    !---------------------------------------------
    ! hipGraphicsUnmapResources
    !---------------------------------------------
    !> @brief Unmaps graphics resources.
    !>
    !> @param [in] count - Number of resources to unmap.
    !> @param [in] resources - Pointer of resources to unmap.
    !> @param [in] stream - Stream for synchronization.
    !>
    !> @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorUnknown`,
    !> `hipErrorContextIsDestroyed`
    function hipGraphicsUnmapResources_raw(count, resources, stream) &
       result(GraphicsUnmapResources_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cudaGraphicsUnmapResources")
#else
       bind(C, name="hipGraphicsUnmapResources")
#endif
       import :: c_int, c_ptr
       integer(c_int), value :: count
       type(c_ptr) :: resources
       type(c_ptr), value :: stream
       integer(c_int) :: GraphicsUnmapResources_raw
    end function hipGraphicsUnmapResources_raw

    module procedure hipGraphicsUnmapResources_typed
  end interface hipGraphicsUnmapResources

  interface hipMemsetAsync_spt
    !---------------------------------------------
    ! hipMemsetAsync_spt
    !---------------------------------------------
    function hipMemsetAsync_spt_raw(dst, value, sizeBytes, stream) &
       result(MemsetAsync_spt_raw) &
       bind(C, name="hipMemsetAsync_spt")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dst
       integer(c_int), value :: value
       integer(c_long), value :: sizeBytes
       type(c_ptr), value :: stream
       integer(c_int) :: MemsetAsync_spt_raw
    end function hipMemsetAsync_spt_raw

    module procedure hipMemsetAsync_spt_typed
  end interface hipMemsetAsync_spt

  interface hipMemset2DAsync_spt
    !---------------------------------------------
    ! hipMemset2DAsync_spt
    !---------------------------------------------
    function hipMemset2DAsync_spt_raw(dst, pitch, value, width, height, stream) &
       result(Memset2DAsync_spt_raw) &
       bind(C, name="hipMemset2DAsync_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       integer(c_long), value :: pitch
       integer(c_int), value :: value
       integer(c_long), value :: width
       integer(c_long), value :: height
       type(c_ptr), value :: stream
       integer(c_int) :: Memset2DAsync_spt_raw
    end function hipMemset2DAsync_spt_raw

    module procedure hipMemset2DAsync_spt_typed
  end interface hipMemset2DAsync_spt

  interface hipMemset3DAsync_spt
    !---------------------------------------------
    ! hipMemset3DAsync_spt
    !---------------------------------------------
    function hipMemset3DAsync_spt_raw(pitchedDevPtr, value, extent, stream) &
       result(Memset3DAsync_spt_raw) &
       bind(C, name="hipMemset3DAsync_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: pitchedDevPtr
       integer(c_int), value :: value
       type(c_ptr), value :: extent
       type(c_ptr), value :: stream
       integer(c_int) :: Memset3DAsync_spt_raw
    end function hipMemset3DAsync_spt_raw

    module procedure hipMemset3DAsync_spt_typed
  end interface hipMemset3DAsync_spt

  interface hipMemcpyAsync_spt
    !---------------------------------------------
    ! hipMemcpyAsync_spt
    !---------------------------------------------
    function hipMemcpyAsync_spt_raw(dst, src, sizeBytes, kind, stream) &
       result(MemcpyAsync_spt_raw) &
       bind(C, name="hipMemcpyAsync_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyAsync_spt_raw
    end function hipMemcpyAsync_spt_raw

    module procedure hipMemcpyAsync_spt_typed
  end interface hipMemcpyAsync_spt

  interface hipMemcpy3DAsync_spt
    !---------------------------------------------
    ! hipMemcpy3DAsync_spt
    !---------------------------------------------
    function hipMemcpy3DAsync_spt_raw(p, stream) &
       result(Memcpy3DAsync_spt_raw) &
       bind(C, name="hipMemcpy3DAsync_spt")
       import :: hipMemcpy3DParms, c_ptr, c_int
       type(hipMemcpy3DParms) :: p
       type(c_ptr), value :: stream
       integer(c_int) :: Memcpy3DAsync_spt_raw
    end function hipMemcpy3DAsync_spt_raw

    module procedure hipMemcpy3DAsync_spt_typed
  end interface hipMemcpy3DAsync_spt

  interface hipMemcpy2DAsync_spt
    !---------------------------------------------
    ! hipMemcpy2DAsync_spt
    !---------------------------------------------
    function hipMemcpy2DAsync_spt_raw(dst, dpitch, src, spitch, width, height, kind, stream) &
       result(Memcpy2DAsync_spt_raw) &
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
       integer(c_int) :: Memcpy2DAsync_spt_raw
    end function hipMemcpy2DAsync_spt_raw

    module procedure hipMemcpy2DAsync_spt_typed
  end interface hipMemcpy2DAsync_spt

  interface hipMemcpyFromSymbolAsync_spt
    !---------------------------------------------
    ! hipMemcpyFromSymbolAsync_spt
    !---------------------------------------------
    function hipMemcpyFromSymbolAsync_spt_raw(dst, symbol, sizeBytes, offset, kind, stream) &
       result(MemcpyFromSymbolAsync_spt_raw) &
       bind(C, name="hipMemcpyFromSymbolAsync_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: dst
       type(c_ptr), value :: symbol
       integer(c_long), value :: sizeBytes
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyFromSymbolAsync_spt_raw
    end function hipMemcpyFromSymbolAsync_spt_raw

    module procedure hipMemcpyFromSymbolAsync_spt_typed
  end interface hipMemcpyFromSymbolAsync_spt

  interface hipMemcpyToSymbolAsync_spt
    !---------------------------------------------
    ! hipMemcpyToSymbolAsync_spt
    !---------------------------------------------
    function hipMemcpyToSymbolAsync_spt_raw(symbol, src, sizeBytes, offset, kind, stream) &
       result(MemcpyToSymbolAsync_spt_raw) &
       bind(C, name="hipMemcpyToSymbolAsync_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: symbol
       type(c_ptr), value :: src
       integer(c_long), value :: sizeBytes
       integer(c_long), value :: offset
       integer(c_int), value :: kind
       type(c_ptr), value :: stream
       integer(c_int) :: MemcpyToSymbolAsync_spt_raw
    end function hipMemcpyToSymbolAsync_spt_raw

    module procedure hipMemcpyToSymbolAsync_spt_typed
  end interface hipMemcpyToSymbolAsync_spt

  interface hipMemcpy2DFromArrayAsync_spt
    !---------------------------------------------
    ! hipMemcpy2DFromArrayAsync_spt
    !---------------------------------------------
    function hipMemcpy2DFromArrayAsync_spt_raw(dst, dpitch, src, wOffsetSrc, hOffsetSrc, width, &
                                               height, kind, stream) &
       result(Memcpy2DFromArrayAsync_spt_raw) &
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
       integer(c_int) :: Memcpy2DFromArrayAsync_spt_raw
    end function hipMemcpy2DFromArrayAsync_spt_raw

    module procedure hipMemcpy2DFromArrayAsync_spt_typed
  end interface hipMemcpy2DFromArrayAsync_spt

  interface hipMemcpy2DToArrayAsync_spt
    !---------------------------------------------
    ! hipMemcpy2DToArrayAsync_spt
    !---------------------------------------------
    function hipMemcpy2DToArrayAsync_spt_raw(dst, wOffset, hOffset, src, spitch, width, height, &
                                             kind, stream) &
       result(Memcpy2DToArrayAsync_spt_raw) &
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
       integer(c_int) :: Memcpy2DToArrayAsync_spt_raw
    end function hipMemcpy2DToArrayAsync_spt_raw

    module procedure hipMemcpy2DToArrayAsync_spt_typed
  end interface hipMemcpy2DToArrayAsync_spt

  interface hipStreamQuery_spt
    !---------------------------------------------
    ! hipStreamQuery_spt
    !---------------------------------------------
    function hipStreamQuery_spt_raw(stream) &
       result(StreamQuery_spt_raw) &
       bind(C, name="hipStreamQuery_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: StreamQuery_spt_raw
    end function hipStreamQuery_spt_raw

    module procedure hipStreamQuery_spt_typed
  end interface hipStreamQuery_spt

  interface hipStreamSynchronize_spt
    !---------------------------------------------
    ! hipStreamSynchronize_spt
    !---------------------------------------------
    function hipStreamSynchronize_spt_raw(stream) &
       result(StreamSynchronize_spt_raw) &
       bind(C, name="hipStreamSynchronize_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int) :: StreamSynchronize_spt_raw
    end function hipStreamSynchronize_spt_raw

    module procedure hipStreamSynchronize_spt_typed
  end interface hipStreamSynchronize_spt

  interface hipStreamGetPriority_spt
    !---------------------------------------------
    ! hipStreamGetPriority_spt
    !---------------------------------------------
    function hipStreamGetPriority_spt_raw(stream, priority) &
       result(StreamGetPriority_spt_raw) &
       bind(C, name="hipStreamGetPriority_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: priority
       integer(c_int) :: StreamGetPriority_spt_raw
    end function hipStreamGetPriority_spt_raw

    module procedure hipStreamGetPriority_spt_native
    module procedure hipStreamGetPriority_spt_typed
  end interface hipStreamGetPriority_spt

  interface hipStreamWaitEvent_spt
    !---------------------------------------------
    ! hipStreamWaitEvent_spt
    !---------------------------------------------
    function hipStreamWaitEvent_spt_raw(stream, event, flags) &
       result(StreamWaitEvent_spt_raw) &
       bind(C, name="hipStreamWaitEvent_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: event
       integer(c_int), value :: flags
       integer(c_int) :: StreamWaitEvent_spt_raw
    end function hipStreamWaitEvent_spt_raw

    module procedure hipStreamWaitEvent_spt_typed
  end interface hipStreamWaitEvent_spt

  interface hipStreamGetFlags_spt
    !---------------------------------------------
    ! hipStreamGetFlags_spt
    !---------------------------------------------
    function hipStreamGetFlags_spt_raw(stream, flags) &
       result(StreamGetFlags_spt_raw) &
       bind(C, name="hipStreamGetFlags_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: flags
       integer(c_int) :: StreamGetFlags_spt_raw
    end function hipStreamGetFlags_spt_raw

    module procedure hipStreamGetFlags_spt_native
    module procedure hipStreamGetFlags_spt_typed
  end interface hipStreamGetFlags_spt

  interface hipStreamAddCallback_spt
    !---------------------------------------------
    ! hipStreamAddCallback_spt
    !---------------------------------------------
    function hipStreamAddCallback_spt_raw(stream, callback, userData, flags) &
       result(StreamAddCallback_spt_raw) &
       bind(C, name="hipStreamAddCallback_spt")
       import :: c_ptr, c_funptr, c_int
       type(c_ptr), value :: stream
       type(c_funptr), value :: callback
       type(c_ptr), value :: userData
       integer(c_int), value :: flags
       integer(c_int) :: StreamAddCallback_spt_raw
    end function hipStreamAddCallback_spt_raw

    module procedure hipStreamAddCallback_spt_typed
  end interface hipStreamAddCallback_spt

  interface hipEventRecord_spt
    !---------------------------------------------
    ! hipEventRecord_spt
    !---------------------------------------------
    function hipEventRecord_spt_raw(event, stream) &
       result(EventRecord_spt_raw) &
       bind(C, name="hipEventRecord_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: event
       type(c_ptr), value :: stream
       integer(c_int) :: EventRecord_spt_raw
    end function hipEventRecord_spt_raw

    module procedure hipEventRecord_spt_typed
  end interface hipEventRecord_spt

  interface hipLaunchCooperativeKernel_spt
    !---------------------------------------------
    ! hipLaunchCooperativeKernel_spt
    !---------------------------------------------
    function hipLaunchCooperativeKernel_spt_raw(f, gridDim, blockDim, kernelParams, &
                                                sharedMemBytes, hStream) &
       result(LaunchCooperativeKernel_spt_raw) &
       bind(C, name="hipLaunchCooperativeKernel_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: f
       type(c_ptr), value :: gridDim
       type(c_ptr), value :: blockDim
       type(c_ptr) :: kernelParams
       integer(c_int), value :: sharedMemBytes
       type(c_ptr), value :: hStream
       integer(c_int) :: LaunchCooperativeKernel_spt_raw
    end function hipLaunchCooperativeKernel_spt_raw

    module procedure hipLaunchCooperativeKernel_spt_typed
  end interface hipLaunchCooperativeKernel_spt

  interface hipLaunchKernel_spt
    !---------------------------------------------
    ! hipLaunchKernel_spt
    !---------------------------------------------
    function hipLaunchKernel_spt_raw(function_address, numBlocks, dimBlocks, args, sharedMemBytes, &
                                     stream) &
       result(LaunchKernel_spt_raw) &
       bind(C, name="hipLaunchKernel_spt")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: function_address
       type(c_ptr), value :: numBlocks
       type(c_ptr), value :: dimBlocks
       type(c_ptr) :: args
       integer(c_long), value :: sharedMemBytes
       type(c_ptr), value :: stream
       integer(c_int) :: LaunchKernel_spt_raw
    end function hipLaunchKernel_spt_raw

    module procedure hipLaunchKernel_spt_typed
  end interface hipLaunchKernel_spt

  interface hipGraphLaunch_spt
    !---------------------------------------------
    ! hipGraphLaunch_spt
    !---------------------------------------------
    function hipGraphLaunch_spt_raw(graphExec, stream) &
       result(GraphLaunch_spt_raw) &
       bind(C, name="hipGraphLaunch_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: graphExec
       type(c_ptr), value :: stream
       integer(c_int) :: GraphLaunch_spt_raw
    end function hipGraphLaunch_spt_raw

    module procedure hipGraphLaunch_spt_typed
  end interface hipGraphLaunch_spt

  interface hipStreamBeginCapture_spt
    !---------------------------------------------
    ! hipStreamBeginCapture_spt
    !---------------------------------------------
    function hipStreamBeginCapture_spt_raw(stream, mode) &
       result(StreamBeginCapture_spt_raw) &
       bind(C, name="hipStreamBeginCapture_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       integer(c_int), value :: mode
       integer(c_int) :: StreamBeginCapture_spt_raw
    end function hipStreamBeginCapture_spt_raw

    module procedure hipStreamBeginCapture_spt_typed
  end interface hipStreamBeginCapture_spt

  interface hipStreamEndCapture_spt
    !---------------------------------------------
    ! hipStreamEndCapture_spt
    !---------------------------------------------
    function hipStreamEndCapture_spt_raw(stream, pGraph) &
       result(StreamEndCapture_spt_raw) &
       bind(C, name="hipStreamEndCapture_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr) :: pGraph
       integer(c_int) :: StreamEndCapture_spt_raw
    end function hipStreamEndCapture_spt_raw

    module procedure hipStreamEndCapture_spt_typed
  end interface hipStreamEndCapture_spt

  interface hipStreamIsCapturing_spt
    !---------------------------------------------
    ! hipStreamIsCapturing_spt
    !---------------------------------------------
    function hipStreamIsCapturing_spt_raw(stream, pCaptureStatus) &
       result(StreamIsCapturing_spt_raw) &
       bind(C, name="hipStreamIsCapturing_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: pCaptureStatus
       integer(c_int) :: StreamIsCapturing_spt_raw
    end function hipStreamIsCapturing_spt_raw

    module procedure hipStreamIsCapturing_spt_native
    module procedure hipStreamIsCapturing_spt_typed
  end interface hipStreamIsCapturing_spt

  interface hipStreamGetCaptureInfo_spt
    !---------------------------------------------
    ! hipStreamGetCaptureInfo_spt
    !---------------------------------------------
    function hipStreamGetCaptureInfo_spt_raw(stream, pCaptureStatus, pId) &
       result(StreamGetCaptureInfo_spt_raw) &
       bind(C, name="hipStreamGetCaptureInfo_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: pCaptureStatus
       type(c_ptr), value :: pId
       integer(c_int) :: StreamGetCaptureInfo_spt_raw
    end function hipStreamGetCaptureInfo_spt_raw

    module procedure hipStreamGetCaptureInfo_spt_native
    module procedure hipStreamGetCaptureInfo_spt_typed
  end interface hipStreamGetCaptureInfo_spt

  interface hipStreamGetCaptureInfo_v2_spt
    !---------------------------------------------
    ! hipStreamGetCaptureInfo_v2_spt
    !---------------------------------------------
    function hipStreamGetCaptureInfo_v2_spt_raw(stream, captureStatus_out, id_out, graph_out, &
                                                dependencies_out, numDependencies_out) &
       result(StreamGetCaptureInfo_v2_spt_raw) &
       bind(C, name="hipStreamGetCaptureInfo_v2_spt")
       import :: c_ptr, c_int
       type(c_ptr), value :: stream
       type(c_ptr), value :: captureStatus_out
       type(c_ptr), value :: id_out
       type(c_ptr) :: graph_out
       type(c_ptr) :: dependencies_out
       type(c_ptr), value :: numDependencies_out
       integer(c_int) :: StreamGetCaptureInfo_v2_spt_raw
    end function hipStreamGetCaptureInfo_v2_spt_raw

    module procedure hipStreamGetCaptureInfo_v2_spt_native
    module procedure hipStreamGetCaptureInfo_v2_spt_typed
  end interface hipStreamGetCaptureInfo_v2_spt

  interface hipLaunchHostFunc_spt
    !---------------------------------------------
    ! hipLaunchHostFunc_spt
    !---------------------------------------------
    function hipLaunchHostFunc_spt_raw(stream, fn, userData) &
       result(LaunchHostFunc_spt_raw) &
       bind(C, name="hipLaunchHostFunc_spt")
       import :: c_ptr, c_funptr, c_int
       type(c_ptr), value :: stream
       type(c_funptr), value :: fn
       type(c_ptr), value :: userData
       integer(c_int) :: LaunchHostFunc_spt_raw
    end function hipLaunchHostFunc_spt_raw

    module procedure hipLaunchHostFunc_spt_typed
  end interface hipLaunchHostFunc_spt

  interface hipGetDriverEntryPoint_spt
    !---------------------------------------------
    ! hipGetDriverEntryPoint_spt
    !---------------------------------------------
    function hipGetDriverEntryPoint_spt_raw(symbol, funcPtr, flags, status) &
       result(GetDriverEntryPoint_spt_raw) &
       bind(C, name="hipGetDriverEntryPoint_spt")
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr), value :: symbol
       type(c_ptr) :: funcPtr
       integer(c_int64_t), value :: flags
       type(c_ptr), value :: status
       integer(c_int) :: GetDriverEntryPoint_spt_raw
    end function hipGetDriverEntryPoint_spt_raw

    module procedure hipGetDriverEntryPoint_spt_native
    module procedure hipGetDriverEntryPoint_spt_cstr
  end interface hipGetDriverEntryPoint_spt


contains

    function hipDriverGetVersion_native(driverVersion) result(DriverGetVersion)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: driverVersion(..)
      integer(c_int) :: DriverGetVersion
      if (.not. is_contiguous(driverVersion)) error stop "driverVersion: array must be contiguous"
      DriverGetVersion = hipDriverGetVersion_raw(c_loc(driverVersion))
    end function hipDriverGetVersion_native

    function hipRuntimeGetVersion_native(runtimeVersion) result(RuntimeGetVersion)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: runtimeVersion(..)
      integer(c_int) :: RuntimeGetVersion
      if (.not. is_contiguous(runtimeVersion)) error stop "runtimeVersion: array must be contiguous"
      RuntimeGetVersion = hipRuntimeGetVersion_raw(c_loc(runtimeVersion))
    end function hipRuntimeGetVersion_native

    function hipDeviceComputeCapability_native(major, minor, device) result(DeviceComputeCapability)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: major(..)
      integer(c_int), target :: minor(..)
      integer(c_int), value :: device
      integer(c_int) :: DeviceComputeCapability
      if (.not. is_contiguous(major)) error stop "major: array must be contiguous"
      if (.not. is_contiguous(minor)) error stop "minor: array must be contiguous"
      DeviceComputeCapability = hipDeviceComputeCapability_raw(c_loc(major), c_loc(minor), device)
    end function hipDeviceComputeCapability_native

    function hipDeviceGetP2PAttribute_native(value, attr, srcDevice, dstDevice) result( &
        DeviceGetP2PAttribute)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: value(..)
      integer(c_int), value :: attr
      integer(c_int), value :: srcDevice
      integer(c_int), value :: dstDevice
      integer(c_int) :: DeviceGetP2PAttribute
      if (.not. is_contiguous(value)) error stop "value: array must be contiguous"
      DeviceGetP2PAttribute = hipDeviceGetP2PAttribute_raw(c_loc(value), attr, srcDevice, dstDevice)
    end function hipDeviceGetP2PAttribute_native

    function hipDeviceGetByPCIBusId_cstr(device, pciBusId) result(DeviceGetByPCIBusId)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int) :: device
      character(len=*), intent(in) :: pciBusId
      integer(c_int) :: DeviceGetByPCIBusId
      character(len=len_trim(pciBusId)+1, kind=c_char), target :: pciBusId__c
      pciBusId__c = trim(pciBusId)//c_null_char
      DeviceGetByPCIBusId = hipDeviceGetByPCIBusId_raw(device, c_loc(pciBusId__c))
    end function hipDeviceGetByPCIBusId_cstr

    function hipSetValidDevices_native(device_arr, len) result(SetValidDevices)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: device_arr(..)
      integer(c_int), value :: len
      integer(c_int) :: SetValidDevices
      if (.not. is_contiguous(device_arr)) error stop "device_arr: array must be contiguous"
      SetValidDevices = hipSetValidDevices_raw(c_loc(device_arr), len)
    end function hipSetValidDevices_native

    function hipDeviceGetAttribute_native(pi, attr, deviceId) result(DeviceGetAttribute)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: pi(..)
      integer(c_int), value :: attr
      integer(c_int), value :: deviceId
      integer(c_int) :: DeviceGetAttribute
      if (.not. is_contiguous(pi)) error stop "pi: array must be contiguous"
      DeviceGetAttribute = hipDeviceGetAttribute_raw(c_loc(pi), attr, deviceId)
    end function hipDeviceGetAttribute_native

    function hipDeviceGetDefaultMemPool_typed(mem_pool, device) result(DeviceGetDefaultMemPool)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t) :: mem_pool
      integer(c_int), value :: device
      integer(c_int) :: DeviceGetDefaultMemPool
      DeviceGetDefaultMemPool = hipDeviceGetDefaultMemPool_raw(mem_pool%ptr, device)
    end function hipDeviceGetDefaultMemPool_typed

    function hipDeviceSetMemPool_typed(device, mem_pool) result(DeviceSetMemPool)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int), value :: device
      type(hipMemPool_t), value :: mem_pool
      integer(c_int) :: DeviceSetMemPool
      DeviceSetMemPool = hipDeviceSetMemPool_raw(device, mem_pool%ptr)
    end function hipDeviceSetMemPool_typed

    function hipDeviceGetMemPool_typed(mem_pool, device) result(DeviceGetMemPool)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t) :: mem_pool
      integer(c_int), value :: device
      integer(c_int) :: DeviceGetMemPool
      DeviceGetMemPool = hipDeviceGetMemPool_raw(mem_pool%ptr, device)
    end function hipDeviceGetMemPool_typed

    function hipDeviceGetCacheConfig_native(cacheConfig) result(DeviceGetCacheConfig)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: cacheConfig(..)
      integer(c_int) :: DeviceGetCacheConfig
      if (.not. is_contiguous(cacheConfig)) error stop "cacheConfig: array must be contiguous"
      DeviceGetCacheConfig = hipDeviceGetCacheConfig_raw(c_loc(cacheConfig))
    end function hipDeviceGetCacheConfig_native

    function hipDeviceGetSharedMemConfig_native(pConfig) result(DeviceGetSharedMemConfig)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: pConfig(..)
      integer(c_int) :: DeviceGetSharedMemConfig
      if (.not. is_contiguous(pConfig)) error stop "pConfig: array must be contiguous"
      DeviceGetSharedMemConfig = hipDeviceGetSharedMemConfig_raw(c_loc(pConfig))
    end function hipDeviceGetSharedMemConfig_native

    function hipGetDeviceFlags_native(flags) result(GetDeviceFlags)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: flags(..)
      integer(c_int) :: GetDeviceFlags
      if (.not. is_contiguous(flags)) error stop "flags: array must be contiguous"
      GetDeviceFlags = hipGetDeviceFlags_raw(c_loc(flags))
    end function hipGetDeviceFlags_native

    function hipChooseDeviceR0600_native(device, prop) result(ChooseDeviceR0600)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: device(..)
      type(hipDeviceProp_t) :: prop
      integer(c_int) :: ChooseDeviceR0600
      if (.not. is_contiguous(device)) error stop "device: array must be contiguous"
      ChooseDeviceR0600 = hipChooseDeviceR0600_raw(c_loc(device), prop)
    end function hipChooseDeviceR0600_native

    function hipExtGetLinkTypeAndHopCount_native(device1, device2, linktype, hopcount) result( &
        ExtGetLinkTypeAndHopCount)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), value :: device1
      integer(c_int), value :: device2
      integer(c_int), target :: linktype(..)
      integer(c_int), target :: hopcount(..)
      integer(c_int) :: ExtGetLinkTypeAndHopCount
      if (.not. is_contiguous(linktype)) error stop "linktype: array must be contiguous"
      if (.not. is_contiguous(hopcount)) error stop "hopcount: array must be contiguous"
      ExtGetLinkTypeAndHopCount = hipExtGetLinkTypeAndHopCount_raw(device1, device2, c_loc( &
        linktype), c_loc(hopcount))
    end function hipExtGetLinkTypeAndHopCount_native

    function hipIpcGetEventHandle_typed(handle, event) result(IpcGetEventHandle)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipIpcEventHandle_t) :: handle
      type(hipEvent_t), value :: event
      integer(c_int) :: IpcGetEventHandle
      IpcGetEventHandle = hipIpcGetEventHandle_raw(handle, event%ptr)
    end function hipIpcGetEventHandle_typed

    function hipIpcOpenEventHandle_typed(event, handle) result(IpcOpenEventHandle)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t) :: event
      type(c_ptr), value :: handle
      integer(c_int) :: IpcOpenEventHandle
      IpcOpenEventHandle = hipIpcOpenEventHandle_raw(event%ptr, handle)
    end function hipIpcOpenEventHandle_typed

    function hipStreamCreate_typed(stream) result(StreamCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t) :: stream
      integer(c_int) :: StreamCreate
      StreamCreate = hipStreamCreate_raw(stream%ptr)
    end function hipStreamCreate_typed

    function hipStreamCreateWithFlags_typed(stream, flags) result(StreamCreateWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t) :: stream
      integer(c_int), value :: flags
      integer(c_int) :: StreamCreateWithFlags
      StreamCreateWithFlags = hipStreamCreateWithFlags_raw(stream%ptr, flags)
    end function hipStreamCreateWithFlags_typed

    function hipStreamCreateWithPriority_typed(stream, flags, priority) result( &
        StreamCreateWithPriority)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t) :: stream
      integer(c_int), value :: flags
      integer(c_int), value :: priority
      integer(c_int) :: StreamCreateWithPriority
      StreamCreateWithPriority = hipStreamCreateWithPriority_raw(stream%ptr, flags, priority)
    end function hipStreamCreateWithPriority_typed

    function hipDeviceGetStreamPriorityRange_native(leastPriority, greatestPriority) result( &
        DeviceGetStreamPriorityRange)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: leastPriority(..)
      integer(c_int), target :: greatestPriority(..)
      integer(c_int) :: DeviceGetStreamPriorityRange
      if (.not. is_contiguous(leastPriority)) error stop "leastPriority: array must be contiguous"
      if (.not. is_contiguous(greatestPriority)) error stop "greatestPriority: array must be contiguous"
      DeviceGetStreamPriorityRange = hipDeviceGetStreamPriorityRange_raw(c_loc(leastPriority), &
        c_loc(greatestPriority))
    end function hipDeviceGetStreamPriorityRange_native

    function hipStreamDestroy_typed(stream) result(StreamDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int) :: StreamDestroy
      StreamDestroy = hipStreamDestroy_raw(stream%ptr)
    end function hipStreamDestroy_typed

    function hipStreamQuery_typed(stream) result(StreamQuery)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int) :: StreamQuery
      StreamQuery = hipStreamQuery_raw(stream%ptr)
    end function hipStreamQuery_typed

    function hipStreamSynchronize_typed(stream) result(StreamSynchronize)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int) :: StreamSynchronize
      StreamSynchronize = hipStreamSynchronize_raw(stream%ptr)
    end function hipStreamSynchronize_typed

    function hipStreamWaitEvent_typed(stream, event, flags) result(StreamWaitEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(hipEvent_t), value :: event
      integer(c_int), value :: flags
      integer(c_int) :: StreamWaitEvent
      StreamWaitEvent = hipStreamWaitEvent_raw(stream%ptr, event%ptr, flags)
    end function hipStreamWaitEvent_typed

    function hipStreamGetFlags_native(stream, flags) result(StreamGetFlags)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), target :: flags(..)
      integer(c_int) :: StreamGetFlags
      if (.not. is_contiguous(flags)) error stop "flags: array must be contiguous"
      StreamGetFlags = hipStreamGetFlags_raw(stream, c_loc(flags))
    end function hipStreamGetFlags_native

    function hipStreamGetFlags_typed(stream, flags) result(StreamGetFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: flags
      integer(c_int) :: StreamGetFlags
      StreamGetFlags = hipStreamGetFlags_raw(stream%ptr, flags)
    end function hipStreamGetFlags_typed

    function hipStreamGetId_native(stream, streamId) result(StreamGetId)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int64_t), target :: streamId(..)
      integer(c_int) :: StreamGetId
      if (.not. is_contiguous(streamId)) error stop "streamId: array must be contiguous"
      StreamGetId = hipStreamGetId_raw(stream, c_loc(streamId))
    end function hipStreamGetId_native

    function hipStreamGetId_typed(stream, streamId) result(StreamGetId)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: streamId
      integer(c_int) :: StreamGetId
      StreamGetId = hipStreamGetId_raw(stream%ptr, streamId)
    end function hipStreamGetId_typed

    function hipStreamGetPriority_native(stream, priority) result(StreamGetPriority)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), target :: priority(..)
      integer(c_int) :: StreamGetPriority
      if (.not. is_contiguous(priority)) error stop "priority: array must be contiguous"
      StreamGetPriority = hipStreamGetPriority_raw(stream, c_loc(priority))
    end function hipStreamGetPriority_native

    function hipStreamGetPriority_typed(stream, priority) result(StreamGetPriority)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: priority
      integer(c_int) :: StreamGetPriority
      StreamGetPriority = hipStreamGetPriority_raw(stream%ptr, priority)
    end function hipStreamGetPriority_typed

    function hipStreamGetDevice_native(stream, device) result(StreamGetDevice)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), target :: device(..)
      integer(c_int) :: StreamGetDevice
      if (.not. is_contiguous(device)) error stop "device: array must be contiguous"
      StreamGetDevice = hipStreamGetDevice_raw(stream, c_loc(device))
    end function hipStreamGetDevice_native

    function hipStreamGetDevice_typed(stream, device) result(StreamGetDevice)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: device
      integer(c_int) :: StreamGetDevice
      StreamGetDevice = hipStreamGetDevice_raw(stream%ptr, device)
    end function hipStreamGetDevice_typed

    function hipExtStreamCreateWithCUMask_native(stream, cuMaskSize, cuMask) result( &
        ExtStreamCreateWithCUMask)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: stream
      integer(c_int), value :: cuMaskSize
      integer(c_int), target :: cuMask(..)
      integer(c_int) :: ExtStreamCreateWithCUMask
      if (.not. is_contiguous(cuMask)) error stop "cuMask: array must be contiguous"
      ExtStreamCreateWithCUMask = hipExtStreamCreateWithCUMask_raw(stream, cuMaskSize, c_loc( &
        cuMask))
    end function hipExtStreamCreateWithCUMask_native

    function hipExtStreamCreateWithCUMask_typed(stream, cuMaskSize, cuMask) result( &
        ExtStreamCreateWithCUMask)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t) :: stream
      integer(c_int), value :: cuMaskSize
      type(c_ptr), value :: cuMask
      integer(c_int) :: ExtStreamCreateWithCUMask
      ExtStreamCreateWithCUMask = hipExtStreamCreateWithCUMask_raw(stream%ptr, cuMaskSize, cuMask)
    end function hipExtStreamCreateWithCUMask_typed

    function hipExtStreamGetCUMask_native(stream, cuMaskSize, cuMask) result(ExtStreamGetCUMask)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), value :: cuMaskSize
      integer(c_int), target :: cuMask(..)
      integer(c_int) :: ExtStreamGetCUMask
      if (.not. is_contiguous(cuMask)) error stop "cuMask: array must be contiguous"
      ExtStreamGetCUMask = hipExtStreamGetCUMask_raw(stream, cuMaskSize, c_loc(cuMask))
    end function hipExtStreamGetCUMask_native

    function hipExtStreamGetCUMask_typed(stream, cuMaskSize, cuMask) result(ExtStreamGetCUMask)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int), value :: cuMaskSize
      type(c_ptr), value :: cuMask
      integer(c_int) :: ExtStreamGetCUMask
      ExtStreamGetCUMask = hipExtStreamGetCUMask_raw(stream%ptr, cuMaskSize, cuMask)
    end function hipExtStreamGetCUMask_typed

    function hipStreamAddCallback_typed(stream, callback, userData, flags) result(StreamAddCallback)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_funptr), value :: callback
      type(c_ptr), value :: userData
      integer(c_int), value :: flags
      integer(c_int) :: StreamAddCallback
      StreamAddCallback = hipStreamAddCallback_raw(stream%ptr, callback, userData, flags)
    end function hipStreamAddCallback_typed

    function hipStreamSetAttribute_typed(stream, attr, value) result(StreamSetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int), value :: attr
      type(c_ptr), value :: value
      integer(c_int) :: StreamSetAttribute
      StreamSetAttribute = hipStreamSetAttribute_raw(stream%ptr, attr, value)
    end function hipStreamSetAttribute_typed

    function hipStreamGetAttribute_typed(stream, attr, value_out) result(StreamGetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int), value :: attr
      type(c_ptr), value :: value_out
      integer(c_int) :: StreamGetAttribute
      StreamGetAttribute = hipStreamGetAttribute_raw(stream%ptr, attr, value_out)
    end function hipStreamGetAttribute_typed

    function hipStreamCopyAttributes_typed(dst, src) result(StreamCopyAttributes)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: dst
      type(hipStream_t), value :: src
      integer(c_int) :: StreamCopyAttributes
      StreamCopyAttributes = hipStreamCopyAttributes_raw(dst%ptr, src%ptr)
    end function hipStreamCopyAttributes_typed

    function hipStreamWaitValue32_typed(stream, ptr, value, flags, mask) result(StreamWaitValue32)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: ptr
      integer(c_int), value :: value
      integer(c_int), value :: flags
      integer(c_int), value :: mask
      integer(c_int) :: StreamWaitValue32
      StreamWaitValue32 = hipStreamWaitValue32_raw(stream%ptr, ptr, value, flags, mask)
    end function hipStreamWaitValue32_typed

    function hipStreamWaitValue64_typed(stream, ptr, value, flags, mask) result(StreamWaitValue64)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: ptr
      integer(c_long), value :: value
      integer(c_int), value :: flags
      integer(c_long), value :: mask
      integer(c_int) :: StreamWaitValue64
      StreamWaitValue64 = hipStreamWaitValue64_raw(stream%ptr, ptr, value, flags, mask)
    end function hipStreamWaitValue64_typed

    function hipStreamWriteValue32_typed(stream, ptr, value, flags) result(StreamWriteValue32)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: ptr
      integer(c_int), value :: value
      integer(c_int), value :: flags
      integer(c_int) :: StreamWriteValue32
      StreamWriteValue32 = hipStreamWriteValue32_raw(stream%ptr, ptr, value, flags)
    end function hipStreamWriteValue32_typed

    function hipStreamWriteValue64_typed(stream, ptr, value, flags) result(StreamWriteValue64)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: ptr
      integer(c_long), value :: value
      integer(c_int), value :: flags
      integer(c_int) :: StreamWriteValue64
      StreamWriteValue64 = hipStreamWriteValue64_raw(stream%ptr, ptr, value, flags)
    end function hipStreamWriteValue64_typed

    function hipStreamBatchMemOp_typed(stream, count, paramArray, flags) result(StreamBatchMemOp)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int), value :: count
      type(c_ptr), value :: paramArray
      integer(c_int), value :: flags
      integer(c_int) :: StreamBatchMemOp
      StreamBatchMemOp = hipStreamBatchMemOp_raw(stream%ptr, count, paramArray, flags)
    end function hipStreamBatchMemOp_typed

    function hipGraphAddBatchMemOpNode_typed(phGraphNode, hGraph, dependencies, numDependencies, &
        nodeParams) result(GraphAddBatchMemOpNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: phGraphNode
      type(hipGraph_t), value :: hGraph
      type(hipGraphNode_t) :: dependencies
      integer(c_long), value :: numDependencies
      type(hipBatchMemOpNodeParams) :: nodeParams
      integer(c_int) :: GraphAddBatchMemOpNode
      GraphAddBatchMemOpNode = hipGraphAddBatchMemOpNode_raw(phGraphNode%ptr, hGraph%ptr, &
        dependencies%ptr, numDependencies, nodeParams)
    end function hipGraphAddBatchMemOpNode_typed

    function hipGraphBatchMemOpNodeGetParams_typed(hNode, nodeParams_out) result( &
        GraphBatchMemOpNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipBatchMemOpNodeParams) :: nodeParams_out
      integer(c_int) :: GraphBatchMemOpNodeGetParams
      GraphBatchMemOpNodeGetParams = hipGraphBatchMemOpNodeGetParams_raw(hNode%ptr, nodeParams_out)
    end function hipGraphBatchMemOpNodeGetParams_typed

    function hipGraphBatchMemOpNodeSetParams_typed(hNode, nodeParams) result( &
        GraphBatchMemOpNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipBatchMemOpNodeParams) :: nodeParams
      integer(c_int) :: GraphBatchMemOpNodeSetParams
      GraphBatchMemOpNodeSetParams = hipGraphBatchMemOpNodeSetParams_raw(hNode%ptr, nodeParams)
    end function hipGraphBatchMemOpNodeSetParams_typed

    function hipGraphExecBatchMemOpNodeSetParams_typed(hGraphExec, hNode, nodeParams) result( &
        GraphExecBatchMemOpNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(hipBatchMemOpNodeParams) :: nodeParams
      integer(c_int) :: GraphExecBatchMemOpNodeSetParams
      GraphExecBatchMemOpNodeSetParams = hipGraphExecBatchMemOpNodeSetParams_raw(hGraphExec%ptr, &
        hNode%ptr, nodeParams)
    end function hipGraphExecBatchMemOpNodeSetParams_typed

    function hipEventCreateWithFlags_typed(event, flags) result(EventCreateWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t) :: event
      integer(c_int), value :: flags
      integer(c_int) :: EventCreateWithFlags
      EventCreateWithFlags = hipEventCreateWithFlags_raw(event%ptr, flags)
    end function hipEventCreateWithFlags_typed

    function hipEventCreate_typed(event) result(EventCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t) :: event
      integer(c_int) :: EventCreate
      EventCreate = hipEventCreate_raw(event%ptr)
    end function hipEventCreate_typed

    function hipEventRecordWithFlags_typed(event, stream, flags) result(EventRecordWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      type(hipStream_t), value :: stream
      integer(c_int), value :: flags
      integer(c_int) :: EventRecordWithFlags
      EventRecordWithFlags = hipEventRecordWithFlags_raw(event%ptr, stream%ptr, flags)
    end function hipEventRecordWithFlags_typed

    function hipEventRecord_typed(event, stream) result(EventRecord)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      type(hipStream_t), value :: stream
      integer(c_int) :: EventRecord
      EventRecord = hipEventRecord_raw(event%ptr, stream%ptr)
    end function hipEventRecord_typed

    function hipEventDestroy_typed(event) result(EventDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      integer(c_int) :: EventDestroy
      EventDestroy = hipEventDestroy_raw(event%ptr)
    end function hipEventDestroy_typed

    function hipEventSynchronize_typed(event) result(EventSynchronize)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      integer(c_int) :: EventSynchronize
      EventSynchronize = hipEventSynchronize_raw(event%ptr)
    end function hipEventSynchronize_typed

    function hipEventElapsedTime_native(ms, start, stop) result(EventElapsedTime)
      use, intrinsic :: iso_c_binding
      implicit none
      real(c_float), target :: ms(..)
      type(c_ptr), value :: start
      type(c_ptr), value :: stop
      integer(c_int) :: EventElapsedTime
      if (.not. is_contiguous(ms)) error stop "ms: array must be contiguous"
      EventElapsedTime = hipEventElapsedTime_raw(c_loc(ms), start, stop)
    end function hipEventElapsedTime_native

    function hipEventElapsedTime_typed(ms, start, stop) result(EventElapsedTime)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: ms
      type(hipEvent_t), value :: start
      type(hipEvent_t), value :: stop
      integer(c_int) :: EventElapsedTime
      EventElapsedTime = hipEventElapsedTime_raw(ms, start%ptr, stop%ptr)
    end function hipEventElapsedTime_typed

    function hipEventQuery_typed(event) result(EventQuery)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      integer(c_int) :: EventQuery
      EventQuery = hipEventQuery_raw(event%ptr)
    end function hipEventQuery_typed

    function hipDrvPointerGetAttributes_native(numAttributes, attributes, data, ptr) result( &
        DrvPointerGetAttributes)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), value :: numAttributes
      integer(c_int), target :: attributes(..)
      type(c_ptr) :: data
      type(c_ptr), value :: ptr
      integer(c_int) :: DrvPointerGetAttributes
      if (.not. is_contiguous(attributes)) error stop "attributes: array must be contiguous"
      DrvPointerGetAttributes = hipDrvPointerGetAttributes_raw(numAttributes, c_loc(attributes), &
        data, ptr)
    end function hipDrvPointerGetAttributes_native

    function hipImportExternalSemaphore_typed(extSem_out, semHandleDesc) result( &
        ImportExternalSemaphore)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipExternalSemaphore_t) :: extSem_out
      type(hipExternalSemaphoreHandleDesc) :: semHandleDesc
      integer(c_int) :: ImportExternalSemaphore
      ImportExternalSemaphore = hipImportExternalSemaphore_raw(extSem_out%ptr, semHandleDesc)
    end function hipImportExternalSemaphore_typed

    function hipSignalExternalSemaphoresAsync_typed(extSemArray, paramsArray, numExtSems, &
        stream) result(SignalExternalSemaphoresAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipExternalSemaphore_t) :: extSemArray
      type(hipExternalSemaphoreSignalParams) :: paramsArray
      integer(c_int), value :: numExtSems
      type(hipStream_t), value :: stream
      integer(c_int) :: SignalExternalSemaphoresAsync
      SignalExternalSemaphoresAsync = hipSignalExternalSemaphoresAsync_raw(extSemArray%ptr, &
        paramsArray, numExtSems, stream%ptr)
    end function hipSignalExternalSemaphoresAsync_typed

    function hipWaitExternalSemaphoresAsync_typed(extSemArray, paramsArray, numExtSems, &
        stream) result(WaitExternalSemaphoresAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipExternalSemaphore_t) :: extSemArray
      type(hipExternalSemaphoreWaitParams) :: paramsArray
      integer(c_int), value :: numExtSems
      type(hipStream_t), value :: stream
      integer(c_int) :: WaitExternalSemaphoresAsync
      WaitExternalSemaphoresAsync = hipWaitExternalSemaphoresAsync_raw(extSemArray%ptr, &
        paramsArray, numExtSems, stream%ptr)
    end function hipWaitExternalSemaphoresAsync_typed

    function hipDestroyExternalSemaphore_typed(extSem) result(DestroyExternalSemaphore)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipExternalSemaphore_t), value :: extSem
      integer(c_int) :: DestroyExternalSemaphore
      DestroyExternalSemaphore = hipDestroyExternalSemaphore_raw(extSem%ptr)
    end function hipDestroyExternalSemaphore_typed

    function hipImportExternalMemory_typed(extMem_out, memHandleDesc) result(ImportExternalMemory)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipExternalMemory_t) :: extMem_out
      type(hipExternalMemoryHandleDesc) :: memHandleDesc
      integer(c_int) :: ImportExternalMemory
      ImportExternalMemory = hipImportExternalMemory_raw(extMem_out%ptr, memHandleDesc)
    end function hipImportExternalMemory_typed

    function hipExternalMemoryGetMappedBuffer_typed(devPtr, extMem, bufferDesc) result( &
        ExternalMemoryGetMappedBuffer)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: devPtr
      type(hipExternalMemory_t), value :: extMem
      type(hipExternalMemoryBufferDesc) :: bufferDesc
      integer(c_int) :: ExternalMemoryGetMappedBuffer
      ExternalMemoryGetMappedBuffer = hipExternalMemoryGetMappedBuffer_raw(devPtr, extMem%ptr, &
        bufferDesc)
    end function hipExternalMemoryGetMappedBuffer_typed

    function hipDestroyExternalMemory_typed(extMem) result(DestroyExternalMemory)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipExternalMemory_t), value :: extMem
      integer(c_int) :: DestroyExternalMemory
      DestroyExternalMemory = hipDestroyExternalMemory_raw(extMem%ptr)
    end function hipDestroyExternalMemory_typed

    function hipExternalMemoryGetMappedMipmappedArray_typed(mipmap, extMem, mipmapDesc) result( &
        ExternalMemoryGetMappedMipmappedArray)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: mipmap
      type(hipExternalMemory_t), value :: extMem
      type(hipExternalMemoryMipmappedArrayDesc) :: mipmapDesc
      integer(c_int) :: ExternalMemoryGetMappedMipmappedArray
      ExternalMemoryGetMappedMipmappedArray = hipExternalMemoryGetMappedMipmappedArray_raw(mipmap, &
        extMem%ptr, mipmapDesc)
    end function hipExternalMemoryGetMappedMipmappedArray_typed

    function hipMemPrefetchAsync_typed(dev_ptr, count, device, stream) result(MemPrefetchAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dev_ptr
      integer(c_long), value :: count
      integer(c_int), value :: device
      type(hipStream_t), value :: stream
      integer(c_int) :: MemPrefetchAsync
      MemPrefetchAsync = hipMemPrefetchAsync_raw(dev_ptr, count, device, stream%ptr)
    end function hipMemPrefetchAsync_typed

    function hipMemPrefetchAsync_v2_typed(dev_ptr, count, location, flags, stream) result( &
        MemPrefetchAsync_v2)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dev_ptr
      integer(c_long), value :: count
      type(c_ptr), value :: location
      integer(c_int), value :: flags
      type(hipStream_t), value :: stream
      integer(c_int) :: MemPrefetchAsync_v2
      MemPrefetchAsync_v2 = hipMemPrefetchAsync_v2_raw(dev_ptr, count, location, flags, stream%ptr)
    end function hipMemPrefetchAsync_v2_typed

    function hipMemRangeGetAttributes_native(data, data_sizes, attributes, num_attributes, &
        dev_ptr, count) result(MemRangeGetAttributes)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: data
      type(c_ptr), value :: data_sizes
      integer(c_int), target :: attributes(..)
      integer(c_long), value :: num_attributes
      type(c_ptr), value :: dev_ptr
      integer(c_long), value :: count
      integer(c_int) :: MemRangeGetAttributes
      if (.not. is_contiguous(attributes)) error stop "attributes: array must be contiguous"
      MemRangeGetAttributes = hipMemRangeGetAttributes_raw(data, data_sizes, c_loc(attributes), &
        num_attributes, dev_ptr, count)
    end function hipMemRangeGetAttributes_native

    function hipStreamAttachMemAsync_typed(stream, dev_ptr, length, flags) result( &
        StreamAttachMemAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: dev_ptr
      integer(c_long), value :: length
      integer(c_int), value :: flags
      integer(c_int) :: StreamAttachMemAsync
      StreamAttachMemAsync = hipStreamAttachMemAsync_raw(stream%ptr, dev_ptr, length, flags)
    end function hipStreamAttachMemAsync_typed

    function hipMallocAsync_typed(dev_ptr, size, stream) result(MallocAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dev_ptr
      integer(c_long), value :: size
      type(hipStream_t), value :: stream
      integer(c_int) :: MallocAsync
      MallocAsync = hipMallocAsync_raw(dev_ptr, size, stream%ptr)
    end function hipMallocAsync_typed

    function hipFreeAsync_typed(dev_ptr, stream) result(FreeAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dev_ptr
      type(hipStream_t), value :: stream
      integer(c_int) :: FreeAsync
      FreeAsync = hipFreeAsync_raw(dev_ptr, stream%ptr)
    end function hipFreeAsync_typed

    function hipMemPoolTrimTo_typed(mem_pool, min_bytes_to_hold) result(MemPoolTrimTo)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t), value :: mem_pool
      integer(c_long), value :: min_bytes_to_hold
      integer(c_int) :: MemPoolTrimTo
      MemPoolTrimTo = hipMemPoolTrimTo_raw(mem_pool%ptr, min_bytes_to_hold)
    end function hipMemPoolTrimTo_typed

    function hipMemPoolSetAttribute_typed(mem_pool, attr, value) result(MemPoolSetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t), value :: mem_pool
      integer(c_int), value :: attr
      type(c_ptr), value :: value
      integer(c_int) :: MemPoolSetAttribute
      MemPoolSetAttribute = hipMemPoolSetAttribute_raw(mem_pool%ptr, attr, value)
    end function hipMemPoolSetAttribute_typed

    function hipMemPoolGetAttribute_typed(mem_pool, attr, value) result(MemPoolGetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t), value :: mem_pool
      integer(c_int), value :: attr
      type(c_ptr), value :: value
      integer(c_int) :: MemPoolGetAttribute
      MemPoolGetAttribute = hipMemPoolGetAttribute_raw(mem_pool%ptr, attr, value)
    end function hipMemPoolGetAttribute_typed

    function hipMemPoolSetAccess_typed(mem_pool, desc_list, count) result(MemPoolSetAccess)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t), value :: mem_pool
      type(hipMemAccessDesc) :: desc_list
      integer(c_long), value :: count
      integer(c_int) :: MemPoolSetAccess
      MemPoolSetAccess = hipMemPoolSetAccess_raw(mem_pool%ptr, desc_list, count)
    end function hipMemPoolSetAccess_typed

    function hipMemPoolGetAccess_native(flags, mem_pool, location) result(MemPoolGetAccess)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: flags(..)
      type(c_ptr), value :: mem_pool
      type(hipMemLocation) :: location
      integer(c_int) :: MemPoolGetAccess
      if (.not. is_contiguous(flags)) error stop "flags: array must be contiguous"
      MemPoolGetAccess = hipMemPoolGetAccess_raw(c_loc(flags), mem_pool, location)
    end function hipMemPoolGetAccess_native

    function hipMemPoolGetAccess_typed(flags, mem_pool, location) result(MemPoolGetAccess)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: flags
      type(hipMemPool_t), value :: mem_pool
      type(hipMemLocation) :: location
      integer(c_int) :: MemPoolGetAccess
      MemPoolGetAccess = hipMemPoolGetAccess_raw(flags, mem_pool%ptr, location)
    end function hipMemPoolGetAccess_typed

    function hipMemPoolCreate_typed(mem_pool, pool_props) result(MemPoolCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t) :: mem_pool
      type(hipMemPoolProps) :: pool_props
      integer(c_int) :: MemPoolCreate
      MemPoolCreate = hipMemPoolCreate_raw(mem_pool%ptr, pool_props)
    end function hipMemPoolCreate_typed

    function hipMemPoolDestroy_typed(mem_pool) result(MemPoolDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t), value :: mem_pool
      integer(c_int) :: MemPoolDestroy
      MemPoolDestroy = hipMemPoolDestroy_raw(mem_pool%ptr)
    end function hipMemPoolDestroy_typed

    function hipMallocFromPoolAsync_typed(dev_ptr, size, mem_pool, stream) result( &
        MallocFromPoolAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dev_ptr
      integer(c_long), value :: size
      type(hipMemPool_t), value :: mem_pool
      type(hipStream_t), value :: stream
      integer(c_int) :: MallocFromPoolAsync
      MallocFromPoolAsync = hipMallocFromPoolAsync_raw(dev_ptr, size, mem_pool%ptr, stream%ptr)
    end function hipMallocFromPoolAsync_typed

    function hipMemPoolExportToShareableHandle_typed(shared_handle, mem_pool, handle_type, &
        flags) result(MemPoolExportToShareableHandle)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: shared_handle
      type(hipMemPool_t), value :: mem_pool
      integer(c_int), value :: handle_type
      integer(c_int), value :: flags
      integer(c_int) :: MemPoolExportToShareableHandle
      MemPoolExportToShareableHandle = hipMemPoolExportToShareableHandle_raw(shared_handle, &
        mem_pool%ptr, handle_type, flags)
    end function hipMemPoolExportToShareableHandle_typed

    function hipMemPoolImportFromShareableHandle_typed(mem_pool, shared_handle, handle_type, &
        flags) result(MemPoolImportFromShareableHandle)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t) :: mem_pool
      type(c_ptr), value :: shared_handle
      integer(c_int), value :: handle_type
      integer(c_int), value :: flags
      integer(c_int) :: MemPoolImportFromShareableHandle
      MemPoolImportFromShareableHandle = hipMemPoolImportFromShareableHandle_raw(mem_pool%ptr, &
        shared_handle, handle_type, flags)
    end function hipMemPoolImportFromShareableHandle_typed

    function hipMemPoolImportPointer_typed(dev_ptr, mem_pool, export_data) result( &
        MemPoolImportPointer)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dev_ptr
      type(hipMemPool_t), value :: mem_pool
      type(hipMemPoolPtrExportData) :: export_data
      integer(c_int) :: MemPoolImportPointer
      MemPoolImportPointer = hipMemPoolImportPointer_raw(dev_ptr, mem_pool%ptr, export_data)
    end function hipMemPoolImportPointer_typed

    function hipMemcpyWithStream_typed(dst, src, sizeBytes, kind, stream) result(MemcpyWithStream)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_long), value :: sizeBytes
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyWithStream
      MemcpyWithStream = hipMemcpyWithStream_raw(dst, src, sizeBytes, kind, stream%ptr)
    end function hipMemcpyWithStream_typed

    function hipMemcpyHtoDAsync_typed(dst, src, sizeBytes, stream) result(MemcpyHtoDAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_long), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyHtoDAsync
      MemcpyHtoDAsync = hipMemcpyHtoDAsync_raw(dst, src, sizeBytes, stream%ptr)
    end function hipMemcpyHtoDAsync_typed

    function hipMemcpyDtoHAsync_typed(dst, src, sizeBytes, stream) result(MemcpyDtoHAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_long), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyDtoHAsync
      MemcpyDtoHAsync = hipMemcpyDtoHAsync_raw(dst, src, sizeBytes, stream%ptr)
    end function hipMemcpyDtoHAsync_typed

    function hipMemcpyDtoDAsync_typed(dst, src, sizeBytes, stream) result(MemcpyDtoDAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_long), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyDtoDAsync
      MemcpyDtoDAsync = hipMemcpyDtoDAsync_raw(dst, src, sizeBytes, stream%ptr)
    end function hipMemcpyDtoDAsync_typed

    function hipMemcpyAtoHAsync_typed(dstHost, srcArray, srcOffset, ByteCount, stream) result( &
        MemcpyAtoHAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dstHost
      type(c_ptr), value :: srcArray
      integer(c_long), value :: srcOffset
      integer(c_long), value :: ByteCount
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyAtoHAsync
      MemcpyAtoHAsync = hipMemcpyAtoHAsync_raw(dstHost, srcArray, srcOffset, ByteCount, stream%ptr)
    end function hipMemcpyAtoHAsync_typed

    function hipMemcpyHtoAAsync_typed(dstArray, dstOffset, srcHost, ByteCount, stream) result( &
        MemcpyHtoAAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dstArray
      integer(c_long), value :: dstOffset
      type(c_ptr), value :: srcHost
      integer(c_long), value :: ByteCount
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyHtoAAsync
      MemcpyHtoAAsync = hipMemcpyHtoAAsync_raw(dstArray, dstOffset, srcHost, ByteCount, stream%ptr)
    end function hipMemcpyHtoAAsync_typed

    function hipModuleGetGlobal_typed(dptr, bytes, hmod, name) result(ModuleGetGlobal)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dptr
      type(c_ptr), value :: bytes
      type(hipModule_t), value :: hmod
      type(c_ptr), value :: name
      integer(c_int) :: ModuleGetGlobal
      ModuleGetGlobal = hipModuleGetGlobal_raw(dptr, bytes, hmod%ptr, name)
    end function hipModuleGetGlobal_typed

    function hipModuleGetGlobal_cstr(dptr, bytes, hmod, name) result(ModuleGetGlobal)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dptr
      type(c_ptr), value :: bytes
      type(c_ptr), value :: hmod
      character(len=*), intent(in) :: name
      integer(c_int) :: ModuleGetGlobal
      character(len=len_trim(name)+1, kind=c_char), target :: name__c
      name__c = trim(name)//c_null_char
      ModuleGetGlobal = hipModuleGetGlobal_raw(dptr, bytes, hmod, c_loc(name__c))
    end function hipModuleGetGlobal_cstr

    function hipGetProcAddress_native(symbol, pfn, hipVersion, flags, symbolStatus) result( &
        GetProcAddress)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: symbol
      type(c_ptr) :: pfn
      integer(c_int), value :: hipVersion
      integer(c_long), value :: flags
      integer(c_int), target :: symbolStatus(..)
      integer(c_int) :: GetProcAddress
      if (.not. is_contiguous(symbolStatus)) error stop "symbolStatus: array must be contiguous"
      GetProcAddress = hipGetProcAddress_raw(symbol, pfn, hipVersion, flags, c_loc(symbolStatus))
    end function hipGetProcAddress_native

    function hipGetProcAddress_cstr(symbol, pfn, hipVersion, flags, symbolStatus) result( &
        GetProcAddress)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      character(len=*), intent(in) :: symbol
      type(c_ptr) :: pfn
      integer(c_int), value :: hipVersion
      integer(c_long), value :: flags
      type(c_ptr), value :: symbolStatus
      integer(c_int) :: GetProcAddress
      character(len=len_trim(symbol)+1, kind=c_char), target :: symbol__c
      symbol__c = trim(symbol)//c_null_char
      GetProcAddress = hipGetProcAddress_raw(c_loc(symbol__c), pfn, hipVersion, flags, symbolStatus)
    end function hipGetProcAddress_cstr

    function hipMemcpyToSymbolAsync_typed(symbol, src, sizeBytes, offset, kind, stream) result( &
        MemcpyToSymbolAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: symbol
      type(c_ptr), value :: src
      integer(c_long), value :: sizeBytes
      integer(c_long), value :: offset
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyToSymbolAsync
      MemcpyToSymbolAsync = hipMemcpyToSymbolAsync_raw(symbol, src, sizeBytes, offset, kind, &
        stream%ptr)
    end function hipMemcpyToSymbolAsync_typed

    function hipMemcpyFromSymbolAsync_typed(dst, symbol, sizeBytes, offset, kind, stream) result( &
        MemcpyFromSymbolAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: symbol
      integer(c_long), value :: sizeBytes
      integer(c_long), value :: offset
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyFromSymbolAsync
      MemcpyFromSymbolAsync = hipMemcpyFromSymbolAsync_raw(dst, symbol, sizeBytes, offset, kind, &
        stream%ptr)
    end function hipMemcpyFromSymbolAsync_typed

    function hipMemsetD8Async_typed(dest, value, count, stream) result(MemsetD8Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dest
      type(c_ptr), value :: value
      integer(c_long), value :: count
      type(hipStream_t), value :: stream
      integer(c_int) :: MemsetD8Async
      MemsetD8Async = hipMemsetD8Async_raw(dest, value, count, stream%ptr)
    end function hipMemsetD8Async_typed

    function hipMemsetD16Async_typed(dest, value, count, stream) result(MemsetD16Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dest
      integer(c_short), value :: value
      integer(c_long), value :: count
      type(hipStream_t), value :: stream
      integer(c_int) :: MemsetD16Async
      MemsetD16Async = hipMemsetD16Async_raw(dest, value, count, stream%ptr)
    end function hipMemsetD16Async_typed

    function hipMemsetAsync_typed(dst, value, sizeBytes, stream) result(MemsetAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_int), value :: value
      integer(c_long), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(c_int) :: MemsetAsync
      MemsetAsync = hipMemsetAsync_raw(dst, value, sizeBytes, stream%ptr)
    end function hipMemsetAsync_typed

    function hipMemsetD32Async_typed(dst, value, count, stream) result(MemsetD32Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_int), value :: value
      integer(c_long), value :: count
      type(hipStream_t), value :: stream
      integer(c_int) :: MemsetD32Async
      MemsetD32Async = hipMemsetD32Async_raw(dst, value, count, stream%ptr)
    end function hipMemsetD32Async_typed

    function hipMemset2DAsync_typed(dst, pitch, value, width, height, stream) result(Memset2DAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_long), value :: pitch
      integer(c_int), value :: value
      integer(c_long), value :: width
      integer(c_long), value :: height
      type(hipStream_t), value :: stream
      integer(c_int) :: Memset2DAsync
      Memset2DAsync = hipMemset2DAsync_raw(dst, pitch, value, width, height, stream%ptr)
    end function hipMemset2DAsync_typed

    function hipMemset3DAsync_typed(pitchedDevPtr, value, extent, stream) result(Memset3DAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: pitchedDevPtr
      integer(c_int), value :: value
      type(c_ptr), value :: extent
      type(hipStream_t), value :: stream
      integer(c_int) :: Memset3DAsync
      Memset3DAsync = hipMemset3DAsync_raw(pitchedDevPtr, value, extent, stream%ptr)
    end function hipMemset3DAsync_typed

    function hipMemsetD2D8Async_typed(dst, dstPitch, value, width, height, stream) result( &
        MemsetD2D8Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_long), value :: dstPitch
      type(c_ptr), value :: value
      integer(c_long), value :: width
      integer(c_long), value :: height
      type(hipStream_t), value :: stream
      integer(c_int) :: MemsetD2D8Async
      MemsetD2D8Async = hipMemsetD2D8Async_raw(dst, dstPitch, value, width, height, stream%ptr)
    end function hipMemsetD2D8Async_typed

    function hipMemsetD2D16Async_typed(dst, dstPitch, value, width, height, stream) result( &
        MemsetD2D16Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_long), value :: dstPitch
      integer(c_short), value :: value
      integer(c_long), value :: width
      integer(c_long), value :: height
      type(hipStream_t), value :: stream
      integer(c_int) :: MemsetD2D16Async
      MemsetD2D16Async = hipMemsetD2D16Async_raw(dst, dstPitch, value, width, height, stream%ptr)
    end function hipMemsetD2D16Async_typed

    function hipMemsetD2D32Async_typed(dst, dstPitch, value, width, height, stream) result( &
        MemsetD2D32Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_long), value :: dstPitch
      integer(c_int), value :: value
      integer(c_long), value :: width
      integer(c_long), value :: height
      type(hipStream_t), value :: stream
      integer(c_int) :: MemsetD2D32Async
      MemsetD2D32Async = hipMemsetD2D32Async_raw(dst, dstPitch, value, width, height, stream%ptr)
    end function hipMemsetD2D32Async_typed

    function hipArrayGetInfo_native(desc, extent, flags, array) result(ArrayGetInfo)
      use, intrinsic :: iso_c_binding
      implicit none
      type(hipChannelFormatDesc) :: desc
      type(hipExtent) :: extent
      integer(c_int), target :: flags(..)
      type(c_ptr), value :: array
      integer(c_int) :: ArrayGetInfo
      if (.not. is_contiguous(flags)) error stop "flags: array must be contiguous"
      ArrayGetInfo = hipArrayGetInfo_raw(desc, extent, c_loc(flags), array)
    end function hipArrayGetInfo_native

    function hipMemcpyParam2DAsync_typed(pCopy, stream) result(MemcpyParam2DAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hip_Memcpy2D) :: pCopy
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyParam2DAsync
      MemcpyParam2DAsync = hipMemcpyParam2DAsync_raw(pCopy, stream%ptr)
    end function hipMemcpyParam2DAsync_typed

    function hipMemcpy2DAsync_typed(dst, dpitch, src, spitch, width, height, kind, stream) result( &
        Memcpy2DAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_long), value :: dpitch
      type(c_ptr), value :: src
      integer(c_long), value :: spitch
      integer(c_long), value :: width
      integer(c_long), value :: height
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: Memcpy2DAsync
      Memcpy2DAsync = hipMemcpy2DAsync_raw(dst, dpitch, src, spitch, width, height, kind, &
        stream%ptr)
    end function hipMemcpy2DAsync_typed

    function hipMemcpy2DToArrayAsync_typed(dst, wOffset, hOffset, src, spitch, width, height, &
        kind, stream) result(Memcpy2DToArrayAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_long), value :: wOffset
      integer(c_long), value :: hOffset
      type(c_ptr), value :: src
      integer(c_long), value :: spitch
      integer(c_long), value :: width
      integer(c_long), value :: height
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: Memcpy2DToArrayAsync
      Memcpy2DToArrayAsync = hipMemcpy2DToArrayAsync_raw(dst, wOffset, hOffset, src, spitch, &
        width, height, kind, stream%ptr)
    end function hipMemcpy2DToArrayAsync_typed

    function hipMemcpy2DFromArrayAsync_typed(dst, dpitch, src, wOffset, hOffset, width, height, &
        kind, stream) result(Memcpy2DFromArrayAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_long), value :: dpitch
      type(c_ptr), value :: src
      integer(c_long), value :: wOffset
      integer(c_long), value :: hOffset
      integer(c_long), value :: width
      integer(c_long), value :: height
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: Memcpy2DFromArrayAsync
      Memcpy2DFromArrayAsync = hipMemcpy2DFromArrayAsync_raw(dst, dpitch, src, wOffset, hOffset, &
        width, height, kind, stream%ptr)
    end function hipMemcpy2DFromArrayAsync_typed

    function hipMemcpy3DAsync_typed(p, stream) result(Memcpy3DAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemcpy3DParms) :: p
      type(hipStream_t), value :: stream
      integer(c_int) :: Memcpy3DAsync
      Memcpy3DAsync = hipMemcpy3DAsync_raw(p, stream%ptr)
    end function hipMemcpy3DAsync_typed

    function hipDrvMemcpy3DAsync_typed(pCopy, stream) result(DrvMemcpy3DAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(HIP_MEMCPY3D) :: pCopy
      type(hipStream_t), value :: stream
      integer(c_int) :: DrvMemcpy3DAsync
      DrvMemcpy3DAsync = hipDrvMemcpy3DAsync_raw(pCopy, stream%ptr)
    end function hipDrvMemcpy3DAsync_typed

    function hipMemcpyBatchAsync_typed(dsts, srcs, sizes, count, attrs, attrsIdxs, numAttrs, &
        failIdx, stream) result(MemcpyBatchAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dsts
      type(c_ptr) :: srcs
      type(c_ptr), value :: sizes
      integer(c_long), value :: count
      type(hipMemcpyAttributes) :: attrs
      type(c_ptr), value :: attrsIdxs
      integer(c_long), value :: numAttrs
      type(c_ptr), value :: failIdx
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyBatchAsync
      MemcpyBatchAsync = hipMemcpyBatchAsync_raw(dsts, srcs, sizes, count, attrs, attrsIdxs, &
        numAttrs, failIdx, stream%ptr)
    end function hipMemcpyBatchAsync_typed

    function hipMemcpy3DBatchAsync_typed(numOps, opList, failIdx, flags, stream) result( &
        Memcpy3DBatchAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_long), value :: numOps
      type(hipMemcpy3DBatchOp) :: opList
      type(c_ptr), value :: failIdx
      integer(c_int64_t), value :: flags
      type(hipStream_t), value :: stream
      integer(c_int) :: Memcpy3DBatchAsync
      Memcpy3DBatchAsync = hipMemcpy3DBatchAsync_raw(numOps, opList, failIdx, flags, stream%ptr)
    end function hipMemcpy3DBatchAsync_typed

    function hipMemcpy3DPeerAsync_typed(p, stream) result(Memcpy3DPeerAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemcpy3DPeerParms) :: p
      type(hipStream_t), value :: stream
      integer(c_int) :: Memcpy3DPeerAsync
      Memcpy3DPeerAsync = hipMemcpy3DPeerAsync_raw(p, stream%ptr)
    end function hipMemcpy3DPeerAsync_typed

    function hipDeviceCanAccessPeer_native(canAccessPeer, deviceId, peerDeviceId) result( &
        DeviceCanAccessPeer)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: canAccessPeer(..)
      integer(c_int), value :: deviceId
      integer(c_int), value :: peerDeviceId
      integer(c_int) :: DeviceCanAccessPeer
      if (.not. is_contiguous(canAccessPeer)) error stop "canAccessPeer: array must be contiguous"
      DeviceCanAccessPeer = hipDeviceCanAccessPeer_raw(c_loc(canAccessPeer), deviceId, peerDeviceId)
    end function hipDeviceCanAccessPeer_native

    function hipMemcpyPeerAsync_typed(dst, dstDeviceId, src, srcDevice, sizeBytes, stream) result( &
        MemcpyPeerAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_int), value :: dstDeviceId
      type(c_ptr), value :: src
      integer(c_int), value :: srcDevice
      integer(c_long), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyPeerAsync
      MemcpyPeerAsync = hipMemcpyPeerAsync_raw(dst, dstDeviceId, src, srcDevice, sizeBytes, &
        stream%ptr)
    end function hipMemcpyPeerAsync_typed

    function hipCtxCreate_typed(ctx, flags, device) result(CtxCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t) :: ctx
      integer(c_int), value :: flags
      integer(c_int), value :: device
      integer(c_int) :: CtxCreate
      CtxCreate = hipCtxCreate_raw(ctx%ptr, flags, device)
    end function hipCtxCreate_typed

    function hipCtxDestroy_typed(ctx) result(CtxDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: ctx
      integer(c_int) :: CtxDestroy
      CtxDestroy = hipCtxDestroy_raw(ctx%ptr)
    end function hipCtxDestroy_typed

    function hipCtxPopCurrent_typed(ctx) result(CtxPopCurrent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t) :: ctx
      integer(c_int) :: CtxPopCurrent
      CtxPopCurrent = hipCtxPopCurrent_raw(ctx%ptr)
    end function hipCtxPopCurrent_typed

    function hipCtxPushCurrent_typed(ctx) result(CtxPushCurrent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: ctx
      integer(c_int) :: CtxPushCurrent
      CtxPushCurrent = hipCtxPushCurrent_raw(ctx%ptr)
    end function hipCtxPushCurrent_typed

    function hipCtxSetCurrent_typed(ctx) result(CtxSetCurrent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: ctx
      integer(c_int) :: CtxSetCurrent
      CtxSetCurrent = hipCtxSetCurrent_raw(ctx%ptr)
    end function hipCtxSetCurrent_typed

    function hipCtxGetCurrent_typed(ctx) result(CtxGetCurrent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t) :: ctx
      integer(c_int) :: CtxGetCurrent
      CtxGetCurrent = hipCtxGetCurrent_raw(ctx%ptr)
    end function hipCtxGetCurrent_typed

    function hipCtxGetApiVersion_native(ctx, apiVersion) result(CtxGetApiVersion)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: ctx
      integer(c_int), target :: apiVersion(..)
      integer(c_int) :: CtxGetApiVersion
      if (.not. is_contiguous(apiVersion)) error stop "apiVersion: array must be contiguous"
      CtxGetApiVersion = hipCtxGetApiVersion_raw(ctx, c_loc(apiVersion))
    end function hipCtxGetApiVersion_native

    function hipCtxGetApiVersion_typed(ctx, apiVersion) result(CtxGetApiVersion)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: ctx
      type(c_ptr), value :: apiVersion
      integer(c_int) :: CtxGetApiVersion
      CtxGetApiVersion = hipCtxGetApiVersion_raw(ctx%ptr, apiVersion)
    end function hipCtxGetApiVersion_typed

    function hipCtxGetCacheConfig_native(cacheConfig) result(CtxGetCacheConfig)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: cacheConfig(..)
      integer(c_int) :: CtxGetCacheConfig
      if (.not. is_contiguous(cacheConfig)) error stop "cacheConfig: array must be contiguous"
      CtxGetCacheConfig = hipCtxGetCacheConfig_raw(c_loc(cacheConfig))
    end function hipCtxGetCacheConfig_native

    function hipCtxGetSharedMemConfig_native(pConfig) result(CtxGetSharedMemConfig)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: pConfig(..)
      integer(c_int) :: CtxGetSharedMemConfig
      if (.not. is_contiguous(pConfig)) error stop "pConfig: array must be contiguous"
      CtxGetSharedMemConfig = hipCtxGetSharedMemConfig_raw(c_loc(pConfig))
    end function hipCtxGetSharedMemConfig_native

    function hipCtxGetFlags_native(flags) result(CtxGetFlags)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: flags(..)
      integer(c_int) :: CtxGetFlags
      if (.not. is_contiguous(flags)) error stop "flags: array must be contiguous"
      CtxGetFlags = hipCtxGetFlags_raw(c_loc(flags))
    end function hipCtxGetFlags_native

    function hipCtxEnablePeerAccess_typed(peerCtx, flags) result(CtxEnablePeerAccess)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: peerCtx
      integer(c_int), value :: flags
      integer(c_int) :: CtxEnablePeerAccess
      CtxEnablePeerAccess = hipCtxEnablePeerAccess_raw(peerCtx%ptr, flags)
    end function hipCtxEnablePeerAccess_typed

    function hipCtxDisablePeerAccess_typed(peerCtx) result(CtxDisablePeerAccess)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: peerCtx
      integer(c_int) :: CtxDisablePeerAccess
      CtxDisablePeerAccess = hipCtxDisablePeerAccess_raw(peerCtx%ptr)
    end function hipCtxDisablePeerAccess_typed

    function hipDevicePrimaryCtxGetState_native(dev, flags, active) result(DevicePrimaryCtxGetState)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), value :: dev
      integer(c_int), target :: flags(..)
      integer(c_int), target :: active(..)
      integer(c_int) :: DevicePrimaryCtxGetState
      if (.not. is_contiguous(flags)) error stop "flags: array must be contiguous"
      if (.not. is_contiguous(active)) error stop "active: array must be contiguous"
      DevicePrimaryCtxGetState = hipDevicePrimaryCtxGetState_raw(dev, c_loc(flags), c_loc(active))
    end function hipDevicePrimaryCtxGetState_native

    function hipDevicePrimaryCtxRetain_typed(pctx, dev) result(DevicePrimaryCtxRetain)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t) :: pctx
      integer(c_int), value :: dev
      integer(c_int) :: DevicePrimaryCtxRetain
      DevicePrimaryCtxRetain = hipDevicePrimaryCtxRetain_raw(pctx%ptr, dev)
    end function hipDevicePrimaryCtxRetain_typed

    function hipModuleLoadFatBinary_typed(module_, fatbin) result(ModuleLoadFatBinary)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipModule_t) :: module_
      type(c_ptr), value :: fatbin
      integer(c_int) :: ModuleLoadFatBinary
      ModuleLoadFatBinary = hipModuleLoadFatBinary_raw(module_%ptr, fatbin)
    end function hipModuleLoadFatBinary_typed

    function hipModuleLoad_typed(module_, fname) result(ModuleLoad)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipModule_t) :: module_
      type(c_ptr), value :: fname
      integer(c_int) :: ModuleLoad
      ModuleLoad = hipModuleLoad_raw(module_%ptr, fname)
    end function hipModuleLoad_typed

    function hipModuleLoad_cstr(module_, fname) result(ModuleLoad)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: module_
      character(len=*), intent(in) :: fname
      integer(c_int) :: ModuleLoad
      character(len=len_trim(fname)+1, kind=c_char), target :: fname__c
      fname__c = trim(fname)//c_null_char
      ModuleLoad = hipModuleLoad_raw(module_, c_loc(fname__c))
    end function hipModuleLoad_cstr

    function hipModuleUnload_typed(module_) result(ModuleUnload)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipModule_t), value :: module_
      integer(c_int) :: ModuleUnload
      ModuleUnload = hipModuleUnload_raw(module_%ptr)
    end function hipModuleUnload_typed

    function hipModuleGetFunction_typed(function_, module_, kname) result(ModuleGetFunction)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipFunction_t) :: function_
      type(hipModule_t), value :: module_
      type(c_ptr), value :: kname
      integer(c_int) :: ModuleGetFunction
      ModuleGetFunction = hipModuleGetFunction_raw(function_%ptr, module_%ptr, kname)
    end function hipModuleGetFunction_typed

    function hipModuleGetFunction_cstr(function_, module_, kname) result(ModuleGetFunction)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: function_
      type(c_ptr), value :: module_
      character(len=*), intent(in) :: kname
      integer(c_int) :: ModuleGetFunction
      character(len=len_trim(kname)+1, kind=c_char), target :: kname__c
      kname__c = trim(kname)//c_null_char
      ModuleGetFunction = hipModuleGetFunction_raw(function_, module_, c_loc(kname__c))
    end function hipModuleGetFunction_cstr

    function hipModuleGetFunctionCount_native(count, mod) result(ModuleGetFunctionCount)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: count(..)
      type(c_ptr), value :: mod
      integer(c_int) :: ModuleGetFunctionCount
      if (.not. is_contiguous(count)) error stop "count: array must be contiguous"
      ModuleGetFunctionCount = hipModuleGetFunctionCount_raw(c_loc(count), mod)
    end function hipModuleGetFunctionCount_native

    function hipModuleGetFunctionCount_typed(count, mod) result(ModuleGetFunctionCount)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: count
      type(hipModule_t), value :: mod
      integer(c_int) :: ModuleGetFunctionCount
      ModuleGetFunctionCount = hipModuleGetFunctionCount_raw(count, mod%ptr)
    end function hipModuleGetFunctionCount_typed

    function hipLibraryLoadData_native(library, code, jitOptions, jitOptionsValues, numJitOptions, &
        libraryOptions, libraryOptionValues, numLibraryOptions) result(LibraryLoadData)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: library
      type(c_ptr), value :: code
      integer(c_int), target :: jitOptions(..)
      type(c_ptr) :: jitOptionsValues
      integer(c_int), value :: numJitOptions
      integer(c_int), target :: libraryOptions(..)
      type(c_ptr) :: libraryOptionValues
      integer(c_int), value :: numLibraryOptions
      integer(c_int) :: LibraryLoadData
      if (.not. is_contiguous(jitOptions)) error stop "jitOptions: array must be contiguous"
      if (.not. is_contiguous(libraryOptions)) error stop "libraryOptions: array must be contiguous"
      LibraryLoadData = hipLibraryLoadData_raw(library, code, c_loc(jitOptions), jitOptionsValues, &
        numJitOptions, c_loc(libraryOptions), libraryOptionValues, numLibraryOptions)
    end function hipLibraryLoadData_native

    function hipLibraryLoadFromFile_native(library, fileName, jitOptions, jitOptionsValues, &
        numJitOptions, libraryOptions, libraryOptionValues, numLibraryOptions) result( &
        LibraryLoadFromFile)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: library
      type(c_ptr), value :: fileName
      integer(c_int), target :: jitOptions(..)
      type(c_ptr) :: jitOptionsValues
      integer(c_int), value :: numJitOptions
      integer(c_int), target :: libraryOptions(..)
      type(c_ptr) :: libraryOptionValues
      integer(c_int), value :: numLibraryOptions
      integer(c_int) :: LibraryLoadFromFile
      if (.not. is_contiguous(jitOptions)) error stop "jitOptions: array must be contiguous"
      if (.not. is_contiguous(libraryOptions)) error stop "libraryOptions: array must be contiguous"
      LibraryLoadFromFile = hipLibraryLoadFromFile_raw(library, fileName, c_loc(jitOptions), &
        jitOptionsValues, numJitOptions, c_loc(libraryOptions), libraryOptionValues, &
        numLibraryOptions)
    end function hipLibraryLoadFromFile_native

    function hipLibraryLoadFromFile_cstr(library, fileName, jitOptions, jitOptionsValues, &
        numJitOptions, libraryOptions, libraryOptionValues, numLibraryOptions) result( &
        LibraryLoadFromFile)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: library
      character(len=*), intent(in) :: fileName
      type(c_ptr), value :: jitOptions
      type(c_ptr) :: jitOptionsValues
      integer(c_int), value :: numJitOptions
      type(c_ptr), value :: libraryOptions
      type(c_ptr) :: libraryOptionValues
      integer(c_int), value :: numLibraryOptions
      integer(c_int) :: LibraryLoadFromFile
      character(len=len_trim(fileName)+1, kind=c_char), target :: fileName__c
      fileName__c = trim(fileName)//c_null_char
      LibraryLoadFromFile = hipLibraryLoadFromFile_raw(library, c_loc(fileName__c), jitOptions, &
        jitOptionsValues, numJitOptions, libraryOptions, libraryOptionValues, numLibraryOptions)
    end function hipLibraryLoadFromFile_cstr

    function hipLibraryGetKernel_cstr(pKernel, library, name) result(LibraryGetKernel)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: pKernel
      type(c_ptr), value :: library
      character(len=*), intent(in) :: name
      integer(c_int) :: LibraryGetKernel
      character(len=len_trim(name)+1, kind=c_char), target :: name__c
      name__c = trim(name)//c_null_char
      LibraryGetKernel = hipLibraryGetKernel_raw(pKernel, library, c_loc(name__c))
    end function hipLibraryGetKernel_cstr

    function hipLibraryGetKernelCount_native(count, library) result(LibraryGetKernelCount)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: count(..)
      type(c_ptr), value :: library
      integer(c_int) :: LibraryGetKernelCount
      if (.not. is_contiguous(count)) error stop "count: array must be contiguous"
      LibraryGetKernelCount = hipLibraryGetKernelCount_raw(c_loc(count), library)
    end function hipLibraryGetKernelCount_native

    function hipFuncGetAttribute_native(value, attrib, hfunc) result(FuncGetAttribute)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: value(..)
      integer(c_int), value :: attrib
      type(c_ptr), value :: hfunc
      integer(c_int) :: FuncGetAttribute
      if (.not. is_contiguous(value)) error stop "value: array must be contiguous"
      FuncGetAttribute = hipFuncGetAttribute_raw(c_loc(value), attrib, hfunc)
    end function hipFuncGetAttribute_native

    function hipFuncGetAttribute_typed(value, attrib, hfunc) result(FuncGetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: value
      integer(c_int), value :: attrib
      type(hipFunction_t), value :: hfunc
      integer(c_int) :: FuncGetAttribute
      FuncGetAttribute = hipFuncGetAttribute_raw(value, attrib, hfunc%ptr)
    end function hipFuncGetAttribute_typed

    function hipGetFuncBySymbol_typed(functionPtr, symbolPtr) result(GetFuncBySymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipFunction_t) :: functionPtr
      type(c_ptr), value :: symbolPtr
      integer(c_int) :: GetFuncBySymbol
      GetFuncBySymbol = hipGetFuncBySymbol_raw(functionPtr%ptr, symbolPtr)
    end function hipGetFuncBySymbol_typed

    function hipGetDriverEntryPoint_native(symbol, funcPtr, flags, driverStatus) result( &
        GetDriverEntryPoint)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t), value :: flags
      integer(c_int), target :: driverStatus(..)
      integer(c_int) :: GetDriverEntryPoint
      if (.not. is_contiguous(driverStatus)) error stop "driverStatus: array must be contiguous"
      GetDriverEntryPoint = hipGetDriverEntryPoint_raw(symbol, funcPtr, flags, c_loc(driverStatus))
    end function hipGetDriverEntryPoint_native

    function hipGetDriverEntryPoint_cstr(symbol, funcPtr, flags, driverStatus) result( &
        GetDriverEntryPoint)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      character(len=*), intent(in) :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t), value :: flags
      type(c_ptr), value :: driverStatus
      integer(c_int) :: GetDriverEntryPoint
      character(len=len_trim(symbol)+1, kind=c_char), target :: symbol__c
      symbol__c = trim(symbol)//c_null_char
      GetDriverEntryPoint = hipGetDriverEntryPoint_raw(c_loc(symbol__c), funcPtr, flags, &
        driverStatus)
    end function hipGetDriverEntryPoint_cstr

    function hipModuleGetTexRef_typed(texRef, hmod, name) result(ModuleGetTexRef)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: texRef
      type(hipModule_t), value :: hmod
      type(c_ptr), value :: name
      integer(c_int) :: ModuleGetTexRef
      ModuleGetTexRef = hipModuleGetTexRef_raw(texRef, hmod%ptr, name)
    end function hipModuleGetTexRef_typed

    function hipModuleGetTexRef_cstr(texRef, hmod, name) result(ModuleGetTexRef)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: texRef
      type(c_ptr), value :: hmod
      character(len=*), intent(in) :: name
      integer(c_int) :: ModuleGetTexRef
      character(len=len_trim(name)+1, kind=c_char), target :: name__c
      name__c = trim(name)//c_null_char
      ModuleGetTexRef = hipModuleGetTexRef_raw(texRef, hmod, c_loc(name__c))
    end function hipModuleGetTexRef_cstr

    function hipModuleLoadData_typed(module_, image) result(ModuleLoadData)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipModule_t) :: module_
      type(c_ptr), value :: image
      integer(c_int) :: ModuleLoadData
      ModuleLoadData = hipModuleLoadData_raw(module_%ptr, image)
    end function hipModuleLoadData_typed

    function hipModuleLoadDataEx_native(module_, image, numOptions, options, optionValues) result( &
        ModuleLoadDataEx)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: module_
      type(c_ptr), value :: image
      integer(c_int), value :: numOptions
      integer(c_int), target :: options(..)
      type(c_ptr) :: optionValues
      integer(c_int) :: ModuleLoadDataEx
      if (.not. is_contiguous(options)) error stop "options: array must be contiguous"
      ModuleLoadDataEx = hipModuleLoadDataEx_raw(module_, image, numOptions, c_loc(options), &
        optionValues)
    end function hipModuleLoadDataEx_native

    function hipModuleLoadDataEx_typed(module_, image, numOptions, options, optionValues) result( &
        ModuleLoadDataEx)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipModule_t) :: module_
      type(c_ptr), value :: image
      integer(c_int), value :: numOptions
      type(c_ptr), value :: options
      type(c_ptr) :: optionValues
      integer(c_int) :: ModuleLoadDataEx
      ModuleLoadDataEx = hipModuleLoadDataEx_raw(module_%ptr, image, numOptions, options, &
        optionValues)
    end function hipModuleLoadDataEx_typed

    function hipLinkAddData_native(state, type, data, size, name, numOptions, options, &
        optionValues) result(LinkAddData)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: state
      integer(c_int), value :: type
      type(c_ptr), value :: data
      integer(c_long), value :: size
      type(c_ptr), value :: name
      integer(c_int), value :: numOptions
      integer(c_int), target :: options(..)
      type(c_ptr) :: optionValues
      integer(c_int) :: LinkAddData
      if (.not. is_contiguous(options)) error stop "options: array must be contiguous"
      LinkAddData = hipLinkAddData_raw(state, type, data, size, name, numOptions, c_loc(options), &
        optionValues)
    end function hipLinkAddData_native

    function hipLinkAddData_cstr(state, type, data, size, name, numOptions, options, &
        optionValues) result(LinkAddData)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: state
      integer(c_int), value :: type
      type(c_ptr), value :: data
      integer(c_long), value :: size
      character(len=*), intent(in) :: name
      integer(c_int), value :: numOptions
      type(c_ptr), value :: options
      type(c_ptr) :: optionValues
      integer(c_int) :: LinkAddData
      character(len=len_trim(name)+1, kind=c_char), target :: name__c
      name__c = trim(name)//c_null_char
      LinkAddData = hipLinkAddData_raw(state, type, data, size, c_loc(name__c), numOptions, &
        options, optionValues)
    end function hipLinkAddData_cstr

    function hipLinkAddFile_native(state, type, path, numOptions, options, optionValues) result( &
        LinkAddFile)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: state
      integer(c_int), value :: type
      type(c_ptr), value :: path
      integer(c_int), value :: numOptions
      integer(c_int), target :: options(..)
      type(c_ptr) :: optionValues
      integer(c_int) :: LinkAddFile
      if (.not. is_contiguous(options)) error stop "options: array must be contiguous"
      LinkAddFile = hipLinkAddFile_raw(state, type, path, numOptions, c_loc(options), optionValues)
    end function hipLinkAddFile_native

    function hipLinkAddFile_cstr(state, type, path, numOptions, options, optionValues) result( &
        LinkAddFile)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: state
      integer(c_int), value :: type
      character(len=*), intent(in) :: path
      integer(c_int), value :: numOptions
      type(c_ptr), value :: options
      type(c_ptr) :: optionValues
      integer(c_int) :: LinkAddFile
      character(len=len_trim(path)+1, kind=c_char), target :: path__c
      path__c = trim(path)//c_null_char
      LinkAddFile = hipLinkAddFile_raw(state, type, c_loc(path__c), numOptions, options, &
        optionValues)
    end function hipLinkAddFile_cstr

    function hipLinkCreate_native(numOptions, options, optionValues, stateOut) result(LinkCreate)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), value :: numOptions
      integer(c_int), target :: options(..)
      type(c_ptr) :: optionValues
      type(c_ptr) :: stateOut
      integer(c_int) :: LinkCreate
      if (.not. is_contiguous(options)) error stop "options: array must be contiguous"
      LinkCreate = hipLinkCreate_raw(numOptions, c_loc(options), optionValues, stateOut)
    end function hipLinkCreate_native

    function hipModuleLaunchKernel_typed(f, gridDimX, gridDimY, gridDimZ, blockDimX, blockDimY, &
        blockDimZ, sharedMemBytes, stream, kernelParams, extra) result(ModuleLaunchKernel)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipFunction_t), value :: f
      integer(c_int), value :: gridDimX
      integer(c_int), value :: gridDimY
      integer(c_int), value :: gridDimZ
      integer(c_int), value :: blockDimX
      integer(c_int), value :: blockDimY
      integer(c_int), value :: blockDimZ
      integer(c_int), value :: sharedMemBytes
      type(hipStream_t), value :: stream
      type(c_ptr) :: kernelParams
      type(c_ptr) :: extra
      integer(c_int) :: ModuleLaunchKernel
      ModuleLaunchKernel = hipModuleLaunchKernel_raw(f%ptr, gridDimX, gridDimY, gridDimZ, &
        blockDimX, blockDimY, blockDimZ, sharedMemBytes, stream%ptr, kernelParams, extra)
    end function hipModuleLaunchKernel_typed

    function hipModuleLaunchCooperativeKernel_typed(f, gridDimX, gridDimY, gridDimZ, blockDimX, &
        blockDimY, blockDimZ, sharedMemBytes, stream, kernelParams) result( &
        ModuleLaunchCooperativeKernel)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipFunction_t), value :: f
      integer(c_int), value :: gridDimX
      integer(c_int), value :: gridDimY
      integer(c_int), value :: gridDimZ
      integer(c_int), value :: blockDimX
      integer(c_int), value :: blockDimY
      integer(c_int), value :: blockDimZ
      integer(c_int), value :: sharedMemBytes
      type(hipStream_t), value :: stream
      type(c_ptr) :: kernelParams
      integer(c_int) :: ModuleLaunchCooperativeKernel
      ModuleLaunchCooperativeKernel = hipModuleLaunchCooperativeKernel_raw(f%ptr, gridDimX, &
        gridDimY, gridDimZ, blockDimX, blockDimY, blockDimZ, sharedMemBytes, stream%ptr, &
        kernelParams)
    end function hipModuleLaunchCooperativeKernel_typed

    function hipLaunchCooperativeKernel_typed(f, gridDim, blockDimX, kernelParams, sharedMemBytes, &
        stream) result(LaunchCooperativeKernel)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: f
      type(c_ptr), value :: gridDim
      type(c_ptr), value :: blockDimX
      type(c_ptr) :: kernelParams
      integer(c_int), value :: sharedMemBytes
      type(hipStream_t), value :: stream
      integer(c_int) :: LaunchCooperativeKernel
      LaunchCooperativeKernel = hipLaunchCooperativeKernel_raw(f, gridDim, blockDimX, &
        kernelParams, sharedMemBytes, stream%ptr)
    end function hipLaunchCooperativeKernel_typed

    function hipDrvLaunchKernelEx_typed(config, f, params, extra) result(DrvLaunchKernelEx)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(HIP_LAUNCH_CONFIG) :: config
      type(hipFunction_t), value :: f
      type(c_ptr) :: params
      type(c_ptr) :: extra
      integer(c_int) :: DrvLaunchKernelEx
      DrvLaunchKernelEx = hipDrvLaunchKernelEx_raw(config, f%ptr, params, extra)
    end function hipDrvLaunchKernelEx_typed

    function hipModuleOccupancyMaxPotentialBlockSize_native(gridSize, blockSize, f, &
        dynSharedMemPerBlk, blockSizeLimit) result(ModuleOccupancyMaxPotentialBlockSize)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: gridSize(..)
      integer(c_int), target :: blockSize(..)
      type(c_ptr), value :: f
      integer(c_long), value :: dynSharedMemPerBlk
      integer(c_int), value :: blockSizeLimit
      integer(c_int) :: ModuleOccupancyMaxPotentialBlockSize
      if (.not. is_contiguous(gridSize)) error stop "gridSize: array must be contiguous"
      if (.not. is_contiguous(blockSize)) error stop "blockSize: array must be contiguous"
      ModuleOccupancyMaxPotentialBlockSize = hipModuleOccupancyMaxPotentialBlockSize_raw(c_loc( &
        gridSize), c_loc(blockSize), f, dynSharedMemPerBlk, blockSizeLimit)
    end function hipModuleOccupancyMaxPotentialBlockSize_native

    function hipModuleOccupancyMaxPotentialBlockSize_typed(gridSize, blockSize, f, &
        dynSharedMemPerBlk, blockSizeLimit) result(ModuleOccupancyMaxPotentialBlockSize)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: gridSize
      type(c_ptr), value :: blockSize
      type(hipFunction_t), value :: f
      integer(c_long), value :: dynSharedMemPerBlk
      integer(c_int), value :: blockSizeLimit
      integer(c_int) :: ModuleOccupancyMaxPotentialBlockSize
      ModuleOccupancyMaxPotentialBlockSize = hipModuleOccupancyMaxPotentialBlockSize_raw(gridSize, &
        blockSize, f%ptr, dynSharedMemPerBlk, blockSizeLimit)
    end function hipModuleOccupancyMaxPotentialBlockSize_typed

    function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_native(gridSize, blockSize, f, &
        dynSharedMemPerBlk, blockSizeLimit, flags) result( &
        ModuleOccupancyMaxPotentialBlockSizeWithFlags)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: gridSize(..)
      integer(c_int), target :: blockSize(..)
      type(c_ptr), value :: f
      integer(c_long), value :: dynSharedMemPerBlk
      integer(c_int), value :: blockSizeLimit
      integer(c_int), value :: flags
      integer(c_int) :: ModuleOccupancyMaxPotentialBlockSizeWithFlags
      if (.not. is_contiguous(gridSize)) error stop "gridSize: array must be contiguous"
      if (.not. is_contiguous(blockSize)) error stop "blockSize: array must be contiguous"
      ModuleOccupancyMaxPotentialBlockSizeWithFlags = hipModuleOccupancyMaxPotentialBlockSizeWithFlags_raw( &
        c_loc(gridSize), c_loc(blockSize), f, dynSharedMemPerBlk, blockSizeLimit, flags)
    end function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_native

    function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_typed(gridSize, blockSize, f, &
        dynSharedMemPerBlk, blockSizeLimit, flags) result( &
        ModuleOccupancyMaxPotentialBlockSizeWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: gridSize
      type(c_ptr), value :: blockSize
      type(hipFunction_t), value :: f
      integer(c_long), value :: dynSharedMemPerBlk
      integer(c_int), value :: blockSizeLimit
      integer(c_int), value :: flags
      integer(c_int) :: ModuleOccupancyMaxPotentialBlockSizeWithFlags
      ModuleOccupancyMaxPotentialBlockSizeWithFlags = hipModuleOccupancyMaxPotentialBlockSizeWithFlags_raw( &
        gridSize, blockSize, f%ptr, dynSharedMemPerBlk, blockSizeLimit, flags)
    end function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_typed

    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_native(numBlocks, f, blockSize, &
        dynSharedMemPerBlk) result(ModuleOccupancyMaxActiveBlocksPerMultiprocessor)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: numBlocks(..)
      type(c_ptr), value :: f
      integer(c_int), value :: blockSize
      integer(c_long), value :: dynSharedMemPerBlk
      integer(c_int) :: ModuleOccupancyMaxActiveBlocksPerMultiprocessor
      if (.not. is_contiguous(numBlocks)) error stop "numBlocks: array must be contiguous"
      ModuleOccupancyMaxActiveBlocksPerMultiprocessor = hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_raw( &
        c_loc(numBlocks), f, blockSize, dynSharedMemPerBlk)
    end function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_native

    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_typed(numBlocks, f, blockSize, &
        dynSharedMemPerBlk) result(ModuleOccupancyMaxActiveBlocksPerMultiprocessor)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: numBlocks
      type(hipFunction_t), value :: f
      integer(c_int), value :: blockSize
      integer(c_long), value :: dynSharedMemPerBlk
      integer(c_int) :: ModuleOccupancyMaxActiveBlocksPerMultiprocessor
      ModuleOccupancyMaxActiveBlocksPerMultiprocessor = hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_raw( &
        numBlocks, f%ptr, blockSize, dynSharedMemPerBlk)
    end function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_typed

    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFl_native(numBlocks, f, &
        blockSize, dynSharedMemPerBlk, flags) result( &
        ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: numBlocks(..)
      type(c_ptr), value :: f
      integer(c_int), value :: blockSize
      integer(c_long), value :: dynSharedMemPerBlk
      integer(c_int), value :: flags
      integer(c_int) :: ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
      if (.not. is_contiguous(numBlocks)) error stop "numBlocks: array must be contiguous"
      ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags = hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_raw( &
        c_loc(numBlocks), f, blockSize, dynSharedMemPerBlk, flags)
    end function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFl_native

    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFla_typed(numBlocks, f, &
        blockSize, dynSharedMemPerBlk, flags) result( &
        ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: numBlocks
      type(hipFunction_t), value :: f
      integer(c_int), value :: blockSize
      integer(c_long), value :: dynSharedMemPerBlk
      integer(c_int), value :: flags
      integer(c_int) :: ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
      ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags = hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_raw( &
        numBlocks, f%ptr, blockSize, dynSharedMemPerBlk, flags)
    end function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFla_typed

    function hipOccupancyMaxActiveBlocksPerMultiprocessor_native(numBlocks, f, blockSize, &
        dynSharedMemPerBlk) result(OccupancyMaxActiveBlocksPerMultiprocessor)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: numBlocks(..)
      type(c_ptr), value :: f
      integer(c_int), value :: blockSize
      integer(c_long), value :: dynSharedMemPerBlk
      integer(c_int) :: OccupancyMaxActiveBlocksPerMultiprocessor
      if (.not. is_contiguous(numBlocks)) error stop "numBlocks: array must be contiguous"
      OccupancyMaxActiveBlocksPerMultiprocessor = hipOccupancyMaxActiveBlocksPerMultiprocessor_raw( &
        c_loc(numBlocks), f, blockSize, dynSharedMemPerBlk)
    end function hipOccupancyMaxActiveBlocksPerMultiprocessor_native

    function hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_native(numBlocks, f, blockSize, &
        dynSharedMemPerBlk, flags) result(OccupancyMaxActiveBlocksPerMultiprocessorWithFlags)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: numBlocks(..)
      type(c_ptr), value :: f
      integer(c_int), value :: blockSize
      integer(c_long), value :: dynSharedMemPerBlk
      integer(c_int), value :: flags
      integer(c_int) :: OccupancyMaxActiveBlocksPerMultiprocessorWithFlags
      if (.not. is_contiguous(numBlocks)) error stop "numBlocks: array must be contiguous"
      OccupancyMaxActiveBlocksPerMultiprocessorWithFlags = hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_raw( &
        c_loc(numBlocks), f, blockSize, dynSharedMemPerBlk, flags)
    end function hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_native

    function hipOccupancyMaxPotentialBlockSize_native(gridSize, blockSize, f, dynSharedMemPerBlk, &
        blockSizeLimit) result(OccupancyMaxPotentialBlockSize)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: gridSize(..)
      integer(c_int), target :: blockSize(..)
      type(c_ptr), value :: f
      integer(c_long), value :: dynSharedMemPerBlk
      integer(c_int), value :: blockSizeLimit
      integer(c_int) :: OccupancyMaxPotentialBlockSize
      if (.not. is_contiguous(gridSize)) error stop "gridSize: array must be contiguous"
      if (.not. is_contiguous(blockSize)) error stop "blockSize: array must be contiguous"
      OccupancyMaxPotentialBlockSize = hipOccupancyMaxPotentialBlockSize_raw(c_loc(gridSize), &
        c_loc(blockSize), f, dynSharedMemPerBlk, blockSizeLimit)
    end function hipOccupancyMaxPotentialBlockSize_native

    function hipConfigureCall_typed(gridDim, blockDim, sharedMem, stream) result(ConfigureCall)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: gridDim
      type(c_ptr), value :: blockDim
      integer(c_long), value :: sharedMem
      type(hipStream_t), value :: stream
      integer(c_int) :: ConfigureCall
      ConfigureCall = hipConfigureCall_raw(gridDim, blockDim, sharedMem, stream%ptr)
    end function hipConfigureCall_typed

    function hipLaunchKernel_typed(function_address, numBlocks, dimBlocks, args, sharedMemBytes, &
        stream) result(LaunchKernel)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: function_address
      type(c_ptr), value :: numBlocks
      type(c_ptr), value :: dimBlocks
      type(c_ptr) :: args
      integer(c_long), value :: sharedMemBytes
      type(hipStream_t), value :: stream
      integer(c_int) :: LaunchKernel
      LaunchKernel = hipLaunchKernel_raw(function_address, numBlocks, dimBlocks, args, &
        sharedMemBytes, stream%ptr)
    end function hipLaunchKernel_typed

    function hipLaunchHostFunc_typed(stream, fn, userData) result(LaunchHostFunc)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_funptr), value :: fn
      type(c_ptr), value :: userData
      integer(c_int) :: LaunchHostFunc
      LaunchHostFunc = hipLaunchHostFunc_raw(stream%ptr, fn, userData)
    end function hipLaunchHostFunc_typed

    function hipExtLaunchKernel_typed(function_address, numBlocks, dimBlocks, args, &
        sharedMemBytes, stream, startEvent, stopEvent, flags) result(ExtLaunchKernel)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: function_address
      type(c_ptr), value :: numBlocks
      type(c_ptr), value :: dimBlocks
      type(c_ptr) :: args
      integer(c_long), value :: sharedMemBytes
      type(hipStream_t), value :: stream
      type(hipEvent_t), value :: startEvent
      type(hipEvent_t), value :: stopEvent
      integer(c_int), value :: flags
      integer(c_int) :: ExtLaunchKernel
      ExtLaunchKernel = hipExtLaunchKernel_raw(function_address, numBlocks, dimBlocks, args, &
        sharedMemBytes, stream%ptr, startEvent%ptr, stopEvent%ptr, flags)
    end function hipExtLaunchKernel_typed

    function hipTexRefGetBorderColor_native(pBorderColor, texRef) result(TexRefGetBorderColor)
      use, intrinsic :: iso_c_binding
      implicit none
      real(c_float), target :: pBorderColor(..)
      type(textureReference) :: texRef
      integer(c_int) :: TexRefGetBorderColor
      if (.not. is_contiguous(pBorderColor)) error stop "pBorderColor: array must be contiguous"
      TexRefGetBorderColor = hipTexRefGetBorderColor_raw(c_loc(pBorderColor), texRef)
    end function hipTexRefGetBorderColor_native

    function hipTexRefGetAddressMode_native(pam, texRef, dim) result(TexRefGetAddressMode)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: pam(..)
      type(textureReference) :: texRef
      integer(c_int), value :: dim
      integer(c_int) :: TexRefGetAddressMode
      if (.not. is_contiguous(pam)) error stop "pam: array must be contiguous"
      TexRefGetAddressMode = hipTexRefGetAddressMode_raw(c_loc(pam), texRef, dim)
    end function hipTexRefGetAddressMode_native

    function hipTexRefGetFilterMode_native(pfm, texRef) result(TexRefGetFilterMode)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: pfm(..)
      type(textureReference) :: texRef
      integer(c_int) :: TexRefGetFilterMode
      if (.not. is_contiguous(pfm)) error stop "pfm: array must be contiguous"
      TexRefGetFilterMode = hipTexRefGetFilterMode_raw(c_loc(pfm), texRef)
    end function hipTexRefGetFilterMode_native

    function hipTexRefGetFlags_native(pFlags, texRef) result(TexRefGetFlags)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: pFlags(..)
      type(textureReference) :: texRef
      integer(c_int) :: TexRefGetFlags
      if (.not. is_contiguous(pFlags)) error stop "pFlags: array must be contiguous"
      TexRefGetFlags = hipTexRefGetFlags_raw(c_loc(pFlags), texRef)
    end function hipTexRefGetFlags_native

    function hipTexRefGetFormat_native(pFormat, pNumChannels, texRef) result(TexRefGetFormat)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: pFormat(..)
      integer(c_int), target :: pNumChannels(..)
      type(textureReference) :: texRef
      integer(c_int) :: TexRefGetFormat
      if (.not. is_contiguous(pFormat)) error stop "pFormat: array must be contiguous"
      if (.not. is_contiguous(pNumChannels)) error stop "pNumChannels: array must be contiguous"
      TexRefGetFormat = hipTexRefGetFormat_raw(c_loc(pFormat), c_loc(pNumChannels), texRef)
    end function hipTexRefGetFormat_native

    function hipTexRefGetMaxAnisotropy_native(pmaxAnsio, texRef) result(TexRefGetMaxAnisotropy)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: pmaxAnsio(..)
      type(textureReference) :: texRef
      integer(c_int) :: TexRefGetMaxAnisotropy
      if (.not. is_contiguous(pmaxAnsio)) error stop "pmaxAnsio: array must be contiguous"
      TexRefGetMaxAnisotropy = hipTexRefGetMaxAnisotropy_raw(c_loc(pmaxAnsio), texRef)
    end function hipTexRefGetMaxAnisotropy_native

    function hipTexRefGetMipmapFilterMode_native(pfm, texRef) result(TexRefGetMipmapFilterMode)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: pfm(..)
      type(textureReference) :: texRef
      integer(c_int) :: TexRefGetMipmapFilterMode
      if (.not. is_contiguous(pfm)) error stop "pfm: array must be contiguous"
      TexRefGetMipmapFilterMode = hipTexRefGetMipmapFilterMode_raw(c_loc(pfm), texRef)
    end function hipTexRefGetMipmapFilterMode_native

    function hipTexRefGetMipmapLevelBias_native(pbias, texRef) result(TexRefGetMipmapLevelBias)
      use, intrinsic :: iso_c_binding
      implicit none
      real(c_float), target :: pbias(..)
      type(textureReference) :: texRef
      integer(c_int) :: TexRefGetMipmapLevelBias
      if (.not. is_contiguous(pbias)) error stop "pbias: array must be contiguous"
      TexRefGetMipmapLevelBias = hipTexRefGetMipmapLevelBias_raw(c_loc(pbias), texRef)
    end function hipTexRefGetMipmapLevelBias_native

    function hipTexRefGetMipmapLevelClamp_native(pminMipmapLevelClamp, pmaxMipmapLevelClamp, &
        texRef) result(TexRefGetMipmapLevelClamp)
      use, intrinsic :: iso_c_binding
      implicit none
      real(c_float), target :: pminMipmapLevelClamp(..)
      real(c_float), target :: pmaxMipmapLevelClamp(..)
      type(textureReference) :: texRef
      integer(c_int) :: TexRefGetMipmapLevelClamp
      if (.not. is_contiguous(pminMipmapLevelClamp)) error stop "pminMipmapLevelClamp: array must be contiguous"
      if (.not. is_contiguous(pmaxMipmapLevelClamp)) error stop "pmaxMipmapLevelClamp: array must be contiguous"
      TexRefGetMipmapLevelClamp = hipTexRefGetMipmapLevelClamp_raw(c_loc(pminMipmapLevelClamp), &
        c_loc(pmaxMipmapLevelClamp), texRef)
    end function hipTexRefGetMipmapLevelClamp_native

    function hipTexRefSetBorderColor_native(texRef, pBorderColor) result(TexRefSetBorderColor)
      use, intrinsic :: iso_c_binding
      implicit none
      type(textureReference) :: texRef
      real(c_float), target :: pBorderColor(..)
      integer(c_int) :: TexRefSetBorderColor
      if (.not. is_contiguous(pBorderColor)) error stop "pBorderColor: array must be contiguous"
      TexRefSetBorderColor = hipTexRefSetBorderColor_raw(texRef, c_loc(pBorderColor))
    end function hipTexRefSetBorderColor_native

    function hipKernelNameRef_typed(f) result(KernelNameRef)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipFunction_t), value :: f
      character(c_char) :: KernelNameRef
      KernelNameRef = hipKernelNameRef_raw(f%ptr)
    end function hipKernelNameRef_typed

    function hipKernelNameRefByPtr_typed(hostFunction, stream) result(KernelNameRefByPtr)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: hostFunction
      type(hipStream_t), value :: stream
      character(c_char) :: KernelNameRefByPtr
      KernelNameRefByPtr = hipKernelNameRefByPtr_raw(hostFunction, stream%ptr)
    end function hipKernelNameRefByPtr_typed

    function hipGetStreamDeviceId_typed(stream) result(GetStreamDeviceId)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int) :: GetStreamDeviceId
      GetStreamDeviceId = hipGetStreamDeviceId_raw(stream%ptr)
    end function hipGetStreamDeviceId_typed

    function hipStreamBeginCapture_typed(stream, mode) result(StreamBeginCapture)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int), value :: mode
      integer(c_int) :: StreamBeginCapture
      StreamBeginCapture = hipStreamBeginCapture_raw(stream%ptr, mode)
    end function hipStreamBeginCapture_typed

    function hipStreamBeginCaptureToGraph_typed(stream, graph, dependencies, dependencyData, &
        numDependencies, mode) result(StreamBeginCaptureToGraph)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: dependencies
      type(hipGraphEdgeData) :: dependencyData
      integer(c_long), value :: numDependencies
      integer(c_int), value :: mode
      integer(c_int) :: StreamBeginCaptureToGraph
      StreamBeginCaptureToGraph = hipStreamBeginCaptureToGraph_raw(stream%ptr, graph%ptr, &
        dependencies%ptr, dependencyData, numDependencies, mode)
    end function hipStreamBeginCaptureToGraph_typed

    function hipStreamEndCapture_typed(stream, pGraph) result(StreamEndCapture)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(hipGraph_t) :: pGraph
      integer(c_int) :: StreamEndCapture
      StreamEndCapture = hipStreamEndCapture_raw(stream%ptr, pGraph%ptr)
    end function hipStreamEndCapture_typed

    function hipStreamGetCaptureInfo_native(stream, pCaptureStatus, pId) result( &
        StreamGetCaptureInfo)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), target :: pCaptureStatus(..)
      integer(c_int64_t), target :: pId(..)
      integer(c_int) :: StreamGetCaptureInfo
      if (.not. is_contiguous(pCaptureStatus)) error stop "pCaptureStatus: array must be contiguous"
      if (.not. is_contiguous(pId)) error stop "pId: array must be contiguous"
      StreamGetCaptureInfo = hipStreamGetCaptureInfo_raw(stream, c_loc(pCaptureStatus), c_loc(pId))
    end function hipStreamGetCaptureInfo_native

    function hipStreamGetCaptureInfo_typed(stream, pCaptureStatus, pId) result(StreamGetCaptureInfo)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: pCaptureStatus
      type(c_ptr), value :: pId
      integer(c_int) :: StreamGetCaptureInfo
      StreamGetCaptureInfo = hipStreamGetCaptureInfo_raw(stream%ptr, pCaptureStatus, pId)
    end function hipStreamGetCaptureInfo_typed

    function hipStreamGetCaptureInfo_v2_native(stream, captureStatus_out, id_out, graph_out, &
        dependencies_out, numDependencies_out) result(StreamGetCaptureInfo_v2)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), target :: captureStatus_out(..)
      integer(c_int64_t), target :: id_out(..)
      type(c_ptr) :: graph_out
      type(c_ptr) :: dependencies_out
      type(c_ptr), value :: numDependencies_out
      integer(c_int) :: StreamGetCaptureInfo_v2
      if (.not. is_contiguous(captureStatus_out)) error stop "captureStatus_out: array must be contiguous"
      if (.not. is_contiguous(id_out)) error stop "id_out: array must be contiguous"
      StreamGetCaptureInfo_v2 = hipStreamGetCaptureInfo_v2_raw(stream, c_loc(captureStatus_out), &
        c_loc(id_out), graph_out, dependencies_out, numDependencies_out)
    end function hipStreamGetCaptureInfo_v2_native

    function hipStreamGetCaptureInfo_v2_typed(stream, captureStatus_out, id_out, graph_out, &
        dependencies_out, numDependencies_out) result(StreamGetCaptureInfo_v2)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: captureStatus_out
      type(c_ptr), value :: id_out
      type(hipGraph_t) :: graph_out
      type(hipGraphNode_t) :: dependencies_out
      type(c_ptr), value :: numDependencies_out
      integer(c_int) :: StreamGetCaptureInfo_v2
      StreamGetCaptureInfo_v2 = hipStreamGetCaptureInfo_v2_raw(stream%ptr, captureStatus_out, &
        id_out, graph_out%ptr, dependencies_out%ptr, numDependencies_out)
    end function hipStreamGetCaptureInfo_v2_typed

    function hipStreamIsCapturing_native(stream, pCaptureStatus) result(StreamIsCapturing)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), target :: pCaptureStatus(..)
      integer(c_int) :: StreamIsCapturing
      if (.not. is_contiguous(pCaptureStatus)) error stop "pCaptureStatus: array must be contiguous"
      StreamIsCapturing = hipStreamIsCapturing_raw(stream, c_loc(pCaptureStatus))
    end function hipStreamIsCapturing_native

    function hipStreamIsCapturing_typed(stream, pCaptureStatus) result(StreamIsCapturing)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: pCaptureStatus
      integer(c_int) :: StreamIsCapturing
      StreamIsCapturing = hipStreamIsCapturing_raw(stream%ptr, pCaptureStatus)
    end function hipStreamIsCapturing_typed

    function hipStreamUpdateCaptureDependencies_typed(stream, dependencies, numDependencies, &
        flags) result(StreamUpdateCaptureDependencies)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(hipGraphNode_t) :: dependencies
      integer(c_long), value :: numDependencies
      integer(c_int), value :: flags
      integer(c_int) :: StreamUpdateCaptureDependencies
      StreamUpdateCaptureDependencies = hipStreamUpdateCaptureDependencies_raw(stream%ptr, &
        dependencies%ptr, numDependencies, flags)
    end function hipStreamUpdateCaptureDependencies_typed

    function hipThreadExchangeStreamCaptureMode_native(mode) result(ThreadExchangeStreamCaptureMode)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: mode(..)
      integer(c_int) :: ThreadExchangeStreamCaptureMode
      if (.not. is_contiguous(mode)) error stop "mode: array must be contiguous"
      ThreadExchangeStreamCaptureMode = hipThreadExchangeStreamCaptureMode_raw(c_loc(mode))
    end function hipThreadExchangeStreamCaptureMode_native

    function hipGraphCreate_typed(pGraph, flags) result(GraphCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t) :: pGraph
      integer(c_int), value :: flags
      integer(c_int) :: GraphCreate
      GraphCreate = hipGraphCreate_raw(pGraph%ptr, flags)
    end function hipGraphCreate_typed

    function hipGraphDestroy_typed(graph) result(GraphDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      integer(c_int) :: GraphDestroy
      GraphDestroy = hipGraphDestroy_raw(graph%ptr)
    end function hipGraphDestroy_typed

    function hipGraphAddDependencies_typed(graph, from, to, numDependencies) result( &
        GraphAddDependencies)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: from
      type(hipGraphNode_t) :: to
      integer(c_long), value :: numDependencies
      integer(c_int) :: GraphAddDependencies
      GraphAddDependencies = hipGraphAddDependencies_raw(graph%ptr, from%ptr, to%ptr, &
        numDependencies)
    end function hipGraphAddDependencies_typed

    function hipGraphRemoveDependencies_typed(graph, from, to, numDependencies) result( &
        GraphRemoveDependencies)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: from
      type(hipGraphNode_t) :: to
      integer(c_long), value :: numDependencies
      integer(c_int) :: GraphRemoveDependencies
      GraphRemoveDependencies = hipGraphRemoveDependencies_raw(graph%ptr, from%ptr, to%ptr, &
        numDependencies)
    end function hipGraphRemoveDependencies_typed

    function hipGraphGetEdges_typed(graph, from, to, numEdges) result(GraphGetEdges)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: from
      type(hipGraphNode_t) :: to
      type(c_ptr), value :: numEdges
      integer(c_int) :: GraphGetEdges
      GraphGetEdges = hipGraphGetEdges_raw(graph%ptr, from%ptr, to%ptr, numEdges)
    end function hipGraphGetEdges_typed

    function hipGraphGetNodes_typed(graph, nodes, numNodes) result(GraphGetNodes)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: nodes
      type(c_ptr), value :: numNodes
      integer(c_int) :: GraphGetNodes
      GraphGetNodes = hipGraphGetNodes_raw(graph%ptr, nodes%ptr, numNodes)
    end function hipGraphGetNodes_typed

    function hipGraphGetRootNodes_typed(graph, pRootNodes, pNumRootNodes) result(GraphGetRootNodes)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pRootNodes
      type(c_ptr), value :: pNumRootNodes
      integer(c_int) :: GraphGetRootNodes
      GraphGetRootNodes = hipGraphGetRootNodes_raw(graph%ptr, pRootNodes%ptr, pNumRootNodes)
    end function hipGraphGetRootNodes_typed

    function hipGraphNodeGetDependencies_typed(node, pDependencies, pNumDependencies) result( &
        GraphNodeGetDependencies)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipGraphNode_t) :: pDependencies
      type(c_ptr), value :: pNumDependencies
      integer(c_int) :: GraphNodeGetDependencies
      GraphNodeGetDependencies = hipGraphNodeGetDependencies_raw(node%ptr, pDependencies%ptr, &
        pNumDependencies)
    end function hipGraphNodeGetDependencies_typed

    function hipGraphNodeGetDependentNodes_typed(node, pDependentNodes, &
        pNumDependentNodes) result(GraphNodeGetDependentNodes)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipGraphNode_t) :: pDependentNodes
      type(c_ptr), value :: pNumDependentNodes
      integer(c_int) :: GraphNodeGetDependentNodes
      GraphNodeGetDependentNodes = hipGraphNodeGetDependentNodes_raw(node%ptr, &
        pDependentNodes%ptr, pNumDependentNodes)
    end function hipGraphNodeGetDependentNodes_typed

    function hipGraphNodeGetType_native(node, pType) result(GraphNodeGetType)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: node
      integer(c_int), target :: pType(..)
      integer(c_int) :: GraphNodeGetType
      if (.not. is_contiguous(pType)) error stop "pType: array must be contiguous"
      GraphNodeGetType = hipGraphNodeGetType_raw(node, c_loc(pType))
    end function hipGraphNodeGetType_native

    function hipGraphNodeGetType_typed(node, pType) result(GraphNodeGetType)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: pType
      integer(c_int) :: GraphNodeGetType
      GraphNodeGetType = hipGraphNodeGetType_raw(node%ptr, pType)
    end function hipGraphNodeGetType_typed

    function hipGraphDestroyNode_typed(node) result(GraphDestroyNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      integer(c_int) :: GraphDestroyNode
      GraphDestroyNode = hipGraphDestroyNode_raw(node%ptr)
    end function hipGraphDestroyNode_typed

    function hipGraphClone_typed(pGraphClone, originalGraph) result(GraphClone)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t) :: pGraphClone
      type(hipGraph_t), value :: originalGraph
      integer(c_int) :: GraphClone
      GraphClone = hipGraphClone_raw(pGraphClone%ptr, originalGraph%ptr)
    end function hipGraphClone_typed

    function hipGraphNodeFindInClone_typed(pNode, originalNode, clonedGraph) result( &
        GraphNodeFindInClone)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pNode
      type(hipGraphNode_t), value :: originalNode
      type(hipGraph_t), value :: clonedGraph
      integer(c_int) :: GraphNodeFindInClone
      GraphNodeFindInClone = hipGraphNodeFindInClone_raw(pNode%ptr, originalNode%ptr, &
        clonedGraph%ptr)
    end function hipGraphNodeFindInClone_typed

    function hipGraphInstantiate_typed(pGraphExec, graph, pErrorNode, pLogBuffer, &
        bufferSize) result(GraphInstantiate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t) :: pGraphExec
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pErrorNode
      type(c_ptr), value :: pLogBuffer
      integer(c_long), value :: bufferSize
      integer(c_int) :: GraphInstantiate
      GraphInstantiate = hipGraphInstantiate_raw(pGraphExec%ptr, graph%ptr, pErrorNode%ptr, &
        pLogBuffer, bufferSize)
    end function hipGraphInstantiate_typed

    function hipGraphInstantiateWithFlags_typed(pGraphExec, graph, flags) result( &
        GraphInstantiateWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t) :: pGraphExec
      type(hipGraph_t), value :: graph
      integer(c_int64_t), value :: flags
      integer(c_int) :: GraphInstantiateWithFlags
      GraphInstantiateWithFlags = hipGraphInstantiateWithFlags_raw(pGraphExec%ptr, graph%ptr, flags)
    end function hipGraphInstantiateWithFlags_typed

    function hipGraphInstantiateWithParams_typed(pGraphExec, graph, instantiateParams) result( &
        GraphInstantiateWithParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t) :: pGraphExec
      type(hipGraph_t), value :: graph
      type(hipGraphInstantiateParams) :: instantiateParams
      integer(c_int) :: GraphInstantiateWithParams
      GraphInstantiateWithParams = hipGraphInstantiateWithParams_raw(pGraphExec%ptr, graph%ptr, &
        instantiateParams)
    end function hipGraphInstantiateWithParams_typed

    function hipGraphLaunch_typed(graphExec, stream) result(GraphLaunch)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      type(hipStream_t), value :: stream
      integer(c_int) :: GraphLaunch
      GraphLaunch = hipGraphLaunch_raw(graphExec%ptr, stream%ptr)
    end function hipGraphLaunch_typed

    function hipGraphUpload_typed(graphExec, stream) result(GraphUpload)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      type(hipStream_t), value :: stream
      integer(c_int) :: GraphUpload
      GraphUpload = hipGraphUpload_raw(graphExec%ptr, stream%ptr)
    end function hipGraphUpload_typed

    function hipGraphAddNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        nodeParams) result(GraphAddNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(hipGraphNodeParams) :: nodeParams
      integer(c_int) :: GraphAddNode
      GraphAddNode = hipGraphAddNode_raw(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies, nodeParams)
    end function hipGraphAddNode_typed

    function hipGraphExecGetFlags_native(graphExec, flags) result(GraphExecGetFlags)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: graphExec
      integer(c_int64_t), target :: flags(..)
      integer(c_int) :: GraphExecGetFlags
      if (.not. is_contiguous(flags)) error stop "flags: array must be contiguous"
      GraphExecGetFlags = hipGraphExecGetFlags_raw(graphExec, c_loc(flags))
    end function hipGraphExecGetFlags_native

    function hipGraphExecGetFlags_typed(graphExec, flags) result(GraphExecGetFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      type(c_ptr), value :: flags
      integer(c_int) :: GraphExecGetFlags
      GraphExecGetFlags = hipGraphExecGetFlags_raw(graphExec%ptr, flags)
    end function hipGraphExecGetFlags_typed

    function hipGraphNodeSetParams_typed(node, nodeParams) result(GraphNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipGraphNodeParams) :: nodeParams
      integer(c_int) :: GraphNodeSetParams
      GraphNodeSetParams = hipGraphNodeSetParams_raw(node%ptr, nodeParams)
    end function hipGraphNodeSetParams_typed

    function hipGraphExecNodeSetParams_typed(graphExec, node, nodeParams) result( &
        GraphExecNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      type(hipGraphNode_t), value :: node
      type(hipGraphNodeParams) :: nodeParams
      integer(c_int) :: GraphExecNodeSetParams
      GraphExecNodeSetParams = hipGraphExecNodeSetParams_raw(graphExec%ptr, node%ptr, nodeParams)
    end function hipGraphExecNodeSetParams_typed

    function hipGraphExecDestroy_typed(graphExec) result(GraphExecDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      integer(c_int) :: GraphExecDestroy
      GraphExecDestroy = hipGraphExecDestroy_raw(graphExec%ptr)
    end function hipGraphExecDestroy_typed

    function hipGraphExecUpdate_native(hGraphExec, hGraph, hErrorNode_out, &
        updateResult_out) result(GraphExecUpdate)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: hGraphExec
      type(c_ptr), value :: hGraph
      type(c_ptr) :: hErrorNode_out
      integer(c_int), target :: updateResult_out(..)
      integer(c_int) :: GraphExecUpdate
      if (.not. is_contiguous(updateResult_out)) error stop "updateResult_out: array must be contiguous"
      GraphExecUpdate = hipGraphExecUpdate_raw(hGraphExec, hGraph, hErrorNode_out, c_loc( &
        updateResult_out))
    end function hipGraphExecUpdate_native

    function hipGraphExecUpdate_typed(hGraphExec, hGraph, hErrorNode_out, &
        updateResult_out) result(GraphExecUpdate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraph_t), value :: hGraph
      type(hipGraphNode_t) :: hErrorNode_out
      type(c_ptr), value :: updateResult_out
      integer(c_int) :: GraphExecUpdate
      GraphExecUpdate = hipGraphExecUpdate_raw(hGraphExec%ptr, hGraph%ptr, hErrorNode_out%ptr, &
        updateResult_out)
    end function hipGraphExecUpdate_typed

    function hipGraphAddKernelNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        pNodeParams) result(GraphAddKernelNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(hipKernelNodeParams) :: pNodeParams
      integer(c_int) :: GraphAddKernelNode
      GraphAddKernelNode = hipGraphAddKernelNode_raw(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies, pNodeParams)
    end function hipGraphAddKernelNode_typed

    function hipGraphKernelNodeGetParams_typed(node, pNodeParams) result(GraphKernelNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipKernelNodeParams) :: pNodeParams
      integer(c_int) :: GraphKernelNodeGetParams
      GraphKernelNodeGetParams = hipGraphKernelNodeGetParams_raw(node%ptr, pNodeParams)
    end function hipGraphKernelNodeGetParams_typed

    function hipGraphKernelNodeSetParams_typed(node, pNodeParams) result(GraphKernelNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipKernelNodeParams) :: pNodeParams
      integer(c_int) :: GraphKernelNodeSetParams
      GraphKernelNodeSetParams = hipGraphKernelNodeSetParams_raw(node%ptr, pNodeParams)
    end function hipGraphKernelNodeSetParams_typed

    function hipGraphExecKernelNodeSetParams_typed(hGraphExec, node, pNodeParams) result( &
        GraphExecKernelNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(hipKernelNodeParams) :: pNodeParams
      integer(c_int) :: GraphExecKernelNodeSetParams
      GraphExecKernelNodeSetParams = hipGraphExecKernelNodeSetParams_raw(hGraphExec%ptr, node%ptr, &
        pNodeParams)
    end function hipGraphExecKernelNodeSetParams_typed

    function hipDrvGraphAddMemcpyNode_typed(phGraphNode, hGraph, dependencies, numDependencies, &
        copyParams, ctx) result(DrvGraphAddMemcpyNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: phGraphNode
      type(hipGraph_t), value :: hGraph
      type(hipGraphNode_t) :: dependencies
      integer(c_long), value :: numDependencies
      type(HIP_MEMCPY3D) :: copyParams
      type(hipCtx_t), value :: ctx
      integer(c_int) :: DrvGraphAddMemcpyNode
      DrvGraphAddMemcpyNode = hipDrvGraphAddMemcpyNode_raw(phGraphNode%ptr, hGraph%ptr, &
        dependencies%ptr, numDependencies, copyParams, ctx%ptr)
    end function hipDrvGraphAddMemcpyNode_typed

    function hipGraphAddMemcpyNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        pCopyParams) result(GraphAddMemcpyNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(hipMemcpy3DParms) :: pCopyParams
      integer(c_int) :: GraphAddMemcpyNode
      GraphAddMemcpyNode = hipGraphAddMemcpyNode_raw(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies, pCopyParams)
    end function hipGraphAddMemcpyNode_typed

    function hipGraphMemcpyNodeGetParams_typed(node, pNodeParams) result(GraphMemcpyNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipMemcpy3DParms) :: pNodeParams
      integer(c_int) :: GraphMemcpyNodeGetParams
      GraphMemcpyNodeGetParams = hipGraphMemcpyNodeGetParams_raw(node%ptr, pNodeParams)
    end function hipGraphMemcpyNodeGetParams_typed

    function hipGraphMemcpyNodeSetParams_typed(node, pNodeParams) result(GraphMemcpyNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipMemcpy3DParms) :: pNodeParams
      integer(c_int) :: GraphMemcpyNodeSetParams
      GraphMemcpyNodeSetParams = hipGraphMemcpyNodeSetParams_raw(node%ptr, pNodeParams)
    end function hipGraphMemcpyNodeSetParams_typed

    function hipGraphKernelNodeSetAttribute_typed(hNode, attr, value) result( &
        GraphKernelNodeSetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      integer(c_int), value :: attr
      type(c_ptr), value :: value
      integer(c_int) :: GraphKernelNodeSetAttribute
      GraphKernelNodeSetAttribute = hipGraphKernelNodeSetAttribute_raw(hNode%ptr, attr, value)
    end function hipGraphKernelNodeSetAttribute_typed

    function hipGraphKernelNodeGetAttribute_typed(hNode, attr, value) result( &
        GraphKernelNodeGetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      integer(c_int), value :: attr
      type(c_ptr), value :: value
      integer(c_int) :: GraphKernelNodeGetAttribute
      GraphKernelNodeGetAttribute = hipGraphKernelNodeGetAttribute_raw(hNode%ptr, attr, value)
    end function hipGraphKernelNodeGetAttribute_typed

    function hipGraphExecMemcpyNodeSetParams_typed(hGraphExec, node, pNodeParams) result( &
        GraphExecMemcpyNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(hipMemcpy3DParms) :: pNodeParams
      integer(c_int) :: GraphExecMemcpyNodeSetParams
      GraphExecMemcpyNodeSetParams = hipGraphExecMemcpyNodeSetParams_raw(hGraphExec%ptr, node%ptr, &
        pNodeParams)
    end function hipGraphExecMemcpyNodeSetParams_typed

    function hipGraphAddMemcpyNode1D_typed(pGraphNode, graph, pDependencies, numDependencies, dst, &
        src, count, kind) result(GraphAddMemcpyNode1D)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_long), value :: count
      integer(c_int), value :: kind
      integer(c_int) :: GraphAddMemcpyNode1D
      GraphAddMemcpyNode1D = hipGraphAddMemcpyNode1D_raw(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, dst, src, count, kind)
    end function hipGraphAddMemcpyNode1D_typed

    function hipGraphMemcpyNodeSetParams1D_typed(node, dst, src, count, kind) result( &
        GraphMemcpyNodeSetParams1D)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_long), value :: count
      integer(c_int), value :: kind
      integer(c_int) :: GraphMemcpyNodeSetParams1D
      GraphMemcpyNodeSetParams1D = hipGraphMemcpyNodeSetParams1D_raw(node%ptr, dst, src, count, &
        kind)
    end function hipGraphMemcpyNodeSetParams1D_typed

    function hipGraphExecMemcpyNodeSetParams1D_typed(hGraphExec, node, dst, src, count, &
        kind) result(GraphExecMemcpyNodeSetParams1D)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_long), value :: count
      integer(c_int), value :: kind
      integer(c_int) :: GraphExecMemcpyNodeSetParams1D
      GraphExecMemcpyNodeSetParams1D = hipGraphExecMemcpyNodeSetParams1D_raw(hGraphExec%ptr, &
        node%ptr, dst, src, count, kind)
    end function hipGraphExecMemcpyNodeSetParams1D_typed

    function hipGraphAddMemcpyNodeFromSymbol_typed(pGraphNode, graph, pDependencies, &
        numDependencies, dst, symbol, count, offset, kind) result(GraphAddMemcpyNodeFromSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(c_ptr), value :: dst
      type(c_ptr), value :: symbol
      integer(c_long), value :: count
      integer(c_long), value :: offset
      integer(c_int), value :: kind
      integer(c_int) :: GraphAddMemcpyNodeFromSymbol
      GraphAddMemcpyNodeFromSymbol = hipGraphAddMemcpyNodeFromSymbol_raw(pGraphNode%ptr, &
        graph%ptr, pDependencies%ptr, numDependencies, dst, symbol, count, offset, kind)
    end function hipGraphAddMemcpyNodeFromSymbol_typed

    function hipGraphMemcpyNodeSetParamsFromSymbol_typed(node, dst, symbol, count, offset, &
        kind) result(GraphMemcpyNodeSetParamsFromSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: dst
      type(c_ptr), value :: symbol
      integer(c_long), value :: count
      integer(c_long), value :: offset
      integer(c_int), value :: kind
      integer(c_int) :: GraphMemcpyNodeSetParamsFromSymbol
      GraphMemcpyNodeSetParamsFromSymbol = hipGraphMemcpyNodeSetParamsFromSymbol_raw(node%ptr, &
        dst, symbol, count, offset, kind)
    end function hipGraphMemcpyNodeSetParamsFromSymbol_typed

    function hipGraphExecMemcpyNodeSetParamsFromSymbol_typed(hGraphExec, node, dst, symbol, count, &
        offset, kind) result(GraphExecMemcpyNodeSetParamsFromSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: dst
      type(c_ptr), value :: symbol
      integer(c_long), value :: count
      integer(c_long), value :: offset
      integer(c_int), value :: kind
      integer(c_int) :: GraphExecMemcpyNodeSetParamsFromSymbol
      GraphExecMemcpyNodeSetParamsFromSymbol = hipGraphExecMemcpyNodeSetParamsFromSymbol_raw( &
        hGraphExec%ptr, node%ptr, dst, symbol, count, offset, kind)
    end function hipGraphExecMemcpyNodeSetParamsFromSymbol_typed

    function hipGraphAddMemcpyNodeToSymbol_typed(pGraphNode, graph, pDependencies, &
        numDependencies, symbol, src, count, offset, kind) result(GraphAddMemcpyNodeToSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(c_ptr), value :: symbol
      type(c_ptr), value :: src
      integer(c_long), value :: count
      integer(c_long), value :: offset
      integer(c_int), value :: kind
      integer(c_int) :: GraphAddMemcpyNodeToSymbol
      GraphAddMemcpyNodeToSymbol = hipGraphAddMemcpyNodeToSymbol_raw(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, symbol, src, count, offset, kind)
    end function hipGraphAddMemcpyNodeToSymbol_typed

    function hipGraphMemcpyNodeSetParamsToSymbol_typed(node, symbol, src, count, offset, &
        kind) result(GraphMemcpyNodeSetParamsToSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: symbol
      type(c_ptr), value :: src
      integer(c_long), value :: count
      integer(c_long), value :: offset
      integer(c_int), value :: kind
      integer(c_int) :: GraphMemcpyNodeSetParamsToSymbol
      GraphMemcpyNodeSetParamsToSymbol = hipGraphMemcpyNodeSetParamsToSymbol_raw(node%ptr, symbol, &
        src, count, offset, kind)
    end function hipGraphMemcpyNodeSetParamsToSymbol_typed

    function hipGraphExecMemcpyNodeSetParamsToSymbol_typed(hGraphExec, node, symbol, src, count, &
        offset, kind) result(GraphExecMemcpyNodeSetParamsToSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: symbol
      type(c_ptr), value :: src
      integer(c_long), value :: count
      integer(c_long), value :: offset
      integer(c_int), value :: kind
      integer(c_int) :: GraphExecMemcpyNodeSetParamsToSymbol
      GraphExecMemcpyNodeSetParamsToSymbol = hipGraphExecMemcpyNodeSetParamsToSymbol_raw( &
        hGraphExec%ptr, node%ptr, symbol, src, count, offset, kind)
    end function hipGraphExecMemcpyNodeSetParamsToSymbol_typed

    function hipGraphAddMemsetNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        pMemsetParams) result(GraphAddMemsetNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(hipMemsetParams) :: pMemsetParams
      integer(c_int) :: GraphAddMemsetNode
      GraphAddMemsetNode = hipGraphAddMemsetNode_raw(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies, pMemsetParams)
    end function hipGraphAddMemsetNode_typed

    function hipGraphMemsetNodeGetParams_typed(node, pNodeParams) result(GraphMemsetNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipMemsetParams) :: pNodeParams
      integer(c_int) :: GraphMemsetNodeGetParams
      GraphMemsetNodeGetParams = hipGraphMemsetNodeGetParams_raw(node%ptr, pNodeParams)
    end function hipGraphMemsetNodeGetParams_typed

    function hipGraphMemsetNodeSetParams_typed(node, pNodeParams) result(GraphMemsetNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipMemsetParams) :: pNodeParams
      integer(c_int) :: GraphMemsetNodeSetParams
      GraphMemsetNodeSetParams = hipGraphMemsetNodeSetParams_raw(node%ptr, pNodeParams)
    end function hipGraphMemsetNodeSetParams_typed

    function hipGraphExecMemsetNodeSetParams_typed(hGraphExec, node, pNodeParams) result( &
        GraphExecMemsetNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(hipMemsetParams) :: pNodeParams
      integer(c_int) :: GraphExecMemsetNodeSetParams
      GraphExecMemsetNodeSetParams = hipGraphExecMemsetNodeSetParams_raw(hGraphExec%ptr, node%ptr, &
        pNodeParams)
    end function hipGraphExecMemsetNodeSetParams_typed

    function hipGraphAddHostNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        pNodeParams) result(GraphAddHostNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(hipHostNodeParams) :: pNodeParams
      integer(c_int) :: GraphAddHostNode
      GraphAddHostNode = hipGraphAddHostNode_raw(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies, pNodeParams)
    end function hipGraphAddHostNode_typed

    function hipGraphHostNodeGetParams_typed(node, pNodeParams) result(GraphHostNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipHostNodeParams) :: pNodeParams
      integer(c_int) :: GraphHostNodeGetParams
      GraphHostNodeGetParams = hipGraphHostNodeGetParams_raw(node%ptr, pNodeParams)
    end function hipGraphHostNodeGetParams_typed

    function hipGraphHostNodeSetParams_typed(node, pNodeParams) result(GraphHostNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipHostNodeParams) :: pNodeParams
      integer(c_int) :: GraphHostNodeSetParams
      GraphHostNodeSetParams = hipGraphHostNodeSetParams_raw(node%ptr, pNodeParams)
    end function hipGraphHostNodeSetParams_typed

    function hipGraphExecHostNodeSetParams_typed(hGraphExec, node, pNodeParams) result( &
        GraphExecHostNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(hipHostNodeParams) :: pNodeParams
      integer(c_int) :: GraphExecHostNodeSetParams
      GraphExecHostNodeSetParams = hipGraphExecHostNodeSetParams_raw(hGraphExec%ptr, node%ptr, &
        pNodeParams)
    end function hipGraphExecHostNodeSetParams_typed

    function hipGraphAddChildGraphNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        childGraph) result(GraphAddChildGraphNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(hipGraph_t), value :: childGraph
      integer(c_int) :: GraphAddChildGraphNode
      GraphAddChildGraphNode = hipGraphAddChildGraphNode_raw(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, childGraph%ptr)
    end function hipGraphAddChildGraphNode_typed

    function hipGraphChildGraphNodeGetGraph_typed(node, pGraph) result(GraphChildGraphNodeGetGraph)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipGraph_t) :: pGraph
      integer(c_int) :: GraphChildGraphNodeGetGraph
      GraphChildGraphNodeGetGraph = hipGraphChildGraphNodeGetGraph_raw(node%ptr, pGraph%ptr)
    end function hipGraphChildGraphNodeGetGraph_typed

    function hipGraphExecChildGraphNodeSetParams_typed(hGraphExec, node, childGraph) result( &
        GraphExecChildGraphNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(hipGraph_t), value :: childGraph
      integer(c_int) :: GraphExecChildGraphNodeSetParams
      GraphExecChildGraphNodeSetParams = hipGraphExecChildGraphNodeSetParams_raw(hGraphExec%ptr, &
        node%ptr, childGraph%ptr)
    end function hipGraphExecChildGraphNodeSetParams_typed

    function hipGraphAddEmptyNode_typed(pGraphNode, graph, pDependencies, numDependencies) result( &
        GraphAddEmptyNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      integer(c_int) :: GraphAddEmptyNode
      GraphAddEmptyNode = hipGraphAddEmptyNode_raw(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies)
    end function hipGraphAddEmptyNode_typed

    function hipGraphAddEventRecordNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        event) result(GraphAddEventRecordNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(hipEvent_t), value :: event
      integer(c_int) :: GraphAddEventRecordNode
      GraphAddEventRecordNode = hipGraphAddEventRecordNode_raw(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, event%ptr)
    end function hipGraphAddEventRecordNode_typed

    function hipGraphEventRecordNodeGetEvent_typed(node, event_out) result( &
        GraphEventRecordNodeGetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipEvent_t) :: event_out
      integer(c_int) :: GraphEventRecordNodeGetEvent
      GraphEventRecordNodeGetEvent = hipGraphEventRecordNodeGetEvent_raw(node%ptr, event_out%ptr)
    end function hipGraphEventRecordNodeGetEvent_typed

    function hipGraphEventRecordNodeSetEvent_typed(node, event) result(GraphEventRecordNodeSetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipEvent_t), value :: event
      integer(c_int) :: GraphEventRecordNodeSetEvent
      GraphEventRecordNodeSetEvent = hipGraphEventRecordNodeSetEvent_raw(node%ptr, event%ptr)
    end function hipGraphEventRecordNodeSetEvent_typed

    function hipGraphExecEventRecordNodeSetEvent_typed(hGraphExec, hNode, event) result( &
        GraphExecEventRecordNodeSetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(hipEvent_t), value :: event
      integer(c_int) :: GraphExecEventRecordNodeSetEvent
      GraphExecEventRecordNodeSetEvent = hipGraphExecEventRecordNodeSetEvent_raw(hGraphExec%ptr, &
        hNode%ptr, event%ptr)
    end function hipGraphExecEventRecordNodeSetEvent_typed

    function hipGraphAddEventWaitNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        event) result(GraphAddEventWaitNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(hipEvent_t), value :: event
      integer(c_int) :: GraphAddEventWaitNode
      GraphAddEventWaitNode = hipGraphAddEventWaitNode_raw(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, event%ptr)
    end function hipGraphAddEventWaitNode_typed

    function hipGraphEventWaitNodeGetEvent_typed(node, event_out) result(GraphEventWaitNodeGetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipEvent_t) :: event_out
      integer(c_int) :: GraphEventWaitNodeGetEvent
      GraphEventWaitNodeGetEvent = hipGraphEventWaitNodeGetEvent_raw(node%ptr, event_out%ptr)
    end function hipGraphEventWaitNodeGetEvent_typed

    function hipGraphEventWaitNodeSetEvent_typed(node, event) result(GraphEventWaitNodeSetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipEvent_t), value :: event
      integer(c_int) :: GraphEventWaitNodeSetEvent
      GraphEventWaitNodeSetEvent = hipGraphEventWaitNodeSetEvent_raw(node%ptr, event%ptr)
    end function hipGraphEventWaitNodeSetEvent_typed

    function hipGraphExecEventWaitNodeSetEvent_typed(hGraphExec, hNode, event) result( &
        GraphExecEventWaitNodeSetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(hipEvent_t), value :: event
      integer(c_int) :: GraphExecEventWaitNodeSetEvent
      GraphExecEventWaitNodeSetEvent = hipGraphExecEventWaitNodeSetEvent_raw(hGraphExec%ptr, &
        hNode%ptr, event%ptr)
    end function hipGraphExecEventWaitNodeSetEvent_typed

    function hipGraphAddMemAllocNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        pNodeParams) result(GraphAddMemAllocNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(hipMemAllocNodeParams) :: pNodeParams
      integer(c_int) :: GraphAddMemAllocNode
      GraphAddMemAllocNode = hipGraphAddMemAllocNode_raw(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, pNodeParams)
    end function hipGraphAddMemAllocNode_typed

    function hipGraphMemAllocNodeGetParams_typed(node, pNodeParams) result( &
        GraphMemAllocNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipMemAllocNodeParams) :: pNodeParams
      integer(c_int) :: GraphMemAllocNodeGetParams
      GraphMemAllocNodeGetParams = hipGraphMemAllocNodeGetParams_raw(node%ptr, pNodeParams)
    end function hipGraphMemAllocNodeGetParams_typed

    function hipGraphAddMemFreeNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        dev_ptr) result(GraphAddMemFreeNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(c_ptr), value :: dev_ptr
      integer(c_int) :: GraphAddMemFreeNode
      GraphAddMemFreeNode = hipGraphAddMemFreeNode_raw(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, dev_ptr)
    end function hipGraphAddMemFreeNode_typed

    function hipGraphMemFreeNodeGetParams_typed(node, dev_ptr) result(GraphMemFreeNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: dev_ptr
      integer(c_int) :: GraphMemFreeNodeGetParams
      GraphMemFreeNodeGetParams = hipGraphMemFreeNodeGetParams_raw(node%ptr, dev_ptr)
    end function hipGraphMemFreeNodeGetParams_typed

    function hipUserObjectCreate_typed(object_out, ptr, destroy, initialRefcount, flags) result( &
        UserObjectCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipUserObject_t) :: object_out
      type(c_ptr), value :: ptr
      type(c_funptr), value :: destroy
      integer(c_int), value :: initialRefcount
      integer(c_int), value :: flags
      integer(c_int) :: UserObjectCreate
      UserObjectCreate = hipUserObjectCreate_raw(object_out%ptr, ptr, destroy, initialRefcount, &
        flags)
    end function hipUserObjectCreate_typed

    function hipUserObjectRelease_typed(object, count) result(UserObjectRelease)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipUserObject_t), value :: object
      integer(c_int), value :: count
      integer(c_int) :: UserObjectRelease
      UserObjectRelease = hipUserObjectRelease_raw(object%ptr, count)
    end function hipUserObjectRelease_typed

    function hipUserObjectRetain_typed(object, count) result(UserObjectRetain)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipUserObject_t), value :: object
      integer(c_int), value :: count
      integer(c_int) :: UserObjectRetain
      UserObjectRetain = hipUserObjectRetain_raw(object%ptr, count)
    end function hipUserObjectRetain_typed

    function hipGraphRetainUserObject_typed(graph, object, count, flags) result( &
        GraphRetainUserObject)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipUserObject_t), value :: object
      integer(c_int), value :: count
      integer(c_int), value :: flags
      integer(c_int) :: GraphRetainUserObject
      GraphRetainUserObject = hipGraphRetainUserObject_raw(graph%ptr, object%ptr, count, flags)
    end function hipGraphRetainUserObject_typed

    function hipGraphReleaseUserObject_typed(graph, object, count) result(GraphReleaseUserObject)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipUserObject_t), value :: object
      integer(c_int), value :: count
      integer(c_int) :: GraphReleaseUserObject
      GraphReleaseUserObject = hipGraphReleaseUserObject_raw(graph%ptr, object%ptr, count)
    end function hipGraphReleaseUserObject_typed

    function hipGraphDebugDotPrint_typed(graph, path, flags) result(GraphDebugDotPrint)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(c_ptr), value :: path
      integer(c_int), value :: flags
      integer(c_int) :: GraphDebugDotPrint
      GraphDebugDotPrint = hipGraphDebugDotPrint_raw(graph%ptr, path, flags)
    end function hipGraphDebugDotPrint_typed

    function hipGraphDebugDotPrint_cstr(graph, path, flags) result(GraphDebugDotPrint)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: graph
      character(len=*), intent(in) :: path
      integer(c_int), value :: flags
      integer(c_int) :: GraphDebugDotPrint
      character(len=len_trim(path)+1, kind=c_char), target :: path__c
      path__c = trim(path)//c_null_char
      GraphDebugDotPrint = hipGraphDebugDotPrint_raw(graph, c_loc(path__c), flags)
    end function hipGraphDebugDotPrint_cstr

    function hipGraphKernelNodeCopyAttributes_typed(hSrc, hDst) result( &
        GraphKernelNodeCopyAttributes)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hSrc
      type(hipGraphNode_t), value :: hDst
      integer(c_int) :: GraphKernelNodeCopyAttributes
      GraphKernelNodeCopyAttributes = hipGraphKernelNodeCopyAttributes_raw(hSrc%ptr, hDst%ptr)
    end function hipGraphKernelNodeCopyAttributes_typed

    function hipGraphNodeSetEnabled_typed(hGraphExec, hNode, isEnabled) result(GraphNodeSetEnabled)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      integer(c_int), value :: isEnabled
      integer(c_int) :: GraphNodeSetEnabled
      GraphNodeSetEnabled = hipGraphNodeSetEnabled_raw(hGraphExec%ptr, hNode%ptr, isEnabled)
    end function hipGraphNodeSetEnabled_typed

    function hipGraphNodeGetEnabled_native(hGraphExec, hNode, isEnabled) result(GraphNodeGetEnabled)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: hGraphExec
      type(c_ptr), value :: hNode
      integer(c_int), target :: isEnabled(..)
      integer(c_int) :: GraphNodeGetEnabled
      if (.not. is_contiguous(isEnabled)) error stop "isEnabled: array must be contiguous"
      GraphNodeGetEnabled = hipGraphNodeGetEnabled_raw(hGraphExec, hNode, c_loc(isEnabled))
    end function hipGraphNodeGetEnabled_native

    function hipGraphNodeGetEnabled_typed(hGraphExec, hNode, isEnabled) result(GraphNodeGetEnabled)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(c_ptr), value :: isEnabled
      integer(c_int) :: GraphNodeGetEnabled
      GraphNodeGetEnabled = hipGraphNodeGetEnabled_raw(hGraphExec%ptr, hNode%ptr, isEnabled)
    end function hipGraphNodeGetEnabled_typed

    function hipGraphAddExternalSemaphoresWaitNode_typed(pGraphNode, graph, pDependencies, &
        numDependencies, nodeParams) result(GraphAddExternalSemaphoresWaitNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
      integer(c_int) :: GraphAddExternalSemaphoresWaitNode
      GraphAddExternalSemaphoresWaitNode = hipGraphAddExternalSemaphoresWaitNode_raw( &
        pGraphNode%ptr, graph%ptr, pDependencies%ptr, numDependencies, nodeParams)
    end function hipGraphAddExternalSemaphoresWaitNode_typed

    function hipGraphAddExternalSemaphoresSignalNode_typed(pGraphNode, graph, pDependencies, &
        numDependencies, nodeParams) result(GraphAddExternalSemaphoresSignalNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_long), value :: numDependencies
      type(hipExternalSemaphoreSignalNodeParams) :: nodeParams
      integer(c_int) :: GraphAddExternalSemaphoresSignalNode
      GraphAddExternalSemaphoresSignalNode = hipGraphAddExternalSemaphoresSignalNode_raw( &
        pGraphNode%ptr, graph%ptr, pDependencies%ptr, numDependencies, nodeParams)
    end function hipGraphAddExternalSemaphoresSignalNode_typed

    function hipGraphExternalSemaphoresSignalNodeSetParams_typed(hNode, nodeParams) result( &
        GraphExternalSemaphoresSignalNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipExternalSemaphoreSignalNodeParams) :: nodeParams
      integer(c_int) :: GraphExternalSemaphoresSignalNodeSetParams
      GraphExternalSemaphoresSignalNodeSetParams = hipGraphExternalSemaphoresSignalNodeSetParams_raw( &
        hNode%ptr, nodeParams)
    end function hipGraphExternalSemaphoresSignalNodeSetParams_typed

    function hipGraphExternalSemaphoresWaitNodeSetParams_typed(hNode, nodeParams) result( &
        GraphExternalSemaphoresWaitNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
      integer(c_int) :: GraphExternalSemaphoresWaitNodeSetParams
      GraphExternalSemaphoresWaitNodeSetParams = hipGraphExternalSemaphoresWaitNodeSetParams_raw( &
        hNode%ptr, nodeParams)
    end function hipGraphExternalSemaphoresWaitNodeSetParams_typed

    function hipGraphExternalSemaphoresSignalNodeGetParams_typed(hNode, params_out) result( &
        GraphExternalSemaphoresSignalNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipExternalSemaphoreSignalNodeParams) :: params_out
      integer(c_int) :: GraphExternalSemaphoresSignalNodeGetParams
      GraphExternalSemaphoresSignalNodeGetParams = hipGraphExternalSemaphoresSignalNodeGetParams_raw( &
        hNode%ptr, params_out)
    end function hipGraphExternalSemaphoresSignalNodeGetParams_typed

    function hipGraphExternalSemaphoresWaitNodeGetParams_typed(hNode, params_out) result( &
        GraphExternalSemaphoresWaitNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipExternalSemaphoreWaitNodeParams) :: params_out
      integer(c_int) :: GraphExternalSemaphoresWaitNodeGetParams
      GraphExternalSemaphoresWaitNodeGetParams = hipGraphExternalSemaphoresWaitNodeGetParams_raw( &
        hNode%ptr, params_out)
    end function hipGraphExternalSemaphoresWaitNodeGetParams_typed

    function hipGraphExecExternalSemaphoresSignalNodeSetParams_typed(hGraphExec, hNode, &
        nodeParams) result(GraphExecExternalSemaphoresSignalNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(hipExternalSemaphoreSignalNodeParams) :: nodeParams
      integer(c_int) :: GraphExecExternalSemaphoresSignalNodeSetParams
      GraphExecExternalSemaphoresSignalNodeSetParams = hipGraphExecExternalSemaphoresSignalNodeSetParams_raw( &
        hGraphExec%ptr, hNode%ptr, nodeParams)
    end function hipGraphExecExternalSemaphoresSignalNodeSetParams_typed

    function hipGraphExecExternalSemaphoresWaitNodeSetParams_typed(hGraphExec, hNode, &
        nodeParams) result(GraphExecExternalSemaphoresWaitNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
      integer(c_int) :: GraphExecExternalSemaphoresWaitNodeSetParams
      GraphExecExternalSemaphoresWaitNodeSetParams = hipGraphExecExternalSemaphoresWaitNodeSetParams_raw( &
        hGraphExec%ptr, hNode%ptr, nodeParams)
    end function hipGraphExecExternalSemaphoresWaitNodeSetParams_typed

    function hipDrvGraphMemcpyNodeGetParams_typed(hNode, nodeParams) result( &
        DrvGraphMemcpyNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(HIP_MEMCPY3D) :: nodeParams
      integer(c_int) :: DrvGraphMemcpyNodeGetParams
      DrvGraphMemcpyNodeGetParams = hipDrvGraphMemcpyNodeGetParams_raw(hNode%ptr, nodeParams)
    end function hipDrvGraphMemcpyNodeGetParams_typed

    function hipDrvGraphMemcpyNodeSetParams_typed(hNode, nodeParams) result( &
        DrvGraphMemcpyNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(HIP_MEMCPY3D) :: nodeParams
      integer(c_int) :: DrvGraphMemcpyNodeSetParams
      DrvGraphMemcpyNodeSetParams = hipDrvGraphMemcpyNodeSetParams_raw(hNode%ptr, nodeParams)
    end function hipDrvGraphMemcpyNodeSetParams_typed

    function hipDrvGraphAddMemsetNode_typed(phGraphNode, hGraph, dependencies, numDependencies, &
        memsetParams, ctx) result(DrvGraphAddMemsetNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: phGraphNode
      type(hipGraph_t), value :: hGraph
      type(hipGraphNode_t) :: dependencies
      integer(c_long), value :: numDependencies
      type(hipMemsetParams) :: memsetParams
      type(hipCtx_t), value :: ctx
      integer(c_int) :: DrvGraphAddMemsetNode
      DrvGraphAddMemsetNode = hipDrvGraphAddMemsetNode_raw(phGraphNode%ptr, hGraph%ptr, &
        dependencies%ptr, numDependencies, memsetParams, ctx%ptr)
    end function hipDrvGraphAddMemsetNode_typed

    function hipDrvGraphAddMemFreeNode_typed(phGraphNode, hGraph, dependencies, numDependencies, &
        dptr) result(DrvGraphAddMemFreeNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: phGraphNode
      type(hipGraph_t), value :: hGraph
      type(hipGraphNode_t) :: dependencies
      integer(c_long), value :: numDependencies
      type(c_ptr), value :: dptr
      integer(c_int) :: DrvGraphAddMemFreeNode
      DrvGraphAddMemFreeNode = hipDrvGraphAddMemFreeNode_raw(phGraphNode%ptr, hGraph%ptr, &
        dependencies%ptr, numDependencies, dptr)
    end function hipDrvGraphAddMemFreeNode_typed

    function hipDrvGraphExecMemcpyNodeSetParams_typed(hGraphExec, hNode, copyParams, ctx) result( &
        DrvGraphExecMemcpyNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(HIP_MEMCPY3D) :: copyParams
      type(hipCtx_t), value :: ctx
      integer(c_int) :: DrvGraphExecMemcpyNodeSetParams
      DrvGraphExecMemcpyNodeSetParams = hipDrvGraphExecMemcpyNodeSetParams_raw(hGraphExec%ptr, &
        hNode%ptr, copyParams, ctx%ptr)
    end function hipDrvGraphExecMemcpyNodeSetParams_typed

    function hipDrvGraphExecMemsetNodeSetParams_typed(hGraphExec, hNode, memsetParams, &
        ctx) result(DrvGraphExecMemsetNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(hipMemsetParams) :: memsetParams
      type(hipCtx_t), value :: ctx
      integer(c_int) :: DrvGraphExecMemsetNodeSetParams
      DrvGraphExecMemsetNodeSetParams = hipDrvGraphExecMemsetNodeSetParams_raw(hGraphExec%ptr, &
        hNode%ptr, memsetParams, ctx%ptr)
    end function hipDrvGraphExecMemsetNodeSetParams_typed

    function hipMemGetAccess_native(flags, location, ptr) result(MemGetAccess)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int64_t), target :: flags(..)
      type(hipMemLocation) :: location
      type(c_ptr), value :: ptr
      integer(c_int) :: MemGetAccess
      if (.not. is_contiguous(flags)) error stop "flags: array must be contiguous"
      MemGetAccess = hipMemGetAccess_raw(c_loc(flags), location, ptr)
    end function hipMemGetAccess_native

    function hipMemMapArrayAsync_typed(mapInfoList, count, stream) result(MemMapArrayAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipArrayMapInfo) :: mapInfoList
      integer(c_int), value :: count
      type(hipStream_t), value :: stream
      integer(c_int) :: MemMapArrayAsync
      MemMapArrayAsync = hipMemMapArrayAsync_raw(mapInfoList, count, stream%ptr)
    end function hipMemMapArrayAsync_typed

    function hipGraphicsMapResources_typed(count, resources, stream) result(GraphicsMapResources)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int), value :: count
      type(c_ptr) :: resources
      type(hipStream_t), value :: stream
      integer(c_int) :: GraphicsMapResources
      GraphicsMapResources = hipGraphicsMapResources_raw(count, resources, stream%ptr)
    end function hipGraphicsMapResources_typed

    function hipGraphicsUnmapResources_typed(count, resources, stream) result( &
        GraphicsUnmapResources)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int), value :: count
      type(c_ptr) :: resources
      type(hipStream_t), value :: stream
      integer(c_int) :: GraphicsUnmapResources
      GraphicsUnmapResources = hipGraphicsUnmapResources_raw(count, resources, stream%ptr)
    end function hipGraphicsUnmapResources_typed

    function hipMemsetAsync_spt_typed(dst, value, sizeBytes, stream) result(MemsetAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_int), value :: value
      integer(c_long), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(c_int) :: MemsetAsync_spt
      MemsetAsync_spt = hipMemsetAsync_spt_raw(dst, value, sizeBytes, stream%ptr)
    end function hipMemsetAsync_spt_typed

    function hipMemset2DAsync_spt_typed(dst, pitch, value, width, height, stream) result( &
        Memset2DAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_long), value :: pitch
      integer(c_int), value :: value
      integer(c_long), value :: width
      integer(c_long), value :: height
      type(hipStream_t), value :: stream
      integer(c_int) :: Memset2DAsync_spt
      Memset2DAsync_spt = hipMemset2DAsync_spt_raw(dst, pitch, value, width, height, stream%ptr)
    end function hipMemset2DAsync_spt_typed

    function hipMemset3DAsync_spt_typed(pitchedDevPtr, value, extent, stream) result( &
        Memset3DAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: pitchedDevPtr
      integer(c_int), value :: value
      type(c_ptr), value :: extent
      type(hipStream_t), value :: stream
      integer(c_int) :: Memset3DAsync_spt
      Memset3DAsync_spt = hipMemset3DAsync_spt_raw(pitchedDevPtr, value, extent, stream%ptr)
    end function hipMemset3DAsync_spt_typed

    function hipMemcpyAsync_spt_typed(dst, src, sizeBytes, kind, stream) result(MemcpyAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_long), value :: sizeBytes
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyAsync_spt
      MemcpyAsync_spt = hipMemcpyAsync_spt_raw(dst, src, sizeBytes, kind, stream%ptr)
    end function hipMemcpyAsync_spt_typed

    function hipMemcpy3DAsync_spt_typed(p, stream) result(Memcpy3DAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemcpy3DParms) :: p
      type(hipStream_t), value :: stream
      integer(c_int) :: Memcpy3DAsync_spt
      Memcpy3DAsync_spt = hipMemcpy3DAsync_spt_raw(p, stream%ptr)
    end function hipMemcpy3DAsync_spt_typed

    function hipMemcpy2DAsync_spt_typed(dst, dpitch, src, spitch, width, height, kind, &
        stream) result(Memcpy2DAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_long), value :: dpitch
      type(c_ptr), value :: src
      integer(c_long), value :: spitch
      integer(c_long), value :: width
      integer(c_long), value :: height
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: Memcpy2DAsync_spt
      Memcpy2DAsync_spt = hipMemcpy2DAsync_spt_raw(dst, dpitch, src, spitch, width, height, kind, &
        stream%ptr)
    end function hipMemcpy2DAsync_spt_typed

    function hipMemcpyFromSymbolAsync_spt_typed(dst, symbol, sizeBytes, offset, kind, &
        stream) result(MemcpyFromSymbolAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: symbol
      integer(c_long), value :: sizeBytes
      integer(c_long), value :: offset
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyFromSymbolAsync_spt
      MemcpyFromSymbolAsync_spt = hipMemcpyFromSymbolAsync_spt_raw(dst, symbol, sizeBytes, offset, &
        kind, stream%ptr)
    end function hipMemcpyFromSymbolAsync_spt_typed

    function hipMemcpyToSymbolAsync_spt_typed(symbol, src, sizeBytes, offset, kind, &
        stream) result(MemcpyToSymbolAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: symbol
      type(c_ptr), value :: src
      integer(c_long), value :: sizeBytes
      integer(c_long), value :: offset
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: MemcpyToSymbolAsync_spt
      MemcpyToSymbolAsync_spt = hipMemcpyToSymbolAsync_spt_raw(symbol, src, sizeBytes, offset, &
        kind, stream%ptr)
    end function hipMemcpyToSymbolAsync_spt_typed

    function hipMemcpy2DFromArrayAsync_spt_typed(dst, dpitch, src, wOffsetSrc, hOffsetSrc, width, &
        height, kind, stream) result(Memcpy2DFromArrayAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_long), value :: dpitch
      type(c_ptr), value :: src
      integer(c_long), value :: wOffsetSrc
      integer(c_long), value :: hOffsetSrc
      integer(c_long), value :: width
      integer(c_long), value :: height
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: Memcpy2DFromArrayAsync_spt
      Memcpy2DFromArrayAsync_spt = hipMemcpy2DFromArrayAsync_spt_raw(dst, dpitch, src, wOffsetSrc, &
        hOffsetSrc, width, height, kind, stream%ptr)
    end function hipMemcpy2DFromArrayAsync_spt_typed

    function hipMemcpy2DToArrayAsync_spt_typed(dst, wOffset, hOffset, src, spitch, width, height, &
        kind, stream) result(Memcpy2DToArrayAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_long), value :: wOffset
      integer(c_long), value :: hOffset
      type(c_ptr), value :: src
      integer(c_long), value :: spitch
      integer(c_long), value :: width
      integer(c_long), value :: height
      integer(c_int), value :: kind
      type(hipStream_t), value :: stream
      integer(c_int) :: Memcpy2DToArrayAsync_spt
      Memcpy2DToArrayAsync_spt = hipMemcpy2DToArrayAsync_spt_raw(dst, wOffset, hOffset, src, &
        spitch, width, height, kind, stream%ptr)
    end function hipMemcpy2DToArrayAsync_spt_typed

    function hipStreamQuery_spt_typed(stream) result(StreamQuery_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int) :: StreamQuery_spt
      StreamQuery_spt = hipStreamQuery_spt_raw(stream%ptr)
    end function hipStreamQuery_spt_typed

    function hipStreamSynchronize_spt_typed(stream) result(StreamSynchronize_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int) :: StreamSynchronize_spt
      StreamSynchronize_spt = hipStreamSynchronize_spt_raw(stream%ptr)
    end function hipStreamSynchronize_spt_typed

    function hipStreamGetPriority_spt_native(stream, priority) result(StreamGetPriority_spt)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), target :: priority(..)
      integer(c_int) :: StreamGetPriority_spt
      if (.not. is_contiguous(priority)) error stop "priority: array must be contiguous"
      StreamGetPriority_spt = hipStreamGetPriority_spt_raw(stream, c_loc(priority))
    end function hipStreamGetPriority_spt_native

    function hipStreamGetPriority_spt_typed(stream, priority) result(StreamGetPriority_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: priority
      integer(c_int) :: StreamGetPriority_spt
      StreamGetPriority_spt = hipStreamGetPriority_spt_raw(stream%ptr, priority)
    end function hipStreamGetPriority_spt_typed

    function hipStreamWaitEvent_spt_typed(stream, event, flags) result(StreamWaitEvent_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(hipEvent_t), value :: event
      integer(c_int), value :: flags
      integer(c_int) :: StreamWaitEvent_spt
      StreamWaitEvent_spt = hipStreamWaitEvent_spt_raw(stream%ptr, event%ptr, flags)
    end function hipStreamWaitEvent_spt_typed

    function hipStreamGetFlags_spt_native(stream, flags) result(StreamGetFlags_spt)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), target :: flags(..)
      integer(c_int) :: StreamGetFlags_spt
      if (.not. is_contiguous(flags)) error stop "flags: array must be contiguous"
      StreamGetFlags_spt = hipStreamGetFlags_spt_raw(stream, c_loc(flags))
    end function hipStreamGetFlags_spt_native

    function hipStreamGetFlags_spt_typed(stream, flags) result(StreamGetFlags_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: flags
      integer(c_int) :: StreamGetFlags_spt
      StreamGetFlags_spt = hipStreamGetFlags_spt_raw(stream%ptr, flags)
    end function hipStreamGetFlags_spt_typed

    function hipStreamAddCallback_spt_typed(stream, callback, userData, flags) result( &
        StreamAddCallback_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_funptr), value :: callback
      type(c_ptr), value :: userData
      integer(c_int), value :: flags
      integer(c_int) :: StreamAddCallback_spt
      StreamAddCallback_spt = hipStreamAddCallback_spt_raw(stream%ptr, callback, userData, flags)
    end function hipStreamAddCallback_spt_typed

    function hipEventRecord_spt_typed(event, stream) result(EventRecord_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      type(hipStream_t), value :: stream
      integer(c_int) :: EventRecord_spt
      EventRecord_spt = hipEventRecord_spt_raw(event%ptr, stream%ptr)
    end function hipEventRecord_spt_typed

    function hipLaunchCooperativeKernel_spt_typed(f, gridDim, blockDim, kernelParams, &
        sharedMemBytes, hStream) result(LaunchCooperativeKernel_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: f
      type(c_ptr), value :: gridDim
      type(c_ptr), value :: blockDim
      type(c_ptr) :: kernelParams
      integer(c_int), value :: sharedMemBytes
      type(hipStream_t), value :: hStream
      integer(c_int) :: LaunchCooperativeKernel_spt
      LaunchCooperativeKernel_spt = hipLaunchCooperativeKernel_spt_raw(f, gridDim, blockDim, &
        kernelParams, sharedMemBytes, hStream%ptr)
    end function hipLaunchCooperativeKernel_spt_typed

    function hipLaunchKernel_spt_typed(function_address, numBlocks, dimBlocks, args, &
        sharedMemBytes, stream) result(LaunchKernel_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: function_address
      type(c_ptr), value :: numBlocks
      type(c_ptr), value :: dimBlocks
      type(c_ptr) :: args
      integer(c_long), value :: sharedMemBytes
      type(hipStream_t), value :: stream
      integer(c_int) :: LaunchKernel_spt
      LaunchKernel_spt = hipLaunchKernel_spt_raw(function_address, numBlocks, dimBlocks, args, &
        sharedMemBytes, stream%ptr)
    end function hipLaunchKernel_spt_typed

    function hipGraphLaunch_spt_typed(graphExec, stream) result(GraphLaunch_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      type(hipStream_t), value :: stream
      integer(c_int) :: GraphLaunch_spt
      GraphLaunch_spt = hipGraphLaunch_spt_raw(graphExec%ptr, stream%ptr)
    end function hipGraphLaunch_spt_typed

    function hipStreamBeginCapture_spt_typed(stream, mode) result(StreamBeginCapture_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int), value :: mode
      integer(c_int) :: StreamBeginCapture_spt
      StreamBeginCapture_spt = hipStreamBeginCapture_spt_raw(stream%ptr, mode)
    end function hipStreamBeginCapture_spt_typed

    function hipStreamEndCapture_spt_typed(stream, pGraph) result(StreamEndCapture_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(hipGraph_t) :: pGraph
      integer(c_int) :: StreamEndCapture_spt
      StreamEndCapture_spt = hipStreamEndCapture_spt_raw(stream%ptr, pGraph%ptr)
    end function hipStreamEndCapture_spt_typed

    function hipStreamIsCapturing_spt_native(stream, pCaptureStatus) result(StreamIsCapturing_spt)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), target :: pCaptureStatus(..)
      integer(c_int) :: StreamIsCapturing_spt
      if (.not. is_contiguous(pCaptureStatus)) error stop "pCaptureStatus: array must be contiguous"
      StreamIsCapturing_spt = hipStreamIsCapturing_spt_raw(stream, c_loc(pCaptureStatus))
    end function hipStreamIsCapturing_spt_native

    function hipStreamIsCapturing_spt_typed(stream, pCaptureStatus) result(StreamIsCapturing_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: pCaptureStatus
      integer(c_int) :: StreamIsCapturing_spt
      StreamIsCapturing_spt = hipStreamIsCapturing_spt_raw(stream%ptr, pCaptureStatus)
    end function hipStreamIsCapturing_spt_typed

    function hipStreamGetCaptureInfo_spt_native(stream, pCaptureStatus, pId) result( &
        StreamGetCaptureInfo_spt)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), target :: pCaptureStatus(..)
      integer(c_int64_t), target :: pId(..)
      integer(c_int) :: StreamGetCaptureInfo_spt
      if (.not. is_contiguous(pCaptureStatus)) error stop "pCaptureStatus: array must be contiguous"
      if (.not. is_contiguous(pId)) error stop "pId: array must be contiguous"
      StreamGetCaptureInfo_spt = hipStreamGetCaptureInfo_spt_raw(stream, c_loc(pCaptureStatus), &
        c_loc(pId))
    end function hipStreamGetCaptureInfo_spt_native

    function hipStreamGetCaptureInfo_spt_typed(stream, pCaptureStatus, pId) result( &
        StreamGetCaptureInfo_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: pCaptureStatus
      type(c_ptr), value :: pId
      integer(c_int) :: StreamGetCaptureInfo_spt
      StreamGetCaptureInfo_spt = hipStreamGetCaptureInfo_spt_raw(stream%ptr, pCaptureStatus, pId)
    end function hipStreamGetCaptureInfo_spt_typed

    function hipStreamGetCaptureInfo_v2_spt_native(stream, captureStatus_out, id_out, graph_out, &
        dependencies_out, numDependencies_out) result(StreamGetCaptureInfo_v2_spt)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: stream
      integer(c_int), target :: captureStatus_out(..)
      integer(c_int64_t), target :: id_out(..)
      type(c_ptr) :: graph_out
      type(c_ptr) :: dependencies_out
      type(c_ptr), value :: numDependencies_out
      integer(c_int) :: StreamGetCaptureInfo_v2_spt
      if (.not. is_contiguous(captureStatus_out)) error stop "captureStatus_out: array must be contiguous"
      if (.not. is_contiguous(id_out)) error stop "id_out: array must be contiguous"
      StreamGetCaptureInfo_v2_spt = hipStreamGetCaptureInfo_v2_spt_raw(stream, c_loc( &
        captureStatus_out), c_loc(id_out), graph_out, dependencies_out, numDependencies_out)
    end function hipStreamGetCaptureInfo_v2_spt_native

    function hipStreamGetCaptureInfo_v2_spt_typed(stream, captureStatus_out, id_out, graph_out, &
        dependencies_out, numDependencies_out) result(StreamGetCaptureInfo_v2_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: captureStatus_out
      type(c_ptr), value :: id_out
      type(hipGraph_t) :: graph_out
      type(hipGraphNode_t) :: dependencies_out
      type(c_ptr), value :: numDependencies_out
      integer(c_int) :: StreamGetCaptureInfo_v2_spt
      StreamGetCaptureInfo_v2_spt = hipStreamGetCaptureInfo_v2_spt_raw(stream%ptr, &
        captureStatus_out, id_out, graph_out%ptr, dependencies_out%ptr, numDependencies_out)
    end function hipStreamGetCaptureInfo_v2_spt_typed

    function hipLaunchHostFunc_spt_typed(stream, fn, userData) result(LaunchHostFunc_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_funptr), value :: fn
      type(c_ptr), value :: userData
      integer(c_int) :: LaunchHostFunc_spt
      LaunchHostFunc_spt = hipLaunchHostFunc_spt_raw(stream%ptr, fn, userData)
    end function hipLaunchHostFunc_spt_typed

    function hipGetDriverEntryPoint_spt_native(symbol, funcPtr, flags, status) result( &
        GetDriverEntryPoint_spt)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t), value :: flags
      integer(c_int), target :: status(..)
      integer(c_int) :: GetDriverEntryPoint_spt
      if (.not. is_contiguous(status)) error stop "status: array must be contiguous"
      GetDriverEntryPoint_spt = hipGetDriverEntryPoint_spt_raw(symbol, funcPtr, flags, c_loc( &
        status))
    end function hipGetDriverEntryPoint_spt_native

    function hipGetDriverEntryPoint_spt_cstr(symbol, funcPtr, flags, status) result( &
        GetDriverEntryPoint_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      character(len=*), intent(in) :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t), value :: flags
      type(c_ptr), value :: status
      integer(c_int) :: GetDriverEntryPoint_spt
      character(len=len_trim(symbol)+1, kind=c_char), target :: symbol__c
      symbol__c = trim(symbol)//c_null_char
      GetDriverEntryPoint_spt = hipGetDriverEntryPoint_spt_raw(c_loc(symbol__c), funcPtr, flags, &
        status)
    end function hipGetDriverEntryPoint_spt_cstr

end module hipfort
