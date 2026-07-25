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
  use hipfort_hipmalloc
  use hipfort_hipmemcpy
  use hipfort_auxiliary
  implicit none

  !>   @defgroup API HIP API
  !>
  !>
  !>   Defines the HIP API.  See the individual sections for more information.
  !>
  !>
  !>   @defgroup Driver Initialization and Version
  !>
  !>   This section describes the initializtion and version functions of HIP runtime API.
  !>
  !>
  !>
  !>  @brief Explicitly initializes the HIP runtime.
  !>
  !>  @param [in] flags  Initialization flag, should be zero.
  !>
  !>  Most HIP APIs implicitly initialize the HIP runtime.
  !>  This API provides control over the timing of the initialization.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipInit
#ifdef USE_CUDA_NAMES
    function hipInit_(flags) bind(c, name="cudaInit")
#else
    function hipInit_(flags) bind(c, name="hipInit")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipInit_
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Returns the approximate HIP driver version.
  !>
  !>  @param [out] driverVersion driver version
  !>
  !>  HIP driver version shows up in the format:
  !>  HIP_VERSION_MAJOR * 10000000 + HIP_VERSION_MINOR * 100000 + HIP_VERSION_PATCH.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning The HIP driver version does not correspond to an exact CUDA driver revision.
  !>  On AMD platform, the API returns the HIP driver version, while on NVIDIA platform, it calls
  !>  the corresponding CUDA runtime API and returns the CUDA driver version.
  !>  There is no mapping/correlation between HIP driver version and CUDA driver version.
  !>
  !>  @see hipRuntimeGetVersion
  interface hipDriverGetVersion
#ifdef USE_CUDA_NAMES
    function hipDriverGetVersion_(driverVersion) bind(c, name="cudaDriverGetVersion")
#else
    function hipDriverGetVersion_(driverVersion) bind(c, name="hipDriverGetVersion")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDriverGetVersion_
      type(c_ptr),value :: driverVersion
    end function
  end interface

  !>  @brief Returns the approximate HIP Runtime version.
  !>
  !>  @param [out] runtimeVersion HIP runtime version
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning The version definition of HIP runtime is different from CUDA.
  !>  On AMD platform, the function returns HIP runtime version,
  !>  while on NVIDIA platform, it returns CUDA runtime version.
  !>  And there is no mapping/correlation between HIP version and CUDA version.
  !>
  !>  @see hipDriverGetVersion
  interface hipRuntimeGetVersion
#ifdef USE_CUDA_NAMES
    function hipRuntimeGetVersion_(runtimeVersion) bind(c, name="cudaRuntimeGetVersion")
#else
    function hipRuntimeGetVersion_(runtimeVersion) bind(c, name="hipRuntimeGetVersion")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipRuntimeGetVersion_
      type(c_ptr),value :: runtimeVersion
    end function
  end interface

  !>  @brief Returns a handle to a compute device
  !>  @param [out] device Handle of device
  !>  @param [in] ordinal Device ordinal
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`
  interface hipDeviceGet
#ifdef USE_CUDA_NAMES
    function hipDeviceGet_(device,ordinal) bind(c, name="cudaDeviceGet")
#else
    function hipDeviceGet_(device,ordinal) bind(c, name="hipDeviceGet")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGet_
      integer(c_int) :: device
      integer(c_int),value :: ordinal
    end function
  end interface

  !>  @brief Returns the compute capability of the device
  !>  @param [out] major Major compute capability version number
  !>  @param [out] minor Minor compute capability version number
  !>  @param [in] device Device ordinal
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`
  interface hipDeviceComputeCapability
#ifdef USE_CUDA_NAMES
    function hipDeviceComputeCapability_(major,minor,device) &
        bind(c, name="cudaDeviceComputeCapability")
#else
    function hipDeviceComputeCapability_(major,minor,device) &
        bind(c, name="hipDeviceComputeCapability")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceComputeCapability_
      type(c_ptr),value :: major
      type(c_ptr),value :: minor
      integer(c_int),value :: device
    end function
  end interface

  !>  @brief Returns an identifer string for the device.
  !>  @param [out] name String of the device name
  !>  @param [in] len Maximum length of string to store in device name
  !>  @param [in] device Device ordinal
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`
  interface hipDeviceGetName
#ifdef USE_CUDA_NAMES
    function hipDeviceGetName_(name,len,device) bind(c, name="cudaDeviceGetName")
#else
    function hipDeviceGetName_(name,len,device) bind(c, name="hipDeviceGetName")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetName_
      type(c_ptr),value :: name
      integer(c_int),value :: len
      integer(c_int),value :: device
    end function
  end interface

  !>  @brief Returns a value for attribute of link between two devices
  !>  @param [out] value Pointer of the value for the attrubute
  !>  @param [in] attr enum of hipDeviceP2PAttr to query
  !>  @param [in] srcDevice The source device of the link
  !>  @param [in] dstDevice The destination device of the link
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`
  interface hipDeviceGetP2PAttribute
#ifdef USE_CUDA_NAMES
    function hipDeviceGetP2PAttribute_(myValue,attr,srcDevice,dstDevice) &
        bind(c, name="cudaDeviceGetP2PAttribute")
#else
    function hipDeviceGetP2PAttribute_(myValue,attr,srcDevice,dstDevice) &
        bind(c, name="hipDeviceGetP2PAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetP2PAttribute_
      type(c_ptr),value :: myValue
      integer(kind(hipDevP2PAttrPerformanceRank)),value :: attr
      integer(c_int),value :: srcDevice
      integer(c_int),value :: dstDevice
    end function
  end interface

  !>  @brief Returns a PCI Bus Id string for the device, overloaded to take int device ID.
  !>  @param [out] pciBusId The string of PCI Bus Id format for the device
  !>  @param [in] len Maximum length of string
  !>  @param [in] device The device ordinal
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`
  interface hipDeviceGetPCIBusId
#ifdef USE_CUDA_NAMES
    function hipDeviceGetPCIBusId_(pciBusId,len,device) bind(c, name="cudaDeviceGetPCIBusId")
#else
    function hipDeviceGetPCIBusId_(pciBusId,len,device) bind(c, name="hipDeviceGetPCIBusId")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetPCIBusId_
      type(c_ptr),value :: pciBusId
      integer(c_int),value :: len
      integer(c_int),value :: device
    end function
  end interface

  !>  @brief Returns a handle to a compute device.
  !>  @param [out] device The handle of the device
  !>  @param [in] pciBusId The string of PCI Bus Id for the device
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  interface hipDeviceGetByPCIBusId
#ifdef USE_CUDA_NAMES
    function hipDeviceGetByPCIBusId_(device,pciBusId) bind(c, name="cudaDeviceGetByPCIBusId")
#else
    function hipDeviceGetByPCIBusId_(device,pciBusId) bind(c, name="hipDeviceGetByPCIBusId")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetByPCIBusId_
      integer(c_int) :: device
      type(c_ptr),value :: pciBusId
    end function
  end interface

  !>  @brief Returns the total amount of memory on the device.
  !>  @param [out] bytes The size of memory in bytes, on the device
  !>  @param [in] device The ordinal of the device
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`
  interface hipDeviceTotalMem
#ifdef USE_CUDA_NAMES
    function hipDeviceTotalMem_(bytes,device) bind(c, name="cudaDeviceTotalMem")
#else
    function hipDeviceTotalMem_(bytes,device) bind(c, name="hipDeviceTotalMem")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceTotalMem_
      integer(c_size_t) :: bytes
      integer(c_int),value :: device
    end function
  end interface

  !>   @defgroup Device Device Management
  !>
  !>   This section describes the device management functions of HIP runtime API.
  !>
  !>
  !>  @brief Waits on all active streams on current device
  !>
  !>  When this command is invoked, the host thread gets blocked until all the commands associated
  !>  with streams associated with the device. HIP does not support multiple blocking modes (yet!).
  !>
  !>  @returns `hipSuccess`
  !>
  !>  @see hipSetDevice, hipDeviceReset
  interface hipDeviceSynchronize
#ifdef USE_CUDA_NAMES
    function hipDeviceSynchronize_() bind(c, name="cudaDeviceSynchronize")
#else
    function hipDeviceSynchronize_() bind(c, name="hipDeviceSynchronize")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceSynchronize_
    end function
  end interface

  !>  @brief The state of current device is discarded and updated to a fresh state.
  !>
  !>  Calling this function deletes all streams created, memory allocated, kernels running, events
  !>  created. Make sure that no other thread is using the device or streams, memory, kernels,
  !>  events
  !>  associated with the current device.
  !>
  !>  @returns `hipSuccess`
  !>
  !>  @see hipDeviceSynchronize
  interface hipDeviceReset
#ifdef USE_CUDA_NAMES
    function hipDeviceReset_() bind(c, name="cudaDeviceReset")
#else
    function hipDeviceReset_() bind(c, name="hipDeviceReset")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceReset_
    end function
  end interface

  !>  @brief Set default device to be used for subsequent hip API calls from this thread.
  !>
  !>  @param[in] deviceId - Valid device in range 0...`hipGetDeviceCount()`.
  !>
  !>  Sets @p device as the default device for the calling host thread.  Valid device id's are 0...
  !>  (`hipGetDeviceCount()`-1).
  !>
  !>  Many HIP APIs implicitly use the "default device" :
  !>
  !>  - Any device memory subsequently allocated from this host thread (using hipMalloc) will be
  !>  allocated on device.
  !>  - Any streams or events created from this host thread will be associated with device.
  !>  - Any kernels launched from this host thread (using hipLaunchKernel) will be executed on
  !>  device
  !>  (unless a specific stream is specified, in which case the device associated with that stream
  !>  will
  !>  be used).
  !>
  !>  This function may be called from any host thread. Multiple host threads may use the same
  !>  device.
  !>  This function does no synchronization with the previous or new device, and has very little
  !>  runtime overhead. Applications can use hipSetDevice to quickly switch the default device
  !>  before
  !>  making a HIP runtime call which uses the default device.
  !>
  !>  The default device is stored in thread-local-storage for each thread.
  !>  Thread-pool implementations may inherit the default device of the previous thread.  A good
  !>  practice is to always call hipSetDevice at the start of HIP coding sequency to establish a
  !>  known
  !>  standard device.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorNoDevice`
  !>
  !>  @see `hipGetDevice`, `hipGetDeviceCount`
  interface hipSetDevice
#ifdef USE_CUDA_NAMES
    function hipSetDevice_(deviceId) bind(c, name="cudaSetDevice")
#else
    function hipSetDevice_(deviceId) bind(c, name="hipSetDevice")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipSetDevice_
      integer(c_int),value :: deviceId
    end function
  end interface

  !>  @brief Return the default device id for the calling host thread.
  !>
  !>  @param [out] deviceId *device is written with the default device
  !>
  !>  HIP maintains an default device for each thread using thread-local-storage.
  !>  This device is used implicitly for HIP runtime APIs called by this thread.
  !>  hipGetDevice returns in * @p device the default device for the calling host thread.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>  @see hipSetDevice, hipGetDevicesizeBytes
  interface hipGetDevice
#ifdef USE_CUDA_NAMES
    function hipGetDevice_(deviceId) bind(c, name="cudaGetDevice")
#else
    function hipGetDevice_(deviceId) bind(c, name="hipGetDevice")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetDevice_
      integer(c_int) :: deviceId
    end function
  end interface

  !>  @brief Return number of compute-capable devices.
  !>
  !>  @param [out] count Returns number of compute-capable devices.
  !>
  !>  @returns `hipSuccess`, `hipErrorNoDevice`
  !>
  !>
  !>  Returns in @p *count the number of devices that have ability to run compute commands. If there
  !>  are no such devices, then `hipGetDeviceCount` will return `hipErrorNoDevice`. If 1 or more
  !>  devices can be found, then hipGetDeviceCount returns `hipSuccess`.
  interface hipGetDeviceCount
#ifdef USE_CUDA_NAMES
    function hipGetDeviceCount_(count) bind(c, name="cudaGetDeviceCount")
#else
    function hipGetDeviceCount_(count) bind(c, name="hipGetDeviceCount")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetDeviceCount_
      integer(c_int) :: count
    end function
  end interface

  !>  @brief Query for a specific device attribute.
  !>
  !>  @param [out] pi pointer to value to return
  !>  @param [in] attr attribute to query
  !>  @param [in] deviceId which device to query for information
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  interface hipDeviceGetAttribute
#ifdef USE_CUDA_NAMES
    function hipDeviceGetAttribute_(pi,attr,deviceId) bind(c, name="cudaDeviceGetAttribute")
#else
    function hipDeviceGetAttribute_(pi,attr,deviceId) bind(c, name="hipDeviceGetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetAttribute_
      type(c_ptr),value :: pi
      integer(kind(hipDeviceAttributeCudaCompatibleBegin)),value :: attr
      integer(c_int),value :: deviceId
    end function
  end interface

  !>  @brief Set L1/Shared cache partition.
  !>
  !>  @param [in] cacheConfig Cache configuration
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorNotSupported`
  !>
  !>  Note: AMD devices do not support reconfigurable cache. This API is not implemented
  !>  on AMD platform. If the function is called, it will return hipErrorNotSupported.
  interface hipDeviceSetCacheConfig
#ifdef USE_CUDA_NAMES
    function hipDeviceSetCacheConfig_(cacheConfig) bind(c, name="cudaDeviceSetCacheConfig")
#else
    function hipDeviceSetCacheConfig_(cacheConfig) bind(c, name="hipDeviceSetCacheConfig")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceSetCacheConfig_
      integer(kind(hipFuncCachePreferNone)),value :: cacheConfig
    end function
  end interface

  !>  @brief Get Cache configuration for a specific Device
  !>
  !>  @param [out] cacheConfig Pointer of cache configuration
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`
  !>  Note: AMD devices do not support reconfigurable cache. This hint is ignored
  !>  on these architectures.
  interface hipDeviceGetCacheConfig
#ifdef USE_CUDA_NAMES
    function hipDeviceGetCacheConfig_(cacheConfig) bind(c, name="cudaDeviceGetCacheConfig")
#else
    function hipDeviceGetCacheConfig_(cacheConfig) bind(c, name="hipDeviceGetCacheConfig")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetCacheConfig_
      type(c_ptr),value :: cacheConfig
    end function
  end interface

  !>  @brief Gets resource limits of current device
  !>
  !>  The function queries the size of limit value, as required by the input enum value hipLimit_t,
  !>  which can be either `hipLimitStackSize`, or `hipLimitMallocHeapSize`. Any other input as
  !>  default, the function will return `hipErrorUnsupportedLimit`.
  !>
  !>  @param [out] pValue Returns the size of the limit in bytes
  !>  @param [in]  limit The limit to query
  !>
  !>  @returns `hipSuccess`, `hipErrorUnsupportedLimit`, `hipErrorInvalidValue`
  interface hipDeviceGetLimit
#ifdef USE_CUDA_NAMES
    function hipDeviceGetLimit_(pValue,limit) bind(c, name="cudaDeviceGetLimit")
#else
    function hipDeviceGetLimit_(pValue,limit) bind(c, name="hipDeviceGetLimit")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetLimit_
      integer(c_size_t) :: pValue
      integer(kind(hipLimitStackSize)),value :: limit
    end function
  end interface

  !>  @brief Returns bank width of shared memory for current device
  !>
  !>  @param [out] pConfig The pointer of the bank width for shared memory
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
  !>
  !>  Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !>  ignored on those architectures.
  interface hipDeviceGetSharedMemConfig
#ifdef USE_CUDA_NAMES
    function hipDeviceGetSharedMemConfig_(pConfig) bind(c, name="cudaDeviceGetSharedMemConfig")
#else
    function hipDeviceGetSharedMemConfig_(pConfig) bind(c, name="hipDeviceGetSharedMemConfig")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetSharedMemConfig_
      type(c_ptr),value :: pConfig
    end function
  end interface

  !>  @brief Gets the flags set for current device
  !>
  !>  @param [out] flags Pointer of the flags
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  interface hipGetDeviceFlags
#ifdef USE_CUDA_NAMES
    function hipGetDeviceFlags_(flags) bind(c, name="cudaGetDeviceFlags")
#else
    function hipGetDeviceFlags_(flags) bind(c, name="hipGetDeviceFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetDeviceFlags_
      type(c_ptr),value :: flags
    end function
  end interface

  !>  @brief The bank width of shared memory on current device is set
  !>
  !>  @param [in] config Configuration for the bank width of shared memory
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
  !>
  !>  Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !>  ignored on those architectures.
  interface hipDeviceSetSharedMemConfig
#ifdef USE_CUDA_NAMES
    function hipDeviceSetSharedMemConfig_(config) bind(c, name="cudaDeviceSetSharedMemConfig")
#else
    function hipDeviceSetSharedMemConfig_(config) bind(c, name="hipDeviceSetSharedMemConfig")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceSetSharedMemConfig_
      integer(kind(hipSharedMemBankSizeDefault)),value :: config
    end function
  end interface

  !>  @brief The current device behavior is changed according to the flags passed.
  !>
  !>  @param [in] flags Flag to set on the current device
  !>
  !>  The schedule flags impact how HIP waits for the completion of a command running on a device.
  !>
  !>  `hipDeviceScheduleSpin`         : HIP runtime will actively spin in the thread which submitted
  !>  the work until the command completes.  This offers the lowest latency, but will consume a CPU
  !>  core and may increase power.
  !>
  !>  `hipDeviceScheduleYield`        : The HIP runtime will yield the CPU to system so that other
  !>  tasks can use it. This may increase latency to detect the completion but will consume less
  !>  power and is friendlier to other tasks in the system.
  !>
  !>  `hipDeviceScheduleBlockingSync` : On ROCm platform, this is a synonym for
  !>  hipDeviceScheduleYield.
  !>
  !>  `hipDeviceScheduleAuto`         : This is the default value if the input 'flags' is zero.
  !>  Uses a heuristic to select between Spin and Yield modes. If the number of HIP contexts is
  !>  greater than the number of logical processors in the system, uses Spin scheduling, otherwise
  !>  uses Yield scheduling.
  !>
  !>  `hipDeviceMapHost` : Allows mapping host memory. On ROCm, this is always allowed and
  !>  the flag is ignored.
  !>
  !>  `hipDeviceLmemResizeToMax`      : This flag is silently ignored on ROCm.
  !>
  !>  @returns `hipSuccess`, `hipErrorNoDevice`, `hipErrorInvalidDevice`,
  !>  `hipErrorSetOnActiveProcess`
  interface hipSetDeviceFlags
#ifdef USE_CUDA_NAMES
    function hipSetDeviceFlags_(flags) bind(c, name="cudaSetDeviceFlags")
#else
    function hipSetDeviceFlags_(flags) bind(c, name="hipSetDeviceFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipSetDeviceFlags_
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Returns the link type and hop count between two devices
  !>
  !>  @param [in] device1 Ordinal for device1
  !>  @param [in] device2 Ordinal for device2
  !>  @param [out] linktype Returns the link type (See hsa_amd_link_info_type_t) between the two
  !>  devices
  !>  @param [out] hopcount Returns the hop count between the two devices
  !>
  !>  Queries and returns the HSA link type and the hop count between the two specified devices.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipExtGetLinkTypeAndHopCount
#ifdef USE_CUDA_NAMES
    function hipExtGetLinkTypeAndHopCount_(device1,device2,linktype,hopcount) &
        bind(c, name="cudaExtGetLinkTypeAndHopCount")
#else
    function hipExtGetLinkTypeAndHopCount_(device1,device2,linktype,hopcount) &
        bind(c, name="hipExtGetLinkTypeAndHopCount")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipExtGetLinkTypeAndHopCount_
      integer(c_int),value :: device1
      integer(c_int),value :: device2
      type(c_ptr),value :: linktype
      type(c_ptr),value :: hopcount
    end function
  end interface

  !>  @brief Gets an interprocess memory handle for an existing device memory
  !>           allocation
  !>
  !>  Takes a pointer to the base of an existing device memory allocation created
  !>  with hipMalloc and exports it for use in another process. This is a
  !>  lightweight operation and may be called multiple times on an allocation
  !>  without adverse effects.
  !>
  !>  If a region of memory is freed with hipFree and a subsequent call
  !>  to hipMalloc returns memory with the same device address,
  !>  hipIpcGetMemHandle will return a unique handle for the
  !>  new memory.
  !>
  !>  @param handle - Pointer to user allocated hipIpcMemHandle to return
  !>                     the handle in.
  !>  @param devPtr - Base pointer to previously allocated device memory
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidHandle`, `hipErrorOutOfMemory`, `hipErrorMapFailed`
  !>
  !>  @note This IPC memory related feature API on Windows may behave differently from Linux.
  interface hipIpcGetMemHandle
#ifdef USE_CUDA_NAMES
    function hipIpcGetMemHandle_(handle,devPtr) bind(c, name="cudaIpcGetMemHandle")
#else
    function hipIpcGetMemHandle_(handle,devPtr) bind(c, name="hipIpcGetMemHandle")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipIpcGetMemHandle_
      type(hipIpcMemHandle_t) :: handle
      type(c_ptr),value :: devPtr
    end function
  end interface

  !>  @brief Opens an interprocess memory handle exported from another process
  !>           and returns a device pointer usable in the local process.
  !>
  !>  Maps memory exported from another process with hipIpcGetMemHandle into
  !>  the current device address space. For contexts on different devices
  !>  hipIpcOpenMemHandle can attempt to enable peer access between the
  !>  devices as if the user called hipDeviceEnablePeerAccess. This behavior is
  !>  controlled by the hipIpcMemLazyEnablePeerAccess flag.
  !>  hipDeviceCanAccessPeer can determine if a mapping is possible.
  !>
  !>  Contexts that may open hipIpcMemHandles are restricted in the following way.
  !>  hipIpcMemHandles from each device in a given process may only be opened
  !>  by one context per device per other process.
  !>
  !>  Memory returned from hipIpcOpenMemHandle must be freed with
  !>  hipIpcCloseMemHandle.
  !>
  !>  Calling hipFree on an exported memory region before calling
  !>  hipIpcCloseMemHandle in the importing context will result in undefined
  !>  behavior.
  !>
  !>  @param devPtr - Returned device pointer
  !>  @param handle - hipIpcMemHandle to open
  !>  @param flags - Flags for this operation. Must be specified as hipIpcMemLazyEnablePeerAccess
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`,
  !>   `hipErrorInvalidDevicePointer`
  !>
  !>  @note During multiple processes, using the same memory handle opened by the current context,
  !>  there is no guarantee that the same device poiter will be returned in @p *devPtr.
  !>  This is diffrent from CUDA.
  !>  @note This IPC memory related feature API on Windows may behave differently from Linux.
  interface hipIpcOpenMemHandle
#ifdef USE_CUDA_NAMES
    function hipIpcOpenMemHandle_(devPtr,handle,flags) bind(c, name="cudaIpcOpenMemHandle")
#else
    function hipIpcOpenMemHandle_(devPtr,handle,flags) bind(c, name="hipIpcOpenMemHandle")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipIpcOpenMemHandle_
      type(c_ptr) :: devPtr
      type(c_ptr),value :: handle
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Close memory mapped with hipIpcOpenMemHandle
  !>
  !>  Unmaps memory returnd by hipIpcOpenMemHandle. The original allocation
  !>  in the exporting process as well as imported mappings in other processes
  !>  will be unaffected.
  !>
  !>  Any resources used to enable peer access will be freed if this is the
  !>  last mapping using them.
  !>
  !>  @param devPtr - Device pointer returned by hipIpcOpenMemHandle
  !>
  !>  @returns `hipSuccess`, `hipErrorMapFailed`, `hipErrorInvalidHandle`
  !>
  !>  @note This IPC memory related feature API on Windows may behave differently from Linux.
  interface hipIpcCloseMemHandle
#ifdef USE_CUDA_NAMES
    function hipIpcCloseMemHandle_(devPtr) bind(c, name="cudaIpcCloseMemHandle")
#else
    function hipIpcCloseMemHandle_(devPtr) bind(c, name="hipIpcCloseMemHandle")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipIpcCloseMemHandle_
      type(c_ptr),value :: devPtr
    end function
  end interface

  !>  @brief Gets an opaque interprocess handle for an event.
  !>
  !>  This opaque handle may be copied into other processes and opened with hipIpcOpenEventHandle.
  !>  Then hipEventRecord, hipEventSynchronize, hipStreamWaitEvent and hipEventQuery may be used in
  !>  either process. Operations on the imported event after the exported event has been freed with
  !>  hipEventDestroy will result in undefined behavior.
  !>
  !>  @param[out] handle - Pointer to hipIpcEventHandle to return the opaque event handle
  !>  @param[in] event - Event allocated with hipEventInterprocess and hipEventDisableTiming flags
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidConfiguration`, `hipErrorInvalidValue`
  !>
  !>  @note This IPC event related feature API is currently applicable on Linux.
  interface hipIpcGetEventHandle
#ifdef USE_CUDA_NAMES
    function hipIpcGetEventHandle_(handle,event) bind(c, name="cudaIpcGetEventHandle")
#else
    function hipIpcGetEventHandle_(handle,event) bind(c, name="hipIpcGetEventHandle")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipIpcGetEventHandle_
      type(hipIpcEventHandle_t) :: handle
      type(c_ptr),value :: event
    end function
  end interface

  !>  @brief Opens an interprocess event handles.
  !>
  !>  Opens an interprocess event handle exported from another process with hipIpcGetEventHandle.
  !>  The
  !>  returned hipEvent_t behaves like a locally created event with the hipEventDisableTiming flag
  !>  specified. This event need be freed with hipEventDestroy. Operations on the imported event
  !>  after
  !>  the exported event has been freed with hipEventDestroy will result in undefined behavior. If
  !>  the
  !>  function is called within the same process where handle is returned by hipIpcGetEventHandle,
  !>  it
  !>  will return hipErrorInvalidContext.
  !>
  !>  @param[out] event - Pointer to hipEvent_t to return the event
  !>  @param[in] handle - The opaque interprocess handle to open
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`
  !>
  !>  @note This IPC event related feature API is currently applicable on Linux.
  interface hipIpcOpenEventHandle
#ifdef USE_CUDA_NAMES
    function hipIpcOpenEventHandle_(event,handle) bind(c, name="cudaIpcOpenEventHandle")
#else
    function hipIpcOpenEventHandle_(event,handle) bind(c, name="hipIpcOpenEventHandle")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipIpcOpenEventHandle_
      type(c_ptr) :: event
      type(c_ptr),value :: handle
    end function
  end interface

  !>   @defgroup Execution Execution Control
  !>
  !>   This section describes the execution control functions of HIP runtime API.
  !>
  !>
  !>
  !>  @brief Set attribute for a specific function
  !>
  !>  @param [in] func Pointer of the function
  !>  @param [in] attr Attribute to set
  !>  @param [in] value Value to set
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDeviceFunction`, `hipErrorInvalidValue`
  !>
  !>  Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !>  ignored on those architectures.
  interface hipFuncSetAttribute
#ifdef USE_CUDA_NAMES
    function hipFuncSetAttribute_(func,attr,myValue) bind(c, name="cudaFuncSetAttribute")
#else
    function hipFuncSetAttribute_(func,attr,myValue) bind(c, name="hipFuncSetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipFuncSetAttribute_
      type(c_ptr),value :: func
      integer(kind(hipFuncAttributeMaxDynamicSharedMemorySize)),value :: attr
      integer(c_int),value :: myValue
    end function
  end interface

  !>  @brief Set Cache configuration for a specific function
  !>
  !>  @param [in] func Pointer of the function.
  !>  @param [in] config Configuration to set.
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`
  !>  Note: AMD devices and some Nvidia GPUS do not support reconfigurable cache. This hint is
  !>  ignored
  !>  on those architectures.
  interface hipFuncSetCacheConfig
#ifdef USE_CUDA_NAMES
    function hipFuncSetCacheConfig_(func,config) bind(c, name="cudaFuncSetCacheConfig")
#else
    function hipFuncSetCacheConfig_(func,config) bind(c, name="hipFuncSetCacheConfig")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipFuncSetCacheConfig_
      type(c_ptr),value :: func
      integer(kind(hipFuncCachePreferNone)),value :: config
    end function
  end interface

  !>  @brief Set shared memory configuation for a specific function
  !>
  !>  @param [in] func Pointer of the function
  !>  @param [in] config Configuration
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDeviceFunction`, `hipErrorInvalidValue`
  !>
  !>  Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !>  ignored on those architectures.
  interface hipFuncSetSharedMemConfig
#ifdef USE_CUDA_NAMES
    function hipFuncSetSharedMemConfig_(func,config) bind(c, name="cudaFuncSetSharedMemConfig")
#else
    function hipFuncSetSharedMemConfig_(func,config) bind(c, name="hipFuncSetSharedMemConfig")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipFuncSetSharedMemConfig_
      type(c_ptr),value :: func
      integer(kind(hipSharedMemBankSizeDefault)),value :: config
    end function
  end interface

  !> -------------------------------------------------------------------------------------------------
  !> -------------------------------------------------------------------------------------------------
  !>   @defgroup Error Error Handling
  !>
  !>   This section describes the error handling functions of HIP runtime API.
  !>
  !>
  !>  @brief Return last error returned by any HIP runtime API call and resets the stored error code
  !>  to
  !>  `hipSuccess`
  !>
  !>  @returns return code from last HIP called from the active host thread
  !>
  !>  Returns the last error that has been returned by any of the runtime calls in the same host
  !>  thread, and then resets the saved error to `hipSuccess`.
  !>
  !>  @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
  interface hipGetLastError
#ifdef USE_CUDA_NAMES
    function hipGetLastError_() bind(c, name="cudaGetLastError")
#else
    function hipGetLastError_() bind(c, name="hipGetLastError")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetLastError_
    end function
  end interface

  !>  @brief Return last error returned by any HIP runtime API call.
  !>
  !>  @returns `hipSuccess`
  !>
  !>  Returns the last error that has been returned by any of the runtime calls in the same host
  !>  thread. Unlike hipGetLastError, this function does not reset the saved error code.
  !>
  !>  @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
  interface hipPeekAtLastError
#ifdef USE_CUDA_NAMES
    function hipPeekAtLastError_() bind(c, name="cudaPeekAtLastError")
#else
    function hipPeekAtLastError_() bind(c, name="hipPeekAtLastError")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipPeekAtLastError_
    end function
  end interface

  !>  @brief Creates an asynchronous stream.
  !>
  !>  @param[in, out] stream - Valid pointer to hipStream_t. This function writes the memory with
  !>  the
  !>  newly created stream.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  Creates a new asynchronous stream with its associated current device. The @p stream returns an
  !>  opaque handle that can be used to reference the newly created stream in subsequent hipStream*
  !>  commands. The stream is allocated on the heap and will remain allocated even if the handle
  !>  goes
  !>  out-of-scope. To release the memory used by the stream, the application must call
  !>  hipStreamDestroy.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @see hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamSynchronize,
  !>  hipStreamWaitEvent, hipStreamDestroy
  interface hipStreamCreate
#ifdef USE_CUDA_NAMES
    function hipStreamCreate_(stream) bind(c, name="cudaStreamCreate")
#else
    function hipStreamCreate_(stream) bind(c, name="hipStreamCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamCreate_
      type(c_ptr) :: stream
    end function
  end interface

  !>  @brief Creates an asynchronous stream with flag.
  !>
  !>  @param[in, out] stream - Pointer to new stream
  !>  @param[in] flags - Parameters to control stream creation
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  Creates a new asynchronous stream with its associated current device. @p stream returns an
  !>  opaque handle that can be used to reference the newly created stream in subsequent hipStream*
  !>  commands. The stream is allocated on the heap and will remain allocated even if the handle
  !>  goes out-of-scope. To release the memory used by the stream, application must call
  !>  hipStreamDestroy.
  !>
  !>  The @p flags parameter controls behavior of the stream. The valid values are
  !>  `hipStreamDefault`
  !>  and `hipStreamNonBlocking`.
  !>
  !>  @see hipStreamCreate, hipStreamCreateWithPriority, hipStreamSynchronize, hipStreamWaitEvent,
  !>  hipStreamDestroy.
  interface hipStreamCreateWithFlags
#ifdef USE_CUDA_NAMES
    function hipStreamCreateWithFlags_(stream,flags) bind(c, name="cudaStreamCreateWithFlags")
#else
    function hipStreamCreateWithFlags_(stream,flags) bind(c, name="hipStreamCreateWithFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamCreateWithFlags_
      type(c_ptr) :: stream
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates an asynchronous stream with the specified priority.
  !>
  !>  @param[in, out] stream - Pointer to new stream
  !>  @param[in] flags - Parameters to control stream creation
  !>  @param[in] priority - Priority of the stream. Lower numbers represent higher priorities.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  Creates a new asynchronous stream with the specified priority, with its associated current
  !>  device.
  !>  @p stream returns an opaque handle that can be used to reference the newly created stream in
  !>  subsequent hipStream* commands. The stream is allocated on the heap and will remain allocated
  !>  even if the handle goes out-of-scope. To release the memory used by the stream, application
  !>  must
  !>  call hipStreamDestroy.
  !>
  !>  The @p flags parameter controls behavior of the stream. The valid values are
  !>  `hipStreamDefault`
  !>  and `hipStreamNonBlocking`.
  !>
  !>  @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
  interface hipStreamCreateWithPriority
#ifdef USE_CUDA_NAMES
    function hipStreamCreateWithPriority_(stream,flags,priority) &
        bind(c, name="cudaStreamCreateWithPriority")
#else
    function hipStreamCreateWithPriority_(stream,flags,priority) &
        bind(c, name="hipStreamCreateWithPriority")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamCreateWithPriority_
      type(c_ptr) :: stream
      integer(c_int),value :: flags
      integer(c_int),value :: priority
    end function
  end interface

  !>  @brief Returns numerical values that correspond to the least and greatest stream priority.
  !>
  !>  @param[in, out] leastPriority - Pointer in which a value corresponding to least priority
  !>  is returned.
  !>  @param[in, out] greatestPriority - Pointer in which a value corresponding to greatest priority
  !>  is returned.
  !>  @returns `hipSuccess`
  !>
  !>  Returns in *leastPriority and *greatestPriority the numerical values that correspond to the
  !>  least and greatest stream priority respectively. Stream priorities follow a convention where
  !>  lower numbers imply greater priorities. The range of meaningful stream priorities is given by
  !>  [*leastPriority,*greatestPriority]. If the user attempts to create a stream with a priority
  !>  value that is outside the meaningful range as specified by this API, the priority is
  !>  automatically clamped to within the valid range.
  !>
  !>  @warning This API is under development on AMD GPUs and simply returns `hipSuccess`.
  interface hipDeviceGetStreamPriorityRange
#ifdef USE_CUDA_NAMES
    function hipDeviceGetStreamPriorityRange_(leastPriority,greatestPriority) &
        bind(c, name="cudaDeviceGetStreamPriorityRange")
#else
    function hipDeviceGetStreamPriorityRange_(leastPriority,greatestPriority) &
        bind(c, name="hipDeviceGetStreamPriorityRange")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetStreamPriorityRange_
      type(c_ptr),value :: leastPriority
      type(c_ptr),value :: greatestPriority
    end function
  end interface

  !>  @brief Destroys the specified stream.
  !>
  !>  @param[in] stream - Stream identifier
  !>  @returns `hipSuccess` `hipErrorInvalidHandle`
  !>
  !>  Destroys the specified stream.
  !>
  !>  If commands are still executing on the specified stream, some may complete execution before
  !>  the
  !>  queue is deleted.
  !>
  !>  The queue may be destroyed while some commands are still inflight, or may wait for all
  !>  commands
  !>  queued to the stream before destroying it.
  !>
  !>  @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamQuery,
  !>  hipStreamWaitEvent, hipStreamSynchronize
  interface hipStreamDestroy
#ifdef USE_CUDA_NAMES
    function hipStreamDestroy_(stream) bind(c, name="cudaStreamDestroy")
#else
    function hipStreamDestroy_(stream) bind(c, name="hipStreamDestroy")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamDestroy_
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Returns `hipSuccess` if all of the operations in the specified @p stream have
  !>  completed, or
  !>  `hipErrorNotReady` if not.
  !>
  !>  @param[in] stream - Stream to query
  !>
  !>  @returns `hipSuccess`, `hipErrorNotReady`, `hipErrorInvalidHandle`
  !>
  !>  This is thread-safe and returns a snapshot of the current state of the queue. However, if
  !>  other
  !>  host threads are sending work to the stream, the status may change immediately after the
  !>  function
  !>  is called.  It is typically used for debug.
  !>
  !>  @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority,
  !>  hipStreamWaitEvent,
  !>  hipStreamSynchronize, hipStreamDestroy
  interface hipStreamQuery
#ifdef USE_CUDA_NAMES
    function hipStreamQuery_(stream) bind(c, name="cudaStreamQuery")
#else
    function hipStreamQuery_(stream) bind(c, name="hipStreamQuery")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamQuery_
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Waits for all commands in the stream to complete.
  !>
  !>  @param[in] stream - Stream identifier.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidHandle`
  !>
  !>  This command is host-synchronous : the host will block until all operations on the specified
  !>  stream with its associated device are completed. On multiple device systems, the @p stream is
  !>  associated with its device, no need to call hipSetDevice before this API.
  !>
  !>  This command follows standard null-stream semantics. Specifying the null stream will cause the
  !>  command to wait for other streams on the same device to complete all pending operations.
  !>
  !>  This command honors the `hipDeviceScheduleBlockingSync` flag, which controls whether the wait
  !>  is
  !>  active or blocking.
  !>
  !>  @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority,
  !>  hipStreamWaitEvent,
  !>  hipStreamDestroy
  interface hipStreamSynchronize
#ifdef USE_CUDA_NAMES
    function hipStreamSynchronize_(stream) bind(c, name="cudaStreamSynchronize")
#else
    function hipStreamSynchronize_(stream) bind(c, name="hipStreamSynchronize")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamSynchronize_
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Makes the specified compute stream wait for the specified event
  !>
  !>  @param[in] stream - Stream to make wait
  !>  @param[in] event - Event to wait on
  !>  @param[in] flags - Parameters to control the operation
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidHandle`, `hipErrorInvalidValue`,
  !>  `hipErrorStreamCaptureIsolation`
  !>
  !>  This function inserts a wait operation into the specified stream.
  !>  All future work submitted to @p stream will wait until @p event reports completion before
  !>  beginning execution.
  !>
  !>  Flags include:
  !>    hipEventWaitDefault: Default event creation flag.
  !>    hipEventWaitExternal: Wait is captured in the graph as an external event node when
  !>                            performing stream capture
  !>
  !>  This function only waits for commands in the current stream to complete. Notably, this
  !>  function
  !>  does not implicitly wait for commands in the default stream to complete, even if the specified
  !>  stream is created with hipStreamNonBlocking = 0.
  !>
  !>  @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority,
  !>  hipStreamSynchronize, hipStreamDestroy
  interface hipStreamWaitEvent
#ifdef USE_CUDA_NAMES
    function hipStreamWaitEvent_(stream,event,flags) bind(c, name="cudaStreamWaitEvent")
#else
    function hipStreamWaitEvent_(stream,event,flags) bind(c, name="hipStreamWaitEvent")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamWaitEvent_
      type(c_ptr),value :: stream
      type(c_ptr),value :: event
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Returns flags associated with this stream.
  !>
  !>  @param[in] stream - Stream to be queried
  !>  @param[in,out] flags - Pointer to an unsigned integer in which the stream's flags are returned
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidHandle`.
  !>
  !>  @see hipStreamCreateWithFlags
  interface hipStreamGetFlags
#ifdef USE_CUDA_NAMES
    function hipStreamGetFlags_(stream,flags) bind(c, name="cudaStreamGetFlags")
#else
    function hipStreamGetFlags_(stream,flags) bind(c, name="hipStreamGetFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetFlags_
      type(c_ptr),value :: stream
      type(c_ptr),value :: flags
    end function
  end interface

  !>  @brief Queries the priority of a stream.
  !>
  !>  @param[in] stream - Stream to be queried
  !>  @param[in,out] priority - Pointer to an unsigned integer in which the stream's priority is
  !>  returned
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidHandle`.
  !>
  !>  @see hipStreamCreateWithPriority
  interface hipStreamGetPriority
#ifdef USE_CUDA_NAMES
    function hipStreamGetPriority_(stream,priority) bind(c, name="cudaStreamGetPriority")
#else
    function hipStreamGetPriority_(stream,priority) bind(c, name="hipStreamGetPriority")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetPriority_
      type(c_ptr),value :: stream
      type(c_ptr),value :: priority
    end function
  end interface

  !>  @brief Creates an asynchronous stream with the specified CU mask.
  !>
  !>  @param[in, out] stream - Pointer to new stream
  !>  @param[in] cuMaskSize - Size of CU mask bit array passed in.
  !>  @param[in] cuMask - Bit-vector representing the CU mask. Each active bit represents using one
  !>  CU.
  !>  The first 32 bits represent the first 32 CUs, and so on. If its size is greater than physical
  !>  CU number (i.e., multiProcessorCount member of hipDeviceProp_t), the extra elements are
  !>  ignored.
  !>  It is user's responsibility to make sure the input is meaningful.
  !>  @returns `hipSuccess`, `hipErrorInvalidHandle`, `hipErrorInvalidValue`
  !>
  !>  Creates  a new asynchronous stream with the specified CU mask.  @p stream returns an opaque
  !>  handle that can be used to reference the newly created stream in subsequent hipStream*
  !>  commands.
  !>  The stream is allocated on the heap and will remain allocated even if the handle goes
  !>  out-of-scope. To release the memory used by the stream, application must call
  !>  hipStreamDestroy.
  !>
  !>  @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
  interface hipExtStreamCreateWithCUMask
#ifdef USE_CUDA_NAMES
    function hipExtStreamCreateWithCUMask_(stream,cuMaskSize,cuMask) &
        bind(c, name="cudaExtStreamCreateWithCUMask")
#else
    function hipExtStreamCreateWithCUMask_(stream,cuMaskSize,cuMask) &
        bind(c, name="hipExtStreamCreateWithCUMask")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamCreateWithCUMask_
      type(c_ptr) :: stream
      integer(c_int32_t),value :: cuMaskSize
      type(c_ptr),value :: cuMask
    end function
  end interface

  !>  @brief Gets CU mask associated with an asynchronous stream
  !>
  !>  @param[in] stream - Stream to be queried
  !>  @param[in] cuMaskSize - Number of the block of memories (uint32_t *) allocated by user
  !>  @param[out] cuMask - Pointer to a pre-allocated block of memories (uint32_t *) in which
  !>  the stream's CU mask is returned. The CU mask is returned in a chunck of 32 bits where
  !>  each active bit represents one active CU.
  !>  @returns `hipSuccess`, `hipErrorInvalidHandle`, `hipErrorInvalidValue`
  !>
  !>  @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
  interface hipExtStreamGetCUMask
#ifdef USE_CUDA_NAMES
    function hipExtStreamGetCUMask_(stream,cuMaskSize,cuMask) bind(c, name="cudaExtStreamGetCUMask")
#else
    function hipExtStreamGetCUMask_(stream,cuMaskSize,cuMask) bind(c, name="hipExtStreamGetCUMask")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamGetCUMask_
      type(c_ptr),value :: stream
      integer(c_int32_t),value :: cuMaskSize
      type(c_ptr),value :: cuMask
    end function
  end interface

  !>  @brief Adds a callback to be called on the host after all currently enqueued items in the
  !>  stream
  !>  have completed.  For each hipStreamAddCallback call, a callback will be executed exactly once.
  !>  The callback will block later work in the stream until it is finished.
  !>
  !>  @param[in] stream - Stream to add callback to
  !>  @param[in] callback - The function to call once preceding stream operations are complete
  !>  @param[in] userData - User specified data to be passed to the callback function
  !>  @param[in] flags - Reserved for future use, must be 0
  !>  @returns `hipSuccess`, `hipErrorInvalidHandle`, `hipErrorNotSupported`
  !>
  !>  @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamQuery, hipStreamSynchronize,
  !>  hipStreamWaitEvent, hipStreamDestroy, hipStreamCreateWithPriority
  interface hipStreamAddCallback
#ifdef USE_CUDA_NAMES
    function hipStreamAddCallback_(stream,callback,userData,flags) &
        bind(c, name="cudaStreamAddCallback")
#else
    function hipStreamAddCallback_(stream,callback,userData,flags) &
        bind(c, name="hipStreamAddCallback")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamAddCallback_
      type(c_ptr),value :: stream
      type(c_funptr),value :: callback
      type(c_ptr),value :: userData
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Enqueues a write command to the stream.[BETA]
  !>
  !>  @param [in] stream - Stream identifier
  !>  @param [in] ptr    - Pointer to a GPU accessible memory object
  !>  @param [in] value  - Value to be written
  !>  @param [in] flags  - reserved, ignored for now, will be used in future releases
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  Enqueues a write command to the stream, write operation is performed after all earlier
  !>  commands
  !>  on this stream have completed the execution.
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @see hipExtMallocWithFlags, hipFree, hipStreamWriteValue32, hipStreamWaitValue32,
  !>  hipStreamWaitValue64
  interface hipStreamWriteValue32
#ifdef USE_CUDA_NAMES
    function hipStreamWriteValue32_(stream,ptr,myValue,flags) bind(c, name="cudaStreamWriteValue32")
#else
    function hipStreamWriteValue32_(stream,ptr,myValue,flags) bind(c, name="hipStreamWriteValue32")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamWriteValue32_
      type(c_ptr),value :: stream
      type(c_ptr),value :: ptr
      integer(c_int32_t),value :: myValue
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Enqueues a write command to the stream.[BETA]
  !>
  !>  @param [in] stream - Stream identifier
  !>  @param [in] ptr    - Pointer to a GPU accessible memory object
  !>  @param [in] value  - Value to be written
  !>  @param [in] flags  - reserved, ignored for now, will be used in future releases
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  Enqueues a write command to the stream, write operation is performed after all earlier
  !>  commands
  !>  on this stream have completed the execution.
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @see hipExtMallocWithFlags, hipFree, hipStreamWriteValue32, hipStreamWaitValue32,
  !>  hipStreamWaitValue64
  interface hipStreamWriteValue64
#ifdef USE_CUDA_NAMES
    function hipStreamWriteValue64_(stream,ptr,myValue,flags) bind(c, name="cudaStreamWriteValue64")
#else
    function hipStreamWriteValue64_(stream,ptr,myValue,flags) bind(c, name="hipStreamWriteValue64")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamWriteValue64_
      type(c_ptr),value :: stream
      type(c_ptr),value :: ptr
      integer(c_int64_t),value :: myValue
      integer(c_int),value :: flags
    end function
  end interface

  !> -------------------------------------------------------------------------------------------------
  !> -------------------------------------------------------------------------------------------------
  !>   @defgroup Event Event Management
  !>
  !>   This section describes the event management functions of HIP runtime API.
  !>
  !>
  !>  @brief Create an event with the specified flags
  !>
  !>  @param[in,out] event - Returns the newly created event.
  !>  @param[in] flags - Flags to control event behavior.  Valid values are `hipEventDefault`,
  !>  `hipEventBlockingSync`, `hipEventDisableTiming`, `hipEventInterprocess`
  !>  `hipEventDefault` : Default flag.  The event will use active synchronization and will support
  !>  timing. Blocking synchronization provides lowest possible latency at the expense of dedicating
  !>  a
  !>  CPU to poll on the event.
  !>  `hipEventBlockingSync` : The event will use blocking synchronization : if hipEventSynchronize
  !>  is
  !>  called on this event, the thread will block until the event completes. This can increase
  !>  latency
  !>  for the synchroniation but can result in lower power and more resources for other CPU threads.
  !>  `hipEventDisableTiming` : Disable recording of timing information. Events created with this
  !>  flag
  !>  would not record profiling data and provide best performance if used for synchronization.
  !>  `hipEventInterprocess` : The event can be used as an interprocess event. hipEventDisableTiming
  !>  flag also must be set when hipEventInterprocess flag is set.
  !>  `hipEventDisableSystemFence` : Disable acquire and release system scope fence. This may
  !>  improve performance but device memory may not be visible to the host and other devices
  !>  if this flag is set.
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`,
  !>  `hipErrorLaunchFailure`, `hipErrorOutOfMemory`
  !>
  !>  @see hipEventCreate, hipEventSynchronize, hipEventDestroy, hipEventElapsedTime
  interface hipEventCreateWithFlags
#ifdef USE_CUDA_NAMES
    function hipEventCreateWithFlags_(event,flags) bind(c, name="cudaEventCreateWithFlags")
#else
    function hipEventCreateWithFlags_(event,flags) bind(c, name="hipEventCreateWithFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipEventCreateWithFlags_
      type(c_ptr) :: event
      integer(c_int),value :: flags
    end function
  end interface

  !>   Create an event
  !>
  !>  @param[in,out] event - Returns the newly created event.
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`,
  !>  `hipErrorLaunchFailure`, `hipErrorOutOfMemory`
  !>
  !>  @see hipEventCreateWithFlags, hipEventRecord, hipEventQuery, hipEventSynchronize,
  !>  hipEventDestroy, hipEventElapsedTime
  interface hipEventCreate
#ifdef USE_CUDA_NAMES
    function hipEventCreate_(event) bind(c, name="cudaEventCreate")
#else
    function hipEventCreate_(event) bind(c, name="hipEventCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipEventCreate_
      type(c_ptr) :: event
    end function
  end interface

  interface hipEventRecord
#ifdef USE_CUDA_NAMES
    function hipEventRecord_(event,stream) bind(c, name="cudaEventRecord")
#else
    function hipEventRecord_(event,stream) bind(c, name="hipEventRecord")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipEventRecord_
      type(c_ptr),value :: event
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Destroy the specified event.
  !>
  !>   @param[in] event - Event to destroy.
  !>   @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`,
  !>  `hipErrorLaunchFailure`
  !>
  !>   Releases memory associated with the event.  If the event is recording but has not completed
  !>  recording when hipEventDestroy() is called, the function will return immediately and the
  !>  completion_future resources will be released later, when the hipDevice is synchronized.
  !>
  !>  @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventSynchronize,
  !>  hipEventRecord,
  !>  hipEventElapsedTime
  !>
  !>  @returns `hipSuccess`
  interface hipEventDestroy
#ifdef USE_CUDA_NAMES
    function hipEventDestroy_(event) bind(c, name="cudaEventDestroy")
#else
    function hipEventDestroy_(event) bind(c, name="hipEventDestroy")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipEventDestroy_
      type(c_ptr),value :: event
    end function
  end interface

  !>   @brief Wait for an event to complete.
  !>
  !>   This function will block until the event is ready, waiting for all previous work in the
  !>   stream
  !>  specified when event was recorded with hipEventRecord().
  !>
  !>   If hipEventRecord() has not been called on @p event, this function returns `hipSuccess` when
  !>   no
  !>   event is captured.
  !>
  !>
  !>   @param[in] event - Event on which to wait.
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`,
  !>  `hipErrorInvalidHandle`, `hipErrorLaunchFailure`
  !>
  !>   @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventDestroy, hipEventRecord,
  !>  hipEventElapsedTime
  interface hipEventSynchronize
#ifdef USE_CUDA_NAMES
    function hipEventSynchronize_(event) bind(c, name="cudaEventSynchronize")
#else
    function hipEventSynchronize_(event) bind(c, name="hipEventSynchronize")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipEventSynchronize_
      type(c_ptr),value :: event
    end function
  end interface

  !>  @brief Return the elapsed time between two events.
  !>
  !>  @param[out] ms - : Return time between start and stop in ms.
  !>  @param[in] start - : Start event.
  !>  @param[in] myStop - : Stop event.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotReady`, `hipErrorInvalidHandle`,
  !>  `hipErrorNotInitialized`, `hipErrorLaunchFailure`
  !>
  !>  Computes the elapsed time between two events. Time is computed in ms, with
  !>  a resolution of approximately 1 us.
  !>
  !>  Events which are recorded in a NULL stream will block until all commands
  !>  on all other streams complete execution, and then record the timestamp.
  !>
  !>  Events which are recorded in a non-NULL stream will record their timestamp
  !>  when they reach the head of the specified stream, after all previous
  !>  commands in that stream have completed executing.  Thus the time that
  !>  the event recorded may be significantly after the host calls hipEventRecord().
  !>
  !>  If hipEventRecord() has not been called on either event, then `hipErrorInvalidHandle` is
  !>  returned. If hipEventRecord() has been called on both events, but the timestamp has not yet
  !>  been
  !>  recorded on one or both events (that is, hipEventQuery() would return `hipErrorNotReady` on at
  !>  least one of the events), then `hipErrorNotReady` is returned.
  !>
  !>  @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventDestroy, hipEventRecord,
  !>  hipEventSynchronize
  interface hipEventElapsedTime
#ifdef USE_CUDA_NAMES
    function hipEventElapsedTime_(ms,start,myStop) bind(c, name="cudaEventElapsedTime")
#else
    function hipEventElapsedTime_(ms,start,myStop) bind(c, name="hipEventElapsedTime")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipEventElapsedTime_
      type(c_ptr),value :: ms
      type(c_ptr),value :: start
      type(c_ptr),value :: myStop
    end function
  end interface

  !>  @brief Query event status
  !>
  !>  @param[in] event - Event to query.
  !>  @returns `hipSuccess`, `hipErrorNotReady`, `hipErrorInvalidHandle`, `hipErrorInvalidValue`,
  !>  `hipErrorNotInitialized`, `hipErrorLaunchFailure`
  !>
  !>  Query the status of the specified event.  This function will return `hipSuccess` if all
  !>  commands in the appropriate stream (specified to hipEventRecord()) have completed.  If any
  !>  execution has not completed, then `hipErrorNotReady` is returned.
  !>
  !>  @note This API returns `hipSuccess`, if hipEventRecord() is not called before this API.
  !>
  !>  @see hipEventCreate, hipEventCreateWithFlags, hipEventRecord, hipEventDestroy,
  !>  hipEventSynchronize, hipEventElapsedTime
  interface hipEventQuery
#ifdef USE_CUDA_NAMES
    function hipEventQuery_(event) bind(c, name="cudaEventQuery")
#else
    function hipEventQuery_(event) bind(c, name="hipEventQuery")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipEventQuery_
      type(c_ptr),value :: event
    end function
  end interface

  !>   @brief Returns attributes for the specified pointer
  !>
  !>   @param [out]  attributes  attributes for the specified pointer
  !>   @param [in]   ptr         pointer to get attributes for
  !>
  !>   The output parameter 'attributes' has a member named 'type' that describes what memory the
  !>   pointer is associated with, such as device memory, host memory, managed memory, and others.
  !>   Otherwise, the API cannot handle the pointer and returns `hipErrorInvalidValue`.
  !>
  !>   @note  The unrecognized memory type is unsupported to keep the HIP functionality backward
  !>   compatibility due to `hipMemoryType` enum values.
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>   @note  The current behavior of this HIP API corresponds to the CUDA API before version 11.0.
  !>
  !>   @see hipPointerGetAttribute
  interface hipPointerGetAttributes
#ifdef USE_CUDA_NAMES
    function hipPointerGetAttributes_(attributes,ptr) bind(c, name="cudaPointerGetAttributes")
#else
    function hipPointerGetAttributes_(attributes,ptr) bind(c, name="hipPointerGetAttributes")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipPointerGetAttributes_
      type(hipPointerAttribute_t) :: attributes
      type(c_ptr),value :: ptr
    end function
  end interface

  !>   @brief Returns information about the specified pointer.[BETA]
  !>
  !>   @param [in, out] data     Returned pointer attribute value
  !>   @param [in]      attribute  Attribute to query for
  !>   @param [in]      ptr      Pointer to get attributes for
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>   @warning This API is marked as Beta. While this feature is complete, it can
  !>            change and might have outstanding issues.
  !>
  !>   @see hipPointerGetAttributes
  interface hipPointerGetAttribute
#ifdef USE_CUDA_NAMES
    function hipPointerGetAttribute_(myData,attribute,ptr) bind(c, name="cudaPointerGetAttribute")
#else
    function hipPointerGetAttribute_(myData,attribute,ptr) bind(c, name="hipPointerGetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipPointerGetAttribute_
      type(c_ptr),value :: myData
      integer(kind(HIP_POINTER_ATTRIBUTE_CONTEXT)),value :: attribute
      type(c_ptr),value :: ptr
    end function
  end interface

  !>   @brief Returns information about the specified pointer.[BETA]
  !>
  !>   @param [in]  numAttributes   number of attributes to query for
  !>   @param [in]  attributes      attributes to query for
  !>   @param [in, out] data        a two-dimensional containing pointers to memory locations
  !>                                where the result of each attribute query will be written to
  !>   @param [in]  ptr             pointer to get attributes for
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>   @warning This API is marked as Beta. While this feature is complete, it can
  !>            change and might have outstanding issues.
  !>
  !>   @see hipPointerGetAttribute
  interface hipDrvPointerGetAttributes
#ifdef USE_CUDA_NAMES
    function hipDrvPointerGetAttributes_(numAttributes,attributes,myData,ptr) &
        bind(c, name="cudaDrvPointerGetAttributes")
#else
    function hipDrvPointerGetAttributes_(numAttributes,attributes,myData,ptr) &
        bind(c, name="hipDrvPointerGetAttributes")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDrvPointerGetAttributes_
      integer(c_int),value :: numAttributes
      type(c_ptr),value :: attributes
      type(c_ptr) :: myData
      type(c_ptr),value :: ptr
    end function
  end interface

  !>   @brief Signals a set of external semaphore objects.
  !>
  !>   @param[in] extSemArray - External semaphores to be waited on
  !>   @param[in] paramsArray - Array of semaphore parameters
  !>   @param[in] numExtSems - Number of semaphores to wait on
  !>   @param[in] stream - Stream to enqueue the wait operations in
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>   @see
  !>
  !>   @note  This API is currently not supported on Linux.
  interface hipSignalExternalSemaphoresAsync
#ifdef USE_CUDA_NAMES
    function hipSignalExternalSemaphoresAsync_(extSemArray,paramsArray,numExtSems,stream) &
        bind(c, name="cudaSignalExternalSemaphoresAsync")
#else
    function hipSignalExternalSemaphoresAsync_(extSemArray,paramsArray,numExtSems,stream) &
        bind(c, name="hipSignalExternalSemaphoresAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipSignalExternalSemaphoresAsync_
      type(c_ptr) :: extSemArray
      type(hipExternalSemaphoreSignalParams) :: paramsArray
      integer(c_int),value :: numExtSems
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Waits on a set of external semaphore objects
  !>
  !>   @param[in] extSemArray - External semaphores to be waited on
  !>   @param[in] paramsArray - Array of semaphore parameters
  !>   @param[in] numExtSems - Number of semaphores to wait on
  !>   @param[in] stream - Stream to enqueue the wait operations in
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>   @see
  !>
  !>   @note  This API is currently not supported on Linux.
  interface hipWaitExternalSemaphoresAsync
#ifdef USE_CUDA_NAMES
    function hipWaitExternalSemaphoresAsync_(extSemArray,paramsArray,numExtSems,stream) &
        bind(c, name="cudaWaitExternalSemaphoresAsync")
#else
    function hipWaitExternalSemaphoresAsync_(extSemArray,paramsArray,numExtSems,stream) &
        bind(c, name="hipWaitExternalSemaphoresAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipWaitExternalSemaphoresAsync_
      type(c_ptr) :: extSemArray
      type(hipExternalSemaphoreWaitParams) :: paramsArray
      integer(c_int),value :: numExtSems
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Destroys an external semaphore object and releases any references to the underlying
  !>  resource. Any outstanding signals or waits must have completed before the semaphore is
  !>  destroyed.
  !>
  !>   @param[in] extSem - handle to an external memory object
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>   @see
  !>
  !>   @note  This API is currently not supported on Linux.
  interface hipDestroyExternalSemaphore
#ifdef USE_CUDA_NAMES
    function hipDestroyExternalSemaphore_(extSem) bind(c, name="cudaDestroyExternalSemaphore")
#else
    function hipDestroyExternalSemaphore_(extSem) bind(c, name="hipDestroyExternalSemaphore")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDestroyExternalSemaphore_
      type(c_ptr),value :: extSem
    end function
  end interface

  !>   @brief Maps a buffer onto an imported memory object.
  !>
  !>   @param[out] devPtr - Returned device pointer to buffer
  !>   @param[in] extMem - Handle to external memory object
  !>   @param[in] bufferDesc - Buffer descriptor
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>   @see
  interface hipExternalMemoryGetMappedBuffer
#ifdef USE_CUDA_NAMES
    function hipExternalMemoryGetMappedBuffer_(devPtr,extMem,bufferDesc) &
        bind(c, name="cudaExternalMemoryGetMappedBuffer")
#else
    function hipExternalMemoryGetMappedBuffer_(devPtr,extMem,bufferDesc) &
        bind(c, name="hipExternalMemoryGetMappedBuffer")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipExternalMemoryGetMappedBuffer_
      type(c_ptr) :: devPtr
      type(c_ptr),value :: extMem
      type(hipExternalMemoryBufferDesc) :: bufferDesc
    end function
  end interface

  !>   @brief Destroys an external memory object.
  !>
  !>   @param[in] extMem - External memory object to be destroyed
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>   @see
  interface hipDestroyExternalMemory
#ifdef USE_CUDA_NAMES
    function hipDestroyExternalMemory_(extMem) bind(c, name="cudaDestroyExternalMemory")
#else
    function hipDestroyExternalMemory_(extMem) bind(c, name="hipDestroyExternalMemory")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDestroyExternalMemory_
      type(c_ptr),value :: extMem
    end function
  end interface

  !>   @brief Allocate memory on the default accelerator
  !>
  !>   @param[out] ptr - Pointer to the allocated memory
  !>   @param[in] sizeBytes - Requested memory size
  !>   @param[in] flags - Type of memory allocation
  !>
  !>   If requested memory size is 0, no memory is allocated, *ptr returns nullptr, and `hipSuccess`
  !>   is returned.
  !>
  !>   The memory allocation flag should be either `hipDeviceMallocDefault`,
  !>   `hipDeviceMallocFinegrained`, `hipDeviceMallocUncached`, or `hipMallocSignalMemory`.
  !>   If the flag is any other value, the API returns `hipErrorInvalidValue`.
  !>
  !>   @returns `hipSuccess`, `hipErrorOutOfMemory`, `hipErrorInvalidValue` (bad context, null *ptr)
  !>
  !>   @see hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D, hipMalloc3DArray,
  !>  hipHostFree, hiHostMalloc
  interface hipExtMallocWithFlags
#ifdef USE_CUDA_NAMES
    function hipExtMallocWithFlags_(ptr,sizeBytes,flags) bind(c, name="cudaExtMallocWithFlags")
#else
    function hipExtMallocWithFlags_(ptr,sizeBytes,flags) bind(c, name="hipExtMallocWithFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipExtMallocWithFlags_
      type(c_ptr) :: ptr
      integer(c_size_t),value :: sizeBytes
      integer(c_int),value :: flags
    end function
  end interface

  !>   @brief Allocate pinned host memory [Deprecated]
  !>
  !>   @param[out] ptr - Pointer to the allocated host pinned memory
  !>   @param[in] mySize - Requested memory size
  !>
  !>   If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
  !>
  !>   @returns `hipSuccess`, `hipErrorOutOfMemory`
  !>
  !>   @warning  This API is deprecated, use hipHostMalloc() instead
  interface hipMallocHost
#ifdef USE_CUDA_NAMES
    function hipMallocHost_(ptr,mySize) bind(c, name="cudaMallocHost")
#else
    function hipMallocHost_(ptr,mySize) bind(c, name="hipMallocHost")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMallocHost_
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
    end function
  end interface

  !>   @brief Allocate pinned host memory [Deprecated]
  !>
  !>   @param[out] ptr - Pointer to the allocated host pinned memory
  !>   @param[in] mySize - Requested memory size
  !>
  !>   If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
  !>
  !>   @returns `hipSuccess`, `hipErrorOutOfMemory`
  !>
  !>   @warning  This API is deprecated, use hipHostMalloc() instead
  interface hipMemAllocHost
#ifdef USE_CUDA_NAMES
    function hipMemAllocHost_(ptr,mySize) bind(c, name="cudaMemAllocHost")
#else
    function hipMemAllocHost_(ptr,mySize) bind(c, name="hipMemAllocHost")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemAllocHost_
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
    end function
  end interface

  !>  @brief Prefetches memory to the specified destination device using HIP.
  !>
  !>  @param [in] dev_ptr  pointer to be prefetched
  !>  @param [in] count    size in bytes for prefetching
  !>  @param [in] device   destination device to prefetch to
  !>  @param [in] stream   stream to enqueue prefetch operation
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPrefetchAsync
#ifdef USE_CUDA_NAMES
    function hipMemPrefetchAsync_(dev_ptr,count,device,stream) bind(c, name="cudaMemPrefetchAsync")
#else
    function hipMemPrefetchAsync_(dev_ptr,count,device,stream) bind(c, name="hipMemPrefetchAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemPrefetchAsync_
      type(c_ptr),value :: dev_ptr
      integer(c_size_t),value :: count
      integer(c_int),value :: device
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Advise about the usage of a given memory range to HIP.
  !>
  !>  @param [in] dev_ptr  pointer to memory to set the advice for
  !>  @param [in] count    size in bytes of the memory range, it should be CPU page size alligned.
  !>  @param [in] advice   advice to be applied for the specified memory range
  !>  @param [in] device   device to apply the advice for
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  This HIP API advises about the usage to be applied on unified memory allocation in the
  !>  range starting from the pointer address devPtr, with the size of count bytes.
  !>  The memory range must refer to managed memory allocated via the API hipMallocManaged, and the
  !>  range will be handled with proper round down and round up respectively in the driver to
  !>  be aligned to CPU page size, the same way as corresponding CUDA API behaves in CUDA version
  !>  8.0
  !>  and afterwards.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemAdvise
#ifdef USE_CUDA_NAMES
    function hipMemAdvise_(dev_ptr,count,advice,device) bind(c, name="cudaMemAdvise")
#else
    function hipMemAdvise_(dev_ptr,count,advice,device) bind(c, name="hipMemAdvise")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemAdvise_
      type(c_ptr),value :: dev_ptr
      integer(c_size_t),value :: count
      integer(kind(hipMemAdviseSetReadMostly)),value :: advice
      integer(c_int),value :: device
    end function
  end interface

  !>  @brief Query an attribute of a given memory range in HIP.
  !>
  !>  @param [in,out] data   a pointer to a memory location where the result of each
  !>                         attribute query will be written to
  !>  @param [in] data_size  the size of data
  !>  @param [in] attribute  the attribute to query
  !>  @param [in] dev_ptr    start of the range to query
  !>  @param [in] count      size of the range to query
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemRangeGetAttribute
#ifdef USE_CUDA_NAMES
    function hipMemRangeGetAttribute_(myData,data_size,attribute,dev_ptr,count) &
        bind(c, name="cudaMemRangeGetAttribute")
#else
    function hipMemRangeGetAttribute_(myData,data_size,attribute,dev_ptr,count) &
        bind(c, name="hipMemRangeGetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemRangeGetAttribute_
      type(c_ptr),value :: myData
      integer(c_size_t),value :: data_size
      integer(kind(hipMemRangeAttributeReadMostly)),value :: attribute
      type(c_ptr),value :: dev_ptr
      integer(c_size_t),value :: count
    end function
  end interface

  !>  @brief Query attributes of a given memory range in HIP.
  !>
  !>  @param [in,out] data     a two-dimensional array containing pointers to memory locations
  !>                           where the result of each attribute query will be written to
  !>  @param [in] data_sizes   an array, containing the sizes of each result
  !>  @param [in] attributes   the attribute to query
  !>  @param [in] num_attributes  an array of attributes to query (numAttributes and the number
  !>                           of attributes in this array should match)
  !>  @param [in] dev_ptr      start of the range to query
  !>  @param [in] count        size of the range to query
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemRangeGetAttributes
#ifdef USE_CUDA_NAMES
    function hipMemRangeGetAttributes_(myData,data_sizes,attributes,num_attributes,dev_ptr,count) &
        bind(c, name="cudaMemRangeGetAttributes")
#else
    function hipMemRangeGetAttributes_(myData,data_sizes,attributes,num_attributes,dev_ptr,count) &
        bind(c, name="hipMemRangeGetAttributes")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemRangeGetAttributes_
      type(c_ptr) :: myData
      type(c_ptr),value :: data_sizes
      type(c_ptr),value :: attributes
      integer(c_size_t),value :: num_attributes
      type(c_ptr),value :: dev_ptr
      integer(c_size_t),value :: count
    end function
  end interface

  !>  @brief Attach memory to a stream asynchronously in HIP.
  !>
  !>  @param [in] stream     - stream in which to enqueue the attach operation
  !>  @param [in] dev_ptr    - pointer to memory (must be a pointer to managed memory or
  !>                           to a valid host-accessible region of system-allocated memory)
  !>  @param [in] length     - length of memory (defaults to zero)
  !>  @param [in] flags      - must be one of hipMemAttachGlobal, hipMemAttachHost or
  !>                           hipMemAttachSingle (defaults to hipMemAttachSingle)
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning This API is under development. Currently it is a no-operation (NOP)
  !>           function on AMD GPUs and returns `hipSuccess`.
  interface hipStreamAttachMemAsync
#ifdef USE_CUDA_NAMES
    function hipStreamAttachMemAsync_(stream,dev_ptr,length,flags) &
        bind(c, name="cudaStreamAttachMemAsync")
#else
    function hipStreamAttachMemAsync_(stream,dev_ptr,length,flags) &
        bind(c, name="hipStreamAttachMemAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamAttachMemAsync_
      type(c_ptr),value :: stream
      type(c_ptr),value :: dev_ptr
      integer(c_size_t),value :: length
      integer(c_int),value :: flags
    end function
  end interface

  !>   @brief Allocate device accessible page locked host memory
  !>
  !>   @param[out] ptr - Pointer to the allocated host pinned memory
  !>   @param[in] mySize - Requested memory size in bytes
  !>   @param[in] flags - Type of host memory allocation see below
  !>
  !>   If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
  !>
  !>   Flags:
  !>   - `hipHostAllocDefault`   Default pinned memory allocation on the host.
  !>   - `hipHostAllocPortable`  Memory is considered allocated by all contexts.
  !>   - `hipHostAllocMapped`    Map the allocation into the address space for the current device.
  !>   - `hipHostAllocWriteCombined`  Allocates the memory as write-combined.
  !>   - `hipHostAllocUncached`  Allocate the host memory on extended fine grained access system
  !>                            memory pool
  !>
  !>   @return `hipSuccess`, `hipErrorOutOfMemory`, `hipErrorInvalidValue`
  interface hipHostAlloc
#ifdef USE_CUDA_NAMES
    function hipHostAlloc_(ptr,mySize,flags) bind(c, name="cudaHostAlloc")
#else
    function hipHostAlloc_(ptr,mySize,flags) bind(c, name="hipHostAlloc")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipHostAlloc_
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
      integer(c_int),value :: flags
    end function
  end interface

  !>   Allocates at least width (in bytes) * height bytes of linear memory
  !>   Padding may occur to ensure alighnment requirements are met for the given row
  !>   The change in width size due to padding will be returned in *pitch.
  !>   Currently the alignment is set to 128 bytes
  !>
  !>   @param[out] ptr - Pointer to the allocated device memory
  !>   @param[out] pitch - Pitch for allocation (in bytes)
  !>   @param[in] width - Requested pitched allocation width (in bytes)
  !>   @param[in] height - Requested pitched allocation height
  !>
  !>   If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
  !>
  !>   @returns Error code
  !>
  !>   @see hipMalloc, hipFree, hipMallocArray, hipFreeArray, hipHostFree, hipMalloc3D,
  !>  hipMalloc3DArray, hipHostMalloc
  interface hipMallocPitch
#ifdef USE_CUDA_NAMES
    function hipMallocPitch_(ptr,pitch,width,height) bind(c, name="cudaMallocPitch")
#else
    function hipMallocPitch_(ptr,pitch,width,height) bind(c, name="hipMallocPitch")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMallocPitch_
      type(c_ptr) :: ptr
      integer(c_size_t) :: pitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
    end function
  end interface

  !>   Allocates at least width (in bytes) * height bytes of linear memory
  !>   Padding may occur to ensure alighnment requirements are met for the given row
  !>   The change in width size due to padding will be returned in *pitch.
  !>   Currently the alignment is set to 128 bytes
  !>
  !>   @param[out] dptr - Pointer to the allocated device memory
  !>   @param[out] pitch - Pitch for allocation (in bytes)
  !>   @param[in] widthInBytes - Requested pitched allocation width (in bytes)
  !>   @param[in] height - Requested pitched allocation height
  !>   @param[in] elementSizeBytes - The size of element bytes, should be 4, 8 or 16
  !>
  !>   If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
  !>   The intended usage of pitch is as a separate parameter of the allocation, used to compute
  !>  addresses within the 2D array. Given the row and column of an array element of type T, the
  !>  address is computed as: T* pElement = (T*)((char*)BaseAddress + Row * Pitch) + Column;
  !>
  !>   @returns Error code
  !>
  !>   @see hipMalloc, hipFree, hipMallocArray, hipFreeArray, hipHostFree, hipMalloc3D,
  !>  hipMalloc3DArray, hipHostMalloc
  interface hipMemAllocPitch
#ifdef USE_CUDA_NAMES
    function hipMemAllocPitch_(dptr,pitch,widthInBytes,height,elementSizeBytes) &
        bind(c, name="cudaMemAllocPitch")
#else
    function hipMemAllocPitch_(dptr,pitch,widthInBytes,height,elementSizeBytes) &
        bind(c, name="hipMemAllocPitch")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemAllocPitch_
      type(c_ptr) :: dptr
      integer(c_size_t) :: pitch
      integer(c_size_t),value :: widthInBytes
      integer(c_size_t),value :: height
      integer(c_int),value :: elementSizeBytes
    end function
  end interface

  !>   @brief Frees page-locked memory
  !>   This API performs an implicit hipDeviceSynchronize() call.
  !>   If pointer is NULL, the hip runtime is initialized and hipSuccess is returned.
  !>
  !>   @param[in] ptr - Pointer to memory to be freed
  !>   @returns `hipSuccess`,
  !>           `hipErrorInvalidValue` (if pointer is invalid, including device pointers allocated
  !>   with hipMalloc)
  interface hipFreeHost
#ifdef USE_CUDA_NAMES
    function hipFreeHost_(ptr) bind(c, name="cudaFreeHost")
#else
    function hipFreeHost_(ptr) bind(c, name="hipFreeHost")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipFreeHost_
      type(c_ptr),value :: ptr
    end function
  end interface

  !>   @brief Memory copy on the stream.
  !>   It allows single or multiple devices to do memory copy on single or multiple streams.
  !>
  !>   @param[out] dst - Data being copy to
  !>   @param[in] src - Data being copy from
  !>   @param[in] sizeBytes - Data size in bytes
  !>   @param[in] myKind - Kind of transfer
  !>   @param[in] stream - Valid stream
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorUnknown`,
  !>   `hipErrorContextIsDestroyed`
  !>
  !>   @see hipMemcpy, hipStreamCreate, hipStreamSynchronize, hipStreamDestroy, hipSetDevice,
  !>  hipLaunchKernelGGL
  interface hipMemcpyWithStream
#ifdef USE_CUDA_NAMES
    function hipMemcpyWithStream_(dst,src,sizeBytes,myKind,stream) &
        bind(c, name="cudaMemcpyWithStream")
#else
    function hipMemcpyWithStream_(dst,src,sizeBytes,myKind,stream) &
        bind(c, name="hipMemcpyWithStream")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyWithStream_
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Copy data from Host to Device
  !>
  !>   @param[out] dst - Data being copy to
  !>   @param[in] src - Data being copy from
  !>   @param[in] sizeBytes - Data size in bytes
  !>
  !>   @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>   `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
  interface hipMemcpyHtoD
#ifdef USE_CUDA_NAMES
    function hipMemcpyHtoD_(dst,src,sizeBytes) bind(c, name="cudaMemcpyHtoD")
#else
    function hipMemcpyHtoD_(dst,src,sizeBytes) bind(c, name="hipMemcpyHtoD")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyHtoD_
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
    end function
  end interface

  !>   @brief Copy data from Device to Host
  !>
  !>   @param[out] dst - Data being copy to
  !>   @param[in] src - Data being copy from
  !>   @param[in] sizeBytes - Data size in bytes
  !>
  !>   @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>   `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
  interface hipMemcpyDtoH
#ifdef USE_CUDA_NAMES
    function hipMemcpyDtoH_(dst,src,sizeBytes) bind(c, name="cudaMemcpyDtoH")
#else
    function hipMemcpyDtoH_(dst,src,sizeBytes) bind(c, name="hipMemcpyDtoH")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyDtoH_
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
    end function
  end interface

  !>   @brief Copy data from Device to Device
  !>
  !>   @param[out] dst - Data being copy to
  !>   @param[in] src - Data being copy from
  !>   @param[in] sizeBytes - Data size in bytes
  !>
  !>   @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>   `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
  interface hipMemcpyDtoD
#ifdef USE_CUDA_NAMES
    function hipMemcpyDtoD_(dst,src,sizeBytes) bind(c, name="cudaMemcpyDtoD")
#else
    function hipMemcpyDtoD_(dst,src,sizeBytes) bind(c, name="hipMemcpyDtoD")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyDtoD_
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
    end function
  end interface

  !>   @brief Copy data from Host to Device asynchronously
  !>
  !>   @param[out] dst - Data being copy to
  !>   @param[in] src - Data being copy from
  !>   @param[in] sizeBytes - Data size in bytes
  !>   @param[in] stream - Stream identifier
  !>
  !>   @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>   `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
  interface hipMemcpyHtoDAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyHtoDAsync_(dst,src,sizeBytes,stream) bind(c, name="cudaMemcpyHtoDAsync")
#else
    function hipMemcpyHtoDAsync_(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyHtoDAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyHtoDAsync_
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Copy data from Device to Host asynchronously
  !>
  !>   @param[out] dst - Data being copy to
  !>   @param[in] src - Data being copy from
  !>   @param[in] sizeBytes - Data size in bytes
  !>   @param[in] stream - Stream identifier
  !>
  !>   @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>   `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
  interface hipMemcpyDtoHAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyDtoHAsync_(dst,src,sizeBytes,stream) bind(c, name="cudaMemcpyDtoHAsync")
#else
    function hipMemcpyDtoHAsync_(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyDtoHAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyDtoHAsync_
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Copy data from Device to Device asynchronously
  !>
  !>   @param[out] dst - Data being copy to
  !>   @param[in] src - Data being copy from
  !>   @param[in] sizeBytes - Data size in bytes
  !>   @param[in] stream - Stream identifier
  !>
  !>   @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>   `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
  interface hipMemcpyDtoDAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyDtoDAsync_(dst,src,sizeBytes,stream) bind(c, name="cudaMemcpyDtoDAsync")
#else
    function hipMemcpyDtoDAsync_(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyDtoDAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyDtoDAsync_
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Returns a global pointer from a module.
  !>   @ingroup Module
  !>
  !>   Returns in *dptr and *bytes the pointer and size of the global of name name located in module
  !>  hmod. If no variable of that name exists, it returns hipErrorNotFound. Both parameters dptr
  !>  and
  !>  bytes are optional. If one of them is NULL, it is ignored and hipSuccess is returned.
  !>
  !>   @param[out] dptr - Returns global device pointer
  !>   @param[out] bytes - Returns global size in bytes
  !>   @param[in] hmod - Module to retrieve global from
  !>   @param[in] name - Name of global to retrieve
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotFound`, `hipErrorInvalidContext`
  interface hipModuleGetGlobal
#ifdef USE_CUDA_NAMES
    function hipModuleGetGlobal_(dptr,bytes,hmod,name) bind(c, name="cudaModuleGetGlobal")
#else
    function hipModuleGetGlobal_(dptr,bytes,hmod,name) bind(c, name="hipModuleGetGlobal")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleGetGlobal_
      type(c_ptr) :: dptr
      integer(c_size_t) :: bytes
      type(c_ptr),value :: hmod
      type(c_ptr),value :: name
    end function
  end interface

  !>   @brief Gets device pointer associated with symbol on the device.
  !>
  !>   @param[out] devPtr - pointer to the device associated the symbole
  !>   @param[in] symbol - pointer to the symbole of the device
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGetSymbolAddress
#ifdef USE_CUDA_NAMES
    function hipGetSymbolAddress_(devPtr,symbol) bind(c, name="cudaGetSymbolAddress")
#else
    function hipGetSymbolAddress_(devPtr,symbol) bind(c, name="hipGetSymbolAddress")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetSymbolAddress_
      type(c_ptr) :: devPtr
      type(c_ptr),value :: symbol
    end function
  end interface

  !>   @brief Gets the size of the given symbol on the device.
  !>
  !>   @param[in] symbol - pointer to the device symbole
  !>   @param[out] mySize - pointer to the size
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGetSymbolSize
#ifdef USE_CUDA_NAMES
    function hipGetSymbolSize_(mySize,symbol) bind(c, name="cudaGetSymbolSize")
#else
    function hipGetSymbolSize_(mySize,symbol) bind(c, name="hipGetSymbolSize")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetSymbolSize_
      integer(c_size_t) :: mySize
      type(c_ptr),value :: symbol
    end function
  end interface

  !>   @brief Copies data to the given symbol on the device.
  !>  Symbol HIP APIs allow a kernel to define a device-side data symbol which can be accessed on
  !>  the host side. The symbol can be in __constant or device space.
  !>  Note that the symbol name needs to be encased in the HIP_SYMBOL macro.
  !>  This also applies to hipMemcpyFromSymbol, hipGetSymbolAddress, and hipGetSymbolSize.
  !>  For detailed usage, see the
  !>  <a
  !>  href="https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/hip_porting_guide.html#memcpytosymbol">memcpyToSymbol
  !>  example</a> in the HIP Porting Guide.
  !>
  !>
  !>   @param[out] symbol - pointer to the device symbole
  !>   @param[in] src - pointer to the source address
  !>   @param[in] sizeBytes - size in bytes to copy
  !>   @param[in] offset - offset in bytes from start of symbole
  !>   @param[in] myKind - type of memory transfer
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemcpyToSymbol
#ifdef USE_CUDA_NAMES
    function hipMemcpyToSymbol_(symbol,src,sizeBytes,offset,myKind) &
        bind(c, name="cudaMemcpyToSymbol")
#else
    function hipMemcpyToSymbol_(symbol,src,sizeBytes,offset,myKind) &
        bind(c, name="hipMemcpyToSymbol")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyToSymbol_
      type(c_ptr),value :: symbol
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>   @brief Copies data to the given symbol on the device asynchronously.
  !>
  !>   @param[out] symbol - pointer to the device symbole
  !>   @param[in] src - pointer to the source address
  !>   @param[in] sizeBytes - size in bytes to copy
  !>   @param[in] offset - offset in bytes from start of symbole
  !>   @param[in] myKind - type of memory transfer
  !>   @param[in] stream - stream identifier
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemcpyToSymbolAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyToSymbolAsync_(symbol,src,sizeBytes,offset,myKind,stream) &
        bind(c, name="cudaMemcpyToSymbolAsync")
#else
    function hipMemcpyToSymbolAsync_(symbol,src,sizeBytes,offset,myKind,stream) &
        bind(c, name="hipMemcpyToSymbolAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyToSymbolAsync_
      type(c_ptr),value :: symbol
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Copies data from the given symbol on the device.
  !>
  !>   @param[out] dst - Returns pointer to destinition memory address
  !>   @param[in] symbol - Pointer to the symbole address on the device
  !>   @param[in] sizeBytes - Size in bytes to copy
  !>   @param[in] offset - Offset in bytes from the start of symbole
  !>   @param[in] myKind - Type of memory transfer
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemcpyFromSymbol
#ifdef USE_CUDA_NAMES
    function hipMemcpyFromSymbol_(dst,symbol,sizeBytes,offset,myKind) &
        bind(c, name="cudaMemcpyFromSymbol")
#else
    function hipMemcpyFromSymbol_(dst,symbol,sizeBytes,offset,myKind) &
        bind(c, name="hipMemcpyFromSymbol")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyFromSymbol_
      type(c_ptr),value :: dst
      type(c_ptr),value :: symbol
      integer(c_size_t),value :: sizeBytes
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>   @brief Copies data from the given symbol on the device asynchronously.
  !>
  !>   @param[out] dst - Returns pointer to destinition memory address
  !>   @param[in] symbol - pointer to the symbole address on the device
  !>   @param[in] sizeBytes - size in bytes to copy
  !>   @param[in] offset - offset in bytes from the start of symbole
  !>   @param[in] myKind - type of memory transfer
  !>   @param[in] stream - stream identifier
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemcpyFromSymbolAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyFromSymbolAsync_(dst,symbol,sizeBytes,offset,myKind,stream) &
        bind(c, name="cudaMemcpyFromSymbolAsync")
#else
    function hipMemcpyFromSymbolAsync_(dst,symbol,sizeBytes,offset,myKind,stream) &
        bind(c, name="hipMemcpyFromSymbolAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyFromSymbolAsync_
      type(c_ptr),value :: dst
      type(c_ptr),value :: symbol
      integer(c_size_t),value :: sizeBytes
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the
  !>   constant
  !>  byte value value.
  !>
  !>   @param[out] dst - Data being filled
  !>   @param[in] myValue - Value to be set
  !>   @param[in] sizeBytes - Data size in bytes
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
  interface hipMemset
#ifdef USE_CUDA_NAMES
    function hipMemset_(dst,myValue,sizeBytes) bind(c, name="cudaMemset")
#else
    function hipMemset_(dst,myValue,sizeBytes) bind(c, name="hipMemset")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemset_
      type(c_ptr),value :: dst
      integer(c_int),value :: myValue
      integer(c_size_t),value :: sizeBytes
    end function
  end interface

  !>   @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the
  !>   constant
  !>  byte value value.
  !>
  !>   @param[out] dest - Data ptr to be filled
  !>   @param[in] myValue - Value to be set
  !>   @param[in] count - Number of values to be set
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
  interface hipMemsetD8
#ifdef USE_CUDA_NAMES
    function hipMemsetD8_(dest,myValue,count) bind(c, name="cudaMemsetD8")
#else
    function hipMemsetD8_(dest,myValue,count) bind(c, name="hipMemsetD8")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD8_
      type(c_ptr),value :: dest
      type(c_ptr),value :: myValue
      integer(c_size_t),value :: count
    end function
  end interface

  !>   @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the
  !>   constant
  !>  byte value value.
  !>
  !>  hipMemsetD8Async() is asynchronous with respect to the host, so the call may return before the
  !>  memset is complete. The operation can optionally be associated to a stream by passing a
  !>  non-zero
  !>  stream argument. If stream is non-zero, the operation may overlap with operations in other
  !>  streams.
  !>
  !>   @param[out] dest - Data ptr to be filled
  !>   @param[in] myValue - Constant value to be set
  !>   @param[in] count - Number of values to be set
  !>   @param[in] stream - Stream identifier
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
  interface hipMemsetD8Async
#ifdef USE_CUDA_NAMES
    function hipMemsetD8Async_(dest,myValue,count,stream) bind(c, name="cudaMemsetD8Async")
#else
    function hipMemsetD8Async_(dest,myValue,count,stream) bind(c, name="hipMemsetD8Async")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD8Async_
      type(c_ptr),value :: dest
      type(c_ptr),value :: myValue
      integer(c_size_t),value :: count
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the
  !>   constant
  !>  short value value.
  !>
  !>   @param[out] dest - Data ptr to be filled
  !>   @param[in] myValue - Constant value to be set
  !>   @param[in] count - Number of values to be set
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
  interface hipMemsetD16
#ifdef USE_CUDA_NAMES
    function hipMemsetD16_(dest,myValue,count) bind(c, name="cudaMemsetD16")
#else
    function hipMemsetD16_(dest,myValue,count) bind(c, name="hipMemsetD16")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD16_
      type(c_ptr),value :: dest
      integer(c_short),value :: myValue
      integer(c_size_t),value :: count
    end function
  end interface

  !>   @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the
  !>   constant
  !>  short value value.
  !>
  !>  hipMemsetD16Async() is asynchronous with respect to the host, so the call may return before
  !>  the
  !>  memset is complete. The operation can optionally be associated to a stream by passing a
  !>  non-zero
  !>  stream argument. If stream is non-zero, the operation may overlap with operations in other
  !>  streams.
  !>
  !>   @param[out] dest - Data ptr to be filled
  !>   @param[in] myValue - Constant value to be set
  !>   @param[in] count - Number of values to be set
  !>   @param[in] stream - Stream identifier
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
  interface hipMemsetD16Async
#ifdef USE_CUDA_NAMES
    function hipMemsetD16Async_(dest,myValue,count,stream) bind(c, name="cudaMemsetD16Async")
#else
    function hipMemsetD16Async_(dest,myValue,count,stream) bind(c, name="hipMemsetD16Async")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD16Async_
      type(c_ptr),value :: dest
      integer(c_short),value :: myValue
      integer(c_size_t),value :: count
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Fills the memory area pointed to by dest with the constant integer
  !>  value for specified number of times.
  !>
  !>   @param[out] dest - Data being filled
  !>   @param[in] myValue - Constant value to be set
  !>   @param[in] count - Number of values to be set
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
  interface hipMemsetD32
#ifdef USE_CUDA_NAMES
    function hipMemsetD32_(dest,myValue,count) bind(c, name="cudaMemsetD32")
#else
    function hipMemsetD32_(dest,myValue,count) bind(c, name="hipMemsetD32")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD32_
      type(c_ptr),value :: dest
      integer(c_int),value :: myValue
      integer(c_size_t),value :: count
    end function
  end interface

  !>   @brief Fills the first sizeBytes bytes of the memory area pointed to by dev with the constant
  !>  byte value value.
  !>
  !>  hipMemsetAsync() is asynchronous with respect to the host, so the call may return before the
  !>  memset is complete. The operation can optionally be associated to a stream by passing a
  !>  non-zero
  !>  stream argument. If stream is non-zero, the operation may overlap with operations in other
  !>  streams.
  !>
  !>   @param[out] dst - Pointer to device memory
  !>   @param[in] myValue - Value to set for each byte of specified memory
  !>   @param[in] sizeBytes - Size in bytes to set
  !>   @param[in] stream - Stream identifier
  !>   @return `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemsetAsync
#ifdef USE_CUDA_NAMES
    function hipMemsetAsync_(dst,myValue,sizeBytes,stream) bind(c, name="cudaMemsetAsync")
#else
    function hipMemsetAsync_(dst,myValue,sizeBytes,stream) bind(c, name="hipMemsetAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetAsync_
      type(c_ptr),value :: dst
      integer(c_int),value :: myValue
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Fills the memory area pointed to by dev with the constant integer
  !>  value for specified number of times.
  !>
  !>   hipMemsetD32Async() is asynchronous with respect to the host, so the call may return before
  !>   the
  !>  memset is complete. The operation can optionally be associated to a stream by passing a
  !>  non-zero
  !>  stream argument. If stream is non-zero, the operation may overlap with operations in other
  !>  streams.
  !>
  !>   @param[out] dst - Pointer to device memory
  !>   @param[in] myValue - Value to set for each byte of specified memory
  !>   @param[in] count - Number of values to be set
  !>   @param[in] stream - Stream identifier
  !>   @return `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemsetD32Async
#ifdef USE_CUDA_NAMES
    function hipMemsetD32Async_(dst,myValue,count,stream) bind(c, name="cudaMemsetD32Async")
#else
    function hipMemsetD32Async_(dst,myValue,count,stream) bind(c, name="hipMemsetD32Async")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD32Async_
      type(c_ptr),value :: dst
      integer(c_int),value :: myValue
      integer(c_size_t),value :: count
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Fills the memory area pointed to by dst with the constant value.
  !>
  !>   @param[out] dst - Pointer to 2D device memory
  !>   @param[in] pitch - Pitch size in bytes of 2D device memory, unused if height equals 1
  !>   @param[in] myValue - Constant value to set for each byte of specified memory
  !>   @param[in] width - Width size in bytes in 2D memory
  !>   @param[in] height - Height size in bytes in 2D memory
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemset2D
#ifdef USE_CUDA_NAMES
    function hipMemset2D_(dst,pitch,myValue,width,height) bind(c, name="cudaMemset2D")
#else
    function hipMemset2D_(dst,pitch,myValue,width,height) bind(c, name="hipMemset2D")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemset2D_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: pitch
      integer(c_int),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
    end function
  end interface

  !>   @brief Fills asynchronously the memory area pointed to by dst with the constant value.
  !>
  !>   @param[in] dst - Pointer to 2D device memory
  !>   @param[in] pitch - Pitch size in bytes of 2D device memory, unused if height equals 1
  !>   @param[in] myValue - Value to set for each byte of specified memory
  !>   @param[in] width - Width size in bytes in 2D memory
  !>   @param[in] height - Height size in bytes in 2D memory
  !>   @param[in] stream - Stream identifier
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemset2DAsync
#ifdef USE_CUDA_NAMES
    function hipMemset2DAsync_(dst,pitch,myValue,width,height,stream) &
        bind(c, name="cudaMemset2DAsync")
#else
    function hipMemset2DAsync_(dst,pitch,myValue,width,height,stream) &
        bind(c, name="hipMemset2DAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemset2DAsync_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: pitch
      integer(c_int),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Fills synchronously the memory area pointed to by pitchedDevPtr with the constant
  !>   value.
  !>
  !>   @param[in] pitchedDevPtr - Pointer to pitched device memory
  !>   @param[in] myValue - Value to set for each byte of specified memory
  !>   @param[in] extent - Size parameters for width field in bytes in device memory
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemset3D
#ifdef USE_CUDA_NAMES
    function hipMemset3D_(pitchedDevPtr,myValue,extent) bind(c, name="cudaMemset3D")
#else
    function hipMemset3D_(pitchedDevPtr,myValue,extent) bind(c, name="hipMemset3D")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemset3D_
      type(c_ptr),value :: pitchedDevPtr
      integer(c_int),value :: myValue
      type(c_ptr),value :: extent
    end function
  end interface

  !>   @brief Fills asynchronously the memory area pointed to by pitchedDevPtr with the constant
  !>   value.
  !>
  !>   @param[in] pitchedDevPtr - Pointer to pitched device memory
  !>   @param[in] myValue - Value to set for each byte of specified memory
  !>   @param[in] extent - Size parameters for width field in bytes in device memory
  !>   @param[in] stream - Stream identifier
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemset3DAsync
#ifdef USE_CUDA_NAMES
    function hipMemset3DAsync_(pitchedDevPtr,myValue,extent,stream) &
        bind(c, name="cudaMemset3DAsync")
#else
    function hipMemset3DAsync_(pitchedDevPtr,myValue,extent,stream) bind(c, name="hipMemset3DAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemset3DAsync_
      type(c_ptr),value :: pitchedDevPtr
      integer(c_int),value :: myValue
      type(c_ptr),value :: extent
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Query memory info.
  !>
  !>  On ROCM, this function gets the actual free memory left on the current device, so supports
  !>  the cases while running multi-workload (such as multiple processes, multiple threads, and
  !>  multiple GPUs).
  !>
  !>  @warning On Windows, the free memory only accounts for memory allocated by this process and
  !>  may
  !>  be optimistic.
  !>
  !>  @param[out] free - Returns free memory on the current device in bytes
  !>  @param[out] total - Returns total allocatable memory on the current device in bytes
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  interface hipMemGetInfo
#ifdef USE_CUDA_NAMES
    function hipMemGetInfo_(free,total) bind(c, name="cudaMemGetInfo")
#else
    function hipMemGetInfo_(free,total) bind(c, name="hipMemGetInfo")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetInfo_
      integer(c_size_t) :: free
      integer(c_size_t) :: total
    end function
  end interface

  !>  @brief Get allocated memory size via memory pointer.
  !>
  !>  This function gets the allocated shared virtual memory size from memory pointer.
  !>
  !>  @param[in] ptr - Pointer to allocated memory
  !>  @param[out] mySize - Returns the allocated memory size in bytes
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemPtrGetInfo
#ifdef USE_CUDA_NAMES
    function hipMemPtrGetInfo_(ptr,mySize) bind(c, name="cudaMemPtrGetInfo")
#else
    function hipMemPtrGetInfo_(ptr,mySize) bind(c, name="hipMemPtrGetInfo")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemPtrGetInfo_
      type(c_ptr),value :: ptr
      integer(c_size_t) :: mySize
    end function
  end interface

  !>   @brief Allocate an array on the device.
  !>
  !>   @param[out] array - Pointer to allocated array in device memory
  !>   @param[in] desc - Requested channel format
  !>   @param[in] width - Requested array allocation width
  !>   @param[in] height - Requested array allocation height
  !>   @param[in] flags - Requested properties of allocated array
  !>   @returns     `hipSuccess`, `hipErrorOutOfMemory`
  !>
  !>   @see hipMalloc, hipMallocPitch, hipFree, hipFreeArray, hipHostMalloc, hipHostFree
  interface hipMallocArray
#ifdef USE_CUDA_NAMES
    function hipMallocArray_(array,desc,width,height,flags) bind(c, name="cudaMallocArray")
#else
    function hipMallocArray_(array,desc,width,height,flags) bind(c, name="hipMallocArray")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMallocArray_
      type(c_ptr) :: array
      type(hipChannelFormatDesc) :: desc
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(c_int),value :: flags
    end function
  end interface

  !>   @brief Create an array memory pointer on the device.
  !>
  !>   @param[out] pHandle - Pointer to the array memory
  !>   @param[in] pAllocateArray - Requested array desciptor
  !>
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>   @see hipMallocArray, hipArrayDestroy, hipFreeArray
  interface hipArrayCreate
#ifdef USE_CUDA_NAMES
    function hipArrayCreate_(pHandle,pAllocateArray) bind(c, name="cudaArrayCreate")
#else
    function hipArrayCreate_(pHandle,pAllocateArray) bind(c, name="hipArrayCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipArrayCreate_
      type(c_ptr) :: pHandle
      type(HIP_ARRAY_DESCRIPTOR) :: pAllocateArray
    end function
  end interface

  !>   @brief Destroy an array memory pointer on the device.
  !>
  !>   @param[in] array - Pointer to the array memory
  !>
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipFreeArray
  interface hipArrayDestroy
#ifdef USE_CUDA_NAMES
    function hipArrayDestroy_(array) bind(c, name="cudaArrayDestroy")
#else
    function hipArrayDestroy_(array) bind(c, name="hipArrayDestroy")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipArrayDestroy_
      type(c_ptr),value :: array
    end function
  end interface

  !>   @brief Create a 3D array memory pointer on the device.
  !>
  !>   @param[out] array - Pointer to the 3D array memory
  !>   @param[in] pAllocateArray - Requested array desciptor
  !>
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>   @see hipMallocArray, hipArrayDestroy, hipFreeArray
  interface hipArray3DCreate
#ifdef USE_CUDA_NAMES
    function hipArray3DCreate_(array,pAllocateArray) bind(c, name="cudaArray3DCreate")
#else
    function hipArray3DCreate_(array,pAllocateArray) bind(c, name="hipArray3DCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipArray3DCreate_
      type(c_ptr) :: array
      type(HIP_ARRAY3D_DESCRIPTOR) :: pAllocateArray
    end function
  end interface

  !>   @brief Create a 3D memory pointer on the device.
  !>
  !>   @param[out] pitchedDevPtr - Pointer to the 3D memory
  !>   @param[in] extent - Requested extent
  !>
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>   @see hipMallocPitch, hipMemGetInfo, hipFree
  interface hipMalloc3D
#ifdef USE_CUDA_NAMES
    function hipMalloc3D_(pitchedDevPtr,extent) bind(c, name="cudaMalloc3D")
#else
    function hipMalloc3D_(pitchedDevPtr,extent) bind(c, name="hipMalloc3D")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMalloc3D_
      type(hipPitchedPtr) :: pitchedDevPtr
      type(c_ptr),value :: extent
    end function
  end interface

  !>   @brief Frees an array on the device.
  !>
  !>   @param[in] array - Pointer to array to free
  !>   @returns    `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`
  !>
  !>   @see hipMalloc, hipMallocPitch, hipFree, hipMallocArray, hipHostMalloc, hipHostFree
  interface hipFreeArray
#ifdef USE_CUDA_NAMES
    function hipFreeArray_(array) bind(c, name="cudaFreeArray")
#else
    function hipFreeArray_(array) bind(c, name="hipFreeArray")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipFreeArray_
      type(c_ptr),value :: array
    end function
  end interface

  !>  @brief Frees a mipmapped array on the device.
  !>
  !>  @param[in] mipmappedArray - Pointer to mipmapped array to free
  !>
  !>  @return `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipFreeMipmappedArray
#ifdef USE_CUDA_NAMES
    function hipFreeMipmappedArray_(mipmappedArray) bind(c, name="cudaFreeMipmappedArray")
#else
    function hipFreeMipmappedArray_(mipmappedArray) bind(c, name="hipFreeMipmappedArray")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipFreeMipmappedArray_
      type(c_ptr),value :: mipmappedArray
    end function
  end interface

  !>   @brief Allocate an array on the device.
  !>
  !>   @param[out] array - Pointer to allocated array in device memory
  !>   @param[in] desc - Requested channel format
  !>   @param[in] extent - Requested array allocation width, height and depth
  !>   @param[in] flags - Requested properties of allocated array
  !>   @returns     `hipSuccess`, `hipErrorOutOfMemory`
  !>
  !>   @see hipMalloc, hipMallocPitch, hipFree, hipFreeArray, hipHostMalloc, hipHostFree
  interface hipMalloc3DArray
#ifdef USE_CUDA_NAMES
    function hipMalloc3DArray_(array,desc,extent,flags) bind(c, name="cudaMalloc3DArray")
#else
    function hipMalloc3DArray_(array,desc,extent,flags) bind(c, name="hipMalloc3DArray")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMalloc3DArray_
      type(c_ptr) :: array
      type(hipChannelFormatDesc) :: desc
      type(c_ptr),value :: extent
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Allocate a mipmapped array on the device.
  !>
  !>  @param[out] mipmappedArray - Pointer to allocated mipmapped array in device memory
  !>  @param[in] desc - Requested channel format
  !>  @param[in] extent - Requested allocation size (width field in elements)
  !>  @param[in] numLevels - Number of mipmap levels to allocate
  !>  @param[in] flags - Flags for extensions
  !>
  !>  @return `hipSuccess`, `hipErrorInvalidValue`, `hipErrorMemoryAllocation`
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMallocMipmappedArray
#ifdef USE_CUDA_NAMES
    function hipMallocMipmappedArray_(mipmappedArray,desc,extent,numLevels,flags) &
        bind(c, name="cudaMallocMipmappedArray")
#else
    function hipMallocMipmappedArray_(mipmappedArray,desc,extent,numLevels,flags) &
        bind(c, name="hipMallocMipmappedArray")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMallocMipmappedArray_
      type(c_ptr) :: mipmappedArray
      type(hipChannelFormatDesc) :: desc
      type(c_ptr),value :: extent
      integer(c_int),value :: numLevels
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Gets a mipmap level of a HIP mipmapped array.
  !>
  !>  @param[out] levelArray - Returned mipmap level HIP array
  !>  @param[in] mipmappedArray - HIP mipmapped array
  !>  @param[in] level - Mipmap level
  !>
  !>  @return `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipGetMipmappedArrayLevel
#ifdef USE_CUDA_NAMES
    function hipGetMipmappedArrayLevel_(levelArray,mipmappedArray,level) &
        bind(c, name="cudaGetMipmappedArrayLevel")
#else
    function hipGetMipmappedArrayLevel_(levelArray,mipmappedArray,level) &
        bind(c, name="hipGetMipmappedArrayLevel")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetMipmappedArrayLevel_
      type(c_ptr) :: levelArray
      type(c_ptr),value :: mipmappedArray
      integer(c_int),value :: level
    end function
  end interface

  !>   @brief Copies memory for 2D arrays.
  !>   @param[in] pCopy - Parameters for the memory copy
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>   `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2D, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray,
  !>  hipMemcpyToSymbol, hipMemcpyAsync
  interface hipMemcpyParam2D
#ifdef USE_CUDA_NAMES
    function hipMemcpyParam2D_(pCopy) bind(c, name="cudaMemcpyParam2D")
#else
    function hipMemcpyParam2D_(pCopy) bind(c, name="hipMemcpyParam2D")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyParam2D_
      type(hip_Memcpy2D) :: pCopy
    end function
  end interface

  !>   @brief Copies memory for 2D arrays.
  !>   @param[in] pCopy - Parameters for the memory copy
  !>   @param[in] stream - Stream to use
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2D, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray,
  !>  hipMemcpyToSymbol, hipMemcpyAsync
  interface hipMemcpyParam2DAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyParam2DAsync_(pCopy,stream) bind(c, name="cudaMemcpyParam2DAsync")
#else
    function hipMemcpyParam2DAsync_(pCopy,stream) bind(c, name="hipMemcpyParam2DAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyParam2DAsync_
      type(hip_Memcpy2D) :: pCopy
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Copies data between host and device.
  !>
  !>   @param[in] dst - Destination memory address
  !>   @param[in] wOffset - Destination starting X offset
  !>   @param[in] hOffset - Destination starting Y offset
  !>   @param[in] src - Source memory address
  !>   @param[in] spitch - Pitch of source memory
  !>   @param[in] width - Width of matrix transfer (columns in bytes)
  !>   @param[in] height - Height of matrix transfer (rows)
  !>   @param[in] myKind - Type of transfer
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpyToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  interface hipMemcpy2DToArray
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DToArray_(dst,wOffset,hOffset,src,spitch,width,height,myKind) &
        bind(c, name="cudaMemcpy2DToArray")
#else
    function hipMemcpy2DToArray_(dst,wOffset,hOffset,src,spitch,width,height,myKind) &
        bind(c, name="hipMemcpy2DToArray")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DToArray_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      type(c_ptr),value :: src
      integer(c_size_t),value :: spitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>   @brief Copies data between host and device.
  !>
  !>   @param[in] dst - Destination memory address
  !>   @param[in] wOffset - Destination starting X offset
  !>   @param[in] hOffset - Destination starting Y offset
  !>   @param[in] src - Source memory address
  !>   @param[in] spitch - Pitch of source memory
  !>   @param[in] width - Width of matrix transfer (columns in bytes)
  !>   @param[in] height - Height of matrix transfer (rows)
  !>   @param[in] myKind - Type of transfer
  !>   @param[in] stream - Accelerator view which the copy is being enqueued
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpyToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  interface hipMemcpy2DToArrayAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DToArrayAsync_(dst,wOffset,hOffset,src,spitch,width,height,myKind,stream) &
        bind(c, name="cudaMemcpy2DToArrayAsync")
#else
    function hipMemcpy2DToArrayAsync_(dst,wOffset,hOffset,src,spitch,width,height,myKind,stream) &
        bind(c, name="hipMemcpy2DToArrayAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DToArrayAsync_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      type(c_ptr),value :: src
      integer(c_size_t),value :: spitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Copies data between host and device [Deprecated]
  !>
  !>   @ingroup MemoryD
  !>
  !>   @param[in] dst - Destination memory address
  !>   @param[in] wOffset - Destination starting X offset
  !>   @param[in] hOffset - Destination starting Y offset
  !>   @param[in] src - Source memory address
  !>   @param[in] count - size in bytes to copy
  !>   @param[in] myKind - Type of transfer
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>   hipMemcpyAsync
  !>   @warning  This API is deprecated.
  interface hipMemcpyToArray
#ifdef USE_CUDA_NAMES
    function hipMemcpyToArray_(dst,wOffset,hOffset,src,count,myKind) &
        bind(c, name="cudaMemcpyToArray")
#else
    function hipMemcpyToArray_(dst,wOffset,hOffset,src,count,myKind) &
        bind(c, name="hipMemcpyToArray")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyToArray_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      type(c_ptr),value :: src
      integer(c_size_t),value :: count
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>   @brief Copies data between host and device [Deprecated]
  !>
  !>   @ingroup MemoryD
  !>
  !>   @param[in] dst - Destination memory address
  !>   @param[in] srcArray - Source memory address
  !>   @param[in] wOffset - Source starting X offset
  !>   @param[in] hOffset - Source starting Y offset
  !>   @param[in] count - Size in bytes to copy
  !>   @param[in] myKind - Type of transfer
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  !>  @warning  This API is deprecated.
  interface hipMemcpyFromArray
#ifdef USE_CUDA_NAMES
    function hipMemcpyFromArray_(dst,srcArray,wOffset,hOffset,count,myKind) &
        bind(c, name="cudaMemcpyFromArray")
#else
    function hipMemcpyFromArray_(dst,srcArray,wOffset,hOffset,count,myKind) &
        bind(c, name="hipMemcpyFromArray")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyFromArray_
      type(c_ptr),value :: dst
      type(c_ptr),value :: srcArray
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      integer(c_size_t),value :: count
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>   @brief Copies data between host and device.
  !>
  !>   @param[in] dst - Destination memory address
  !>   @param[in] dpitch - Pitch of destination memory
  !>   @param[in] src - Source memory address
  !>   @param[in] wOffset - Source starting X offset
  !>   @param[in] hOffset - Source starting Y offset
  !>   @param[in] width - Width of matrix transfer (columns in bytes)
  !>   @param[in] height - Height of matrix transfer (rows)
  !>   @param[in] myKind - Type of transfer
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  interface hipMemcpy2DFromArray
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DFromArray_(dst,dpitch,src,wOffset,hOffset,width,height,myKind) &
        bind(c, name="cudaMemcpy2DFromArray")
#else
    function hipMemcpy2DFromArray_(dst,dpitch,src,wOffset,hOffset,width,height,myKind) &
        bind(c, name="hipMemcpy2DFromArray")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DFromArray_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dpitch
      type(c_ptr),value :: src
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>   @brief Copies data between host and device asynchronously.
  !>
  !>   @param[in] dst - Destination memory address
  !>   @param[in] dpitch - Pitch of destination memory
  !>   @param[in] src - Source memory address
  !>   @param[in] wOffset - Source starting X offset
  !>   @param[in] hOffset - Source starting Y offset
  !>   @param[in] width - Width of matrix transfer (columns in bytes)
  !>   @param[in] height - Height of matrix transfer (rows)
  !>   @param[in] myKind - Type of transfer
  !>   @param[in] stream - Accelerator view which the copy is being enqueued
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  interface hipMemcpy2DFromArrayAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DFromArrayAsync_(dst,dpitch,src,wOffset,hOffset,width,height,myKind,stream) &
        bind(c, name="cudaMemcpy2DFromArrayAsync")
#else
    function hipMemcpy2DFromArrayAsync_(dst,dpitch,src,wOffset,hOffset,width,height,myKind,stream) &
        bind(c, name="hipMemcpy2DFromArrayAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DFromArrayAsync_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dpitch
      type(c_ptr),value :: src
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Copies data between host and device.
  !>
  !>   @param[in] dst - Destination memory address
  !>   @param[in] srcArray - Source array
  !>   @param[in] srcOffset - Offset in bytes of source array
  !>   @param[in] count - Size of memory copy in bytes
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  interface hipMemcpyAtoH
#ifdef USE_CUDA_NAMES
    function hipMemcpyAtoH_(dst,srcArray,srcOffset,count) bind(c, name="cudaMemcpyAtoH")
#else
    function hipMemcpyAtoH_(dst,srcArray,srcOffset,count) bind(c, name="hipMemcpyAtoH")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyAtoH_
      type(c_ptr),value :: dst
      type(c_ptr),value :: srcArray
      integer(c_size_t),value :: srcOffset
      integer(c_size_t),value :: count
    end function
  end interface

  !>   @brief Copies data between host and device.
  !>
  !>   @param[in] dstArray - Destination memory address
  !>   @param[in] dstOffset - Offset in bytes of destination array
  !>   @param[in] srcHost - Source host pointer
  !>   @param[in] count - Size of memory copy in bytes
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  interface hipMemcpyHtoA
#ifdef USE_CUDA_NAMES
    function hipMemcpyHtoA_(dstArray,dstOffset,srcHost,count) bind(c, name="cudaMemcpyHtoA")
#else
    function hipMemcpyHtoA_(dstArray,dstOffset,srcHost,count) bind(c, name="hipMemcpyHtoA")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyHtoA_
      type(c_ptr),value :: dstArray
      integer(c_size_t),value :: dstOffset
      type(c_ptr),value :: srcHost
      integer(c_size_t),value :: count
    end function
  end interface

  !>   @brief Copies data between host and device.
  !>
  !>   @param[in] p - 3D memory copy parameters
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  interface hipMemcpy3D
#ifdef USE_CUDA_NAMES
    function hipMemcpy3D_(p) bind(c, name="cudaMemcpy3D")
#else
    function hipMemcpy3D_(p) bind(c, name="hipMemcpy3D")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3D_
      type(hipMemcpy3DParms) :: p
    end function
  end interface

  !>   @brief Copies data between host and device asynchronously.
  !>
  !>   @param[in] p - 3D memory copy parameters
  !>   @param[in] stream - Stream to use
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  interface hipMemcpy3DAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpy3DAsync_(p,stream) bind(c, name="cudaMemcpy3DAsync")
#else
    function hipMemcpy3DAsync_(p,stream) bind(c, name="hipMemcpy3DAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3DAsync_
      type(hipMemcpy3DParms) :: p
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Copies data between host and device.
  !>
  !>   @param[in] pCopy - 3D memory copy parameters
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>   `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  interface hipDrvMemcpy3D
#ifdef USE_CUDA_NAMES
    function hipDrvMemcpy3D_(pCopy) bind(c, name="cudaDrvMemcpy3D")
#else
    function hipDrvMemcpy3D_(pCopy) bind(c, name="hipDrvMemcpy3D")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemcpy3D_
      type(HIP_MEMCPY3D) :: pCopy
    end function
  end interface

  !>   @brief Copies data between host and device asynchronously.
  !>
  !>   @param[in] pCopy - 3D memory copy parameters
  !>   @param[in] stream - Stream to use
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>   `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  interface hipDrvMemcpy3DAsync
#ifdef USE_CUDA_NAMES
    function hipDrvMemcpy3DAsync_(pCopy,stream) bind(c, name="cudaDrvMemcpy3DAsync")
#else
    function hipDrvMemcpy3DAsync_(pCopy,stream) bind(c, name="hipDrvMemcpy3DAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemcpy3DAsync_
      type(HIP_MEMCPY3D) :: pCopy
      type(c_ptr),value :: stream
    end function
  end interface

  !> -------------------------------------------------------------------------------------------------
  !> -------------------------------------------------------------------------------------------------
  !>   @defgroup PeerToPeer PeerToPeer Device Memory Access
  !>
  !>   @ingroup API
  !>   This section describes the PeerToPeer device memory access functions of HIP runtime API.
  !>
  !>
  !>  @brief Determines if a device can access a peer device's memory.
  !>
  !>  @param [out] canAccessPeer - Returns the peer access capability (0 or 1)
  !>  @param [in] deviceId - The device accessing the peer device memory.
  !>  @param [in] peerDeviceId - Peer device where memory is physically located
  !>
  !>  The value of @p canAccessPeer,
  !>
  !>  Returns "1" if the specified @p deviceId is capable of directly accessing memory physically
  !>  located on @p peerDeviceId,
  !>
  !>  Returns "0" if the specified @p deviceId is not capable of directly accessing memory
  !>  physically
  !>  located on @p peerDeviceId.
  !>
  !>  Returns "0" if @p deviceId == @p peerDeviceId, both are valid devices,
  !>  however, a device is not a peer of itself.
  !>
  !>  Returns `hipErrorInvalidDevice` if deviceId or peerDeviceId are not valid devices
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`
  interface hipDeviceCanAccessPeer
#ifdef USE_CUDA_NAMES
    function hipDeviceCanAccessPeer_(canAccessPeer,deviceId,peerDeviceId) &
        bind(c, name="cudaDeviceCanAccessPeer")
#else
    function hipDeviceCanAccessPeer_(canAccessPeer,deviceId,peerDeviceId) &
        bind(c, name="hipDeviceCanAccessPeer")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceCanAccessPeer_
      type(c_ptr),value :: canAccessPeer
      integer(c_int),value :: deviceId
      integer(c_int),value :: peerDeviceId
    end function
  end interface

  !>  @brief Enables direct access to memory allocations on a peer device.
  !>
  !>  When this API is successful, all memory allocations on peer device will be mapped into the
  !>  address space of the current device. In addition, any future memory allocation on the
  !>  peer device will remain accessible from the current device, until the access is disabled using
  !>  hipDeviceDisablePeerAccess or device is reset using hipDeviceReset.
  !>
  !>  @param [in] peerDeviceId - Peer device to enable direct access to from the current device
  !>  @param [in] flags - Reserved for future use, must be zero
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`,
  !>  @returns `hipErrorPeerAccessAlreadyEnabled` if peer access is already enabled for this device.
  interface hipDeviceEnablePeerAccess
#ifdef USE_CUDA_NAMES
    function hipDeviceEnablePeerAccess_(peerDeviceId,flags) &
        bind(c, name="cudaDeviceEnablePeerAccess")
#else
    function hipDeviceEnablePeerAccess_(peerDeviceId,flags) &
        bind(c, name="hipDeviceEnablePeerAccess")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceEnablePeerAccess_
      integer(c_int),value :: peerDeviceId
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Disables direct access to memory allocations on a peer device.
  !>
  !>  If direct access to memory allocations on peer device has not been enabled yet from the
  !>  current
  !>  device, it returns `hipErrorPeerAccessNotEnabled`.
  !>
  !>  @param [in] peerDeviceId  Peer device to disable direct access to
  !>
  !>  @returns `hipSuccess`, `hipErrorPeerAccessNotEnabled`
  interface hipDeviceDisablePeerAccess
#ifdef USE_CUDA_NAMES
    function hipDeviceDisablePeerAccess_(peerDeviceId) bind(c, name="cudaDeviceDisablePeerAccess")
#else
    function hipDeviceDisablePeerAccess_(peerDeviceId) bind(c, name="hipDeviceDisablePeerAccess")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceDisablePeerAccess_
      integer(c_int),value :: peerDeviceId
    end function
  end interface

  !>  @brief Get information on memory allocations.
  !>
  !>  @param [out] pbase - BAse pointer address
  !>  @param [out] psize - Size of allocation
  !>  @param [in]  dptr- Device Pointer
  !>
  !>  @returns `hipSuccess`, `hipErrorNotFound`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  interface hipMemGetAddressRange
#ifdef USE_CUDA_NAMES
    function hipMemGetAddressRange_(pbase,psize,dptr) bind(c, name="cudaMemGetAddressRange")
#else
    function hipMemGetAddressRange_(pbase,psize,dptr) bind(c, name="hipMemGetAddressRange")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetAddressRange_
      type(c_ptr) :: pbase
      integer(c_size_t) :: psize
      type(c_ptr),value :: dptr
    end function
  end interface

  !>  @brief Copies memory between two peer accessible devices.
  !>
  !>  @param [out] dst - Destination device pointer
  !>  @param [in] dstDeviceId - Destination device
  !>  @param [in] src - Source device pointer
  !>  @param [in] srcDeviceId - Source device
  !>  @param [in] sizeBytes - Size of memory copy in bytes
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDevice`
  interface hipMemcpyPeer
#ifdef USE_CUDA_NAMES
    function hipMemcpyPeer_(dst,dstDeviceId,src,srcDeviceId,sizeBytes) &
        bind(c, name="cudaMemcpyPeer")
#else
    function hipMemcpyPeer_(dst,dstDeviceId,src,srcDeviceId,sizeBytes) bind(c, name="hipMemcpyPeer")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyPeer_
      type(c_ptr),value :: dst
      integer(c_int),value :: dstDeviceId
      type(c_ptr),value :: src
      integer(c_int),value :: srcDeviceId
      integer(c_size_t),value :: sizeBytes
    end function
  end interface

  !>  @brief Copies memory between two peer accessible devices asynchronously.
  !>
  !>  @param [out] dst - Destination device pointer
  !>  @param [in] dstDeviceId - Destination device
  !>  @param [in] src - Source device pointer
  !>  @param [in] srcDevice - Source device
  !>  @param [in] sizeBytes - Size of memory copy in bytes
  !>  @param [in] stream - Stream identifier
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDevice`
  interface hipMemcpyPeerAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyPeerAsync_(dst,dstDeviceId,src,srcDevice,sizeBytes,stream) &
        bind(c, name="cudaMemcpyPeerAsync")
#else
    function hipMemcpyPeerAsync_(dst,dstDeviceId,src,srcDevice,sizeBytes,stream) &
        bind(c, name="hipMemcpyPeerAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyPeerAsync_
      type(c_ptr),value :: dst
      integer(c_int),value :: dstDeviceId
      type(c_ptr),value :: src
      integer(c_int),value :: srcDevice
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Create a context and set it as current/default context
  !>
  !>  @param [out] ctx  Context to create
  !>  @param [in] flags  Context creation flags
  !>  @param [in] device  device handle
  !>
  !>  @returns `hipSuccess`
  !>
  !>  @see hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent, hipCtxPushCurrent,
  !>  hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxCreate
#ifdef USE_CUDA_NAMES
    function hipCtxCreate_(ctx,flags,device) bind(c, name="cudaCtxCreate")
#else
    function hipCtxCreate_(ctx,flags,device) bind(c, name="hipCtxCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxCreate_
      type(c_ptr) :: ctx
      integer(c_int),value :: flags
      integer(c_int),value :: device
    end function
  end interface

  !>  @brief Destroy a HIP context [Deprecated]
  !>
  !>  @param [in] ctx Context to destroy
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @see hipCtxCreate, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,hipCtxSetCurrent,
  !>  hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize , hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxDestroy
#ifdef USE_CUDA_NAMES
    function hipCtxDestroy_(ctx) bind(c, name="cudaCtxDestroy")
#else
    function hipCtxDestroy_(ctx) bind(c, name="hipCtxDestroy")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxDestroy_
      type(c_ptr),value :: ctx
    end function
  end interface

  !>  @brief Pop the current/default context and return the popped context [Deprecated]
  !>
  !>  @param [out] ctx  The current context to pop
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidContext`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxSetCurrent, hipCtxGetCurrent,
  !>  hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxPopCurrent
#ifdef USE_CUDA_NAMES
    function hipCtxPopCurrent_(ctx) bind(c, name="cudaCtxPopCurrent")
#else
    function hipCtxPopCurrent_(ctx) bind(c, name="hipCtxPopCurrent")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxPopCurrent_
      type(c_ptr) :: ctx
    end function
  end interface

  !>  @brief Push the context to be set as current/ default context [Deprecated]
  !>
  !>  @param [in] ctx  The current context to push
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidContext`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize , hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxPushCurrent
#ifdef USE_CUDA_NAMES
    function hipCtxPushCurrent_(ctx) bind(c, name="cudaCtxPushCurrent")
#else
    function hipCtxPushCurrent_(ctx) bind(c, name="hipCtxPushCurrent")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxPushCurrent_
      type(c_ptr),value :: ctx
    end function
  end interface

  !>  @brief Set the passed context as current/default [Deprecated]
  !>
  !>  @param [in] ctx The context to set as current
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidContext`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize , hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxSetCurrent
#ifdef USE_CUDA_NAMES
    function hipCtxSetCurrent_(ctx) bind(c, name="cudaCtxSetCurrent")
#else
    function hipCtxSetCurrent_(ctx) bind(c, name="hipCtxSetCurrent")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxSetCurrent_
      type(c_ptr),value :: ctx
    end function
  end interface

  !>  @brief Get the handle of the current/ default context [Deprecated]
  !>
  !>  @param [out] ctx  The context to get as current
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidContext`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetDevice, hipCtxGetFlags, hipCtxPopCurrent,
  !>  hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxGetCurrent
#ifdef USE_CUDA_NAMES
    function hipCtxGetCurrent_(ctx) bind(c, name="cudaCtxGetCurrent")
#else
    function hipCtxGetCurrent_(ctx) bind(c, name="hipCtxGetCurrent")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetCurrent_
      type(c_ptr) :: ctx
    end function
  end interface

  !>  @brief Get the handle of the device associated with current/default context [Deprecated]
  !>
  !>  @param [out] device The device from the current context
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidContext`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxGetDevice
#ifdef USE_CUDA_NAMES
    function hipCtxGetDevice_(device) bind(c, name="cudaCtxGetDevice")
#else
    function hipCtxGetDevice_(device) bind(c, name="hipCtxGetDevice")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetDevice_
      integer(c_int) :: device
    end function
  end interface

  !>  @brief Returns the approximate HIP api version.
  !>
  !>  @param [in]  ctx Context to check [Deprecated]
  !>  @param [out] apiVersion API version to get
  !>
  !>  @returns `hipSuccess`
  !>
  !>  @warning The HIP feature set does not correspond to an exact CUDA SDK api revision.
  !>  This function always set *apiVersion to 4 as an approximation though HIP supports
  !>  some features which were introduced in later CUDA SDK revisions.
  !>  HIP apps code should not rely on the api revision number here and should
  !>  use arch feature flags to test device capabilities or conditional compilation.
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetDevice, hipCtxGetFlags, hipCtxPopCurrent,
  !>  hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxGetApiVersion
#ifdef USE_CUDA_NAMES
    function hipCtxGetApiVersion_(ctx,apiVersion) bind(c, name="cudaCtxGetApiVersion")
#else
    function hipCtxGetApiVersion_(ctx,apiVersion) bind(c, name="hipCtxGetApiVersion")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetApiVersion_
      type(c_ptr),value :: ctx
      type(c_ptr),value :: apiVersion
    end function
  end interface

  !>  @brief Get Cache configuration for a specific function [Deprecated]
  !>
  !>  @param [out] cacheConfig  Cache configuration
  !>
  !>  @returns `hipSuccess`
  !>
  !>  @warning AMD devices and some Nvidia GPUS do not support reconfigurable cache.  This hint is
  !>  ignored on those architectures.
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxGetCacheConfig
#ifdef USE_CUDA_NAMES
    function hipCtxGetCacheConfig_(cacheConfig) bind(c, name="cudaCtxGetCacheConfig")
#else
    function hipCtxGetCacheConfig_(cacheConfig) bind(c, name="hipCtxGetCacheConfig")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetCacheConfig_
      type(c_ptr),value :: cacheConfig
    end function
  end interface

  !>  @brief Set L1/Shared cache partition [Deprecated]
  !>
  !>  @param [in] cacheConfig  Cache configuration to set
  !>
  !>  @return `hipSuccess`
  !>
  !>  @warning AMD devices and some Nvidia GPUS do not support reconfigurable cache.  This hint is
  !>  ignored on those architectures.
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxSetCacheConfig
#ifdef USE_CUDA_NAMES
    function hipCtxSetCacheConfig_(cacheConfig) bind(c, name="cudaCtxSetCacheConfig")
#else
    function hipCtxSetCacheConfig_(cacheConfig) bind(c, name="hipCtxSetCacheConfig")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxSetCacheConfig_
      integer(kind(hipFuncCachePreferNone)),value :: cacheConfig
    end function
  end interface

  !>  @brief Set Shared memory bank configuration  [Deprecated]
  !>
  !>  @param [in] config  Shared memory configuration to set
  !>
  !>  @return `hipSuccess`
  !>
  !>  @warning AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !>  ignored on those architectures.
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxSetSharedMemConfig
#ifdef USE_CUDA_NAMES
    function hipCtxSetSharedMemConfig_(config) bind(c, name="cudaCtxSetSharedMemConfig")
#else
    function hipCtxSetSharedMemConfig_(config) bind(c, name="hipCtxSetSharedMemConfig")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxSetSharedMemConfig_
      integer(kind(hipSharedMemBankSizeDefault)),value :: config
    end function
  end interface

  !>  @brief Get Shared memory bank configuration [Deprecated]
  !>
  !>  @param [out] pConfig  Pointer of shared memory configuration
  !>
  !>  @return `hipSuccess`
  !>
  !>  @warning AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !>  ignored on those architectures.
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxGetSharedMemConfig
#ifdef USE_CUDA_NAMES
    function hipCtxGetSharedMemConfig_(pConfig) bind(c, name="cudaCtxGetSharedMemConfig")
#else
    function hipCtxGetSharedMemConfig_(pConfig) bind(c, name="hipCtxGetSharedMemConfig")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetSharedMemConfig_
      type(c_ptr),value :: pConfig
    end function
  end interface

  !>  @brief Blocks until the default context has completed all preceding requested tasks
  !>  [Deprecated]
  !>
  !>  @return `hipSuccess`
  !>
  !>  @warning This function waits for all streams on the default context to complete execution, and
  !>  then returns.
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxSynchronize
#ifdef USE_CUDA_NAMES
    function hipCtxSynchronize_() bind(c, name="cudaCtxSynchronize")
#else
    function hipCtxSynchronize_() bind(c, name="hipCtxSynchronize")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxSynchronize_
    end function
  end interface

  !>  @brief Return flags used for creating default context [Deprecated]
  !>
  !>  @param [out] flags  Pointer of flags
  !>
  !>  @returns `hipSuccess`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxPopCurrent, hipCtxGetCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxGetFlags
#ifdef USE_CUDA_NAMES
    function hipCtxGetFlags_(flags) bind(c, name="cudaCtxGetFlags")
#else
    function hipCtxGetFlags_(flags) bind(c, name="hipCtxGetFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetFlags_
      type(c_ptr),value :: flags
    end function
  end interface

  !>  @brief Enables direct access to memory allocations in a peer context [Deprecated]
  !>
  !>  Memory which already allocated on peer device will be mapped into the address space of the
  !>  current device. In addition, all future memory allocations on peerDeviceId will be mapped into
  !>  the address space of the current device when the memory is allocated. The peer memory remains
  !>  accessible from the current device until a call to hipDeviceDisablePeerAccess or
  !>  hipDeviceReset.
  !>
  !>
  !>  @param [in] peerCtx  Peer context
  !>  @param [in] flags  flags, need to set as 0
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`,
  !>  `hipErrorPeerAccessAlreadyEnabled`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>  @warning PeerToPeer support is experimental.
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxEnablePeerAccess
#ifdef USE_CUDA_NAMES
    function hipCtxEnablePeerAccess_(peerCtx,flags) bind(c, name="cudaCtxEnablePeerAccess")
#else
    function hipCtxEnablePeerAccess_(peerCtx,flags) bind(c, name="hipCtxEnablePeerAccess")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxEnablePeerAccess_
      type(c_ptr),value :: peerCtx
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Disable direct access from current context's virtual address space to memory
  !>  allocations
  !>  physically located on a peer context.Disables direct access to memory allocations in a peer
  !>  context and unregisters any registered allocations [Deprecated]
  !>
  !>  Returns `hipErrorPeerAccessNotEnabled` if direct access to memory on peerDevice has not yet
  !>  been
  !>  enabled from the current device.
  !>
  !>  @param [in] peerCtx  Peer context to be disabled
  !>
  !>  @returns `hipSuccess`, `hipErrorPeerAccessNotEnabled`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>  @warning PeerToPeer support is experimental.
  !>
  !>  @warning This API is deprecated on the AMD platform, only for equivalent cuCtx driver API on
  !>  the
  !>  NVIDIA platform.
  interface hipCtxDisablePeerAccess
#ifdef USE_CUDA_NAMES
    function hipCtxDisablePeerAccess_(peerCtx) bind(c, name="cudaCtxDisablePeerAccess")
#else
    function hipCtxDisablePeerAccess_(peerCtx) bind(c, name="hipCtxDisablePeerAccess")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipCtxDisablePeerAccess_
      type(c_ptr),value :: peerCtx
    end function
  end interface

  !>  @brief Get the state of the primary context [Deprecated]
  !>
  !>  @param [in] dev  Device to get primary context flags for
  !>  @param [out] flags  Pointer to store flags
  !>  @param [out] active  Pointer to store context state; 0 = inactive, 1 = active
  !>
  !>  @returns `hipSuccess`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
  !>  NVIDIA platform.
  interface hipDevicePrimaryCtxGetState
#ifdef USE_CUDA_NAMES
    function hipDevicePrimaryCtxGetState_(dev,flags,active) &
        bind(c, name="cudaDevicePrimaryCtxGetState")
#else
    function hipDevicePrimaryCtxGetState_(dev,flags,active) &
        bind(c, name="hipDevicePrimaryCtxGetState")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxGetState_
      integer(c_int),value :: dev
      type(c_ptr),value :: flags
      type(c_ptr),value :: active
    end function
  end interface

  !>  @brief Release the primary context on the GPU.
  !>
  !>  @param [in] dev  Device which primary context is released [Deprecated]
  !>
  !>  @returns `hipSuccess`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>  @warning This function return `hipSuccess` though doesn't release the primaryCtx by design on
  !>  HIP/HIP-CLANG path.
  !>
  !>  @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
  !>  NVIDIA platform.
  interface hipDevicePrimaryCtxRelease
#ifdef USE_CUDA_NAMES
    function hipDevicePrimaryCtxRelease_(dev) bind(c, name="cudaDevicePrimaryCtxRelease")
#else
    function hipDevicePrimaryCtxRelease_(dev) bind(c, name="hipDevicePrimaryCtxRelease")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxRelease_
      integer(c_int),value :: dev
    end function
  end interface

  !>  @brief Retain the primary context on the GPU [Deprecated]
  !>
  !>  @param [out] pctx  Returned context handle of the new context
  !>  @param [in] dev  Device which primary context is released
  !>
  !>  @returns `hipSuccess`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
  !>  NVIDIA platform.
  interface hipDevicePrimaryCtxRetain
#ifdef USE_CUDA_NAMES
    function hipDevicePrimaryCtxRetain_(pctx,dev) bind(c, name="cudaDevicePrimaryCtxRetain")
#else
    function hipDevicePrimaryCtxRetain_(pctx,dev) bind(c, name="hipDevicePrimaryCtxRetain")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxRetain_
      type(c_ptr) :: pctx
      integer(c_int),value :: dev
    end function
  end interface

  !>  @brief Resets the primary context on the GPU [Deprecated]
  !>
  !>  @param [in] dev  Device which primary context is reset
  !>
  !>  @returns `hipSuccess`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
  !>  NVIDIA platform.
  interface hipDevicePrimaryCtxReset
#ifdef USE_CUDA_NAMES
    function hipDevicePrimaryCtxReset_(dev) bind(c, name="cudaDevicePrimaryCtxReset")
#else
    function hipDevicePrimaryCtxReset_(dev) bind(c, name="hipDevicePrimaryCtxReset")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxReset_
      integer(c_int),value :: dev
    end function
  end interface

  !>  @brief Set flags for the primary context [Deprecated]
  !>
  !>  @param [in] dev  Device for which the primary context flags are set
  !>  @param [in] flags  New flags for the device
  !>
  !>  @returns `hipSuccess`, `hipErrorContextAlreadyInUse`
  !>
  !>  @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>  hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>
  !>  @warning  This API is deprecated on the AMD platform, only for equivalent driver API on the
  !>  NVIDIA platform.
  interface hipDevicePrimaryCtxSetFlags
#ifdef USE_CUDA_NAMES
    function hipDevicePrimaryCtxSetFlags_(dev,flags) bind(c, name="cudaDevicePrimaryCtxSetFlags")
#else
    function hipDevicePrimaryCtxSetFlags_(dev,flags) bind(c, name="hipDevicePrimaryCtxSetFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxSetFlags_
      integer(c_int),value :: dev
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Loads code object from file into a module the currrent context.
  !>
  !>  @param [in] fname  Filename of code object to load
  !>
  !>  @param [out] module  Module
  !>
  !>  @warning File/memory resources allocated in this function are released only in
  !>  hipModuleUnload.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`,
  !>  `hipErrorFileNotFound`,
  !>  `hipErrorOutOfMemory`, `hipErrorSharedObjectInitFailed`, `hipErrorNotInitialized`
  interface hipModuleLoad
#ifdef USE_CUDA_NAMES
    function hipModuleLoad_(myModule,fname) bind(c, name="cudaModuleLoad")
#else
    function hipModuleLoad_(myModule,fname) bind(c, name="hipModuleLoad")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoad_
      type(c_ptr) :: myModule
      type(c_ptr),value :: fname
    end function
  end interface

  !>  @brief Frees the module
  !>
  !>  @param [in] module  Module to free
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidResourceHandle`
  !>
  !>  The module is freed, and the code objects associated with it are destroyed.
  interface hipModuleUnload
#ifdef USE_CUDA_NAMES
    function hipModuleUnload_(myModule) bind(c, name="cudaModuleUnload")
#else
    function hipModuleUnload_(myModule) bind(c, name="hipModuleUnload")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleUnload_
      type(c_ptr),value :: myModule
    end function
  end interface

  !>  @brief Function with kname will be extracted if present in module
  !>
  !>  @param [in] module  Module to get function from
  !>  @param [in] kname  Pointer to the name of function
  !>  @param [out] function  Pointer to function handle
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`,
  !>  `hipErrorNotInitialized`,
  !>  `hipErrorNotFound`,
  interface hipModuleGetFunction
#ifdef USE_CUDA_NAMES
    function hipModuleGetFunction_(myFunction,myModule,kname) bind(c, name="cudaModuleGetFunction")
#else
    function hipModuleGetFunction_(myFunction,myModule,kname) bind(c, name="hipModuleGetFunction")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleGetFunction_
      type(c_ptr) :: myFunction
      type(c_ptr),value :: myModule
      type(c_ptr),value :: kname
    end function
  end interface

  !>  @brief Find out attributes for a given function.
  !>  @ingroup Execution
  !>  @param [out] attr  Attributes of funtion
  !>  @param [in] func  Pointer to the function handle
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDeviceFunction`
  interface hipFuncGetAttributes
#ifdef USE_CUDA_NAMES
    function hipFuncGetAttributes_(attr,func) bind(c, name="cudaFuncGetAttributes")
#else
    function hipFuncGetAttributes_(attr,func) bind(c, name="hipFuncGetAttributes")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipFuncGetAttributes_
      type(hipFuncAttributes) :: attr
      type(c_ptr),value :: func
    end function
  end interface

  !>  @brief Find out a specific attribute for a given function.
  !>  @ingroup Execution
  !>  @param [out] value  Pointer to the value
  !>  @param [in]  attrib  Attributes of the given funtion
  !>  @param [in]  hfunc  Function to get attributes from
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDeviceFunction`
  interface hipFuncGetAttribute
#ifdef USE_CUDA_NAMES
    function hipFuncGetAttribute_(myValue,attrib,hfunc) bind(c, name="cudaFuncGetAttribute")
#else
    function hipFuncGetAttribute_(myValue,attrib,hfunc) bind(c, name="hipFuncGetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipFuncGetAttribute_
      type(c_ptr),value :: myValue
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)),value :: attrib
      type(c_ptr),value :: hfunc
    end function
  end interface

  !>  @brief returns the handle of the texture reference with the name from the module.
  !>
  !>  @param [in] hmod  Module
  !>  @param [in] name  Pointer of name of texture reference
  !>  @param [out] texRef  Pointer of texture reference
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorNotFound`, `hipErrorInvalidValue`
  interface hipModuleGetTexRef
#ifdef USE_CUDA_NAMES
    function hipModuleGetTexRef_(texRef,hmod,name) bind(c, name="cudaModuleGetTexRef")
#else
    function hipModuleGetTexRef_(texRef,hmod,name) bind(c, name="hipModuleGetTexRef")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleGetTexRef_
      type(c_ptr) :: texRef
      type(c_ptr),value :: hmod
      type(c_ptr),value :: name
    end function
  end interface

  !>  @brief builds module from code object data which resides in host memory.
  !>
  !>  The "image" is a pointer to the location of code object data. This data can be either
  !>  a single code object or a fat binary (fatbin), which serves as the entry point for loading and
  !>  launching device-specific kernel executions.
  !>
  !>  By default, the following command generates a fatbin:
  !>
  !>  "amdclang++ -O3 -c --offload-device-only --offload-arch=<GPU_ARCH> <input_file> -o
  !>  <output_file>"
  !>
  !>  For more details, refer to:
  !>  <a
  !>  href=
  !>  "https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/kernel_language_cpp_support.html#kernel-compilation">
  !>  Kernel Compilation</a> in the HIP kernel language C++ support, or
  !>  <a
  !>  href="https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/hip_rtc.html">HIP runtime
  !>  compilation (HIP RTC)</a>.
  !>
  !>  @param [in] image  The pointer to the location of data
  !>  @param [out] module  Retuned module
  !>
  !>  @returns hipSuccess, hipErrorNotInitialized, hipErrorOutOfMemory, hipErrorNotInitialized
  interface hipModuleLoadData
#ifdef USE_CUDA_NAMES
    function hipModuleLoadData_(myModule,image) bind(c, name="cudaModuleLoadData")
#else
    function hipModuleLoadData_(myModule,image) bind(c, name="hipModuleLoadData")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoadData_
      type(c_ptr) :: myModule
      type(c_ptr),value :: image
    end function
  end interface

  !>  @brief builds module from code object which resides in host memory. Image is pointer to that
  !>  location. Options are not used. hipModuleLoadData is called.
  !>
  !>  @param [in] image  The pointer to the location of data
  !>  @param [out] module  Retuned module
  !>  @param [in] numOptions Number of options
  !>  @param [in] options Options for JIT
  !>  @param [in] optionValues  Option values for JIT
  !>
  !>  @returns hipSuccess, hipErrorNotInitialized, hipErrorOutOfMemory, hipErrorNotInitialized
  interface hipModuleLoadDataEx
#ifdef USE_CUDA_NAMES
    function hipModuleLoadDataEx_(myModule,image,numOptions,options,optionValues) &
        bind(c, name="cudaModuleLoadDataEx")
#else
    function hipModuleLoadDataEx_(myModule,image,numOptions,options,optionValues) &
        bind(c, name="hipModuleLoadDataEx")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoadDataEx_
      type(c_ptr) :: myModule
      type(c_ptr),value :: image
      integer(c_int),value :: numOptions
      type(c_ptr),value :: options
      type(c_ptr) :: optionValues
    end function
  end interface

  !>  @brief launches kernel f with launch parameters and shared memory on stream with arguments
  !>  passed
  !>  to kernelparams or extra
  !>  @ingroup Execution
  !>  @param [in] f         Kernel to launch.
  !>  @param [in] gridDimX  X grid dimension specified as multiple of blockDimX.
  !>  @param [in] gridDimY  Y grid dimension specified as multiple of blockDimY.
  !>  @param [in] gridDimZ  Z grid dimension specified as multiple of blockDimZ.
  !>  @param [in] blockDimX X block dimensions specified in work-items
  !>  @param [in] blockDimY Y grid dimension specified in work-items
  !>  @param [in] blockDimZ Z grid dimension specified in work-items
  !>  @param [in] sharedMemBytes Amount of dynamic shared memory to allocate for this kernel. The
  !>  HIP-Clang compiler provides support for extern shared declarations.
  !>  @param [in] stream Stream where the kernel should be dispatched. May be 0, in which case th
  !>  default stream is used with associated synchronization rules.
  !>  @param [in] kernelParams  Kernel parameters to launch
  !>  @param [in] extra Pointer to kernel arguments. These are passed directly to the kernel and
  !>  must be in the memory layout and alignment expected by the kernel.
  !>  All passed arguments must be naturally aligned according to their type. The memory address of
  !>  each argument should be a multiple of its size in bytes. Please refer to
  !>  hip_porting_driver_api.md for sample usage.
  !>
  !>  Please note, HIP does not support kernel launch with total work items defined in dimension
  !>  with
  !>  size gridDim x blockDim >= 2^32. So gridDim.x * blockDim.x, gridDim.y * blockDim.y
  !>  and gridDim.z * blockDim.z are always less than 2^32.
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`
  interface hipModuleLaunchKernel
#ifdef USE_CUDA_NAMES
    function hipModuleLaunchKernel_(f,gridDimX,gridDimY,gridDimZ,blockDimX,blockDimY,blockDimZ, &
        sharedMemBytes,stream,kernelParams,extra) &
        bind(c, name="cudaModuleLaunchKernel")
#else
    function hipModuleLaunchKernel_(f,gridDimX,gridDimY,gridDimZ,blockDimX,blockDimY,blockDimZ, &
        sharedMemBytes,stream,kernelParams,extra) &
        bind(c, name="hipModuleLaunchKernel")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLaunchKernel_
      type(c_ptr),value :: f
      integer(c_int),value :: gridDimX
      integer(c_int),value :: gridDimY
      integer(c_int),value :: gridDimZ
      integer(c_int),value :: blockDimX
      integer(c_int),value :: blockDimY
      integer(c_int),value :: blockDimZ
      integer(c_int),value :: sharedMemBytes
      type(c_ptr),value :: stream
      type(c_ptr) :: kernelParams
      type(c_ptr) :: extra
    end function
  end interface

  !>  @brief Launches kernel f with launch parameters and shared memory on stream with arguments
  !>  passed
  !>  to kernelparams or extra, where thread blocks can cooperate and synchronize as they execute.
  !>
  !>  @param [in] f - Kernel to launch.
  !>  @param [in] gridDim - Grid dimensions specified as multiple of blockDim.
  !>  @param [in] blockDimX - Block dimensions specified in work-items
  !>  @param [in] kernelParams - Pointer of arguments passed to the kernel. If the kernel has
  !>  multiple
  !>  parameters, 'kernelParams' should be array of pointers, each points the corresponding
  !>  argument.
  !>  @param [in] sharedMemBytes - Amount of dynamic shared memory to allocate for this kernel. The
  !>  HIP-Clang compiler provides support for extern shared declarations.
  !>  @param [in] stream - Stream where the kernel should be dispatched.  May be 0, in which case th
  !>  default stream is used with associated synchronization rules.
  !>
  !>  Please note, HIP does not support kernel launch with total work items defined in dimension
  !>  with
  !>  size \f$ gridDim \cdot blockDim &ge; 2^{32} \f$.
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`,
  !>  `hipErrorCooperativeLaunchTooLarge`
  interface hipLaunchCooperativeKernel
#ifdef USE_CUDA_NAMES
    function hipLaunchCooperativeKernel_(f,gridDim,blockDimX,kernelParams,sharedMemBytes,stream) &
        bind(c, name="cudaLaunchCooperativeKernel")
#else
    function hipLaunchCooperativeKernel_(f,gridDim,blockDimX,kernelParams,sharedMemBytes,stream) &
        bind(c, name="hipLaunchCooperativeKernel")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchCooperativeKernel_
      type(c_ptr),value :: f
      type(c_ptr),value :: gridDim
      type(c_ptr),value :: blockDimX
      type(c_ptr) :: kernelParams
      integer(c_int),value :: sharedMemBytes
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Launches kernels on multiple devices where thread blocks can cooperate and
  !>  synchronize as they execute.
  !>
  !>  @param [in] launchParamsList         List of launch parameters, one per device.
  !>  @param [in] numDevices               Size of the launchParamsList array.
  !>  @param [in] flags                    Flags to control launch behavior.
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`,
  !>   `hipErrorCooperativeLaunchTooLarge`
  interface hipLaunchCooperativeKernelMultiDevice
#ifdef USE_CUDA_NAMES
    function hipLaunchCooperativeKernelMultiDevice_(launchParamsList,numDevices,flags) &
        bind(c, name="cudaLaunchCooperativeKernelMultiDevice")
#else
    function hipLaunchCooperativeKernelMultiDevice_(launchParamsList,numDevices,flags) &
        bind(c, name="hipLaunchCooperativeKernelMultiDevice")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchCooperativeKernelMultiDevice_
      type(hipLaunchParams) :: launchParamsList
      integer(c_int),value :: numDevices
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Launches kernels on multiple devices and guarantees all specified kernels are
  !>  dispatched
  !>  on respective streams before enqueuing any other work on the specified streams from any other
  !>  threads
  !>  @ingroup Execution
  !>  @param [in] launchParamsList          List of launch parameters, one per device.
  !>  @param [in] numDevices               Size of the launchParamsList array.
  !>  @param [in] flags                    Flags to control launch behavior.
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`
  interface hipExtLaunchMultiKernelMultiDevice
#ifdef USE_CUDA_NAMES
    function hipExtLaunchMultiKernelMultiDevice_(launchParamsList,numDevices,flags) &
        bind(c, name="cudaExtLaunchMultiKernelMultiDevice")
#else
    function hipExtLaunchMultiKernelMultiDevice_(launchParamsList,numDevices,flags) &
        bind(c, name="hipExtLaunchMultiKernelMultiDevice")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipExtLaunchMultiKernelMultiDevice_
      type(hipLaunchParams) :: launchParamsList
      integer(c_int),value :: numDevices
      integer(c_int),value :: flags
    end function
  end interface

  !> -------------------------------------------------------------------------------------------------
  !> -------------------------------------------------------------------------------------------------
  !>   @defgroup Occupancy Occupancy
  !>
  !>   This section describes the occupancy functions of HIP runtime API.
  !>
  !>
  !>
  !>  @brief determine the grid and block sizes to achieves maximum occupancy for a kernel
  !>
  !>  @param [out] gridSize           minimum grid size for maximum potential occupancy
  !>  @param [out] blockSize          block size for maximum potential occupancy
  !>  @param [in]  f                  kernel function for which occupancy is calulated
  !>  @param [in]  dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
  !>  @param [in]  blockSizeLimit     the maximum block size for the kernel, use 0 for no limit
  !>
  !>  Please note, HIP does not support kernel launch with total work items defined in dimension
  !>  with
  !>  size gridDim x blockDim >= 2^32.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipModuleOccupancyMaxPotentialBlockSize
#ifdef USE_CUDA_NAMES
    function hipModuleOccupancyMaxPotentialBlockSize_(gridSize,blockSize,f,dynSharedMemPerBlk, &
        blockSizeLimit) &
        bind(c, name="cudaModuleOccupancyMaxPotentialBlockSize")
#else
    function hipModuleOccupancyMaxPotentialBlockSize_(gridSize,blockSize,f,dynSharedMemPerBlk, &
        blockSizeLimit) &
        bind(c, name="hipModuleOccupancyMaxPotentialBlockSize")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxPotentialBlockSize_
      type(c_ptr),value :: gridSize
      type(c_ptr),value :: blockSize
      type(c_ptr),value :: f
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: blockSizeLimit
    end function
  end interface

  !>  @brief determine the grid and block sizes to achieves maximum occupancy for a kernel
  !>
  !>  @param [out] gridSize           minimum grid size for maximum potential occupancy
  !>  @param [out] blockSize          block size for maximum potential occupancy
  !>  @param [in]  f                  kernel function for which occupancy is calulated
  !>  @param [in]  dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
  !>  @param [in]  blockSizeLimit     the maximum block size for the kernel, use 0 for no limit
  !>  @param [in]  flags            Extra flags for occupancy calculation (only default supported)
  !>
  !>  Please note, HIP does not support kernel launch with total work items defined in dimension
  !>  with
  !>  size gridDim x blockDim >= 2^32.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipModuleOccupancyMaxPotentialBlockSizeWithFlags
#ifdef USE_CUDA_NAMES
    function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_(gridSize,blockSize,f, &
        dynSharedMemPerBlk,blockSizeLimit,flags) &
        bind(c, name="cudaModuleOccupancyMaxPotentialBlockSizeWithFlags")
#else
    function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_(gridSize,blockSize,f, &
        dynSharedMemPerBlk,blockSizeLimit,flags) &
        bind(c, name="hipModuleOccupancyMaxPotentialBlockSizeWithFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxPotentialBlockSizeWithFlags_
      type(c_ptr),value :: gridSize
      type(c_ptr),value :: blockSize
      type(c_ptr),value :: f
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: blockSizeLimit
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Returns occupancy for a device function.
  !>
  !>  @param [out] numBlocks        Returned occupancy
  !>  @param [in]  f                Kernel function (hipFunction) for which occupancy is calulated
  !>  @param [in]  blockSize        Block size the kernel is intended to be launched with
  !>  @param [in]  dynSharedMemPerBlk Dynamic shared memory usage (in bytes) intended for each block
  !>  @returns  `hipSuccess`, `hipErrorInvalidValue`
  interface hipModuleOccupancyMaxActiveBlocksPerMultiprocessor
#ifdef USE_CUDA_NAMES
    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_(numBlocks,f,blockSize, &
        dynSharedMemPerBlk) &
        bind(c, name="cudaModuleOccupancyMaxActiveBlocksPerMultiprocessor")
#else
    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_(numBlocks,f,blockSize, &
        dynSharedMemPerBlk) &
        bind(c, name="hipModuleOccupancyMaxActiveBlocksPerMultiprocessor")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_
      type(c_ptr),value :: numBlocks
      type(c_ptr),value :: f
      integer(c_int),value :: blockSize
      integer(c_size_t),value :: dynSharedMemPerBlk
    end function
  end interface

  !>  @brief Returns occupancy for a device function.
  !>
  !>  @param [out] numBlocks        Returned occupancy
  !>  @param [in]  f                Kernel function for which occupancy is calulated
  !>  @param [in]  blockSize        Block size the kernel is intended to be launched with
  !>  @param [in]  dynSharedMemPerBlk Dynamic shared memory usage (in bytes) intended for each block
  !>  @returns  `hipSuccess`, `hipErrorInvalidDeviceFunction`, `hipErrorInvalidValue`
  interface hipOccupancyMaxActiveBlocksPerMultiprocessor
#ifdef USE_CUDA_NAMES
    function hipOccupancyMaxActiveBlocksPerMultiprocessor_(numBlocks,f,blockSize, &
        dynSharedMemPerBlk) &
        bind(c, name="cudaOccupancyMaxActiveBlocksPerMultiprocessor")
#else
    function hipOccupancyMaxActiveBlocksPerMultiprocessor_(numBlocks,f,blockSize, &
        dynSharedMemPerBlk) &
        bind(c, name="hipOccupancyMaxActiveBlocksPerMultiprocessor")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessor_
      type(c_ptr),value :: numBlocks
      type(c_ptr),value :: f
      integer(c_int),value :: blockSize
      integer(c_size_t),value :: dynSharedMemPerBlk
    end function
  end interface

  !>  @brief Returns occupancy for a device function.
  !>
  !>  @param [out] numBlocks        Returned occupancy
  !>  @param [in]  f                Kernel function for which occupancy is calulated
  !>  @param [in]  blockSize        Block size the kernel is intended to be launched with
  !>  @param [in]  dynSharedMemPerBlk Dynamic shared memory usage (in bytes) intended for each block
  !>  @param [in]  flags            Extra flags for occupancy calculation (currently ignored)
  !>  @returns  `hipSuccess`, `hipErrorInvalidDeviceFunction`, `hipErrorInvalidValue`
  interface hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
#ifdef USE_CUDA_NAMES
    function hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_(numBlocks,f,blockSize, &
        dynSharedMemPerBlk,flags) &
        bind(c, name="cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
#else
    function hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_(numBlocks,f,blockSize, &
        dynSharedMemPerBlk,flags) &
        bind(c, name="hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_
      type(c_ptr),value :: numBlocks
      type(c_ptr),value :: f
      integer(c_int),value :: blockSize
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief determine the grid and block sizes to achieves maximum occupancy for a kernel
  !>
  !>  @param [out] gridSize           minimum grid size for maximum potential occupancy
  !>  @param [out] blockSize          block size for maximum potential occupancy
  !>  @param [in]  f                  kernel function for which occupancy is calulated
  !>  @param [in]  dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
  !>  @param [in]  blockSizeLimit     the maximum block size for the kernel, use 0 for no limit
  !>
  !>  Please note, HIP does not support kernel launch with total work items defined in dimension
  !>  with
  !>  size gridDim x blockDim >= 2^32.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipOccupancyMaxPotentialBlockSize
#ifdef USE_CUDA_NAMES
    function hipOccupancyMaxPotentialBlockSize_(gridSize,blockSize,f,dynSharedMemPerBlk, &
        blockSizeLimit) &
        bind(c, name="cudaOccupancyMaxPotentialBlockSize")
#else
    function hipOccupancyMaxPotentialBlockSize_(gridSize,blockSize,f,dynSharedMemPerBlk, &
        blockSizeLimit) &
        bind(c, name="hipOccupancyMaxPotentialBlockSize")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxPotentialBlockSize_
      type(c_ptr),value :: gridSize
      type(c_ptr),value :: blockSize
      type(c_ptr),value :: f
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: blockSizeLimit
    end function
  end interface

  !>  @brief Start recording of profiling information [Deprecated]
  !>  When using this API, start the profiler with profiling disabled.  (--startdisabled)
  !>  @returns  `hipErrorNotSupported`
  !>  @warning hipProfilerStart API is deprecated, use roctracer/rocTX instead.
  interface hipProfilerStart
#ifdef USE_CUDA_NAMES
    function hipProfilerStart_() bind(c, name="cudaProfilerStart")
#else
    function hipProfilerStart_() bind(c, name="hipProfilerStart")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipProfilerStart_
    end function
  end interface

  !>  @brief Stop recording of profiling information [Deprecated]
  !>  When using this API, start the profiler with profiling disabled.  (--startdisabled)
  !>  @returns  `hipErrorNotSupported`
  !>  @warning  hipProfilerStart API is deprecated, use roctracer/rocTX instead.
  interface hipProfilerStop
#ifdef USE_CUDA_NAMES
    function hipProfilerStop_() bind(c, name="cudaProfilerStop")
#else
    function hipProfilerStop_() bind(c, name="hipProfilerStop")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipProfilerStop_
    end function
  end interface

  !> -------------------------------------------------------------------------------------------------
  !> -------------------------------------------------------------------------------------------------
  !>   @defgroup Clang Launch API to support the triple-chevron syntax
  !>
  !>   This section describes the API to support the triple-chevron syntax.
  !>
  !>
  !>  @brief Configure a kernel launch.
  !>
  !>  @param [in] gridDim   grid dimension specified as multiple of blockDim.
  !>  @param [in] blockDim  block dimensions specified in work-items
  !>  @param [in] sharedMem Amount of dynamic shared memory to allocate for this kernel. The
  !>  HIP-Clang compiler provides support for extern shared declarations.
  !>  @param [in] stream Stream where the kernel should be dispatched. May be 0, in which case the
  !>  default stream is used with associated synchronization rules.
  !>
  !>  Please note, HIP does not support kernel launch with total work items defined in dimension
  !>  with
  !>  size gridDim x blockDim >= 2^32.
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`
  interface hipConfigureCall
#ifdef USE_CUDA_NAMES
    function hipConfigureCall_(gridDim,blockDim,sharedMem,stream) bind(c, name="cudaConfigureCall")
#else
    function hipConfigureCall_(gridDim,blockDim,sharedMem,stream) bind(c, name="hipConfigureCall")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipConfigureCall_
      type(c_ptr),value :: gridDim
      type(c_ptr),value :: blockDim
      integer(c_size_t),value :: sharedMem
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Set a kernel argument.
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`
  !>
  !>  @param [in] arg    Pointer the argument in host memory.
  !>  @param [in] size   Size of the argument.
  !>  @param [in] offset Offset of the argument on the argument stack.
  interface hipSetupArgument
#ifdef USE_CUDA_NAMES
    function hipSetupArgument_(arg,mySize,offset) bind(c, name="cudaSetupArgument")
#else
    function hipSetupArgument_(arg,mySize,offset) bind(c, name="hipSetupArgument")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipSetupArgument_
      type(c_ptr),value :: arg
      integer(c_size_t),value :: mySize
      integer(c_size_t),value :: offset
    end function
  end interface

  !>  @brief Launch a kernel.
  !>
  !>  @param [in] func Kernel to launch.
  !>
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`
  interface hipLaunchByPtr
#ifdef USE_CUDA_NAMES
    function hipLaunchByPtr_(func) bind(c, name="cudaLaunchByPtr")
#else
    function hipLaunchByPtr_(func) bind(c, name="hipLaunchByPtr")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchByPtr_
      type(c_ptr),value :: func
    end function
  end interface

  !>  @brief C compliant kernel launch API
  !>
  !>  @param [in] function_address - Kernel stub function pointer.
  !>  @param [in] numBlocks - Number of blocks.
  !>  @param [in] dimBlocks - Dimension of a block
  !>  @param [in] args - Pointer of arguments passed to the kernel. If the kernel has multiple
  !>  parameters, 'args' should be array of pointers, each points the corresponding argument.
  !>  @param [in] sharedMemBytes - Amount of dynamic shared memory to allocate for this kernel. The
  !>  HIP-Clang compiler provides support for extern shared declarations.
  !>  @param [in] stream - Stream where the kernel should be dispatched.  May be 0, in which case th
  !>   default stream is used with associated synchronization rules.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipLaunchKernel
#ifdef USE_CUDA_NAMES
    function hipLaunchKernel_(function_address,numBlocks,dimBlocks,args,sharedMemBytes,stream) &
        bind(c, name="cudaLaunchKernel")
#else
    function hipLaunchKernel_(function_address,numBlocks,dimBlocks,args,sharedMemBytes,stream) &
        bind(c, name="hipLaunchKernel")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchKernel_
      type(c_ptr),value :: function_address
      type(c_ptr),value :: numBlocks
      type(c_ptr),value :: dimBlocks
      type(c_ptr) :: args
      integer(c_size_t),value :: sharedMemBytes
      type(c_ptr),value :: stream
    end function
  end interface

  !>  Copies memory for 2D arrays.
  !>
  !>  @param pCopy - Parameters for the memory copy
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipDrvMemcpy2DUnaligned
#ifdef USE_CUDA_NAMES
    function hipDrvMemcpy2DUnaligned_(pCopy) bind(c, name="cudaDrvMemcpy2DUnaligned")
#else
    function hipDrvMemcpy2DUnaligned_(pCopy) bind(c, name="hipDrvMemcpy2DUnaligned")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemcpy2DUnaligned_
      type(hip_Memcpy2D) :: pCopy
    end function
  end interface

  !>  @brief Launches kernel from the pointer address, with arguments and shared memory on stream.
  !>
  !>  @param [in] function_address - Pointer to the Kernel to launch.
  !>  @param [in] numBlocks -  Number of blocks.
  !>  @param [in] dimBlocks - Dimension of a block.
  !>  @param [in] args - Pointer of arguments passed to the kernel. If the kernel has multiple
  !>  parameters, 'args' should be array of pointers, each points the corresponding argument.
  !>  @param [in] sharedMemBytes - Amount of dynamic shared memory to allocate for this kernel.
  !>  HIP-Clang compiler provides support for extern shared declarations.
  !>  @param [in] stream - Stream where the kernel should be dispatched.
  !>  May be 0, in which case the default stream is used with associated synchronization rules.
  !>  @param [in] startEvent - If non-null, specified event will be updated to track the start time
  !>  of
  !>  the kernel launch. The event must be created before calling this API.
  !>  @param [in] stopEvent - If non-null, specified event will be updated to track the stop time of
  !>  the kernel launch. The event must be created before calling this API.
  !>  @param [in] flags - The value of hipExtAnyOrderLaunch, signifies if kernel can be
  !>  launched in any order.
  !>  @returns `hipSuccess`, `hipErrorNotInitialized`, `hipErrorInvalidValue`.
  interface hipExtLaunchKernel
#ifdef USE_CUDA_NAMES
    function hipExtLaunchKernel_(function_address,numBlocks,dimBlocks,args,sharedMemBytes,stream, &
        startEvent,stopEvent,flags) &
        bind(c, name="cudaExtLaunchKernel")
#else
    function hipExtLaunchKernel_(function_address,numBlocks,dimBlocks,args,sharedMemBytes,stream, &
        startEvent,stopEvent,flags) &
        bind(c, name="hipExtLaunchKernel")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipExtLaunchKernel_
      type(c_ptr),value :: function_address
      type(c_ptr),value :: numBlocks
      type(c_ptr),value :: dimBlocks
      type(c_ptr) :: args
      integer(c_size_t),value :: sharedMemBytes
      type(c_ptr),value :: stream
      type(c_ptr),value :: startEvent
      type(c_ptr),value :: stopEvent
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Binds a memory area to a texture [Deprecated]
  !>
  !>  @param [in] offset  Offset in bytes.
  !>  @param [in] tex  Texture to bind.
  !>  @param [in] devPtr  Pointer of memory on the device.
  !>  @param [in] desc  Pointer of channel format descriptor.
  !>  @param [in] size  Size of memory in bites.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipBindTexture
#ifdef USE_CUDA_NAMES
    function hipBindTexture_(offset,tex,devPtr,desc,mySize) bind(c, name="cudaBindTexture")
#else
    function hipBindTexture_(offset,tex,devPtr,desc,mySize) bind(c, name="hipBindTexture")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipBindTexture_
      integer(c_size_t) :: offset
      type(textureReference) :: tex
      type(c_ptr),value :: devPtr
      type(hipChannelFormatDesc) :: desc
      integer(c_size_t),value :: mySize
    end function
  end interface

  !>  @brief Binds a 2D memory area to a texture [Deprecated]
  !>
  !>  @param [in] offset  Offset in bytes.
  !>  @param [in] tex  Texture to bind.
  !>  @param [in] devPtr  Pointer of 2D memory area on the device.
  !>  @param [in] desc  Pointer of channel format descriptor.
  !>  @param [in] width  Width in texel units.
  !>  @param [in] height  Height in texel units.
  !>  @param [in] pitch  Pitch in bytes.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipBindTexture2D
#ifdef USE_CUDA_NAMES
    function hipBindTexture2D_(offset,tex,devPtr,desc,width,height,pitch) &
        bind(c, name="cudaBindTexture2D")
#else
    function hipBindTexture2D_(offset,tex,devPtr,desc,width,height,pitch) &
        bind(c, name="hipBindTexture2D")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipBindTexture2D_
      integer(c_size_t) :: offset
      type(textureReference) :: tex
      type(c_ptr),value :: devPtr
      type(hipChannelFormatDesc) :: desc
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(c_size_t),value :: pitch
    end function
  end interface

  !>  @brief Binds a memory area to a texture [Deprecated]
  !>
  !>  @param [in] tex  Pointer of texture reference.
  !>  @param [in] array  Array to bind.
  !>  @param [in] desc  Pointer of channel format descriptor.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipBindTextureToArray
#ifdef USE_CUDA_NAMES
    function hipBindTextureToArray_(tex,array,desc) bind(c, name="cudaBindTextureToArray")
#else
    function hipBindTextureToArray_(tex,array,desc) bind(c, name="hipBindTextureToArray")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipBindTextureToArray_
      type(textureReference) :: tex
      type(c_ptr),value :: array
      type(hipChannelFormatDesc) :: desc
    end function
  end interface

  !>  @brief Get the offset of the alignment in a texture [Deprecated]
  !>
  !>  @param [in] offset  Offset in bytes.
  !>  @param [in] texref  Pointer of texture reference.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipGetTextureAlignmentOffset
#ifdef USE_CUDA_NAMES
    function hipGetTextureAlignmentOffset_(offset,texref) &
        bind(c, name="cudaGetTextureAlignmentOffset")
#else
    function hipGetTextureAlignmentOffset_(offset,texref) &
        bind(c, name="hipGetTextureAlignmentOffset")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetTextureAlignmentOffset_
      integer(c_size_t) :: offset
      type(textureReference) :: texref
    end function
  end interface

  !>  @brief Unbinds a texture [Deprecated]
  !>
  !>  @param [in] tex  Texture to unbind.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipUnbindTexture
#ifdef USE_CUDA_NAMES
    function hipUnbindTexture_(tex) bind(c, name="cudaUnbindTexture")
#else
    function hipUnbindTexture_(tex) bind(c, name="hipUnbindTexture")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipUnbindTexture_
      type(textureReference) :: tex
    end function
  end interface

  !>  @brief Gets the address for a texture reference [Deprecated]
  !>
  !>  @param [out] dev_ptr  Pointer of device address.
  !>  @param [in] texRef  Pointer of texture reference.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefGetAddress
#ifdef USE_CUDA_NAMES
    function hipTexRefGetAddress_(dev_ptr,texRef) bind(c, name="cudaTexRefGetAddress")
#else
    function hipTexRefGetAddress_(dev_ptr,texRef) bind(c, name="hipTexRefGetAddress")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetAddress_
      type(c_ptr) :: dev_ptr
      type(textureReference) :: texRef
    end function
  end interface

  !>  @brief Gets the address mode for a texture reference [Deprecated]
  !>
  !>  @param [out] pam  Pointer of address mode.
  !>  @param [in] texRef  Pointer of texture reference.
  !>  @param [in] dim  Dimension.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefGetAddressMode
#ifdef USE_CUDA_NAMES
    function hipTexRefGetAddressMode_(pam,texRef,dim) bind(c, name="cudaTexRefGetAddressMode")
#else
    function hipTexRefGetAddressMode_(pam,texRef,dim) bind(c, name="hipTexRefGetAddressMode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetAddressMode_
      type(c_ptr),value :: pam
      type(textureReference) :: texRef
      integer(c_int),value :: dim
    end function
  end interface

  !>  @brief Gets filter mode for a texture reference [Deprecated]
  !>
  !>  @param [out] pfm  Pointer of filter mode.
  !>  @param [in] texRef  Pointer of texture reference.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefGetFilterMode
#ifdef USE_CUDA_NAMES
    function hipTexRefGetFilterMode_(pfm,texRef) bind(c, name="cudaTexRefGetFilterMode")
#else
    function hipTexRefGetFilterMode_(pfm,texRef) bind(c, name="hipTexRefGetFilterMode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFilterMode_
      type(c_ptr),value :: pfm
      type(textureReference) :: texRef
    end function
  end interface

  !>  @brief Gets flags for a texture reference [Deprecated]
  !>
  !>  @param [out] pFlags  Pointer of flags.
  !>  @param [in] texRef  Pointer of texture reference.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefGetFlags
#ifdef USE_CUDA_NAMES
    function hipTexRefGetFlags_(pFlags,texRef) bind(c, name="cudaTexRefGetFlags")
#else
    function hipTexRefGetFlags_(pFlags,texRef) bind(c, name="hipTexRefGetFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFlags_
      type(c_ptr),value :: pFlags
      type(textureReference) :: texRef
    end function
  end interface

  !>  @brief Gets texture format for a texture reference [Deprecated]
  !>
  !>  @param [out] pFormat  Pointer of the format.
  !>  @param [out] pNumChannels  Pointer of number of channels.
  !>  @param [in] texRef  Pointer of texture reference.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefGetFormat
#ifdef USE_CUDA_NAMES
    function hipTexRefGetFormat_(pFormat,pNumChannels,texRef) bind(c, name="cudaTexRefGetFormat")
#else
    function hipTexRefGetFormat_(pFormat,pNumChannels,texRef) bind(c, name="hipTexRefGetFormat")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFormat_
      type(c_ptr),value :: pFormat
      type(c_ptr),value :: pNumChannels
      type(textureReference) :: texRef
    end function
  end interface

  !>  @brief Gets the maximum anisotropy for a texture reference [Deprecated]
  !>
  !>  @param [out] pmaxAnsio  Pointer of the maximum anisotropy.
  !>  @param [in] texRef  Pointer of texture reference.
  !>
  !>  @returns `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefGetMaxAnisotropy
#ifdef USE_CUDA_NAMES
    function hipTexRefGetMaxAnisotropy_(pmaxAnsio,texRef) bind(c, name="cudaTexRefGetMaxAnisotropy")
#else
    function hipTexRefGetMaxAnisotropy_(pmaxAnsio,texRef) bind(c, name="hipTexRefGetMaxAnisotropy")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMaxAnisotropy_
      type(c_ptr),value :: pmaxAnsio
      type(textureReference) :: texRef
    end function
  end interface

  !>  @brief Gets the mipmap filter mode for a texture reference [Deprecated]
  !>
  !>  @param [out] pfm  Pointer of the mipmap filter mode.
  !>  @param [in] texRef  Pointer of texture reference.
  !>
  !>  @returns `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefGetMipmapFilterMode
#ifdef USE_CUDA_NAMES
    function hipTexRefGetMipmapFilterMode_(pfm,texRef) bind(c, name="cudaTexRefGetMipmapFilterMode")
#else
    function hipTexRefGetMipmapFilterMode_(pfm,texRef) bind(c, name="hipTexRefGetMipmapFilterMode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapFilterMode_
      type(c_ptr),value :: pfm
      type(textureReference) :: texRef
    end function
  end interface

  !>  @brief Gets the mipmap level bias for a texture reference [Deprecated]
  !>
  !>  @param [out] pbias  Pointer of the mipmap level bias.
  !>  @param [in] texRef  Pointer of texture reference.
  !>
  !>  @returns `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefGetMipmapLevelBias
#ifdef USE_CUDA_NAMES
    function hipTexRefGetMipmapLevelBias_(pbias,texRef) bind(c, name="cudaTexRefGetMipmapLevelBias")
#else
    function hipTexRefGetMipmapLevelBias_(pbias,texRef) bind(c, name="hipTexRefGetMipmapLevelBias")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelBias_
      type(c_ptr),value :: pbias
      type(textureReference) :: texRef
    end function
  end interface

  !>  @brief Gets the minimum and maximum mipmap level clamps for a texture reference [Deprecated]
  !>
  !>  @param [out] pminMipmapLevelClamp  Pointer of the minimum mipmap level clamp.
  !>  @param [out] pmaxMipmapLevelClamp  Pointer of the maximum mipmap level clamp.
  !>  @param [in] texRef  Pointer of texture reference.
  !>
  !>  @returns `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefGetMipmapLevelClamp
#ifdef USE_CUDA_NAMES
    function hipTexRefGetMipmapLevelClamp_(pminMipmapLevelClamp,pmaxMipmapLevelClamp,texRef) &
        bind(c, name="cudaTexRefGetMipmapLevelClamp")
#else
    function hipTexRefGetMipmapLevelClamp_(pminMipmapLevelClamp,pmaxMipmapLevelClamp,texRef) &
        bind(c, name="hipTexRefGetMipmapLevelClamp")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelClamp_
      type(c_ptr),value :: pminMipmapLevelClamp
      type(c_ptr),value :: pmaxMipmapLevelClamp
      type(textureReference) :: texRef
    end function
  end interface

  !>  @brief Gets the mipmapped array bound to a texture reference [Deprecated]
  !>
  !>  @param [out] pArray  Pointer of the mipmapped array.
  !>  @param [in] texRef  Pointer of texture reference.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefGetMipMappedArray
#ifdef USE_CUDA_NAMES
    function hipTexRefGetMipMappedArray_(pArray,texRef) bind(c, name="cudaTexRefGetMipMappedArray")
#else
    function hipTexRefGetMipMappedArray_(pArray,texRef) bind(c, name="hipTexRefGetMipMappedArray")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipMappedArray_
      type(c_ptr) :: pArray
      type(textureReference) :: texRef
    end function
  end interface

  !>  @brief Sets an bound address for a texture reference [Deprecated]
  !>
  !>  @param [out] ByteOffset  Pointer of the offset in bytes.
  !>  @param [in] texRef  Pointer of texture reference.
  !>  @param [in] dptr  Pointer of device address to bind.
  !>  @param [in] bytes  Size in bytes.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetAddress
#ifdef USE_CUDA_NAMES
    function hipTexRefSetAddress_(ByteOffset,texRef,dptr,bytes) bind(c, name="cudaTexRefSetAddress")
#else
    function hipTexRefSetAddress_(ByteOffset,texRef,dptr,bytes) bind(c, name="hipTexRefSetAddress")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetAddress_
      integer(c_size_t) :: ByteOffset
      type(textureReference) :: texRef
      type(c_ptr),value :: dptr
      integer(c_size_t),value :: bytes
    end function
  end interface

  !>  @brief Set a bind an address as a 2D texture reference [Deprecated]
  !>
  !>  @param [in] texRef  Pointer of texture reference.
  !>  @param [in] desc  Pointer of array descriptor.
  !>  @param [in] dptr  Pointer of device address to bind.
  !>  @param [in] Pitch  Pitch in bytes.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetAddress2D
#ifdef USE_CUDA_NAMES
    function hipTexRefSetAddress2D_(texRef,desc,dptr,Pitch) bind(c, name="cudaTexRefSetAddress2D")
#else
    function hipTexRefSetAddress2D_(texRef,desc,dptr,Pitch) bind(c, name="hipTexRefSetAddress2D")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetAddress2D_
      type(textureReference) :: texRef
      type(HIP_ARRAY_DESCRIPTOR) :: desc
      type(c_ptr),value :: dptr
      integer(c_size_t),value :: Pitch
    end function
  end interface

  !>  @brief Sets the maximum anisotropy for a texture reference [Deprecated]
  !>
  !>  @param [in] texRef  Pointer of texture reference.
  !>  @param [out] maxAniso  Value of the maximum anisotropy.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetMaxAnisotropy
#ifdef USE_CUDA_NAMES
    function hipTexRefSetMaxAnisotropy_(texRef,maxAniso) bind(c, name="cudaTexRefSetMaxAnisotropy")
#else
    function hipTexRefSetMaxAnisotropy_(texRef,maxAniso) bind(c, name="hipTexRefSetMaxAnisotropy")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetMaxAnisotropy_
      type(textureReference) :: texRef
      integer(c_int),value :: maxAniso
    end function
  end interface

  !>  @brief  Binds a mipmapped array to a texture [Deprecated]
  !>
  !>  @param [in] tex  pointer to the texture reference to bind
  !>  @param [in] mipmappedArray memory mipmapped array on the device
  !>  @param [in] desc  opointer to the channel format
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipBindTextureToMipmappedArray
#ifdef USE_CUDA_NAMES
    function hipBindTextureToMipmappedArray_(tex,mipmappedArray,desc) &
        bind(c, name="cudaBindTextureToMipmappedArray")
#else
    function hipBindTextureToMipmappedArray_(tex,mipmappedArray,desc) &
        bind(c, name="hipBindTextureToMipmappedArray")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipBindTextureToMipmappedArray_
      type(textureReference) :: tex
      type(c_ptr),value :: mipmappedArray
      type(hipChannelFormatDesc) :: desc
    end function
  end interface

  !>  @brief Creates a texture object.
  !>
  !>  @param [out] pTexObject  pointer to the texture object to create
  !>  @param [in] pResDesc  pointer to resource descriptor
  !>  @param [in] pTexDesc  pointer to texture descriptor
  !>  @param [in] pResViewDesc  pointer to resource view descriptor
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`, `hipErrorOutOfMemory`
  !>
  !>  @note 3D linear filter isn't supported on GFX90A boards, on which the API @p
  !>  hipCreateTextureObject will return hipErrorNotSupported.
  interface hipCreateTextureObject
#ifdef USE_CUDA_NAMES
    function hipCreateTextureObject_(pTexObject,pResDesc,pTexDesc,pResViewDesc) &
        bind(c, name="cudaCreateTextureObject")
#else
    function hipCreateTextureObject_(pTexObject,pResDesc,pTexDesc,pResViewDesc) &
        bind(c, name="hipCreateTextureObject")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCreateTextureObject_
      type(c_ptr) :: pTexObject
      type(hipResourceDesc) :: pResDesc
      type(hipTextureDesc) :: pTexDesc
      type(hipResourceViewDesc) :: pResViewDesc
    end function
  end interface

  !>  @brief Destroys a texture object.
  !>
  !>  @param [in] textureObject  texture object to destroy
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipDestroyTextureObject
#ifdef USE_CUDA_NAMES
    function hipDestroyTextureObject_(textureObject) bind(c, name="cudaDestroyTextureObject")
#else
    function hipDestroyTextureObject_(textureObject) bind(c, name="hipDestroyTextureObject")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDestroyTextureObject_
      type(c_ptr),value :: textureObject
    end function
  end interface

  !>  @brief Gets the channel descriptor in an array.
  !>
  !>  @param [in] desc  pointer to channel format descriptor
  !>  @param [out] array  memory array on the device
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGetChannelDesc
#ifdef USE_CUDA_NAMES
    function hipGetChannelDesc_(desc,array) bind(c, name="cudaGetChannelDesc")
#else
    function hipGetChannelDesc_(desc,array) bind(c, name="hipGetChannelDesc")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetChannelDesc_
      type(hipChannelFormatDesc) :: desc
      type(c_ptr),value :: array
    end function
  end interface

  !>  @brief Gets resource descriptor for the texture object.
  !>
  !>  @param [out] pResDesc  pointer to resource descriptor
  !>  @param [in] textureObject  texture object
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGetTextureObjectResourceDesc
#ifdef USE_CUDA_NAMES
    function hipGetTextureObjectResourceDesc_(pResDesc,textureObject) &
        bind(c, name="cudaGetTextureObjectResourceDesc")
#else
    function hipGetTextureObjectResourceDesc_(pResDesc,textureObject) &
        bind(c, name="hipGetTextureObjectResourceDesc")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetTextureObjectResourceDesc_
      type(hipResourceDesc) :: pResDesc
      type(c_ptr),value :: textureObject
    end function
  end interface

  !>  @brief Gets resource view descriptor for the texture object.
  !>
  !>  @param [out] pResViewDesc  pointer to resource view descriptor
  !>  @param [in] textureObject  texture object
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGetTextureObjectResourceViewDesc
#ifdef USE_CUDA_NAMES
    function hipGetTextureObjectResourceViewDesc_(pResViewDesc,textureObject) &
        bind(c, name="cudaGetTextureObjectResourceViewDesc")
#else
    function hipGetTextureObjectResourceViewDesc_(pResViewDesc,textureObject) &
        bind(c, name="hipGetTextureObjectResourceViewDesc")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetTextureObjectResourceViewDesc_
      type(hipResourceViewDesc) :: pResViewDesc
      type(c_ptr),value :: textureObject
    end function
  end interface

  !>  @brief Gets texture descriptor for the texture object.
  !>
  !>  @param [out] pTexDesc  pointer to texture descriptor
  !>  @param [in] textureObject  texture object
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGetTextureObjectTextureDesc
#ifdef USE_CUDA_NAMES
    function hipGetTextureObjectTextureDesc_(pTexDesc,textureObject) &
        bind(c, name="cudaGetTextureObjectTextureDesc")
#else
    function hipGetTextureObjectTextureDesc_(pTexDesc,textureObject) &
        bind(c, name="hipGetTextureObjectTextureDesc")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGetTextureObjectTextureDesc_
      type(hipTextureDesc) :: pTexDesc
      type(c_ptr),value :: textureObject
    end function
  end interface

  !>  @brief Sets address mode for a texture reference [Deprecated]
  !>
  !>  @param [in] texRef  texture reference.
  !>  @param [in] dim  Dimension of the texture.
  !>  @param [in] am  Value of the texture address mode.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>  @warning This API is deprecated.
  interface hipTexRefSetAddressMode
#ifdef USE_CUDA_NAMES
    function hipTexRefSetAddressMode_(texRef,dim,am) bind(c, name="cudaTexRefSetAddressMode")
#else
    function hipTexRefSetAddressMode_(texRef,dim,am) bind(c, name="hipTexRefSetAddressMode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetAddressMode_
      type(textureReference) :: texRef
      integer(c_int),value :: dim
      integer(kind(hipAddressModeWrap)),value :: am
    end function
  end interface

  !>  @brief Binds an array as a texture reference [Deprecated]
  !>
  !>  @param [in] tex  Pointer texture reference.
  !>  @param [in] array  Array to bind.
  !>  @param [in] flags  Flags should be set as HIP_TRSA_OVERRIDE_FORMAT, as a valid value.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetArray
#ifdef USE_CUDA_NAMES
    function hipTexRefSetArray_(tex,array,flags) bind(c, name="cudaTexRefSetArray")
#else
    function hipTexRefSetArray_(tex,array,flags) bind(c, name="hipTexRefSetArray")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetArray_
      type(textureReference) :: tex
      type(c_ptr),value :: array
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Set filter mode for a texture reference [Deprecated]
  !>
  !>  @param [in] texRef  Pointer texture reference.
  !>  @param [in] fm  Value of texture filter mode.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetFilterMode
#ifdef USE_CUDA_NAMES
    function hipTexRefSetFilterMode_(texRef,fm) bind(c, name="cudaTexRefSetFilterMode")
#else
    function hipTexRefSetFilterMode_(texRef,fm) bind(c, name="hipTexRefSetFilterMode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetFilterMode_
      type(textureReference) :: texRef
      integer(kind(hipFilterModePoint)),value :: fm
    end function
  end interface

  !>  @brief Set flags for a texture reference [Deprecated]
  !>
  !>  @param [in] texRef  Pointer texture reference.
  !>  @param [in] Flags  Value of flags.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetFlags
#ifdef USE_CUDA_NAMES
    function hipTexRefSetFlags_(texRef,Flags) bind(c, name="cudaTexRefSetFlags")
#else
    function hipTexRefSetFlags_(texRef,Flags) bind(c, name="hipTexRefSetFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetFlags_
      type(textureReference) :: texRef
      integer(c_int),value :: Flags
    end function
  end interface

  !>  @brief Set format for a texture reference [Deprecated]
  !>
  !>  @param [in] texRef  Pointer texture reference.
  !>  @param [in] fmt  Value of format.
  !>  @param [in] NumPackedComponents  Number of components per array.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetFormat
#ifdef USE_CUDA_NAMES
    function hipTexRefSetFormat_(texRef,fmt,NumPackedComponents) bind(c, name="cudaTexRefSetFormat")
#else
    function hipTexRefSetFormat_(texRef,fmt,NumPackedComponents) bind(c, name="hipTexRefSetFormat")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetFormat_
      type(textureReference) :: texRef
      integer(kind(HIP_AD_FORMAT_UNSIGNED_INT8)),value :: fmt
      integer(c_int),value :: NumPackedComponents
    end function
  end interface

  !>  @brief Creates a texture object.
  !>
  !>  @param [out] pTexObject  pointer to texture object to create
  !>  @param [in] pResDesc  pointer to resource descriptor
  !>  @param [in] pTexDesc  pointer to texture descriptor
  !>  @param [in] pResViewDesc  pointer to resource view descriptor
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipTexObjectCreate
#ifdef USE_CUDA_NAMES
    function hipTexObjectCreate_(pTexObject,pResDesc,pTexDesc,pResViewDesc) &
        bind(c, name="cudaTexObjectCreate")
#else
    function hipTexObjectCreate_(pTexObject,pResDesc,pTexDesc,pResViewDesc) &
        bind(c, name="hipTexObjectCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexObjectCreate_
      type(c_ptr) :: pTexObject
      type(HIP_RESOURCE_DESC) :: pResDesc
      type(HIP_TEXTURE_DESC) :: pTexDesc
      type(HIP_RESOURCE_VIEW_DESC) :: pResViewDesc
    end function
  end interface

  !>  @brief Destroys a texture object.
  !>
  !>  @param [in] texObject  texture object to destroy
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipTexObjectDestroy
#ifdef USE_CUDA_NAMES
    function hipTexObjectDestroy_(texObject) bind(c, name="cudaTexObjectDestroy")
#else
    function hipTexObjectDestroy_(texObject) bind(c, name="hipTexObjectDestroy")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipTexObjectDestroy_
      type(c_ptr),value :: texObject
    end function
  end interface

  !>  @brief Gets resource descriptor of a texture object.
  !>
  !>  @param [out] pResDesc  pointer to resource descriptor
  !>  @param [in] texObject  texture object
  !>
  !>  @returns `hipSuccess`, `hipErrorNotSupported`, `hipErrorInvalidValue`
  interface hipTexObjectGetResourceDesc
#ifdef USE_CUDA_NAMES
    function hipTexObjectGetResourceDesc_(pResDesc,texObject) &
        bind(c, name="cudaTexObjectGetResourceDesc")
#else
    function hipTexObjectGetResourceDesc_(pResDesc,texObject) &
        bind(c, name="hipTexObjectGetResourceDesc")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexObjectGetResourceDesc_
      type(HIP_RESOURCE_DESC) :: pResDesc
      type(c_ptr),value :: texObject
    end function
  end interface

  !>  @brief Gets resource view descriptor of a texture object.
  !>
  !>  @param [out] pResViewDesc  pointer to resource view descriptor
  !>  @param [in] texObject  texture object
  !>
  !>  @returns `hipSuccess`, `hipErrorNotSupported`, `hipErrorInvalidValue`
  interface hipTexObjectGetResourceViewDesc
#ifdef USE_CUDA_NAMES
    function hipTexObjectGetResourceViewDesc_(pResViewDesc,texObject) &
        bind(c, name="cudaTexObjectGetResourceViewDesc")
#else
    function hipTexObjectGetResourceViewDesc_(pResViewDesc,texObject) &
        bind(c, name="hipTexObjectGetResourceViewDesc")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexObjectGetResourceViewDesc_
      type(HIP_RESOURCE_VIEW_DESC) :: pResViewDesc
      type(c_ptr),value :: texObject
    end function
  end interface

  !>  @brief Gets texture descriptor of a texture object.
  !>
  !>  @param [out] pTexDesc  pointer to texture descriptor
  !>  @param [in] texObject  texture object
  !>
  !>  @returns `hipSuccess`, `hipErrorNotSupported`, `hipErrorInvalidValue`
  interface hipTexObjectGetTextureDesc
#ifdef USE_CUDA_NAMES
    function hipTexObjectGetTextureDesc_(pTexDesc,texObject) &
        bind(c, name="cudaTexObjectGetTextureDesc")
#else
    function hipTexObjectGetTextureDesc_(pTexDesc,texObject) &
        bind(c, name="hipTexObjectGetTextureDesc")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexObjectGetTextureDesc_
      type(HIP_TEXTURE_DESC) :: pTexDesc
      type(c_ptr),value :: texObject
    end function
  end interface

  !>  @brief Sets border color for a texture reference [Deprecated]
  !>
  !>  @param [in] texRef  Pointer of texture reference.
  !>  @param [in] pBorderColor  Pointer of border color.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetBorderColor
#ifdef USE_CUDA_NAMES
    function hipTexRefSetBorderColor_(texRef,pBorderColor) bind(c, name="cudaTexRefSetBorderColor")
#else
    function hipTexRefSetBorderColor_(texRef,pBorderColor) bind(c, name="hipTexRefSetBorderColor")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetBorderColor_
      type(textureReference) :: texRef
      type(c_ptr),value :: pBorderColor
    end function
  end interface

  !>  @brief Sets mipmap filter mode for a texture reference [Deprecated]
  !>
  !>  @param [in] texRef  Pointer of texture reference.
  !>  @param [in] fm  Value of filter mode.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetMipmapFilterMode
#ifdef USE_CUDA_NAMES
    function hipTexRefSetMipmapFilterMode_(texRef,fm) bind(c, name="cudaTexRefSetMipmapFilterMode")
#else
    function hipTexRefSetMipmapFilterMode_(texRef,fm) bind(c, name="hipTexRefSetMipmapFilterMode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapFilterMode_
      type(textureReference) :: texRef
      integer(kind(hipFilterModePoint)),value :: fm
    end function
  end interface

  !>  @brief Sets mipmap level bias for a texture reference [Deprecated]
  !>
  !>  @param [in] texRef  Pointer of texture reference.
  !>  @param [in] bias  Value of mipmap bias.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetMipmapLevelBias
#ifdef USE_CUDA_NAMES
    function hipTexRefSetMipmapLevelBias_(texRef,bias) bind(c, name="cudaTexRefSetMipmapLevelBias")
#else
    function hipTexRefSetMipmapLevelBias_(texRef,bias) bind(c, name="hipTexRefSetMipmapLevelBias")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapLevelBias_
      type(textureReference) :: texRef
      real(c_float),value :: bias
    end function
  end interface

  !>  @brief Sets mipmap level clamp for a texture reference [Deprecated]
  !>
  !>  @param [in] texRef  Pointer of texture reference.
  !>  @param [in] minMipMapLevelClamp  Value of minimum mipmap level clamp.
  !>  @param [in] maxMipMapLevelClamp  Value of maximum mipmap level clamp.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetMipmapLevelClamp
#ifdef USE_CUDA_NAMES
    function hipTexRefSetMipmapLevelClamp_(texRef,minMipMapLevelClamp,maxMipMapLevelClamp) &
        bind(c, name="cudaTexRefSetMipmapLevelClamp")
#else
    function hipTexRefSetMipmapLevelClamp_(texRef,minMipMapLevelClamp,maxMipMapLevelClamp) &
        bind(c, name="hipTexRefSetMipmapLevelClamp")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapLevelClamp_
      type(textureReference) :: texRef
      real(c_float),value :: minMipMapLevelClamp
      real(c_float),value :: maxMipMapLevelClamp
    end function
  end interface

  !>  @brief Binds mipmapped array to a texture reference [Deprecated]
  !>
  !>  @param [in] texRef  Pointer of texture reference to bind.
  !>  @param [in] mipmappedArray  Pointer of mipmapped array to bind.
  !>  @param [in] Flags  Flags should be set as HIP_TRSA_OVERRIDE_FORMAT, as a valid value.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning This API is deprecated.
  interface hipTexRefSetMipmappedArray
#ifdef USE_CUDA_NAMES
    function hipTexRefSetMipmappedArray_(texRef,mipmappedArray,Flags) &
        bind(c, name="cudaTexRefSetMipmappedArray")
#else
    function hipTexRefSetMipmappedArray_(texRef,mipmappedArray,Flags) &
        bind(c, name="hipTexRefSetMipmappedArray")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetMipmappedArray_
      type(textureReference) :: texRef
      type(hipMipmappedArray) :: mipmappedArray
      integer(c_int),value :: Flags
    end function
  end interface

  !>  @brief Create a mipmapped array.
  !>
  !>  @param [out] pHandle  pointer to mipmapped array
  !>  @param [in] pMipmappedArrayDesc  mipmapped array descriptor
  !>  @param [in] numMipmapLevels  mipmap level
  !>
  !>  @returns `hipSuccess`, `hipErrorNotSupported`, `hipErrorInvalidValue`
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMipmappedArrayCreate
#ifdef USE_CUDA_NAMES
    function hipMipmappedArrayCreate_(pHandle,pMipmappedArrayDesc,numMipmapLevels) &
        bind(c, name="cudaMipmappedArrayCreate")
#else
    function hipMipmappedArrayCreate_(pHandle,pMipmappedArrayDesc,numMipmapLevels) &
        bind(c, name="hipMipmappedArrayCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMipmappedArrayCreate_
      type(c_ptr) :: pHandle
      type(HIP_ARRAY3D_DESCRIPTOR) :: pMipmappedArrayDesc
      integer(c_int),value :: numMipmapLevels
    end function
  end interface

  !>  @brief Destroy a mipmapped array.
  !>
  !>  @param [out] hMipmappedArray  pointer to mipmapped array to destroy
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMipmappedArrayDestroy
#ifdef USE_CUDA_NAMES
    function hipMipmappedArrayDestroy_(hMipmappedArray) bind(c, name="cudaMipmappedArrayDestroy")
#else
    function hipMipmappedArrayDestroy_(hMipmappedArray) bind(c, name="hipMipmappedArrayDestroy")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMipmappedArrayDestroy_
      type(c_ptr),value :: hMipmappedArray
    end function
  end interface

  !>  @brief Get a mipmapped array on a mipmapped level.
  !>
  !>  @param [in] pLevelArray Pointer of array
  !>  @param [out] hMipMappedArray Pointer of mipmapped array on the requested mipmap level
  !>  @param [out] level  Mipmap level
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMipmappedArrayGetLevel
#ifdef USE_CUDA_NAMES
    function hipMipmappedArrayGetLevel_(pLevelArray,hMipMappedArray,level) &
        bind(c, name="cudaMipmappedArrayGetLevel")
#else
    function hipMipmappedArrayGetLevel_(pLevelArray,hMipMappedArray,level) &
        bind(c, name="hipMipmappedArrayGetLevel")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMipmappedArrayGetLevel_
      type(c_ptr) :: pLevelArray
      type(c_ptr),value :: hMipMappedArray
      integer(c_int),value :: level
    end function
  end interface

  !>  @brief Begins graph capture on a stream.
  !>
  !>  @param [in] stream - Stream to initiate capture.
  !>  @param [in] mode - Controls the interaction of this capture sequence with other API calls that
  !>  are not safe.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipStreamBeginCapture
#ifdef USE_CUDA_NAMES
    function hipStreamBeginCapture_(stream,mode) bind(c, name="cudaStreamBeginCapture")
#else
    function hipStreamBeginCapture_(stream,mode) bind(c, name="hipStreamBeginCapture")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamBeginCapture_
      type(c_ptr),value :: stream
      integer(kind(hipStreamCaptureModeGlobal)),value :: mode
    end function
  end interface

  !>  @brief Ends capture on a stream, returning the captured graph.
  !>
  !>  @param [in] stream - Stream to end capture.
  !>  @param [out] pGraph - Captured graph.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipStreamEndCapture
#ifdef USE_CUDA_NAMES
    function hipStreamEndCapture_(stream,pGraph) bind(c, name="cudaStreamEndCapture")
#else
    function hipStreamEndCapture_(stream,pGraph) bind(c, name="hipStreamEndCapture")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamEndCapture_
      type(c_ptr),value :: stream
      type(c_ptr) :: pGraph
    end function
  end interface

  !>  @brief Get capture status of a stream.
  !>
  !>  @param [in] stream - Stream of which to get capture status from.
  !>  @param [out] pCaptureStatus - Returns current capture status.
  !>  @param [out] pId - Unique capture ID.
  !>
  !>  @returns `hipSuccess`, `hipErrorStreamCaptureImplicit`
  interface hipStreamGetCaptureInfo
#ifdef USE_CUDA_NAMES
    function hipStreamGetCaptureInfo_(stream,pCaptureStatus,pId) &
        bind(c, name="cudaStreamGetCaptureInfo")
#else
    function hipStreamGetCaptureInfo_(stream,pCaptureStatus,pId) &
        bind(c, name="hipStreamGetCaptureInfo")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_
      type(c_ptr),value :: stream
      type(c_ptr),value :: pCaptureStatus
      type(c_ptr),value :: pId
    end function
  end interface

  !>  @brief Get stream's capture state
  !>
  !>  @param [in] stream - Stream of which to get capture status from.
  !>  @param [out] captureStatus_out - Returns current capture status.
  !>  @param [out] id_out - Unique capture ID.
  !>  @param [out] graph_out - Returns the graph being captured into.
  !>  @param [out] dependencies_out - Pointer to an array of nodes representing the graphs
  !>  dependencies.
  !>  @param [out] numDependencies_out - Returns size of the array returned in dependencies_out.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorStreamCaptureImplicit`
  interface hipStreamGetCaptureInfo_v2
#ifdef USE_CUDA_NAMES
    function hipStreamGetCaptureInfo_v2_(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out) &
        bind(c, name="cudaStreamGetCaptureInfo_v2")
#else
    function hipStreamGetCaptureInfo_v2_(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out) &
        bind(c, name="hipStreamGetCaptureInfo_v2")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_
      type(c_ptr),value :: stream
      type(c_ptr),value :: captureStatus_out
      type(c_ptr),value :: id_out
      type(c_ptr) :: graph_out
      type(c_ptr) :: dependencies_out
      type(c_ptr),value :: numDependencies_out
    end function
  end interface

  !>  @brief Get stream's capture state
  !>
  !>  @param [in] stream - Stream of which to get capture status from.
  !>  @param [out] pCaptureStatus - Returns current capture status.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorStreamCaptureImplicit`
  interface hipStreamIsCapturing
#ifdef USE_CUDA_NAMES
    function hipStreamIsCapturing_(stream,pCaptureStatus) bind(c, name="cudaStreamIsCapturing")
#else
    function hipStreamIsCapturing_(stream,pCaptureStatus) bind(c, name="hipStreamIsCapturing")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_
      type(c_ptr),value :: stream
      type(c_ptr),value :: pCaptureStatus
    end function
  end interface

  !>  @brief Update the set of dependencies in a capturing stream
  !>
  !>  @param [in] stream  Stream that is being captured.
  !>  @param [in] dependencies  Pointer to an array of nodes to add/replace.
  !>  @param [in] numDependencies  Size of the dependencies array.
  !>  @param [in] flags  Flag to update dependency set. Should be one of the values
  !>  in enum `hipStreamUpdateCaptureDependenciesFlags`.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorIllegalState`
  interface hipStreamUpdateCaptureDependencies
#ifdef USE_CUDA_NAMES
    function hipStreamUpdateCaptureDependencies_(stream,dependencies,numDependencies,flags) &
        bind(c, name="cudaStreamUpdateCaptureDependencies")
#else
    function hipStreamUpdateCaptureDependencies_(stream,dependencies,numDependencies,flags) &
        bind(c, name="hipStreamUpdateCaptureDependencies")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamUpdateCaptureDependencies_
      type(c_ptr),value :: stream
      type(c_ptr) :: dependencies
      integer(c_size_t),value :: numDependencies
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a graph
  !>
  !>  @param [out] pGraph - pointer to graph to create.
  !>  @param [in] flags - flags for graph creation, must be 0.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorMemoryAllocation`
  interface hipGraphCreate
#ifdef USE_CUDA_NAMES
    function hipGraphCreate_(pGraph,flags) bind(c, name="cudaGraphCreate")
#else
    function hipGraphCreate_(pGraph,flags) bind(c, name="hipGraphCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphCreate_
      type(c_ptr) :: pGraph
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Destroys a graph
  !>
  !>  @param [in] graph - instance of graph to destroy.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphDestroy
#ifdef USE_CUDA_NAMES
    function hipGraphDestroy_(graph) bind(c, name="cudaGraphDestroy")
#else
    function hipGraphDestroy_(graph) bind(c, name="hipGraphDestroy")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphDestroy_
      type(c_ptr),value :: graph
    end function
  end interface

  !>  @brief Adds dependency edges to a graph.
  !>
  !>  @param [in] graph - Instance of the graph to add dependencies to.
  !>  @param [in] from - Pointer to the graph nodes with dependencies to add from.
  !>  @param [in] to - Pointer to the graph nodes to add dependencies to.
  !>  @param [in] numDependencies - Number of dependencies to add.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddDependencies
#ifdef USE_CUDA_NAMES
    function hipGraphAddDependencies_(graph,from,to,numDependencies) &
        bind(c, name="cudaGraphAddDependencies")
#else
    function hipGraphAddDependencies_(graph,from,to,numDependencies) &
        bind(c, name="hipGraphAddDependencies")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddDependencies_
      type(c_ptr),value :: graph
      type(c_ptr) :: from
      type(c_ptr) :: to
      integer(c_size_t),value :: numDependencies
    end function
  end interface

  !>  @brief Removes dependency edges from a graph.
  !>
  !>  @param [in] graph - Instance of the graph to remove dependencies from.
  !>  @param [in] from - Array of nodes that provide the dependencies.
  !>  @param [in] to - Array of dependent nodes.
  !>  @param [in] numDependencies - Number of dependencies to remove.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphRemoveDependencies
#ifdef USE_CUDA_NAMES
    function hipGraphRemoveDependencies_(graph,from,to,numDependencies) &
        bind(c, name="cudaGraphRemoveDependencies")
#else
    function hipGraphRemoveDependencies_(graph,from,to,numDependencies) &
        bind(c, name="hipGraphRemoveDependencies")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphRemoveDependencies_
      type(c_ptr),value :: graph
      type(c_ptr) :: from
      type(c_ptr) :: to
      integer(c_size_t),value :: numDependencies
    end function
  end interface

  !>  @brief Returns a graph's dependency edges.
  !>
  !>  @param [in] graph - Instance of the graph to get the edges from.
  !>  @param [out] from - Pointer to the graph nodes to return edge endpoints.
  !>  @param [out] to - Pointer to the graph nodes to return edge endpoints.
  !>  @param [out] numEdges - Returns number of edges.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  from and to may both be NULL, in which case this function only returns the number of edges in
  !>  numEdges. Otherwise, numEdges entries will be filled in. If numEdges is higher than the actual
  !>  number of edges, the remaining entries in from and to will be set to NULL, and the number of
  !>  edges actually returned will be written to numEdges.
  interface hipGraphGetEdges
#ifdef USE_CUDA_NAMES
    function hipGraphGetEdges_(graph,from,to,numEdges) bind(c, name="cudaGraphGetEdges")
#else
    function hipGraphGetEdges_(graph,from,to,numEdges) bind(c, name="hipGraphGetEdges")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetEdges_
      type(c_ptr),value :: graph
      type(c_ptr) :: from
      type(c_ptr) :: to
      type(c_ptr),value :: numEdges
    end function
  end interface

  !>  @brief Returns a graph's nodes.
  !>
  !>  @param [in] graph - Instance of graph to get the nodes from.
  !>  @param [out] nodes - Pointer to return the  graph nodes.
  !>  @param [out] numNodes - Returns the number of graph nodes.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  nodes may be NULL, in which case this function will return the number of nodes in numNodes.
  !>  Otherwise, numNodes entries will be filled in. If numNodes is higher than the actual number of
  !>  nodes, the remaining entries in nodes will be set to NULL, and the number of nodes actually
  !>  obtained will be returned in numNodes.
  interface hipGraphGetNodes
#ifdef USE_CUDA_NAMES
    function hipGraphGetNodes_(graph,nodes,numNodes) bind(c, name="cudaGraphGetNodes")
#else
    function hipGraphGetNodes_(graph,nodes,numNodes) bind(c, name="hipGraphGetNodes")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetNodes_
      type(c_ptr),value :: graph
      type(c_ptr) :: nodes
      type(c_ptr),value :: numNodes
    end function
  end interface

  !>  @brief Returns a graph's root nodes.
  !>
  !>  @param [in] graph - Instance of the graph to get the nodes from.
  !>  @param [out] pRootNodes - Pointer to return the graph's root nodes.
  !>  @param [out] pNumRootNodes - Returns the number of graph's root nodes.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  pRootNodes may be NULL, in which case this function will return the number of root nodes in
  !>  pNumRootNodes. Otherwise, pNumRootNodes entries will be filled in. If pNumRootNodes is higher
  !>  than the actual number of root nodes, the remaining entries in pRootNodes will be set to NULL,
  !>  and the number of nodes actually obtained will be returned in pNumRootNodes.
  interface hipGraphGetRootNodes
#ifdef USE_CUDA_NAMES
    function hipGraphGetRootNodes_(graph,pRootNodes,pNumRootNodes) &
        bind(c, name="cudaGraphGetRootNodes")
#else
    function hipGraphGetRootNodes_(graph,pRootNodes,pNumRootNodes) &
        bind(c, name="hipGraphGetRootNodes")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetRootNodes_
      type(c_ptr),value :: graph
      type(c_ptr) :: pRootNodes
      type(c_ptr),value :: pNumRootNodes
    end function
  end interface

  !>  @brief Returns a node's dependencies.
  !>
  !>  @param [in] node - Graph node to get the dependencies from.
  !>  @param [out] pDependencies - Pointer to return the dependencies.
  !>  @param [out] pNumDependencies -  Returns the number of graph node dependencies.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  pDependencies may be NULL, in which case this function will return the number of dependencies
  !>  in
  !>  pNumDependencies. Otherwise, pNumDependencies entries will be filled in. If pNumDependencies
  !>  is
  !>  higher than the actual number of dependencies, the remaining entries in pDependencies will be
  !>  set
  !>  to NULL, and the number of nodes actually obtained will be returned in pNumDependencies.
  interface hipGraphNodeGetDependencies
#ifdef USE_CUDA_NAMES
    function hipGraphNodeGetDependencies_(node,pDependencies,pNumDependencies) &
        bind(c, name="cudaGraphNodeGetDependencies")
#else
    function hipGraphNodeGetDependencies_(node,pDependencies,pNumDependencies) &
        bind(c, name="hipGraphNodeGetDependencies")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependencies_
      type(c_ptr),value :: node
      type(c_ptr) :: pDependencies
      type(c_ptr),value :: pNumDependencies
    end function
  end interface

  !>  @brief Returns a node's dependent nodes.
  !>
  !>  @param [in] node - Graph node to get the dependent nodes from.
  !>  @param [out] pDependentNodes - Pointer to return the graph dependent nodes.
  !>  @param [out] pNumDependentNodes - Returns the number of graph node dependent nodes.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  pDependentNodes may be NULL, in which case this function will return the number of dependent
  !>  nodes in pNumDependentNodes. Otherwise, pNumDependentNodes entries will be filled in. If
  !>  pNumDependentNodes is higher than the actual number of dependent nodes, the remaining entries
  !>  in
  !>  pDependentNodes will be set to NULL, and the number of nodes actually obtained will be
  !>  returned
  !>  in pNumDependentNodes.
  interface hipGraphNodeGetDependentNodes
#ifdef USE_CUDA_NAMES
    function hipGraphNodeGetDependentNodes_(node,pDependentNodes,pNumDependentNodes) &
        bind(c, name="cudaGraphNodeGetDependentNodes")
#else
    function hipGraphNodeGetDependentNodes_(node,pDependentNodes,pNumDependentNodes) &
        bind(c, name="hipGraphNodeGetDependentNodes")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependentNodes_
      type(c_ptr),value :: node
      type(c_ptr) :: pDependentNodes
      type(c_ptr),value :: pNumDependentNodes
    end function
  end interface

  !>  @brief Returns a node's type.
  !>
  !>  @param [in] node - Node to get type of.
  !>  @param [out] pType - Returns the node's type.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphNodeGetType
#ifdef USE_CUDA_NAMES
    function hipGraphNodeGetType_(node,pType) bind(c, name="cudaGraphNodeGetType")
#else
    function hipGraphNodeGetType_(node,pType) bind(c, name="hipGraphNodeGetType")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetType_
      type(c_ptr),value :: node
      type(c_ptr),value :: pType
    end function
  end interface

  !>  @brief Remove a node from the graph.
  !>
  !>  @param [in] node - graph node to remove
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphDestroyNode
#ifdef USE_CUDA_NAMES
    function hipGraphDestroyNode_(node) bind(c, name="cudaGraphDestroyNode")
#else
    function hipGraphDestroyNode_(node) bind(c, name="hipGraphDestroyNode")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphDestroyNode_
      type(c_ptr),value :: node
    end function
  end interface

  !>  @brief Clones a graph.
  !>
  !>  @param [out] pGraphClone - Returns newly created cloned graph.
  !>  @param [in] originalGraph - original graph to clone from.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorMemoryAllocation`
  interface hipGraphClone
#ifdef USE_CUDA_NAMES
    function hipGraphClone_(pGraphClone,originalGraph) bind(c, name="cudaGraphClone")
#else
    function hipGraphClone_(pGraphClone,originalGraph) bind(c, name="hipGraphClone")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphClone_
      type(c_ptr) :: pGraphClone
      type(c_ptr),value :: originalGraph
    end function
  end interface

  !>  @brief Finds a cloned version of a node.
  !>
  !>  @param [out] pNode - Returns the cloned node.
  !>  @param [in] originalNode - original node handle.
  !>  @param [in] clonedGraph - Cloned graph to query.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphNodeFindInClone
#ifdef USE_CUDA_NAMES
    function hipGraphNodeFindInClone_(pNode,originalNode,clonedGraph) &
        bind(c, name="cudaGraphNodeFindInClone")
#else
    function hipGraphNodeFindInClone_(pNode,originalNode,clonedGraph) &
        bind(c, name="hipGraphNodeFindInClone")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeFindInClone_
      type(c_ptr) :: pNode
      type(c_ptr),value :: originalNode
      type(c_ptr),value :: clonedGraph
    end function
  end interface

  !>  @brief Creates an executable graph from a graph
  !>
  !>  @param [out] pGraphExec - Pointer to instantiated executable graph.
  !>  @param [in] graph - Instance of graph to instantiate.
  !>  @param [out] pErrorNode - Pointer to error node. In case an error occured during
  !>  graph instantiation, it could modify the corresponding node.
  !>  @param [out] pLogBuffer - Pointer to log buffer.
  !>  @param [out] bufferSize - Size of the log buffer.
  !>
  !>  @returns `hipSuccess`, `hipErrorOutOfMemory`
  interface hipGraphInstantiate
#ifdef USE_CUDA_NAMES
    function hipGraphInstantiate_(pGraphExec,graph,pErrorNode,pLogBuffer,bufferSize) &
        bind(c, name="cudaGraphInstantiate")
#else
    function hipGraphInstantiate_(pGraphExec,graph,pErrorNode,pLogBuffer,bufferSize) &
        bind(c, name="hipGraphInstantiate")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphInstantiate_
      type(c_ptr) :: pGraphExec
      type(c_ptr),value :: graph
      type(c_ptr) :: pErrorNode
      type(c_ptr),value :: pLogBuffer
      integer(c_size_t),value :: bufferSize
    end function
  end interface

  !>  @brief Creates an executable graph from a graph.
  !>
  !>  @param [out] pGraphExec - Pointer to instantiated executable graph.
  !>  @param [in] graph - Instance of graph to instantiate.
  !>  @param [in] flags - Flags to control instantiation.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning This API does not support any of flag and is behaving as hipGraphInstantiate.
  interface hipGraphInstantiateWithFlags
#ifdef USE_CUDA_NAMES
    function hipGraphInstantiateWithFlags_(pGraphExec,graph,flags) &
        bind(c, name="cudaGraphInstantiateWithFlags")
#else
    function hipGraphInstantiateWithFlags_(pGraphExec,graph,flags) &
        bind(c, name="hipGraphInstantiateWithFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphInstantiateWithFlags_
      type(c_ptr) :: pGraphExec
      type(c_ptr),value :: graph
      integer(c_int64_t),value :: flags
    end function
  end interface

  !>  @brief Launches an executable graph in the specified stream.
  !>
  !>  @param [in] graphExec - Instance of executable graph to launch.
  !>  @param [in] stream - Instance of stream in which to launch executable graph.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphLaunch
#ifdef USE_CUDA_NAMES
    function hipGraphLaunch_(graphExec,stream) bind(c, name="cudaGraphLaunch")
#else
    function hipGraphLaunch_(graphExec,stream) bind(c, name="hipGraphLaunch")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphLaunch_
      type(c_ptr),value :: graphExec
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Destroys an executable graph
  !>
  !>  @param [in] graphExec - Instance of executable graph to destroy.
  !>
  !>  @returns `hipSuccess`.
  interface hipGraphExecDestroy
#ifdef USE_CUDA_NAMES
    function hipGraphExecDestroy_(graphExec) bind(c, name="cudaGraphExecDestroy")
#else
    function hipGraphExecDestroy_(graphExec) bind(c, name="hipGraphExecDestroy")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecDestroy_
      type(c_ptr),value :: graphExec
    end function
  end interface

  !>  @brief Check whether an executable graph can be updated with a graph and perform the update if
  !>  *
  !>  possible.
  !>
  !>  @param [in] hGraphExec - instance of executable graph to update.
  !>  @param [in] hGraph - graph that contains the updated parameters.
  !>  @param [in] hErrorNode_out -  node which caused the permissibility check to forbid the update.
  !>  @param [in] updateResult_out - Return code whether the graph update was performed.
  !>  @returns `hipSuccess`, `hipErrorGraphExecUpdateFailure`
  interface hipGraphExecUpdate
#ifdef USE_CUDA_NAMES
    function hipGraphExecUpdate_(hGraphExec,hGraph,hErrorNode_out,updateResult_out) &
        bind(c, name="cudaGraphExecUpdate")
#else
    function hipGraphExecUpdate_(hGraphExec,hGraph,hErrorNode_out,updateResult_out) &
        bind(c, name="hipGraphExecUpdate")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecUpdate_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: hGraph
      type(c_ptr) :: hErrorNode_out
      type(c_ptr),value :: updateResult_out
    end function
  end interface

  !>  @brief Creates a kernel execution node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to graph node that is created
  !>  @param [in] graph - Instance of graph to add the created node to.
  !>  @param [in] pDependencies - Pointer to the dependencies of the kernel execution node.
  !>  @param [in] numDependencies - The number of the dependencies.
  !>  @param [in] pNodeParams - Pointer to the parameters of the kernel execution node.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDeviceFunction`
  interface hipGraphAddKernelNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddKernelNode_(pGraphNode,graph,pDependencies,numDependencies,pNodeParams) &
        bind(c, name="cudaGraphAddKernelNode")
#else
    function hipGraphAddKernelNode_(pGraphNode,graph,pDependencies,numDependencies,pNodeParams) &
        bind(c, name="hipGraphAddKernelNode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddKernelNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(hipKernelNodeParams) :: pNodeParams
    end function
  end interface

  !>  @brief Gets kernel node's parameters.
  !>
  !>  @param [in] node - instance of the node to get parameters from.
  !>  @param [out] pNodeParams - pointer to the parameters
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphKernelNodeGetParams
#ifdef USE_CUDA_NAMES
    function hipGraphKernelNodeGetParams_(node,pNodeParams) &
        bind(c, name="cudaGraphKernelNodeGetParams")
#else
    function hipGraphKernelNodeGetParams_(node,pNodeParams) &
        bind(c, name="hipGraphKernelNodeGetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphKernelNodeGetParams_
      type(c_ptr),value :: node
      type(hipKernelNodeParams) :: pNodeParams
    end function
  end interface

  !>  @brief Sets a kernel node's parameters.
  !>
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] pNodeParams - const pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphKernelNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphKernelNodeSetParams_(node,pNodeParams) &
        bind(c, name="cudaGraphKernelNodeSetParams")
#else
    function hipGraphKernelNodeSetParams_(node,pNodeParams) &
        bind(c, name="hipGraphKernelNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphKernelNodeSetParams_
      type(c_ptr),value :: node
      type(hipKernelNodeParams) :: pNodeParams
    end function
  end interface

  !>  @brief Sets the parameters for a kernel node in the given graphExec.
  !>
  !>  @param [in] hGraphExec - Instance of the executable graph with the node.
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] pNodeParams - const pointer to the kernel node parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecKernelNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExecKernelNodeSetParams_(hGraphExec,node,pNodeParams) &
        bind(c, name="cudaGraphExecKernelNodeSetParams")
#else
    function hipGraphExecKernelNodeSetParams_(hGraphExec,node,pNodeParams) &
        bind(c, name="hipGraphExecKernelNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecKernelNodeSetParams_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: node
      type(hipKernelNodeParams) :: pNodeParams
    end function
  end interface

  !>  @brief Creates a memcpy node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to graph node that is created.
  !>  @param [in] graph - Instance of graph to add the created node to.
  !>  @param [in] pDependencies - const pointer to the dependencies of the memcpy execution node.
  !>  @param [in] numDependencies - The number of dependencies.
  !>  @param [in] pCopyParams - const pointer to the parameters for the memory copy.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddMemcpyNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddMemcpyNode_(pGraphNode,graph,pDependencies,numDependencies,pCopyParams) &
        bind(c, name="cudaGraphAddMemcpyNode")
#else
    function hipGraphAddMemcpyNode_(pGraphNode,graph,pDependencies,numDependencies,pCopyParams) &
        bind(c, name="hipGraphAddMemcpyNode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddMemcpyNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(hipMemcpy3DParms) :: pCopyParams
    end function
  end interface

  !>  @brief Gets a memcpy node's parameters.
  !>
  !>  @param [in] node - instance of the node to get parameters from.
  !>  @param [out] pNodeParams - pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphMemcpyNodeGetParams
#ifdef USE_CUDA_NAMES
    function hipGraphMemcpyNodeGetParams_(node,pNodeParams) &
        bind(c, name="cudaGraphMemcpyNodeGetParams")
#else
    function hipGraphMemcpyNodeGetParams_(node,pNodeParams) &
        bind(c, name="hipGraphMemcpyNodeGetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphMemcpyNodeGetParams_
      type(c_ptr),value :: node
      type(hipMemcpy3DParms) :: pNodeParams
    end function
  end interface

  !>  @brief Sets a memcpy node's parameters.
  !>
  !>  @param [in] node - instance of the node to set parameters to.
  !>  @param [in] pNodeParams - const pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphMemcpyNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphMemcpyNodeSetParams_(node,pNodeParams) &
        bind(c, name="cudaGraphMemcpyNodeSetParams")
#else
    function hipGraphMemcpyNodeSetParams_(node,pNodeParams) &
        bind(c, name="hipGraphMemcpyNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphMemcpyNodeSetParams_
      type(c_ptr),value :: node
      type(hipMemcpy3DParms) :: pNodeParams
    end function
  end interface

  !>  @brief Sets the parameters of a memcpy node in the given graphExec.
  !>
  !>  @param [in] hGraphExec - Instance of the executable graph with the node.
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] pNodeParams - const pointer to the kernel node parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecMemcpyNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExecMemcpyNodeSetParams_(hGraphExec,node,pNodeParams) &
        bind(c, name="cudaGraphExecMemcpyNodeSetParams")
#else
    function hipGraphExecMemcpyNodeSetParams_(hGraphExec,node,pNodeParams) &
        bind(c, name="hipGraphExecMemcpyNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecMemcpyNodeSetParams_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: node
      type(hipMemcpy3DParms) :: pNodeParams
    end function
  end interface

  !>  @brief Creates a 1D memcpy node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to graph node that is created.
  !>  @param [in] graph - Instance of graph to add the created node to.
  !>  @param [in] pDependencies - const pointer to the dependencies of the memcpy execution node.
  !>  @param [in] numDependencies - The number of dependencies.
  !>  @param [in] dst - Pointer to memory address of the destination.
  !>  @param [in] src - Pointer to memory address of the source.
  !>  @param [in] count - Size of the memory to copy.
  !>  @param [in] kind - Type of memory copy.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddMemcpyNode1D
#ifdef USE_CUDA_NAMES
    function hipGraphAddMemcpyNode1D_(pGraphNode,graph,pDependencies,numDependencies,dst,src, &
        count,myKind) &
        bind(c, name="cudaGraphAddMemcpyNode1D")
#else
    function hipGraphAddMemcpyNode1D_(pGraphNode,graph,pDependencies,numDependencies,dst,src, &
        count,myKind) &
        bind(c, name="hipGraphAddMemcpyNode1D")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddMemcpyNode1D_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: count
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>  @brief Sets a memcpy node's parameters to perform a 1-dimensional copy.
  !>
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] dst - Pointer to memory address of the destination.
  !>  @param [in] src - Pointer to memory address of the source.
  !>  @param [in] count - Size of the memory to copy.
  !>  @param [in] kind - Type of memory copy.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphMemcpyNodeSetParams1D
#ifdef USE_CUDA_NAMES
    function hipGraphMemcpyNodeSetParams1D_(node,dst,src,count,myKind) &
        bind(c, name="cudaGraphMemcpyNodeSetParams1D")
#else
    function hipGraphMemcpyNodeSetParams1D_(node,dst,src,count,myKind) &
        bind(c, name="hipGraphMemcpyNodeSetParams1D")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphMemcpyNodeSetParams1D_
      type(c_ptr),value :: node
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: count
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>  @brief Sets the parameters for a memcpy node in the given graphExec to perform a 1-dimensional
  !>  copy.
  !>
  !>  @param [in] hGraphExec - Instance of the executable graph with the node.
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] dst - Pointer to memory address of the destination.
  !>  @param [in] src - Pointer to memory address of the source.
  !>  @param [in] count - Size of the memory to copy.
  !>  @param [in] kind - Type of memory copy.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecMemcpyNodeSetParams1D
#ifdef USE_CUDA_NAMES
    function hipGraphExecMemcpyNodeSetParams1D_(hGraphExec,node,dst,src,count,myKind) &
        bind(c, name="cudaGraphExecMemcpyNodeSetParams1D")
#else
    function hipGraphExecMemcpyNodeSetParams1D_(hGraphExec,node,dst,src,count,myKind) &
        bind(c, name="hipGraphExecMemcpyNodeSetParams1D")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecMemcpyNodeSetParams1D_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: node
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: count
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>  @brief Creates a memcpy node to copy from a symbol on the device and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to graph node that is created.
  !>  @param [in] graph - Instance of graph to add the created node to.
  !>  @param [in] pDependencies - const pointer to the dependencies of the memcpy execution node.
  !>  @param [in] numDependencies - Number of the dependencies.
  !>  @param [in] dst - Pointer to memory address of the destination.
  !>  @param [in] symbol - Device symbol address.
  !>  @param [in] count - Size of the memory to copy.
  !>  @param [in] offset - Offset from start of symbol in bytes.
  !>  @param [in] kind - Type of memory copy.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddMemcpyNodeFromSymbol
#ifdef USE_CUDA_NAMES
    function hipGraphAddMemcpyNodeFromSymbol_(pGraphNode,graph,pDependencies,numDependencies,dst, &
        symbol,count,offset,myKind) &
        bind(c, name="cudaGraphAddMemcpyNodeFromSymbol")
#else
    function hipGraphAddMemcpyNodeFromSymbol_(pGraphNode,graph,pDependencies,numDependencies,dst, &
        symbol,count,offset,myKind) &
        bind(c, name="hipGraphAddMemcpyNodeFromSymbol")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddMemcpyNodeFromSymbol_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(c_ptr),value :: dst
      type(c_ptr),value :: symbol
      integer(c_size_t),value :: count
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>  @brief Sets a memcpy node's parameters to copy from a symbol on the device.
  !>
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] dst - Pointer to memory address of the destination.
  !>  @param [in] symbol - Device symbol address.
  !>  @param [in] count - Size of the memory to copy.
  !>  @param [in] offset - Offset from start of symbol in bytes.
  !>  @param [in] kind - Type of memory copy.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphMemcpyNodeSetParamsFromSymbol
#ifdef USE_CUDA_NAMES
    function hipGraphMemcpyNodeSetParamsFromSymbol_(node,dst,symbol,count,offset,myKind) &
        bind(c, name="cudaGraphMemcpyNodeSetParamsFromSymbol")
#else
    function hipGraphMemcpyNodeSetParamsFromSymbol_(node,dst,symbol,count,offset,myKind) &
        bind(c, name="hipGraphMemcpyNodeSetParamsFromSymbol")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphMemcpyNodeSetParamsFromSymbol_
      type(c_ptr),value :: node
      type(c_ptr),value :: dst
      type(c_ptr),value :: symbol
      integer(c_size_t),value :: count
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>  @brief Sets the parameters for a memcpy node in the given graphExec to copy from a symbol on
  !>  the
  !>  * device.
  !>
  !>  @param [in] hGraphExec - Instance of the executable graph with the node.
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] dst - Pointer to memory address of the destination.
  !>  @param [in] symbol - Device symbol address.
  !>  @param [in] count - Size of the memory to copy.
  !>  @param [in] offset - Offset from start of symbol in bytes.
  !>  @param [in] kind - Type of memory copy.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecMemcpyNodeSetParamsFromSymbol
#ifdef USE_CUDA_NAMES
    function hipGraphExecMemcpyNodeSetParamsFromSymbol_(hGraphExec,node,dst,symbol,count,offset, &
        myKind) &
        bind(c, name="cudaGraphExecMemcpyNodeSetParamsFromSymbol")
#else
    function hipGraphExecMemcpyNodeSetParamsFromSymbol_(hGraphExec,node,dst,symbol,count,offset, &
        myKind) &
        bind(c, name="hipGraphExecMemcpyNodeSetParamsFromSymbol")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecMemcpyNodeSetParamsFromSymbol_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: node
      type(c_ptr),value :: dst
      type(c_ptr),value :: symbol
      integer(c_size_t),value :: count
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>  @brief Creates a memcpy node to copy to a symbol on the device and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to graph node that is created.
  !>  @param [in] graph - Instance of graph to add the created node to.
  !>  @param [in] pDependencies - const pointer to the dependencies on the memcpy execution node.
  !>  @param [in] numDependencies - Number of dependencies.
  !>  @param [in] symbol - Device symbol address.
  !>  @param [in] src - Pointer to memory address of the src.
  !>  @param [in] count - Size of the memory to copy.
  !>  @param [in] offset - Offset from start of symbol in bytes.
  !>  @param [in] kind - Type of memory copy.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddMemcpyNodeToSymbol
#ifdef USE_CUDA_NAMES
    function hipGraphAddMemcpyNodeToSymbol_(pGraphNode,graph,pDependencies,numDependencies,symbol, &
        src,count,offset,myKind) &
        bind(c, name="cudaGraphAddMemcpyNodeToSymbol")
#else
    function hipGraphAddMemcpyNodeToSymbol_(pGraphNode,graph,pDependencies,numDependencies,symbol, &
        src,count,offset,myKind) &
        bind(c, name="hipGraphAddMemcpyNodeToSymbol")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddMemcpyNodeToSymbol_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(c_ptr),value :: symbol
      type(c_ptr),value :: src
      integer(c_size_t),value :: count
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>  @brief Sets a memcpy node's parameters to copy to a symbol on the device.
  !>
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] symbol - Device symbol address.
  !>  @param [in] src - Pointer to memory address of the src.
  !>  @param [in] count - Size of the memory to copy.
  !>  @param [in] offset - Offset from start of symbol in bytes.
  !>  @param [in] kind - Type of memory copy.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphMemcpyNodeSetParamsToSymbol
#ifdef USE_CUDA_NAMES
    function hipGraphMemcpyNodeSetParamsToSymbol_(node,symbol,src,count,offset,myKind) &
        bind(c, name="cudaGraphMemcpyNodeSetParamsToSymbol")
#else
    function hipGraphMemcpyNodeSetParamsToSymbol_(node,symbol,src,count,offset,myKind) &
        bind(c, name="hipGraphMemcpyNodeSetParamsToSymbol")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphMemcpyNodeSetParamsToSymbol_
      type(c_ptr),value :: node
      type(c_ptr),value :: symbol
      type(c_ptr),value :: src
      integer(c_size_t),value :: count
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>  @brief Sets the parameters for a memcpy node in the given graphExec to copy to a symbol on the
  !>  device.
  !>  @param [in] hGraphExec - Instance of the executable graph with the node.
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] symbol - Device symbol address.
  !>  @param [in] src - Pointer to memory address of the src.
  !>  @param [in] count - Size of the memory to copy.
  !>  @param [in] offset - Offset from start of symbol in bytes.
  !>  @param [in] kind - Type of memory copy.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecMemcpyNodeSetParamsToSymbol
#ifdef USE_CUDA_NAMES
    function hipGraphExecMemcpyNodeSetParamsToSymbol_(hGraphExec,node,symbol,src,count,offset, &
        myKind) &
        bind(c, name="cudaGraphExecMemcpyNodeSetParamsToSymbol")
#else
    function hipGraphExecMemcpyNodeSetParamsToSymbol_(hGraphExec,node,symbol,src,count,offset, &
        myKind) &
        bind(c, name="hipGraphExecMemcpyNodeSetParamsToSymbol")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecMemcpyNodeSetParamsToSymbol_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: node
      type(c_ptr),value :: symbol
      type(c_ptr),value :: src
      integer(c_size_t),value :: count
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>  @brief Creates a memset node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to graph node that is created.
  !>  @param [in] graph - Instance of the graph to add the created node to.
  !>  @param [in] pDependencies - const pointer to the dependencies on the memset execution node.
  !>  @param [in] numDependencies - Number of dependencies.
  !>  @param [in] pMemsetParams - const pointer to the parameters for the memory set.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddMemsetNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddMemsetNode_(pGraphNode,graph,pDependencies,numDependencies,pMemsetParams) &
        bind(c, name="cudaGraphAddMemsetNode")
#else
    function hipGraphAddMemsetNode_(pGraphNode,graph,pDependencies,numDependencies,pMemsetParams) &
        bind(c, name="hipGraphAddMemsetNode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddMemsetNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(hipMemsetParams) :: pMemsetParams
    end function
  end interface

  !>  @brief Gets a memset node's parameters.
  !>
  !>  @param [in] node - Instance of the node to get parameters of.
  !>  @param [out] pNodeParams - Pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphMemsetNodeGetParams
#ifdef USE_CUDA_NAMES
    function hipGraphMemsetNodeGetParams_(node,pNodeParams) &
        bind(c, name="cudaGraphMemsetNodeGetParams")
#else
    function hipGraphMemsetNodeGetParams_(node,pNodeParams) &
        bind(c, name="hipGraphMemsetNodeGetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphMemsetNodeGetParams_
      type(c_ptr),value :: node
      type(hipMemsetParams) :: pNodeParams
    end function
  end interface

  !>  @brief Sets a memset node's parameters.
  !>
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] pNodeParams - Pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphMemsetNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphMemsetNodeSetParams_(node,pNodeParams) &
        bind(c, name="cudaGraphMemsetNodeSetParams")
#else
    function hipGraphMemsetNodeSetParams_(node,pNodeParams) &
        bind(c, name="hipGraphMemsetNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphMemsetNodeSetParams_
      type(c_ptr),value :: node
      type(hipMemsetParams) :: pNodeParams
    end function
  end interface

  !>  @brief Sets the parameters for a memset node in the given graphExec.
  !>
  !>  @param [in] hGraphExec - Instance of the executable graph with the node.
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] pNodeParams - Pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecMemsetNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExecMemsetNodeSetParams_(hGraphExec,node,pNodeParams) &
        bind(c, name="cudaGraphExecMemsetNodeSetParams")
#else
    function hipGraphExecMemsetNodeSetParams_(hGraphExec,node,pNodeParams) &
        bind(c, name="hipGraphExecMemsetNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecMemsetNodeSetParams_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: node
      type(hipMemsetParams) :: pNodeParams
    end function
  end interface

  !>  @brief Creates a host execution node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to graph node that is created.
  !>  @param [in] graph - Instance of the graph to add the created node to.
  !>  @param [in] pDependencies - const pointer to the dependencies of the memset execution node.
  !>  @param [in] numDependencies - Number of dependencies.
  !>  @param [in] pNodeParams - Pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddHostNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddHostNode_(pGraphNode,graph,pDependencies,numDependencies,pNodeParams) &
        bind(c, name="cudaGraphAddHostNode")
#else
    function hipGraphAddHostNode_(pGraphNode,graph,pDependencies,numDependencies,pNodeParams) &
        bind(c, name="hipGraphAddHostNode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddHostNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(hipHostNodeParams) :: pNodeParams
    end function
  end interface

  !>  @brief Returns a host node's parameters.
  !>
  !>  @param [in] node - Instance of the node to get parameters of.
  !>  @param [out] pNodeParams - Pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphHostNodeGetParams
#ifdef USE_CUDA_NAMES
    function hipGraphHostNodeGetParams_(node,pNodeParams) bind(c, name="cudaGraphHostNodeGetParams")
#else
    function hipGraphHostNodeGetParams_(node,pNodeParams) bind(c, name="hipGraphHostNodeGetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphHostNodeGetParams_
      type(c_ptr),value :: node
      type(hipHostNodeParams) :: pNodeParams
    end function
  end interface

  !>  @brief Sets a host node's parameters.
  !>
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] pNodeParams - Pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphHostNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphHostNodeSetParams_(node,pNodeParams) bind(c, name="cudaGraphHostNodeSetParams")
#else
    function hipGraphHostNodeSetParams_(node,pNodeParams) bind(c, name="hipGraphHostNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphHostNodeSetParams_
      type(c_ptr),value :: node
      type(hipHostNodeParams) :: pNodeParams
    end function
  end interface

  !>  @brief Sets the parameters for a host node in the given graphExec.
  !>
  !>  @param [in] hGraphExec - Instance of the executable graph with the node.
  !>  @param [in] node - Instance of the node to set parameters of.
  !>  @param [in] pNodeParams - Pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecHostNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExecHostNodeSetParams_(hGraphExec,node,pNodeParams) &
        bind(c, name="cudaGraphExecHostNodeSetParams")
#else
    function hipGraphExecHostNodeSetParams_(hGraphExec,node,pNodeParams) &
        bind(c, name="hipGraphExecHostNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecHostNodeSetParams_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: node
      type(hipHostNodeParams) :: pNodeParams
    end function
  end interface

  !>  @brief Creates a child graph node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to graph node that is created.
  !>  @param [in] graph - Instance of the graph to add the created node.
  !>  @param [in] pDependencies - const pointer to the dependencies of the memset execution node.
  !>  @param [in] numDependencies - Number of dependencies.
  !>  @param [in] childGraph - Graph to clone into this node
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddChildGraphNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddChildGraphNode_(pGraphNode,graph,pDependencies,numDependencies,childGraph) &
        bind(c, name="cudaGraphAddChildGraphNode")
#else
    function hipGraphAddChildGraphNode_(pGraphNode,graph,pDependencies,numDependencies,childGraph) &
        bind(c, name="hipGraphAddChildGraphNode")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddChildGraphNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(c_ptr),value :: childGraph
    end function
  end interface

  !>  @brief Gets a handle to the embedded graph of a child graph node.
  !>
  !>  @param [in] node - Instance of the node to get child graph of.
  !>  @param [out] pGraph - Pointer to get the graph.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphChildGraphNodeGetGraph
#ifdef USE_CUDA_NAMES
    function hipGraphChildGraphNodeGetGraph_(node,pGraph) &
        bind(c, name="cudaGraphChildGraphNodeGetGraph")
#else
    function hipGraphChildGraphNodeGetGraph_(node,pGraph) &
        bind(c, name="hipGraphChildGraphNodeGetGraph")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphChildGraphNodeGetGraph_
      type(c_ptr),value :: node
      type(c_ptr) :: pGraph
    end function
  end interface

  !>  @brief Updates node parameters in the child graph node in the given graphExec.
  !>
  !>  @param [in] hGraphExec - instance of the executable graph with the node.
  !>  @param [in] node - node from the graph which was used to instantiate graphExec.
  !>  @param [in] childGraph - child graph with updated parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecChildGraphNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExecChildGraphNodeSetParams_(hGraphExec,node,childGraph) &
        bind(c, name="cudaGraphExecChildGraphNodeSetParams")
#else
    function hipGraphExecChildGraphNodeSetParams_(hGraphExec,node,childGraph) &
        bind(c, name="hipGraphExecChildGraphNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecChildGraphNodeSetParams_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: node
      type(c_ptr),value :: childGraph
    end function
  end interface

  !>  @brief Creates an empty node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to graph node that is created.
  !>  @param [in] graph - Instance of the graph the node is added to.
  !>  @param [in] pDependencies - const pointer to the node dependencies.
  !>  @param [in] numDependencies - Number of dependencies.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddEmptyNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddEmptyNode_(pGraphNode,graph,pDependencies,numDependencies) &
        bind(c, name="cudaGraphAddEmptyNode")
#else
    function hipGraphAddEmptyNode_(pGraphNode,graph,pDependencies,numDependencies) &
        bind(c, name="hipGraphAddEmptyNode")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddEmptyNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
    end function
  end interface

  !>  @brief Creates an event record node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to graph node that is created.
  !>  @param [in] graph - Instance of the graph the node is added to.
  !>  @param [in] pDependencies - const pointer to the node dependencies.
  !>  @param [in] numDependencies - Number of dependencies.
  !>  @param [in] event - Event of the node.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddEventRecordNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddEventRecordNode_(pGraphNode,graph,pDependencies,numDependencies,event) &
        bind(c, name="cudaGraphAddEventRecordNode")
#else
    function hipGraphAddEventRecordNode_(pGraphNode,graph,pDependencies,numDependencies,event) &
        bind(c, name="hipGraphAddEventRecordNode")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddEventRecordNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(c_ptr),value :: event
    end function
  end interface

  !>  @brief Returns the event associated with an event record node.
  !>
  !>  @param [in] node -  Instance of the node to get event of.
  !>  @param [out] event_out - Pointer to return the event.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphEventRecordNodeGetEvent
#ifdef USE_CUDA_NAMES
    function hipGraphEventRecordNodeGetEvent_(node,event_out) &
        bind(c, name="cudaGraphEventRecordNodeGetEvent")
#else
    function hipGraphEventRecordNodeGetEvent_(node,event_out) &
        bind(c, name="hipGraphEventRecordNodeGetEvent")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphEventRecordNodeGetEvent_
      type(c_ptr),value :: node
      type(c_ptr) :: event_out
    end function
  end interface

  !>  @brief Sets an event record node's event.
  !>
  !>  @param [in] node - Instance of the node to set event to.
  !>  @param [in] event - Pointer to the event.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphEventRecordNodeSetEvent
#ifdef USE_CUDA_NAMES
    function hipGraphEventRecordNodeSetEvent_(node,event) &
        bind(c, name="cudaGraphEventRecordNodeSetEvent")
#else
    function hipGraphEventRecordNodeSetEvent_(node,event) &
        bind(c, name="hipGraphEventRecordNodeSetEvent")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphEventRecordNodeSetEvent_
      type(c_ptr),value :: node
      type(c_ptr),value :: event
    end function
  end interface

  !>  @brief Sets the event for an event record node in the given graphExec.
  !>
  !>  @param [in] hGraphExec - instance of the executable graph with the node.
  !>  @param [in] hNode - node from the graph which was used to instantiate graphExec.
  !>  @param [in] event - pointer to the event.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecEventRecordNodeSetEvent
#ifdef USE_CUDA_NAMES
    function hipGraphExecEventRecordNodeSetEvent_(hGraphExec,hNode,event) &
        bind(c, name="cudaGraphExecEventRecordNodeSetEvent")
#else
    function hipGraphExecEventRecordNodeSetEvent_(hGraphExec,hNode,event) &
        bind(c, name="hipGraphExecEventRecordNodeSetEvent")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecEventRecordNodeSetEvent_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: hNode
      type(c_ptr),value :: event
    end function
  end interface

  !>  @brief Creates an event wait node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to graph node that is created.
  !>  @param [in] graph - Instance of the graph the node to be added.
  !>  @param [in] pDependencies - const pointer to the node dependencies.
  !>  @param [in] numDependencies - Number of dependencies.
  !>  @param [in] event - Event for the node.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddEventWaitNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddEventWaitNode_(pGraphNode,graph,pDependencies,numDependencies,event) &
        bind(c, name="cudaGraphAddEventWaitNode")
#else
    function hipGraphAddEventWaitNode_(pGraphNode,graph,pDependencies,numDependencies,event) &
        bind(c, name="hipGraphAddEventWaitNode")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddEventWaitNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(c_ptr),value :: event
    end function
  end interface

  !>  @brief Returns the event associated with an event wait node.
  !>
  !>  @param [in] node -  Instance of the node to get event of.
  !>  @param [out] event_out - Pointer to return the event.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphEventWaitNodeGetEvent
#ifdef USE_CUDA_NAMES
    function hipGraphEventWaitNodeGetEvent_(node,event_out) &
        bind(c, name="cudaGraphEventWaitNodeGetEvent")
#else
    function hipGraphEventWaitNodeGetEvent_(node,event_out) &
        bind(c, name="hipGraphEventWaitNodeGetEvent")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphEventWaitNodeGetEvent_
      type(c_ptr),value :: node
      type(c_ptr) :: event_out
    end function
  end interface

  !>  @brief Sets an event wait node's event.
  !>
  !>  @param [in] node - Instance of the node to set event of.
  !>  @param [in] event - Pointer to the event.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphEventWaitNodeSetEvent
#ifdef USE_CUDA_NAMES
    function hipGraphEventWaitNodeSetEvent_(node,event) &
        bind(c, name="cudaGraphEventWaitNodeSetEvent")
#else
    function hipGraphEventWaitNodeSetEvent_(node,event) &
        bind(c, name="hipGraphEventWaitNodeSetEvent")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphEventWaitNodeSetEvent_
      type(c_ptr),value :: node
      type(c_ptr),value :: event
    end function
  end interface

  !>  @brief Sets the event for an event record node in the given graphExec.
  !>
  !>  @param [in] hGraphExec - instance of the executable graph with the node.
  !>  @param [in] hNode - node from the graph which was used to instantiate graphExec.
  !>  @param [in] event - pointer to the event.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecEventWaitNodeSetEvent
#ifdef USE_CUDA_NAMES
    function hipGraphExecEventWaitNodeSetEvent_(hGraphExec,hNode,event) &
        bind(c, name="cudaGraphExecEventWaitNodeSetEvent")
#else
    function hipGraphExecEventWaitNodeSetEvent_(hGraphExec,hNode,event) &
        bind(c, name="hipGraphExecEventWaitNodeSetEvent")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecEventWaitNodeSetEvent_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: hNode
      type(c_ptr),value :: event
    end function
  end interface

  interface hipCreateChannelDesc
#ifdef USE_CUDA_NAMES
    function hipCreateChannelDesc_(x,y,z,w,f) bind(c, name="cudaCreateChannelDesc")
#else
    function hipCreateChannelDesc_(x,y,z,w,f) bind(c, name="hipCreateChannelDesc")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      type(c_ptr) :: hipCreateChannelDesc_
      integer(c_int),value :: x
      integer(c_int),value :: y
      integer(c_int),value :: z
      integer(c_int),value :: w
      integer(kind(hipChannelFormatKindSigned)),value :: f
    end function
  end interface

  !>  @brief Returns an UUID for the device.[BETA]
  !>  @param [out] uuid UUID for the device
  !>  @param [in] device device ordinal
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`,
  !>  `hipErrorNotInitialized`,
  !>  `hipErrorDeinitialized`
  interface hipDeviceGetUuid
#ifdef USE_CUDA_NAMES
    function hipDeviceGetUuid_(uuid,device) bind(c, name="cuDeviceGetUuid")
#else
    function hipDeviceGetUuid_(uuid,device) bind(c, name="hipDeviceGetUuid")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetUuid_
      type(hipUUID) :: uuid
      integer(c_int),value :: device
    end function
  end interface

  !>  @brief Set a list of devices that can be used.
  !>
  !>  @param[in] device_arr - List of devices to try
  !>  @param[in] len - Number of devices in specified list
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>  @see `hipGetDevice`, `hipGetDeviceCount`. `hipSetDevice`. `hipGetDeviceProperties`.
  !>  `hipSetDeviceFlags`. `hipChooseDevice`
  interface hipSetValidDevices
#ifdef USE_CUDA_NAMES
    function hipSetValidDevices_(device_arr,len) bind(c, name="cudaSetValidDevices")
#else
    function hipSetValidDevices_(device_arr,len) bind(c, name="hipSetValidDevices")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipSetValidDevices_
      type(c_ptr),value :: device_arr
      integer(c_int),value :: len
    end function
  end interface

  !>  @brief Returns the default memory pool of the specified device
  !>
  !>  @param [out] mem_pool Default memory pool to return
  !>  @param [in] device    Device index for query the default memory pool
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @see hipDeviceGetDefaultMemPool, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
  !>  hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  interface hipDeviceGetDefaultMemPool
#ifdef USE_CUDA_NAMES
    function hipDeviceGetDefaultMemPool_(mem_pool,device) &
        bind(c, name="cudaDeviceGetDefaultMemPool")
#else
    function hipDeviceGetDefaultMemPool_(mem_pool,device) bind(c, name="hipDeviceGetDefaultMemPool")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetDefaultMemPool_
      type(c_ptr) :: mem_pool
      integer(c_int),value :: device
    end function
  end interface

  !>  @brief Sets the current memory pool of a device
  !>
  !>  The memory pool must be local to the specified device.
  !>  @p hipMallocAsync allocates from the current mempool of the provided stream's device.
  !>  By default, a device's current memory pool is its default memory pool.
  !>
  !>  @note Use @p hipMallocFromPoolAsync for asynchronous memory allocations from a device
  !>  different than the one the stream runs on.
  !>
  !>  @param [in] device   Device index for the update
  !>  @param [in] mem_pool Memory pool for update as the current on the specified device
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDevice`, `hipErrorNotSupported`
  !>
  !>  @see hipDeviceGetDefaultMemPool, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
  !>  hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  interface hipDeviceSetMemPool
#ifdef USE_CUDA_NAMES
    function hipDeviceSetMemPool_(device,mem_pool) bind(c, name="cudaDeviceSetMemPool")
#else
    function hipDeviceSetMemPool_(device,mem_pool) bind(c, name="hipDeviceSetMemPool")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceSetMemPool_
      integer(c_int),value :: device
      type(c_ptr),value :: mem_pool
    end function
  end interface

  !>  @brief Gets the current memory pool for the specified device
  !>
  !>  Returns the last pool provided to @p hipDeviceSetMemPool for this device
  !>  or the device's default memory pool if @p hipDeviceSetMemPool has never been called.
  !>  By default the current mempool is the default mempool for a device,
  !>  otherwise the returned pool must have been set with @p hipDeviceSetMemPool.
  !>
  !>  @param [out] mem_pool Current memory pool on the specified device
  !>  @param [in] device    Device index to query the current memory pool
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @see hipDeviceGetDefaultMemPool, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
  !>  hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  interface hipDeviceGetMemPool
#ifdef USE_CUDA_NAMES
    function hipDeviceGetMemPool_(mem_pool,device) bind(c, name="cudaDeviceGetMemPool")
#else
    function hipDeviceGetMemPool_(mem_pool,device) bind(c, name="hipDeviceGetMemPool")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetMemPool_
      type(c_ptr) :: mem_pool
      integer(c_int),value :: device
    end function
  end interface

  !>  @brief Gets the maximum width for 1D linear textures on the specified device
  !>
  !>  This function queries the maximum width, in elements, of 1D linear textures that can be
  !>  allocated
  !>  on the specified device. The maximum width depends on the texture element size and the
  !>  hardware
  !>  limitations of the device.
  !>
  !>  @param [out] max_width Maximum width, in elements, of 1D linear textures that the device can
  !>  support
  !>  @param [in] desc       Requested channel format
  !>  @param [in] device     Device index to query for maximum 1D texture width
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDevice`
  !>
  !>  @see hipDeviceGetAttribute, hipMalloc, hipTexRefSetAddressMode
  interface hipDeviceGetTexture1DLinearMaxWidth
#ifdef USE_CUDA_NAMES
    function hipDeviceGetTexture1DLinearMaxWidth_(max_width,desc,device) &
        bind(c, name="cudaDeviceGetTexture1DLinearMaxWidth")
#else
    function hipDeviceGetTexture1DLinearMaxWidth_(max_width,desc,device) &
        bind(c, name="hipDeviceGetTexture1DLinearMaxWidth")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetTexture1DLinearMaxWidth_
      type(c_ptr),value :: max_width
      type(hipChannelFormatDesc) :: desc
      integer(c_int),value :: device
    end function
  end interface

  !>  @brief Sets resource limits of current device.
  !>
  !>  As the input enum limit,
  !>  `hipLimitStackSize` sets the limit value of the stack size on the current GPU device, per
  !>  thread.
  !>  The limit size can get via hipDeviceGetLimit. The size is in units of 256 dwords, up to the
  !>  limit
  !>  (128K - 16).
  !>
  !>  `hipLimitMallocHeapSize` sets the limit value of the heap used by the malloc()/free()
  !>  calls. For limit size, use the `hipDeviceGetLimit` API.
  !>
  !>  Any other input as default, the funtion will return hipErrorUnsupportedLimit.
  !>
  !>  @param [in] limit Enum of hipLimit_t to set
  !>  @param [in] value The size of limit value in bytes
  !>
  !>  @returns `hipSuccess`, `hipErrorUnsupportedLimit`, `hipErrorInvalidValue`
  interface hipDeviceSetLimit
#ifdef USE_CUDA_NAMES
    function hipDeviceSetLimit_(limit,myValue) bind(c, name="cudaDeviceSetLimit")
#else
    function hipDeviceSetLimit_(limit,myValue) bind(c, name="hipDeviceSetLimit")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceSetLimit_
      integer(kind(hipLimitStackSize)),value :: limit
      integer(c_size_t),value :: myValue
    end function
  end interface

  !>  @brief Device which matches hipDeviceProp_t is returned
  !>
  !>  @param [out] device Pointer of the device
  !>  @param [in]  prop Pointer of the properties
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipChooseDeviceR0600
#ifdef USE_CUDA_NAMES
    function hipChooseDeviceR0600_(device,prop) bind(c, name="cudaChooseDevice")
#else
    function hipChooseDeviceR0600_(device,prop) bind(c, name="hipChooseDeviceR0600")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipChooseDeviceR0600_
      type(c_ptr),value :: device
      type(hipDeviceProp_t) :: prop
    end function
  end interface

  !>  @brief Return last error returned by any HIP runtime API call and resets the stored error code
  !>  to
  !>  `hipSuccess`
  !>
  !>  @returns return code from last HIP called from the active host thread
  !>
  !>  Returns the last error that has been returned by any of the runtime calls in the same host
  !>  thread, and then resets the saved error to `hipSuccess`.
  !>
  !>  @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
#ifndef USE_CUDA_NAMES
  interface hipExtGetLastError
    function hipExtGetLastError_() bind(c, name="hipExtGetLastError")
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipExtGetLastError_
    end function
  end interface
#endif

  !>  @brief Return hip error as text string form.
  !>
  !>  @param hip_error - Error code to convert to name.
  !>  @returns const char pointer to the NULL-terminated error name
  !>
  !>  @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
  interface hipGetErrorName
#ifdef USE_CUDA_NAMES
    function hipGetErrorName_(hip_error) bind(c, name="cudaGetErrorName")
#else
    function hipGetErrorName_(hip_error) bind(c, name="hipGetErrorName")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      character(c_char) :: hipGetErrorName_
      integer(kind(hipSuccess)),value :: hip_error
    end function
  end interface

  !>  @brief Return handy text string message to explain the error which occurred
  !>
  !>  @param hipError - Error code to convert to string.
  !>  @returns const char pointer to the NULL-terminated error string
  !>
  !>  @see hipGetErrorName, hipGetLastError, hipPeakAtLastError, hipError_t
  interface hipGetErrorString
#ifdef USE_CUDA_NAMES
    function hipGetErrorString_(hipError) bind(c, name="cudaGetErrorString")
#else
    function hipGetErrorString_(hipError) bind(c, name="hipGetErrorString")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      character(c_char) :: hipGetErrorString_
      integer(kind(hipSuccess)),value :: hipError
    end function
  end interface

  !>  @brief Return hip error as text string form.
  !>
  !>  @param [in] hipError Error code to convert to string.
  !>  @param [out] errorString char pointer to the NULL-terminated error string
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @see hipGetErrorName, hipGetLastError, hipPeakAtLastError, hipError_t
#ifndef USE_CUDA_NAMES
  interface hipDrvGetErrorName
    function hipDrvGetErrorName_(hipError,errorString) bind(c, name="hipDrvGetErrorName")
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDrvGetErrorName_
      integer(kind(hipSuccess)),value :: hipError
      type(c_ptr) :: errorString
    end function
  end interface
#endif

  !>  @brief Return handy text string message to explain the error which occurred
  !>
  !>  @param [in] hipError Error code to convert to string.
  !>  @param [out] errorString char pointer to the NULL-terminated error string
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @see hipGetErrorName, hipGetLastError, hipPeakAtLastError, hipError_t
#ifndef USE_CUDA_NAMES
  interface hipDrvGetErrorString
    function hipDrvGetErrorString_(hipError,errorString) bind(c, name="hipDrvGetErrorString")
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDrvGetErrorString_
      integer(kind(hipSuccess)),value :: hipError
      type(c_ptr) :: errorString
    end function
  end interface
#endif

  !>  @brief Queries the Id of a stream.
  !>
  !>  @param[in] stream - Stream to be queried
  !>  flags - Pointer to an unsigned long long in which the stream's id is returned
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidHandle`.
  !>
  !>  @see hipStreamCreateWithFlags, hipStreamGetFlags, hipStreamCreateWithPriority,
  !>  hipStreamGetPriority
  interface hipStreamGetId
#ifdef USE_CUDA_NAMES
    function hipStreamGetId_(stream,streamId) bind(c, name="cudaStreamGetId")
#else
    function hipStreamGetId_(stream,streamId) bind(c, name="hipStreamGetId")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetId_
      type(c_ptr),value :: stream
      type(c_ptr),value :: streamId
    end function
  end interface

  !>  @brief Gets the device associated with the stream.
  !>
  !>  @param[in] stream - Stream to be queried
  !>  @param[out] device - Device associated with the stream
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorContextIsDestroyed`,
  !>  `hipErrorInvalidHandle`,
  !>  `hipErrorNotInitialized`, `hipErrorDeinitialized`, `hipErrorInvalidContext`
  !>
  !>  @see hipStreamCreate, hipStreamDestroy, hipDeviceGetStreamPriorityRange
  interface hipStreamGetDevice
#ifdef USE_CUDA_NAMES
    function hipStreamGetDevice_(stream,device) bind(c, name="cudaStreamGetDevice")
#else
    function hipStreamGetDevice_(stream,device) bind(c, name="hipStreamGetDevice")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetDevice_
      type(c_ptr),value :: stream
      type(c_ptr),value :: device
    end function
  end interface

  !> @brief Sets stream attribute. Updated attribute is applied to work submitted to the stream.
  !>  @param[in] stream - Stream to set attributes to
  !>  @param[in] attr - Attribute ID for the attribute to set
  !>  @param[in] myValue - Attribute value for the attribute to set
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidResourceHandle`
  interface hipStreamSetAttribute
#ifdef USE_CUDA_NAMES
    function hipStreamSetAttribute_(stream,attr,myValue) bind(c, name="cudaStreamSetAttribute")
#else
    function hipStreamSetAttribute_(stream,attr,myValue) bind(c, name="hipStreamSetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamSetAttribute_
      type(c_ptr),value :: stream
      integer(kind(hipLaunchAttributeAccessPolicyWindow)),value :: attr
      type(c_ptr),value :: myValue
    end function
  end interface

  !> @brief queries stream attribute.
  !>  @param[in] stream - Stream to geet attributes from
  !>  @param[in] attr - Attribute ID for the attribute to query
  !>  value - Attribute value output
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidResourceHandle`
  interface hipStreamGetAttribute
#ifdef USE_CUDA_NAMES
    function hipStreamGetAttribute_(stream,attr,value_out) bind(c, name="cudaStreamGetAttribute")
#else
    function hipStreamGetAttribute_(stream,attr,value_out) bind(c, name="hipStreamGetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetAttribute_
      type(c_ptr),value :: stream
      integer(kind(hipLaunchAttributeAccessPolicyWindow)),value :: attr
      type(c_ptr),value :: value_out
    end function
  end interface

  !> @brief Copies attributes from source stream to destination stream.
  !>  @param[in] dst - Destination stream
  !>  @param[in] src - Source stream
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipStreamCopyAttributes
#ifdef USE_CUDA_NAMES
    function hipStreamCopyAttributes_(dst,src) bind(c, name="cudaStreamCopyAttributes")
#else
    function hipStreamCopyAttributes_(dst,src) bind(c, name="hipStreamCopyAttributes")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamCopyAttributes_
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
    end function
  end interface

  !>  @brief Enqueues a wait command to the stream.[BETA]
  !>
  !>  @param [in] stream - Stream identifier
  !>  @param [in] ptr    - Pointer to memory object allocated using `hipMallocSignalMemory` flag
  !>  @param [in] value  - Value to be used in compare operation
  !>  @param [in] flags - Defines the compare operation, supported values are
  !>  `hipStreamWaitValueGte`
  !>  `hipStreamWaitValueEq`, `hipStreamWaitValueAnd` and `hipStreamWaitValueNor`
  !>  @param [in] mask   - Mask to be applied on value at memory before it is compared with value,
  !>  default value is set to enable every bit
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  Enqueues a wait command to the stream, all operations enqueued on this stream after this, will
  !>  not execute until the defined wait condition is true.
  !>
  !>  `hipStreamWaitValueGte`: waits until *ptr&mask >= value
  !>
  !>  `hipStreamWaitValueEq` : waits until *ptr&mask == value
  !>
  !>  `hipStreamWaitValueAnd`: waits until ((*ptr&mask) & value) != 0
  !>
  !>  `hipStreamWaitValueNor`: waits until ~((*ptr&mask) | (value&mask)) != 0
  !>
  !>  @note when using `hipStreamWaitValueNor`, mask is applied on both 'value' and '*ptr'.
  !>
  !>  @note Support for `hipStreamWaitValue32` can be queried using 'hipDeviceGetAttribute()' and
  !>  'hipDeviceAttributeCanUseStreamWaitValue' flag.
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @see hipExtMallocWithFlags, hipFree, hipStreamWaitValue64, hipStreamWriteValue64,
  !>  hipStreamWriteValue32, hipDeviceGetAttribute
  interface hipStreamWaitValue32
#ifdef USE_CUDA_NAMES
    function hipStreamWaitValue32_(stream,ptr,myValue,flags,mask) &
        bind(c, name="cuStreamWaitValue32")
#else
    function hipStreamWaitValue32_(stream,ptr,myValue,flags,mask) &
        bind(c, name="hipStreamWaitValue32")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamWaitValue32_
      type(c_ptr),value :: stream
      type(c_ptr),value :: ptr
      integer(c_int32_t),value :: myValue
      integer(c_int),value :: flags
      integer(c_int32_t),value :: mask
    end function
  end interface

  !>  @brief Enqueues a wait command to the stream.[BETA]
  !>
  !>  @param [in] stream - Stream identifier
  !>  @param [in] ptr    - Pointer to memory object allocated using 'hipMallocSignalMemory' flag
  !>  @param [in] value  - Value to be used in compare operation
  !>  @param [in] flags - Defines the compare operation, supported values are
  !>  `hipStreamWaitValueGte`
  !>  `hipStreamWaitValueEq`, `hipStreamWaitValueAnd` and `hipStreamWaitValueNor`.
  !>  @param [in] mask   - Mask to be applied on value at memory before it is compared with value
  !>  default value is set to enable every bit
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  Enqueues a wait command to the stream, all operations enqueued on this stream after this, will
  !>  not execute until the defined wait condition is true.
  !>
  !>  `hipStreamWaitValueGte`: waits until *ptr&mask >= value
  !>
  !>  `hipStreamWaitValueEq` : waits until *ptr&mask == value
  !>
  !>  `hipStreamWaitValueAnd`: waits until ((*ptr&mask) & value) != 0
  !>
  !>  `hipStreamWaitValueNor`: waits until ~((*ptr&mask) | (value&mask)) != 0
  !>
  !>  @note when using `hipStreamWaitValueNor`, mask is applied on both 'value' and '*ptr'.
  !>
  !>  @note Support for hipStreamWaitValue64 can be queried using 'hipDeviceGetAttribute()' and
  !>  'hipDeviceAttributeCanUseStreamWaitValue' flag.
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @see hipExtMallocWithFlags, hipFree, hipStreamWaitValue32, hipStreamWriteValue64,
  !>  hipStreamWriteValue32, hipDeviceGetAttribute
  interface hipStreamWaitValue64
#ifdef USE_CUDA_NAMES
    function hipStreamWaitValue64_(stream,ptr,myValue,flags,mask) &
        bind(c, name="cuStreamWaitValue64")
#else
    function hipStreamWaitValue64_(stream,ptr,myValue,flags,mask) &
        bind(c, name="hipStreamWaitValue64")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamWaitValue64_
      type(c_ptr),value :: stream
      type(c_ptr),value :: ptr
      integer(c_int64_t),value :: myValue
      integer(c_int),value :: flags
      integer(c_int64_t),value :: mask
    end function
  end interface

  !>  @brief Enqueues an array of stream memory operations in the stream.[BETA]
  !>
  !>  @param [in] stream      - Stream identifier
  !>  @param [in] count       - The number of operations in the array. Must be less than 256
  !>  @param [in] paramArray  - The types and parameters of the individual operations.
  !>  @param [in] flags       - Reserved for future expansion; must be 0.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  Batch operations to synchronize the stream via memory operations.
  !>
  !>  @warning This API is marked as beta, meaning, while this is feature complete,
  !>  it is still open to changes and may have outstanding issues.
  !>
  !>  @see hipStreamWriteValue32, hipStreamWaitValue32,
  !>  hipStreamWaitValue64. hipStreamWriteValue64
  interface hipStreamBatchMemOp
#ifdef USE_CUDA_NAMES
    function hipStreamBatchMemOp_(stream,count,paramArray,flags) bind(c, name="cuStreamBatchMemOp")
#else
    function hipStreamBatchMemOp_(stream,count,paramArray,flags) bind(c, name="hipStreamBatchMemOp")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamBatchMemOp_
      type(c_ptr),value :: stream
      integer(c_int),value :: count
      type(c_ptr),value :: paramArray
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a batch memory operation node and adds it to a graph.[BETA]
  !>
  !>  @param [in] phGraphNode      - Returns the newly created node
  !>  @param [in] hGraph           - Graph to which to add the node
  !>  @param [in] dependencies     -  Dependencies of the node
  !>  @param [in] numDependencies  - Number of dependencies
  !>  @param [in] nodeParams       - Parameters for the node
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning This API is marked as beta, meaning, while this is feature complete,
  !>  it is still open to changes and may have outstanding issues.
  !>
  !>  @see hipStreamWriteValue32, hipStreamWaitValue32,
  !>  hipStreamWaitValue64. hipStreamWriteValue64, hipStreamBatchMemOp
  interface hipGraphAddBatchMemOpNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddBatchMemOpNode_(phGraphNode,hGraph,dependencies,numDependencies, &
        nodeParams) &
        bind(c, name="cuGraphAddBatchMemOpNode")
#else
    function hipGraphAddBatchMemOpNode_(phGraphNode,hGraph,dependencies,numDependencies, &
        nodeParams) &
        bind(c, name="hipGraphAddBatchMemOpNode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddBatchMemOpNode_
      type(c_ptr) :: phGraphNode
      type(c_ptr),value :: hGraph
      type(c_ptr) :: dependencies
      integer(c_size_t),value :: numDependencies
      type(hipBatchMemOpNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Returns a batch mem op node's parameters.[BETA]
  !>
  !>  @param [in] hNode           - Node to get the parameters for
  !>  @param [in] nodeParams_out  - Pointer to return the parameters
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  Returns the parameters of batch mem op node hNode in nodeParams_out.
  !>  The paramArray returned in nodeParams_out is owned by the node.
  !>  This memory remains valid until the node is destroyed or its parameters are modified,
  !>  and should not be modified directly.
  !>
  !>  @warning This API is marked as beta, meaning, while this is feature complete,
  !>  it is still open to changes and may have outstanding issues.
  !>
  !>  @see hipStreamWriteValue32, hipStreamWaitValue32,
  !>  hipStreamWaitValue64. hipStreamWriteValue64. hipGraphBatchMemOpNodeSetParams
  interface hipGraphBatchMemOpNodeGetParams
#ifdef USE_CUDA_NAMES
    function hipGraphBatchMemOpNodeGetParams_(hNode,nodeParams_out) &
        bind(c, name="cuGraphBatchMemOpNodeGetParams")
#else
    function hipGraphBatchMemOpNodeGetParams_(hNode,nodeParams_out) &
        bind(c, name="hipGraphBatchMemOpNodeGetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphBatchMemOpNodeGetParams_
      type(c_ptr),value :: hNode
      type(hipBatchMemOpNodeParams) :: nodeParams_out
    end function
  end interface

  !>  @brief Sets the batch mem op node's parameters.[BETA]
  !>
  !>  @param [in] hNode       - Node to set the parameters for
  !>  @param [in] nodeParams  - Parameters to copy
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  Sets the parameters of batch mem op node hNode to nodeParams.
  !>
  !>  @warning This API is marked as beta, meaning, while this is feature complete,
  !>  it is still open to changes and may have outstanding issues.
  !>
  !>  @see hipStreamWriteValue32, hipStreamWaitValue32,
  !>  hipStreamWaitValue64. hipStreamWriteValue64, hipGraphBatchMemOpNodeGetParams
  interface hipGraphBatchMemOpNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphBatchMemOpNodeSetParams_(hNode,nodeParams) &
        bind(c, name="cuGraphBatchMemOpNodeSetParams")
#else
    function hipGraphBatchMemOpNodeSetParams_(hNode,nodeParams) &
        bind(c, name="hipGraphBatchMemOpNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphBatchMemOpNodeSetParams_
      type(c_ptr),value :: hNode
      type(hipBatchMemOpNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Sets the parameters for a batch mem op node in the given graphExec.[BETA]
  !>
  !>  @param [in] hGraphExec  - The executable graph in which to set the specified node
  !>  @param [in] hNode - Batch mem op node from the graph from which graphExec was instantiated
  !>  @param [in] nodeParams  - Updated Parameters to set
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  Sets the parameters of a batch mem op node in an executable graph hGraphExec.
  !>  The node is identified by the corresponding node hNode in the non-executable graph,
  !>  from which the executable graph was instantiated.
  !>
  !>  @warning This API is marked as beta, meaning, while this is feature complete,
  !>  it is still open to changes and may have outstanding issues.
  !>
  !>  @see hipStreamWriteValue32, hipStreamWaitValue32,
  !>  hipStreamWaitValue64. hipStreamWriteValue64, hipStreamBatchMemOp
  interface hipGraphExecBatchMemOpNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExecBatchMemOpNodeSetParams_(hGraphExec,hNode,nodeParams) &
        bind(c, name="cuGraphExecBatchMemOpNodeSetParams")
#else
    function hipGraphExecBatchMemOpNodeSetParams_(hGraphExec,hNode,nodeParams) &
        bind(c, name="hipGraphExecBatchMemOpNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecBatchMemOpNodeSetParams_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: hNode
      type(hipBatchMemOpNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Record an event in the specified stream.
  !>
  !>  @param[in] event - event to record.
  !>  @param[in] stream - stream in which to record event.
  !>  @param[in] flags - parameter for operations
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`,
  !>  `hipErrorInvalidHandle`, `hipErrorLaunchFailure`
  !>
  !>  hipEventQuery() or hipEventSynchronize() must be used to determine when the event
  !>  transitions from "recording" (after hipEventRecord() is called) to "recorded"
  !>  (when timestamps are set, if requested).
  !>
  !>  Events which are recorded in a non-NULL stream will transition to
  !>  from recording to "recorded" state when they reach the head of
  !>  the specified stream, after all previous
  !>  commands in that stream have completed executing.
  !>
  !>  Flags include:
  !>    hipEventRecordDefault: Default event creation flag.
  !>    hipEventRecordExternal: Event is captured in the graph as an external event node when
  !>                            performing stream capture
  !>
  !>  If hipEventRecord() has been previously called on this event, then this call will overwrite
  !>  any
  !>  existing state in event.
  !>
  !>  If this function is called on an event that is currently being recorded, results are undefined
  !>  - either outstanding recording may save state into the event, and the order is not guaranteed.
  !>
  !>  @note: If this function is not called before use hipEventQuery() or hipEventSynchronize(),
  !>  `hipSuccess` is returned, meaning no pending event in the stream.
  !>
  !>  @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventSynchronize,
  !>  hipEventDestroy, hipEventElapsedTime
  interface hipEventRecordWithFlags
#ifdef USE_CUDA_NAMES
    function hipEventRecordWithFlags_(event,stream,flags) bind(c, name="cudaEventRecordWithFlags")
#else
    function hipEventRecordWithFlags_(event,stream,flags) bind(c, name="hipEventRecordWithFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipEventRecordWithFlags_
      type(c_ptr),value :: event
      type(c_ptr),value :: stream
      integer(c_int),value :: flags
    end function
  end interface

  !>   @brief Sets information on the specified pointer.[BETA]
  !>
  !>   @param [in]      value     Sets pointer attribute value
  !>   @param [in]      attribute  Attribute to set
  !>   @param [in]      ptr      Pointer to set attributes for
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>   @warning This API is marked as Beta. While this feature is complete, it can
  !>            change and might have outstanding issues.
  interface hipPointerSetAttribute
#ifdef USE_CUDA_NAMES
    function hipPointerSetAttribute_(myValue,attribute,ptr) bind(c, name="cuPointerSetAttribute")
#else
    function hipPointerSetAttribute_(myValue,attribute,ptr) bind(c, name="hipPointerSetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipPointerSetAttribute_
      type(c_ptr),value :: myValue
      integer(kind(HIP_POINTER_ATTRIBUTE_CONTEXT)),value :: attribute
      type(c_ptr),value :: ptr
    end function
  end interface

  !> -------------------------------------------------------------------------------------------------
  !> -------------------------------------------------------------------------------------------------
  !>   @defgroup External External Resource Interoperability
  !>
  !>   @ingroup API
  !>
  !>   This section describes the external resource interoperability functions of HIP runtime API.
  !>
  !>
  !>
  !>   @brief Imports an external semaphore.
  !>
  !>   @param[out] extSem_out - External semaphores to be waited on
  !>   @param[in] semHandleDesc - Semaphore import handle descriptor
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>   @see
  !>
  !>   @note  This API is currently not supported on Linux.
  interface hipImportExternalSemaphore
#ifdef USE_CUDA_NAMES
    function hipImportExternalSemaphore_(extSem_out,semHandleDesc) &
        bind(c, name="cudaImportExternalSemaphore")
#else
    function hipImportExternalSemaphore_(extSem_out,semHandleDesc) &
        bind(c, name="hipImportExternalSemaphore")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipImportExternalSemaphore_
      type(c_ptr) :: extSem_out
      type(hipExternalSemaphoreHandleDesc) :: semHandleDesc
    end function
  end interface

  !>   @brief Imports an external memory object.
  !>
  !>   @param[out] extMem_out - Returned handle to an external memory object
  !>   @param[in] memHandleDesc - Memory import handle descriptor
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidValue`
  !>
  !>   @see
  interface hipImportExternalMemory
#ifdef USE_CUDA_NAMES
    function hipImportExternalMemory_(extMem_out,memHandleDesc) &
        bind(c, name="cudaImportExternalMemory")
#else
    function hipImportExternalMemory_(extMem_out,memHandleDesc) &
        bind(c, name="hipImportExternalMemory")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipImportExternalMemory_
      type(c_ptr) :: extMem_out
      type(hipExternalMemoryHandleDesc) :: memHandleDesc
    end function
  end interface

  !>   @brief Maps a mipmapped array onto an external memory object.
  !>
  !>   @param[out] mipmap - mipmapped array to return
  !>   @param[in] extMem - external memory object handle
  !>   @param[in] mipmapDesc - external mipmapped array descriptor
  !>
  !>   Returned mipmapped array must be freed using hipFreeMipmappedArray.
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidResourceHandle`
  !>
  !>   @see hipImportExternalMemory, hipDestroyExternalMemory, hipExternalMemoryGetMappedBuffer,
  !>  hipFreeMipmappedArray
  interface hipExternalMemoryGetMappedMipmappedArray
#ifdef USE_CUDA_NAMES
    function hipExternalMemoryGetMappedMipmappedArray_(mipmap,extMem,mipmapDesc) &
        bind(c, name="cudaExternalMemoryGetMappedMipmappedArray")
#else
    function hipExternalMemoryGetMappedMipmappedArray_(mipmap,extMem,mipmapDesc) &
        bind(c, name="hipExternalMemoryGetMappedMipmappedArray")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipExternalMemoryGetMappedMipmappedArray_
      type(c_ptr) :: mipmap
      type(c_ptr),value :: extMem
      type(hipExternalMemoryMipmappedArrayDesc) :: mipmapDesc
    end function
  end interface

  !>  @brief Prefetches memory to the specified destination device using HIP.
  !>
  !>  @param [in] dev_ptr    pointer to be prefetched
  !>  @param [in] count      size in bytes for prefetching
  !>  @param [in] location   destination location to prefetch to
  !>  @param [in] flags      flags for future use, must be zero now.
  !>  @param [in] stream     stream to enqueue prefetch operation
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPrefetchAsync_v2
#ifdef USE_CUDA_NAMES
    function hipMemPrefetchAsync_v2_(dev_ptr,count,location,flags,stream) &
        bind(c, name="cuMemPrefetchAsync_v2")
#else
    function hipMemPrefetchAsync_v2_(dev_ptr,count,location,flags,stream) &
        bind(c, name="hipMemPrefetchAsync_v2")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemPrefetchAsync_v2_
      type(c_ptr),value :: dev_ptr
      integer(c_size_t),value :: count
      type(c_ptr),value :: location
      integer(c_int),value :: flags
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Advise about the usage of a given memory range to HIP.
  !>
  !>  @param [in] dev_ptr    pointer to memory to set the advice for
  !>  @param [in] count      size in bytes of the memory range, it should be CPU page size alligned.
  !>  @param [in] advice     advice to be applied for the specified memory range
  !>  @param [in] location   location to apply the advice for
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  This HIP API advises about the usage to be applied on unified memory allocation in the
  !>  range starting from the pointer address devPtr, with the size of count bytes.
  !>  The memory range must refer to managed memory allocated via the API hipMallocManaged, and the
  !>  range will be handled with proper round down and round up respectively in the driver to
  !>  be aligned to CPU page size, the same way as corresponding CUDA API behaves in CUDA version
  !>  8.0
  !>  and afterwards.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemAdvise_v2
#ifdef USE_CUDA_NAMES
    function hipMemAdvise_v2_(dev_ptr,count,advice,location) bind(c, name="cuMemAdvise_v2")
#else
    function hipMemAdvise_v2_(dev_ptr,count,advice,location) bind(c, name="hipMemAdvise_v2")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemAdvise_v2_
      type(c_ptr),value :: dev_ptr
      integer(c_size_t),value :: count
      integer(kind(hipMemAdviseSetReadMostly)),value :: advice
      type(c_ptr),value :: location
    end function
  end interface

  !>  @brief Allocates memory with stream ordered semantics
  !>
  !>  Inserts a memory allocation operation into @p stream.
  !>  A pointer to the allocated memory is returned immediately in *dptr.
  !>  The allocation must not be accessed until the allocation operation completes.
  !>  The allocation comes from the memory pool associated with the stream's device.
  !>
  !>  @note The default memory pool of a device contains device memory from that device.
  !>  @note Basic stream ordering allows future work submitted into the same stream to use the
  !>   allocation. Stream query, stream synchronize, and HIP events can be used to guarantee that
  !>   the allocation operation completes before work submitted in a separate stream runs.
  !>  @note During stream capture, this function results in the creation of an allocation node.
  !>   In this case, the allocation is owned by the graph instead of the memory pool. The memory
  !>   pool's properties are used to set the node's creation parameters.
  !>
  !>  @param [out] dev_ptr  Returned device pointer of memory allocation
  !>  @param [in] size      Number of bytes to allocate
  !>  @param [in] stream    The stream establishing the stream ordering contract and
  !>                        the memory pool to allocate from
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`, `hipErrorOutOfMemory`
  !>
  !>  @see hipMallocFromPoolAsync, hipFreeAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
  !>  hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMallocAsync
#ifdef USE_CUDA_NAMES
    function hipMallocAsync_(dev_ptr,mySize,stream) bind(c, name="cudaMallocAsync")
#else
    function hipMallocAsync_(dev_ptr,mySize,stream) bind(c, name="hipMallocAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMallocAsync_
      type(c_ptr) :: dev_ptr
      integer(c_size_t),value :: mySize
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Frees memory with stream ordered semantics
  !>
  !>  Inserts a free operation into @p stream.
  !>  The allocation must not be used after stream execution reaches the free.
  !>  After this API returns, accessing the memory from any subsequent work launched on the GPU
  !>  or querying its pointer attributes results in undefined behavior.
  !>
  !>  @note During stream capture, this function results in the creation of a free node and
  !>  must therefore be passed the address of a graph allocation.
  !>
  !>  @param [in] dev_ptr Pointer to device memory to free
  !>  @param [in] stream The stream, where the destruciton will occur according to the execution
  !>  order
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @see hipMallocFromPoolAsync, hipMallocAsync, hipMemPoolTrimTo, hipMemPoolGetAttribute,
  !>  hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipFreeAsync
#ifdef USE_CUDA_NAMES
    function hipFreeAsync_(dev_ptr,stream) bind(c, name="cudaFreeAsync")
#else
    function hipFreeAsync_(dev_ptr,stream) bind(c, name="hipFreeAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipFreeAsync_
      type(c_ptr),value :: dev_ptr
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Releases freed memory back to the OS
  !>
  !>  Releases memory back to the OS until the pool contains fewer than @p min_bytes_to_keep
  !>  reserved bytes, or there is no more memory that the allocator can safely release.
  !>  The allocator cannot release OS allocations that back outstanding asynchronous allocations.
  !>  The OS allocations may happen at different granularity from the user allocations.
  !>
  !>  @note Allocations that have not been freed count as outstanding.
  !>  @note Allocations that have been asynchronously freed but whose completion has
  !>  not been observed on the host (eg. by a synchronize) can count as outstanding.
  !>
  !>  @param[in] mem_pool - The memory pool to trim allocations
  !>  @param[in] min_bytes_to_hold - If the pool has less than min_bytes_to_hold reserved,
  !>  then the TrimTo operation is a no-op.  Otherwise the memory pool will contain
  !>  at least min_bytes_to_hold bytes reserved after the operation.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
  !>  hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess, hipMemPoolGetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPoolTrimTo
#ifdef USE_CUDA_NAMES
    function hipMemPoolTrimTo_(mem_pool,min_bytes_to_hold) bind(c, name="cudaMemPoolTrimTo")
#else
    function hipMemPoolTrimTo_(mem_pool,min_bytes_to_hold) bind(c, name="hipMemPoolTrimTo")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolTrimTo_
      type(c_ptr),value :: mem_pool
      integer(c_size_t),value :: min_bytes_to_hold
    end function
  end interface

  !>  @brief Sets attributes of a memory pool
  !>
  !>  Supported attributes are:
  !>  - @p hipMemPoolAttrReleaseThreshold: (value type = cuuint64_t)
  !>                                   Amount of reserved memory in bytes to hold onto before trying
  !>                                   to release memory back to the OS. When more than the release
  !>                                   threshold bytes of memory are held by the memory pool, the
  !>                                   allocator will try to release memory back to the OS on the
  !>                                   next call to stream, event or context synchronize. (default
  !>                                   0)
  !>  - @p hipMemPoolReuseFollowEventDependencies: (value type = int)
  !>                                   Allow @p hipMallocAsync to use memory asynchronously freed
  !>                                   in another stream as long as a stream ordering dependency
  !>                                   of the allocating stream on the free action exists.
  !>                                   HIP events and null stream interactions can create the
  !>                                   required
  !>                                   stream ordered dependencies. (default enabled)
  !>  - @p hipMemPoolReuseAllowOpportunistic: (value type = int)
  !>                                   Allow reuse of already completed frees when there is no
  !>  dependency between the free and allocation. (default enabled)
  !>  - @p hipMemPoolReuseAllowInternalDependencies: (value type = int)
  !>                                   Allow @p hipMallocAsync to insert new stream dependencies
  !>                                   in order to establish the stream ordering required to reuse
  !>                                   a piece of memory released by @p hipFreeAsync (default
  !>                                   enabled).
  !>
  !>  @param [in] mem_pool The memory pool to modify
  !>  @param [in] attr     The attribute to modify
  !>  @param [in] value    Pointer to the value to assign
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
  !>  hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAccess, hipMemPoolGetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPoolSetAttribute
#ifdef USE_CUDA_NAMES
    function hipMemPoolSetAttribute_(mem_pool,attr,myValue) bind(c, name="cudaMemPoolSetAttribute")
#else
    function hipMemPoolSetAttribute_(mem_pool,attr,myValue) bind(c, name="hipMemPoolSetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolSetAttribute_
      type(c_ptr),value :: mem_pool
      integer(kind(hipMemPoolReuseFollowEventDependencies)),value :: attr
      type(c_ptr),value :: myValue
    end function
  end interface

  !>  @brief Gets attributes of a memory pool
  !>
  !>  Supported attributes are:
  !>  - @p hipMemPoolAttrReleaseThreshold: (value type = cuuint64_t)
  !>                                   Amount of reserved memory in bytes to hold onto before trying
  !>                                   to release memory back to the OS. When more than the release
  !>                                   threshold bytes of memory are held by the memory pool, the
  !>                                   allocator will try to release memory back to the OS on the
  !>                                   next call to stream, event or context synchronize. (default
  !>                                   0)
  !>  - @p hipMemPoolReuseFollowEventDependencies: (value type = int)
  !>                                   Allow @p hipMallocAsync to use memory asynchronously freed
  !>                                   in another stream as long as a stream ordering dependency
  !>                                   of the allocating stream on the free action exists.
  !>                                   HIP events and null stream interactions can create the
  !>                                   required
  !>                                   stream ordered dependencies. (default enabled)
  !>  - @p hipMemPoolReuseAllowOpportunistic: (value type = int)
  !>                                   Allow reuse of already completed frees when there is no
  !>  dependency between the free and allocation. (default enabled)
  !>  - @p hipMemPoolReuseAllowInternalDependencies: (value type = int)
  !>                                   Allow @p hipMallocAsync to insert new stream dependencies
  !>                                   in order to establish the stream ordering required to reuse
  !>                                   a piece of memory released by @p hipFreeAsync (default
  !>                                   enabled).
  !>
  !>  @param [in] mem_pool The memory pool to get attributes of
  !>  @param [in] attr     The attribute to get
  !>  @param [in] value    Retrieved value
  !>
  !>  @returns  `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync,
  !>  hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess,
  !>  hipMemPoolGetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPoolGetAttribute
#ifdef USE_CUDA_NAMES
    function hipMemPoolGetAttribute_(mem_pool,attr,myValue) bind(c, name="cudaMemPoolGetAttribute")
#else
    function hipMemPoolGetAttribute_(mem_pool,attr,myValue) bind(c, name="hipMemPoolGetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolGetAttribute_
      type(c_ptr),value :: mem_pool
      integer(kind(hipMemPoolReuseFollowEventDependencies)),value :: attr
      type(c_ptr),value :: myValue
    end function
  end interface

  !>  @brief Controls visibility of the specified pool between devices
  !>
  !>  @param [in] mem_pool   Memory pool for acccess change
  !>  @param [in] desc_list  Array of access descriptors. Each descriptor instructs the access to
  !>  enable for a single gpu
  !>  @param [in] count  Number of descriptors in the map array.
  !>
  !>  @returns  `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
  !>  hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolGetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPoolSetAccess
#ifdef USE_CUDA_NAMES
    function hipMemPoolSetAccess_(mem_pool,desc_list,count) bind(c, name="cudaMemPoolSetAccess")
#else
    function hipMemPoolSetAccess_(mem_pool,desc_list,count) bind(c, name="hipMemPoolSetAccess")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolSetAccess_
      type(c_ptr),value :: mem_pool
      type(hipMemAccessDesc) :: desc_list
      integer(c_size_t),value :: count
    end function
  end interface

  !>  @brief Returns the accessibility of a pool from a device
  !>
  !>  Returns the accessibility of the pool's memory from the specified location.
  !>
  !>  @param [out] flags    Accessibility of the memory pool from the specified location/device
  !>  @param [in] mem_pool   Memory pool being queried
  !>  @param [in] location  Location/device for memory pool access
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
  !>  hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPoolGetAccess
#ifdef USE_CUDA_NAMES
    function hipMemPoolGetAccess_(flags,mem_pool,location) bind(c, name="cudaMemPoolGetAccess")
#else
    function hipMemPoolGetAccess_(flags,mem_pool,location) bind(c, name="hipMemPoolGetAccess")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolGetAccess_
      type(c_ptr),value :: flags
      type(c_ptr),value :: mem_pool
      type(hipMemLocation) :: location
    end function
  end interface

  !>  @brief Creates a memory pool
  !>
  !>  Creates a HIP memory pool and returns the handle in @p mem_pool. The @p pool_props determines
  !>  the properties of the pool such as the backing device and IPC capabilities.
  !>
  !>  By default, the memory pool will be accessible from the device it is allocated on.
  !>
  !>  @param [out] mem_pool    Contains createed memory pool
  !>  @param [in] pool_props   Memory pool properties
  !>
  !>  @note Specifying hipMemHandleTypeNone creates a memory pool that will not support IPC.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>
  !>  @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
  !>  hipMemPoolDestroy, hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute,
  !>  hipMemPoolSetAccess, hipMemPoolGetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPoolCreate
#ifdef USE_CUDA_NAMES
    function hipMemPoolCreate_(mem_pool,pool_props) bind(c, name="cudaMemPoolCreate")
#else
    function hipMemPoolCreate_(mem_pool,pool_props) bind(c, name="hipMemPoolCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolCreate_
      type(c_ptr) :: mem_pool
      type(hipMemPoolProps) :: pool_props
    end function
  end interface

  !>  @brief Destroys the specified memory pool
  !>
  !>  If any pointers obtained from this pool haven't been freed or
  !>  the pool has free operations that haven't completed
  !>  when @p hipMemPoolDestroy is invoked, the function will return immediately and the
  !>  resources associated with the pool will be released automatically
  !>  once there are no more outstanding allocations.
  !>
  !>  Destroying the current mempool of a device sets the default mempool of
  !>  that device as the current mempool for that device.
  !>
  !>  @param [in] mem_pool Memory pool for destruction
  !>
  !>  @note A device's default memory pool cannot be destroyed.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @see hipMallocFromPoolAsync, hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute,
  !>  hipMemPoolCreate hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute,
  !>  hipMemPoolSetAccess, hipMemPoolGetAccess
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPoolDestroy
#ifdef USE_CUDA_NAMES
    function hipMemPoolDestroy_(mem_pool) bind(c, name="cudaMemPoolDestroy")
#else
    function hipMemPoolDestroy_(mem_pool) bind(c, name="hipMemPoolDestroy")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolDestroy_
      type(c_ptr),value :: mem_pool
    end function
  end interface

  !>  @brief Allocates memory from a specified pool with stream ordered semantics.
  !>
  !>  Inserts an allocation operation into @p stream.
  !>  A pointer to the allocated memory is returned immediately in @p dev_ptr.
  !>  The allocation must not be accessed until the allocation operation completes.
  !>  The allocation comes from the specified memory pool.
  !>
  !>  @note The specified memory pool may be from a device different than that of the specified @p
  !>  stream.
  !>
  !>  Basic stream ordering allows future work submitted into the same stream to use the allocation.
  !>  Stream query, stream synchronize, and HIP events can be used to guarantee that the allocation
  !>  operation completes before work submitted in a separate stream runs.
  !>
  !>  @note During stream capture, this function results in the creation of an allocation node. In
  !>  this
  !>  case, the allocation is owned by the graph instead of the memory pool. The memory pool's
  !>  properties are used to set the node's creation parameters.
  !>
  !>  @param [out] dev_ptr Returned device pointer
  !>  @param [in] size     Number of bytes to allocate
  !>  @param [in] mem_pool The pool to allocate from
  !>  @param [in] stream   The stream establishing the stream ordering semantic
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`, `hipErrorOutOfMemory`
  !>
  !>  @see hipMallocAsync, hipFreeAsync, hipMemPoolGetAttribute, hipMemPoolCreate
  !>  hipMemPoolTrimTo, hipDeviceSetMemPool, hipMemPoolSetAttribute, hipMemPoolSetAccess,
  !>  hipMemPoolGetAccess,
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMallocFromPoolAsync
#ifdef USE_CUDA_NAMES
    function hipMallocFromPoolAsync_(dev_ptr,mySize,mem_pool,stream) &
        bind(c, name="cudaMallocFromPoolAsync")
#else
    function hipMallocFromPoolAsync_(dev_ptr,mySize,mem_pool,stream) &
        bind(c, name="hipMallocFromPoolAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMallocFromPoolAsync_
      type(c_ptr) :: dev_ptr
      integer(c_size_t),value :: mySize
      type(c_ptr),value :: mem_pool
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Exports a memory pool to the requested handle type.
  !>
  !>  Given an IPC capable mempool, create an OS handle to share the pool with another process.
  !>  A recipient process can convert the shareable handle into a mempool with @p
  !>  hipMemPoolImportFromShareableHandle. Individual pointers can then be shared with the @p
  !>  hipMemPoolExportPointer and @p hipMemPoolImportPointer APIs. The implementation of what the
  !>  shareable handle is and how it can be transferred is defined by the requested handle type.
  !>
  !>  @note To create an IPC capable mempool, create a mempool with a @p hipMemAllocationHandleType
  !>  other than @p hipMemHandleTypeNone.
  !>
  !>  @param [out] shared_handle Pointer to the location in which to store the requested handle
  !>  @param [in] mem_pool       Pool to export
  !>  @param [in] handle_type    The type of handle to create
  !>  @param [in] flags          Must be 0
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorOutOfMemory`
  !>
  !>  @see hipMemPoolImportFromShareableHandle
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPoolExportToShareableHandle
#ifdef USE_CUDA_NAMES
    function hipMemPoolExportToShareableHandle_(shared_handle,mem_pool,handle_type,flags) &
        bind(c, name="cudaMemPoolExportToShareableHandle")
#else
    function hipMemPoolExportToShareableHandle_(shared_handle,mem_pool,handle_type,flags) &
        bind(c, name="hipMemPoolExportToShareableHandle")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolExportToShareableHandle_
      type(c_ptr),value :: shared_handle
      type(c_ptr),value :: mem_pool
      integer(kind(hipMemHandleTypeNone)),value :: handle_type
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Imports a memory pool from a shared handle.
  !>
  !>  Specific allocations can be imported from the imported pool with @p hipMemPoolImportPointer.
  !>
  !>  @note Imported memory pools do not support creating new allocations.
  !>  As such imported memory pools may not be used in @p hipDeviceSetMemPool
  !>  or @p hipMallocFromPoolAsync calls.
  !>
  !>  @param [out] mem_pool     Returned memory pool
  !>  @param [in] shared_handle OS handle of the pool to open
  !>  @param [in] handle_type   The type of handle being imported
  !>  @param [in] flags         Must be 0
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorOutOfMemory`
  !>
  !>  @see hipMemPoolExportToShareableHandle
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPoolImportFromShareableHandle
#ifdef USE_CUDA_NAMES
    function hipMemPoolImportFromShareableHandle_(mem_pool,shared_handle,handle_type,flags) &
        bind(c, name="cudaMemPoolImportFromShareableHandle")
#else
    function hipMemPoolImportFromShareableHandle_(mem_pool,shared_handle,handle_type,flags) &
        bind(c, name="hipMemPoolImportFromShareableHandle")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolImportFromShareableHandle_
      type(c_ptr) :: mem_pool
      type(c_ptr),value :: shared_handle
      integer(kind(hipMemHandleTypeNone)),value :: handle_type
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Export data to share a memory pool allocation between processes.
  !>
  !>  Constructs @p export_data for sharing a specific allocation from an already shared memory
  !>  pool.
  !>  The recipient process can import the allocation with the @p hipMemPoolImportPointer api.
  !>  The data is not a handle and may be shared through any IPC mechanism.
  !>
  !>  @param[out] export_data - Returned export data
  !>  @param[in] dev_ptr - Pointer to memory being exported
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorOutOfMemory`
  !>
  !>  @see hipMemPoolImportPointer
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPoolExportPointer
#ifdef USE_CUDA_NAMES
    function hipMemPoolExportPointer_(export_data,dev_ptr) bind(c, name="cudaMemPoolExportPointer")
#else
    function hipMemPoolExportPointer_(export_data,dev_ptr) bind(c, name="hipMemPoolExportPointer")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolExportPointer_
      type(hipMemPoolPtrExportData) :: export_data
      type(c_ptr),value :: dev_ptr
    end function
  end interface

  !>  @brief Import a memory pool allocation from another process.
  !>
  !>  Returns in @p dev_ptr a pointer to the imported memory.
  !>  The imported memory must not be accessed before the allocation operation completes
  !>  in the exporting process. The imported memory must be freed from all importing processes
  !>  before
  !>  being freed in the exporting process. The pointer may be freed with @p hipFree
  !>  or @p hipFreeAsync. If @p hipFreeAsync is used, the free must be completed
  !>  on the importing process before the free operation on the exporting process.
  !>
  !>  @note The @p hipFreeAsync api may be used in the exporting process before
  !>  the @p hipFreeAsync operation completes in its stream as long as the
  !>  @p hipFreeAsync in the exporting process specifies a stream with
  !>  a stream dependency on the importing process's @p hipFreeAsync.
  !>
  !>  @param [out] dev_ptr     Pointer to imported memory
  !>  @param [in] mem_pool     Memory pool from which to import a pointer
  !>  @param [in] export_data  Data specifying the memory to import
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotInitialized`, `hipErrorOutOfMemory`
  !>
  !>  @see hipMemPoolExportPointer
  !>
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemPoolImportPointer
#ifdef USE_CUDA_NAMES
    function hipMemPoolImportPointer_(dev_ptr,mem_pool,export_data) &
        bind(c, name="cudaMemPoolImportPointer")
#else
    function hipMemPoolImportPointer_(dev_ptr,mem_pool,export_data) &
        bind(c, name="hipMemPoolImportPointer")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolImportPointer_
      type(c_ptr) :: dev_ptr
      type(c_ptr),value :: mem_pool
      type(hipMemPoolPtrExportData) :: export_data
    end function
  end interface

  !>   @brief Copies from one 1D array to device memory.
  !>
  !>   @param[out] dstDevice - Destination device pointer
  !>   @param[in] srcArray - Source array
  !>   @param[in] srcOffset - Offset in bytes of source array
  !>   @param[in] ByteCount - Size of memory copy in bytes
  !>
  !>   @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>   `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
  interface hipMemcpyAtoD
#ifdef USE_CUDA_NAMES
    function hipMemcpyAtoD_(dstDevice,srcArray,srcOffset,ByteCount) bind(c, name="cuMemcpyAtoD")
#else
    function hipMemcpyAtoD_(dstDevice,srcArray,srcOffset,ByteCount) bind(c, name="hipMemcpyAtoD")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyAtoD_
      type(c_ptr),value :: dstDevice
      type(c_ptr),value :: srcArray
      integer(c_size_t),value :: srcOffset
      integer(c_size_t),value :: ByteCount
    end function
  end interface

  !>   @brief Copies from device memory to a 1D array.
  !>
  !>   @param[out] dstArray - Destination array
  !>   @param[in] dstOffset - Offset in bytes of destination array
  !>   @param[in] srcDevice - Source device pointer
  !>   @param[in] ByteCount - Size of memory copy in bytes
  !>
  !>   @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>   `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
  interface hipMemcpyDtoA
#ifdef USE_CUDA_NAMES
    function hipMemcpyDtoA_(dstArray,dstOffset,srcDevice,ByteCount) bind(c, name="cuMemcpyDtoA")
#else
    function hipMemcpyDtoA_(dstArray,dstOffset,srcDevice,ByteCount) bind(c, name="hipMemcpyDtoA")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyDtoA_
      type(c_ptr),value :: dstArray
      integer(c_size_t),value :: dstOffset
      type(c_ptr),value :: srcDevice
      integer(c_size_t),value :: ByteCount
    end function
  end interface

  !>   @brief Copies from one 1D array to another.
  !>
  !>   @param[out] dstArray - Destination array
  !>   @param[in] dstOffset - Offset in bytes of destination array
  !>   @param[in] srcArray - Source array
  !>   @param[in] srcOffset - Offset in bytes of source array
  !>   @param[in] ByteCount - Size of memory copy in bytes
  !>
  !>   @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>   `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
  interface hipMemcpyAtoA
#ifdef USE_CUDA_NAMES
    function hipMemcpyAtoA_(dstArray,dstOffset,srcArray,srcOffset,ByteCount) &
        bind(c, name="cuMemcpyAtoA")
#else
    function hipMemcpyAtoA_(dstArray,dstOffset,srcArray,srcOffset,ByteCount) &
        bind(c, name="hipMemcpyAtoA")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyAtoA_
      type(c_ptr),value :: dstArray
      integer(c_size_t),value :: dstOffset
      type(c_ptr),value :: srcArray
      integer(c_size_t),value :: srcOffset
      integer(c_size_t),value :: ByteCount
    end function
  end interface

  !>  @brief Copies from one 1D array to host memory.
  !>
  !>   @param[out] dstHost - Destination pointer
  !>   @param[in] srcArray - Source array
  !>   @param[in] srcOffset - Offset in bytes of source array
  !>   @param[in] ByteCount - Size of memory copy in bytes
  !>   @param[in] stream - Stream identifier
  !>
  !>   @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>   `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
  interface hipMemcpyAtoHAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyAtoHAsync_(dstHost,srcArray,srcOffset,ByteCount,stream) &
        bind(c, name="cuMemcpyAtoHAsync")
#else
    function hipMemcpyAtoHAsync_(dstHost,srcArray,srcOffset,ByteCount,stream) &
        bind(c, name="hipMemcpyAtoHAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyAtoHAsync_
      type(c_ptr),value :: dstHost
      type(c_ptr),value :: srcArray
      integer(c_size_t),value :: srcOffset
      integer(c_size_t),value :: ByteCount
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Copies from host memory to a 1D array.
  !>
  !>   @param[out] dstArray - Destination array
  !>   @param[in] dstOffset - Offset in bytes of destination array
  !>   @param[in] srcHost - Source host pointer
  !>   @param[in] ByteCount - Size of memory copy in bytes
  !>   @param[in] stream - Stream identifier
  !>
  !>   @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>   `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
  interface hipMemcpyHtoAAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyHtoAAsync_(dstArray,dstOffset,srcHost,ByteCount,stream) &
        bind(c, name="cuMemcpyHtoAAsync")
#else
    function hipMemcpyHtoAAsync_(dstArray,dstOffset,srcHost,ByteCount,stream) &
        bind(c, name="hipMemcpyHtoAAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyHtoAAsync_
      type(c_ptr),value :: dstArray
      integer(c_size_t),value :: dstOffset
      type(c_ptr),value :: srcHost
      integer(c_size_t),value :: ByteCount
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Gets the pointer of requested HIP driver function.
  !>
  !>  @param[in] symbol - The Symbol name of the driver function to request.
  !>  @param[out] pfn - Output pointer to the requested driver function.
  !>  @param[in] hipVersion - The HIP version for the requested driver function symbol.
  !>  HIP version is defined as 100*version_major + version_minor. For example, in HIP 6.1, the
  !>  hipversion is 601, for the symbol function "hipGetDeviceProperties", the specified hipVersion
  !>  601
  !>  is greater or equal to the version 600, the symbol function will be handle properly as backend
  !>  compatible function.
  !>
  !>  @param[in] flags - Currently only default flag is suppported.
  !>  @param[out] symbolStatus - Optional enumeration for returned status of searching for symbol
  !>  driver
  !>  function based on the input hipVersion.
  !>
  !>  Returns hipSuccess if the returned pfn is addressed to the pointer of found driver function.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`.
  interface hipGetProcAddress
#ifdef USE_CUDA_NAMES
    function hipGetProcAddress_(symbol,pfn,hipVersion,flags,symbolStatus) &
        bind(c, name="cuGetProcAddress")
#else
    function hipGetProcAddress_(symbol,pfn,hipVersion,flags,symbolStatus) &
        bind(c, name="hipGetProcAddress")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetProcAddress_
      type(c_ptr),value :: symbol
      type(c_ptr) :: pfn
      integer(c_int),value :: hipVersion
      integer(c_int64_t),value :: flags
      type(c_ptr),value :: symbolStatus
    end function
  end interface

  !>   @brief Fills 2D memory range of 'width' 8-bit values synchronously to the specified char
  !>   value.
  !>  Height specifies numbers of rows to set and dstPitch speicifies the number of bytes between
  !>  each
  !>  row.
  !>   @param[in] dst - Pointer to device memory
  !>   @param[in] dstPitch - Pitch of dst device pointer
  !>   @param[in] myValue - value to set
  !>   @param[in] width - Width of row
  !>   @param[in] height - Number of rows
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemsetD2D8
#ifdef USE_CUDA_NAMES
    function hipMemsetD2D8_(dst,dstPitch,myValue,width,height) bind(c, name="cuMemsetD2D8")
#else
    function hipMemsetD2D8_(dst,dstPitch,myValue,width,height) bind(c, name="hipMemsetD2D8")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD2D8_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dstPitch
      type(c_ptr),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
    end function
  end interface

  !>   @brief Fills 2D memory range of 'width' 8-bit values asynchronously to the specified char
  !>   value.
  !>  Height specifies numbers of rows to set and dstPitch speicifies the number of bytes between
  !>  each
  !>  row.
  !>   @param[in] dst - Pointer to device memory
  !>   @param[in] dstPitch - Pitch of dst device pointer
  !>   @param[in] myValue - value to set
  !>   @param[in] width - Width of row
  !>   @param[in] height - Number of rows
  !>   @param[in] stream - Stream Identifier
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemsetD2D8Async
#ifdef USE_CUDA_NAMES
    function hipMemsetD2D8Async_(dst,dstPitch,myValue,width,height,stream) &
        bind(c, name="cuMemsetD2D8Async")
#else
    function hipMemsetD2D8Async_(dst,dstPitch,myValue,width,height,stream) &
        bind(c, name="hipMemsetD2D8Async")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD2D8Async_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dstPitch
      type(c_ptr),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Fills 2D memory range of 'width' 16-bit values synchronously to the specified short
  !>  value. Height specifies numbers of rows to set and dstPitch speicifies the number of bytes
  !>  between each row.
  !>   @param[in] dst - Pointer to device memory
  !>   @param[in] dstPitch - Pitch of dst device pointer
  !>   @param[in] myValue - value to set
  !>   @param[in] width - Width of row
  !>   @param[in] height - Number of rows
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemsetD2D16
#ifdef USE_CUDA_NAMES
    function hipMemsetD2D16_(dst,dstPitch,myValue,width,height) bind(c, name="cuMemsetD2D16")
#else
    function hipMemsetD2D16_(dst,dstPitch,myValue,width,height) bind(c, name="hipMemsetD2D16")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD2D16_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dstPitch
      integer(c_short),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
    end function
  end interface

  !>   @brief Fills 2D memory range of 'width' 16-bit values asynchronously to the specified short
  !>  value. Height specifies numbers of rows to set and dstPitch speicifies the number of bytes
  !>  between each row.
  !>   @param[in] dst - Pointer to device memory
  !>   @param[in] dstPitch - Pitch of dst device pointer
  !>   @param[in] myValue - value to set
  !>   @param[in] width - Width of row
  !>   @param[in] height - Number of rows
  !>   @param[in] stream - Stream Identifier
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemsetD2D16Async
#ifdef USE_CUDA_NAMES
    function hipMemsetD2D16Async_(dst,dstPitch,myValue,width,height,stream) &
        bind(c, name="cuMemsetD2D16Async")
#else
    function hipMemsetD2D16Async_(dst,dstPitch,myValue,width,height,stream) &
        bind(c, name="hipMemsetD2D16Async")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD2D16Async_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dstPitch
      integer(c_short),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      type(c_ptr),value :: stream
    end function
  end interface

  !>   @brief Fills 2D memory range of 'width' 32-bit values synchronously to the specified int
  !>   value.
  !>  Height specifies numbers of rows to set and dstPitch speicifies the number of bytes between
  !>  each
  !>  row.
  !>   @param[in] dst - Pointer to device memory
  !>   @param[in] dstPitch - Pitch of dst device pointer
  !>   @param[in] myValue - value to set
  !>   @param[in] width - Width of row
  !>   @param[in] height - Number of rows
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemsetD2D32
#ifdef USE_CUDA_NAMES
    function hipMemsetD2D32_(dst,dstPitch,myValue,width,height) bind(c, name="cuMemsetD2D32")
#else
    function hipMemsetD2D32_(dst,dstPitch,myValue,width,height) bind(c, name="hipMemsetD2D32")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD2D32_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dstPitch
      integer(c_int),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
    end function
  end interface

  !>   @brief Fills 2D memory range of 'width' 32-bit values asynchronously to the specified int
  !>  value. Height specifies numbers of rows to set and dstPitch speicifies the number of bytes
  !>  between each row.
  !>   @param[in] dst - Pointer to device memory
  !>   @param[in] dstPitch - Pitch of dst device pointer
  !>   @param[in] myValue - value to set
  !>   @param[in] width - Width of row
  !>   @param[in] height - Number of rows
  !>   @param[in] stream - Stream Identifier
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemsetD2D32Async
#ifdef USE_CUDA_NAMES
    function hipMemsetD2D32Async_(dst,dstPitch,myValue,width,height,stream) &
        bind(c, name="cuMemsetD2D32Async")
#else
    function hipMemsetD2D32Async_(dst,dstPitch,myValue,width,height,stream) &
        bind(c, name="hipMemsetD2D32Async")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetD2D32Async_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dstPitch
      integer(c_int),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Gets info about the specified array
  !>
  !>  @param[out] desc - Returned array type
  !>  @param[out] extent - Returned array shape. 2D arrays will have depth of zero
  !>  @param[out] flags - Returned array flags
  !>  @param[in] array - The HIP array to get info for
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue` `hipErrorInvalidHandle`
  !>
  !>  @see hipArrayGetDescriptor, hipArray3DGetDescriptor
  interface hipArrayGetInfo
#ifdef USE_CUDA_NAMES
    function hipArrayGetInfo_(desc,extent,flags,array) bind(c, name="cudaArrayGetInfo")
#else
    function hipArrayGetInfo_(desc,extent,flags,array) bind(c, name="hipArrayGetInfo")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipArrayGetInfo_
      type(hipChannelFormatDesc) :: desc
      type(hipExtent) :: extent
      type(c_ptr),value :: flags
      type(c_ptr),value :: array
    end function
  end interface

  !>  @brief Gets a 1D or 2D array descriptor
  !>
  !>  @param[out] pArrayDescriptor - Returned array descriptor
  !>  @param[in] array - Array to get descriptor of
  !>
  !>  @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>  `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue` `hipErrorInvalidHandle`
  !>
  !>  @see hipArray3DCreate, hipArray3DGetDescriptor, hipArrayCreate, hipArrayDestroy, hipMemAlloc,
  !>  hipMemAllocHost, hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned,
  !>  hipMemcpy3D, hipMemcpy3DAsync, hipMemcpyAtoA, hipMemcpyAtoD, hipMemcpyAtoH,
  !>  hipMemcpyAtoHAsync,
  !>  hipMemcpyDtoA, hipMemcpyDtoD, hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync,
  !>  hipMemcpyHtoA, hipMemcpyHtoAAsync, hipMemcpyHtoD, hipMemcpyHtoDAsync, hipMemFree,
  !>  hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo, hipMemHostAlloc,
  !>  hipMemHostGetDevicePointer, hipMemsetD8, hipMemsetD16, hipMemsetD32, hipArrayGetInfo
  interface hipArrayGetDescriptor
#ifdef USE_CUDA_NAMES
    function hipArrayGetDescriptor_(pArrayDescriptor,array) bind(c, name="cuArrayGetDescriptor")
#else
    function hipArrayGetDescriptor_(pArrayDescriptor,array) bind(c, name="hipArrayGetDescriptor")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipArrayGetDescriptor_
      type(HIP_ARRAY_DESCRIPTOR) :: pArrayDescriptor
      type(c_ptr),value :: array
    end function
  end interface

  !>  @brief Gets a 3D array descriptor
  !>
  !>  @param[out] pArrayDescriptor - Returned 3D array descriptor
  !>  @param[in] array - 3D array to get descriptor of
  !>
  !>  @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>  `hipErrorInvalidContext`,
  !>  `hipErrorInvalidValue` `hipErrorInvalidHandle`, `hipErrorContextIsDestroyed`
  !>
  !>  @see hipArray3DCreate, hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc,
  !>  hipMemAllocHost, hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned,
  !>  hipMemcpy3D, hipMemcpy3DAsync, hipMemcpyAtoA, hipMemcpyAtoD, hipMemcpyAtoH,
  !>  hipMemcpyAtoHAsync,
  !>  hipMemcpyDtoA, hipMemcpyDtoD, hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync,
  !>  hipMemcpyHtoA, hipMemcpyHtoAAsync, hipMemcpyHtoD, hipMemcpyHtoDAsync, hipMemFree,
  !>  hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo, hipMemHostAlloc,
  !>  hipMemHostGetDevicePointer, hipMemsetD8, hipMemsetD16, hipMemsetD32, hipArrayGetInfo
  interface hipArray3DGetDescriptor
#ifdef USE_CUDA_NAMES
    function hipArray3DGetDescriptor_(pArrayDescriptor,array) bind(c, name="cuArray3DGetDescriptor")
#else
    function hipArray3DGetDescriptor_(pArrayDescriptor,array) &
        bind(c, name="hipArray3DGetDescriptor")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipArray3DGetDescriptor_
      type(HIP_ARRAY3D_DESCRIPTOR) :: pArrayDescriptor
      type(c_ptr),value :: array
    end function
  end interface

  !>   @brief Copies data between host and device.
  !>
  !>   @param[in] dst - Destination memory address
  !>   @param[in] wOffsetDst - Destination starting X offset
  !>   @param[in] hOffsetDst - Destination starting Y offset
  !>   @param[in] src - Source memory address
  !>   @param[in] wOffsetSrc - Source starting X offset
  !>   @param[in] hOffsetSrc - Source starting Y offset (columns in bytes)
  !>   @param[in] width - Width of matrix transfer (columns in bytes)
  !>   @param[in] height - Height of matrix transfer (rows)
  !>   @param[in] myKind - Type of transfer
  !>
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpyToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
  interface hipMemcpy2DArrayToArray
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DArrayToArray_(dst,wOffsetDst,hOffsetDst,src,wOffsetSrc,hOffsetSrc,width, &
        height,myKind) &
        bind(c, name="cudaMemcpy2DArrayToArray")
#else
    function hipMemcpy2DArrayToArray_(dst,wOffsetDst,hOffsetDst,src,wOffsetSrc,hOffsetSrc,width, &
        height,myKind) &
        bind(c, name="hipMemcpy2DArrayToArray")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DArrayToArray_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: wOffsetDst
      integer(c_size_t),value :: hOffsetDst
      type(c_ptr),value :: src
      integer(c_size_t),value :: wOffsetSrc
      integer(c_size_t),value :: hOffsetSrc
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  !>  @brief Perform Batch of 1D copies
  !>
  !>  @param [in] dsts      - Array of destination pointers
  !>  @param [in] srcs      - Array of source pointers.
  !>  @param [in] sizes     - Array of sizes for memcpy operations
  !>  @param [in] count     - Size of dsts, srcs and sizes arrays
  !>  @param [in] attrs     - Array of memcpy attributes (not supported)
  !>  @param [in] attrsIdxs - Array of indices to map attrs to copies (not supported)
  !>  @param [in] numAttrs  - Size of attrs and attrsIdxs arrays (not supported)
  !>  @param [in] failIdx   - Pointer to a location to return failure index inside the batch
  !>  @param [in] stream    - stream used to enqueue operations in.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemcpyBatchAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyBatchAsync_(dsts,srcs,sizes,count,attrs,attrsIdxs,numAttrs,failIdx,stream) &
        bind(c, name="cudaMemcpyBatchAsync")
#else
    function hipMemcpyBatchAsync_(dsts,srcs,sizes,count,attrs,attrsIdxs,numAttrs,failIdx,stream) &
        bind(c, name="hipMemcpyBatchAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyBatchAsync_
      type(c_ptr) :: dsts
      type(c_ptr) :: srcs
      type(c_ptr),value :: sizes
      integer(c_size_t),value :: count
      type(hipMemcpyAttributes) :: attrs
      type(c_ptr),value :: attrsIdxs
      integer(c_size_t),value :: numAttrs
      type(c_ptr),value :: failIdx
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Perform Batch of 3D copies
  !>
  !>  @param [in] numOps  - Total number of memcpy operations.
  !>  @param [in] opList  - Array of size numOps containing the actual memcpy operations.
  !>  @param [in] failIdx - Pointer to a location to return the index of the copy where a failure
  !>                      - was encountered.
  !>  @param [in] flags   - Flags for future use, must be zero now.
  !>  @param [in] stream  - The stream to enqueue the operations in.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipMemcpy3DBatchAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpy3DBatchAsync_(numOps,opList,failIdx,flags,stream) &
        bind(c, name="cudaMemcpy3DBatchAsync")
#else
    function hipMemcpy3DBatchAsync_(numOps,opList,failIdx,flags,stream) &
        bind(c, name="hipMemcpy3DBatchAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3DBatchAsync_
      integer(c_size_t),value :: numOps
      type(hipMemcpy3DBatchOp) :: opList
      type(c_ptr),value :: failIdx
      integer(c_int64_t),value :: flags
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Performs 3D memory copies between devices
  !>  This API is asynchronous with respect to host
  !>
  !>  @param [in] p  - Parameters for memory copy
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, hipErrorInvalidDevice
  interface hipMemcpy3DPeer
#ifdef USE_CUDA_NAMES
    function hipMemcpy3DPeer_(p) bind(c, name="cudaMemcpy3DPeer")
#else
    function hipMemcpy3DPeer_(p) bind(c, name="hipMemcpy3DPeer")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3DPeer_
      type(hipMemcpy3DPeerParms) :: p
    end function
  end interface

  !>  @brief Performs 3D memory copies between devices asynchronously
  !>
  !>  @param [in] p  - Parameters for memory copy
  !>  @param [in] stream - Stream to enqueue operation in.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, hipErrorInvalidDevice
  interface hipMemcpy3DPeerAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpy3DPeerAsync_(p,stream) bind(c, name="cudaMemcpy3DPeerAsync")
#else
    function hipMemcpy3DPeerAsync_(p,stream) bind(c, name="hipMemcpy3DPeerAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3DPeerAsync_
      type(hipMemcpy3DPeerParms) :: p
      type(c_ptr),value :: stream
    end function
  end interface

  !> -------------------------------------------------------------------------------------------------
  !> -------------------------------------------------------------------------------------------------
  !>
  !>   @defgroup Module Module Management
  !>
  !>   @ingroup API
  !>   This section describes the module management functions of HIP runtime API.
  !>
  !>
  !>
  !>  @brief Loads fatbin object
  !>
  !>  @param [in] fatbin  fatbin to be loaded as a module
  !>  @param [out] module  Module
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`,
  !>  `hipErrorFileNotFound`,
  !>  `hipErrorOutOfMemory`, `hipErrorSharedObjectInitFailed`, `hipErrorNotInitialized`
  interface hipModuleLoadFatBinary
#ifdef USE_CUDA_NAMES
    function hipModuleLoadFatBinary_(myModule,fatbin) bind(c, name="cuModuleLoadFatBinary")
#else
    function hipModuleLoadFatBinary_(myModule,fatbin) bind(c, name="hipModuleLoadFatBinary")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoadFatBinary_
      type(c_ptr) :: myModule
      type(c_ptr),value :: fatbin
    end function
  end interface

  !>  @brief Returns the number of functions within a module.
  !>
  !>  @param [in] mod  Module to get function count from
  !>  @param [out] count  function count from module
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidContext`,
  !>  `hipErrorNotInitialized`,
  !>  `hipErrorNotFound`,
  interface hipModuleGetFunctionCount
#ifdef USE_CUDA_NAMES
    function hipModuleGetFunctionCount_(count,mod) bind(c, name="cuModuleGetFunctionCount")
#else
    function hipModuleGetFunctionCount_(count,mod) bind(c, name="hipModuleGetFunctionCount")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleGetFunctionCount_
      type(c_ptr),value :: count
      type(c_ptr),value :: mod
    end function
  end interface

  !>  @brief Load hip Library from inmemory object
  !>
  !>  @param [out] library Output Library
  !>  @param [in] code In memory object
  !>  @param [in] jitOptions JIT options, CUDA only
  !>  @param [in] jitOptionsValues JIT options values, CUDA only
  !>  @param [in] numJitOptions Number of JIT options
  !>  @param [in] libraryOptions Library options
  !>  @param [in] libraryOptionValues Library options values
  !>  @param [in] numLibraryOptions Number of library options
  !>  @return `hipSuccess`, `hipErrorInvalidValue`,
  interface hipLibraryLoadData
#ifdef USE_CUDA_NAMES
    function hipLibraryLoadData_(library,code,jitOptions,jitOptionsValues,numJitOptions, &
        libraryOptions,libraryOptionValues,numLibraryOptions) &
        bind(c, name="cudaLibraryLoadData")
#else
    function hipLibraryLoadData_(library,code,jitOptions,jitOptionsValues,numJitOptions, &
        libraryOptions,libraryOptionValues,numLibraryOptions) &
        bind(c, name="hipLibraryLoadData")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryLoadData_
      type(c_ptr) :: library
      type(c_ptr),value :: code
      type(c_ptr),value :: jitOptions
      type(c_ptr) :: jitOptionsValues
      integer(c_int),value :: numJitOptions
      type(c_ptr),value :: libraryOptions
      type(c_ptr) :: libraryOptionValues
      integer(c_int),value :: numLibraryOptions
    end function
  end interface

  !>  @brief Load hip Library from file
  !>
  !>  @param [out] library Output Library
  !>  @param [in] fileName file which contains code object
  !>  @param [in] jitOptions JIT options, CUDA only
  !>  @param [in] jitOptionsValues JIT options values, CUDA only
  !>  @param [in] numJitOptions Number of JIT options
  !>  @param [in] libraryOptions Library options
  !>  @param [in] libraryOptionValues Library options values
  !>  @param [in] numLibraryOptions Number of library options
  !>  @return `hipSuccess`, `hipErrorInvalidValue`
  interface hipLibraryLoadFromFile
#ifdef USE_CUDA_NAMES
    function hipLibraryLoadFromFile_(library,fileName,jitOptions,jitOptionsValues,numJitOptions, &
        libraryOptions,libraryOptionValues,numLibraryOptions) &
        bind(c, name="cudaLibraryLoadFromFile")
#else
    function hipLibraryLoadFromFile_(library,fileName,jitOptions,jitOptionsValues,numJitOptions, &
        libraryOptions,libraryOptionValues,numLibraryOptions) &
        bind(c, name="hipLibraryLoadFromFile")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryLoadFromFile_
      type(c_ptr) :: library
      type(c_ptr),value :: fileName
      type(c_ptr),value :: jitOptions
      type(c_ptr) :: jitOptionsValues
      integer(c_int),value :: numJitOptions
      type(c_ptr),value :: libraryOptions
      type(c_ptr) :: libraryOptionValues
      integer(c_int),value :: numLibraryOptions
    end function
  end interface

  !>  @brief Unload HIP Library
  !>
  !>  @param [in] library Input created hip library
  !>  @return `hipSuccess`, `hipErrorInvalidValue`
  interface hipLibraryUnload
#ifdef USE_CUDA_NAMES
    function hipLibraryUnload_(library) bind(c, name="cudaLibraryUnload")
#else
    function hipLibraryUnload_(library) bind(c, name="hipLibraryUnload")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryUnload_
      type(c_ptr),value :: library
    end function
  end interface

  !>  @brief Get Kernel object from library
  !>
  !>  @param [out] pKernel Output kernel object
  !>  @param [in] library Input hip library
  !>  @param [in] name kernel name to be searched for
  !>  @return `hipSuccess`, `hipErrorInvalidValue`
  interface hipLibraryGetKernel
#ifdef USE_CUDA_NAMES
    function hipLibraryGetKernel_(pKernel,library,name) bind(c, name="cudaLibraryGetKernel")
#else
    function hipLibraryGetKernel_(pKernel,library,name) bind(c, name="hipLibraryGetKernel")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryGetKernel_
      type(c_ptr) :: pKernel
      type(c_ptr),value :: library
      type(c_ptr),value :: name
    end function
  end interface

  !>  @brief Get Kernel count in library
  !>
  !>  @param [out] count Count of kernels in library
  !>  @param [in] library Input created hip library
  !>  @return `hipSuccess`, `hipErrorInvalidValue`
  interface hipLibraryGetKernelCount
#ifdef USE_CUDA_NAMES
    function hipLibraryGetKernelCount_(count,library) bind(c, name="cudaLibraryGetKernelCount")
#else
    function hipLibraryGetKernelCount_(count,library) bind(c, name="hipLibraryGetKernelCount")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryGetKernelCount_
      type(c_ptr),value :: count
      type(c_ptr),value :: library
    end function
  end interface

  !>  @brief Retrieve kernel handles within a library
  !>
  !>  @param [out] kernels Buffer for kernel handles
  !>  @param [in] numKernels Maximum number of kernel handles to return to buffer
  !>  @param [in] library Library handle to query from
  !>  @return `hipSuccess`, `hipErrorInvalidValue`
  interface hipLibraryEnumerateKernels
#ifdef USE_CUDA_NAMES
    function hipLibraryEnumerateKernels_(kernels,numKernels,library) &
        bind(c, name="cudaLibraryEnumerateKernels")
#else
    function hipLibraryEnumerateKernels_(kernels,numKernels,library) &
        bind(c, name="hipLibraryEnumerateKernels")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryEnumerateKernels_
      type(c_ptr) :: kernels
      integer(c_int),value :: numKernels
      type(c_ptr),value :: library
    end function
  end interface

  !>  @brief Returns a Library Handle
  !>
  !>  @param [out] library Returned Library handle
  !>  @param [in] kernel Kernel to retrieve library Handle
  !>  @return `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipKernelGetLibrary
    function hipKernelGetLibrary_(library,kernel) bind(c, name="hipKernelGetLibrary")
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipKernelGetLibrary_
      type(c_ptr) :: library
      type(c_ptr),value :: kernel
    end function
  end interface
#endif

  !>  @brief Returns a Kernel Name
  !>
  !>  @param [out] name Returned Kernel Name
  !>  @param [in] kernel Kernel handle to retrieve name
  !>  @return `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipKernelGetName
    function hipKernelGetName_(name,kernel) bind(c, name="hipKernelGetName")
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipKernelGetName_
      type(c_ptr) :: name
      type(c_ptr),value :: kernel
    end function
  end interface
#endif

  !>  @brief Gets pointer to device entry function that matches entry function symbolPtr.
  !>
  !>  @param [out] functionPtr  Device entry function
  !>  @param [in]  symbolPtr  Pointer to device entry function to search for
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDeviceFunction`
  interface hipGetFuncBySymbol
#ifdef USE_CUDA_NAMES
    function hipGetFuncBySymbol_(functionPtr,symbolPtr) bind(c, name="cudaGetFuncBySymbol")
#else
    function hipGetFuncBySymbol_(functionPtr,symbolPtr) bind(c, name="hipGetFuncBySymbol")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetFuncBySymbol_
      type(c_ptr) :: functionPtr
      type(c_ptr),value :: symbolPtr
    end function
  end interface

  !>  @brief Gets function pointer of a requested HIP API
  !>
  !>  @param [in]  symbol  The API base name
  !>  @param [out] funcPtr  Pointer to the requested function
  !>  @param [in]  flags  Flags for the search
  !>  @param [out] driverStatus  Optional returned status of the search
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGetDriverEntryPoint
#ifdef USE_CUDA_NAMES
    function hipGetDriverEntryPoint_(symbol,funcPtr,flags,driverStatus) &
        bind(c, name="cudaGetDriverEntryPoint")
#else
    function hipGetDriverEntryPoint_(symbol,funcPtr,flags,driverStatus) &
        bind(c, name="hipGetDriverEntryPoint")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetDriverEntryPoint_
      type(c_ptr),value :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t),value :: flags
      type(c_ptr),value :: driverStatus
    end function
  end interface

  !>  @brief Adds bitcode data to be linked with options.
  !>  @param [in] state hip link state
  !>  @param [in] type  Type of the input data or bitcode
  !>  @param [in] data  Input data which is null terminated
  !>  @param [in] size  Size of the input data
  !>  @param [in] name  Optional name for this input
  !>  @param [in] numOptions  Size of the options
  !>  @param [in] options  Array of options applied to this input
  !>  @param [in] optionValues  Array of option values cast to void*
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidHandle`
  !>
  !>  If adding the file fails, it will
  !>  @return `hipErrorInvalidConfiguration`
  !>
  !>  @see hipError_t
  interface hipLinkAddData
#ifdef USE_CUDA_NAMES
    function hipLinkAddData_(state,myType,myData,mySize,name,numOptions,options,optionValues) &
        bind(c, name="cuLinkAddData")
#else
    function hipLinkAddData_(state,myType,myData,mySize,name,numOptions,options,optionValues) &
        bind(c, name="hipLinkAddData")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLinkAddData_
      type(c_ptr),value :: state
      integer(kind(hipJitInputCubin)),value :: myType
      type(c_ptr),value :: myData
      integer(c_size_t),value :: mySize
      type(c_ptr),value :: name
      integer(c_int),value :: numOptions
      type(c_ptr),value :: options
      type(c_ptr) :: optionValues
    end function
  end interface

  !>  @brief Adds a file with bitcode to be linked with options.
  !>  @param [in] state hip link state
  !>  @param [in] type  Type of the input data or bitcode
  !>  @param [in] path  Path to the input file where bitcode is present
  !>  @param [in] numOptions  Size of the options
  !>  @param [in] options  Array of options applied to this input
  !>  @param [in] optionValues  Array of option values cast to void*
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  If adding the file fails, it will
  !>  @return `hipErrorInvalidConfiguration`
  !>
  !>  @see hipError_t
  interface hipLinkAddFile
#ifdef USE_CUDA_NAMES
    function hipLinkAddFile_(state,myType,path,numOptions,options,optionValues) &
        bind(c, name="cuLinkAddFile")
#else
    function hipLinkAddFile_(state,myType,path,numOptions,options,optionValues) &
        bind(c, name="hipLinkAddFile")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLinkAddFile_
      type(c_ptr),value :: state
      integer(kind(hipJitInputCubin)),value :: myType
      type(c_ptr),value :: path
      integer(c_int),value :: numOptions
      type(c_ptr),value :: options
      type(c_ptr) :: optionValues
    end function
  end interface

  !>  @brief Completes the linking of the given program.
  !>  @param [in]   state hip link state
  !>  @param [out]  hipBinOut  Upon success, points to the output binary
  !>  @param [out]  sizeOut  Size of the binary is stored (optional)
  !>
  !>  @returns `hipSuccess` `hipErrorInvalidValue`
  !>
  !>  If adding the data fails, it will
  !>  @return `hipErrorInvalidConfiguration`
  !>
  !>  @see hipError_t
  interface hipLinkComplete
#ifdef USE_CUDA_NAMES
    function hipLinkComplete_(state,hipBinOut,sizeOut) bind(c, name="cuLinkComplete")
#else
    function hipLinkComplete_(state,hipBinOut,sizeOut) bind(c, name="hipLinkComplete")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLinkComplete_
      type(c_ptr),value :: state
      type(c_ptr) :: hipBinOut
      type(c_ptr),value :: sizeOut
    end function
  end interface

  !>  @brief Creates a linker instance with options.
  !>  @param [in] numOptions  Number of options
  !>  @param [in] options  Array of options
  !>  @param [in] optionValues  Array of option values cast to void*
  !>  @param [out] stateOut  hip link state created upon success
  !>
  !>  @returns `hipSuccess` `hipErrorInvalidValue` `hipErrorInvalidConfiguration`
  !>
  !>  @see hipSuccess
  interface hipLinkCreate
#ifdef USE_CUDA_NAMES
    function hipLinkCreate_(numOptions,options,optionValues,stateOut) bind(c, name="cuLinkCreate")
#else
    function hipLinkCreate_(numOptions,options,optionValues,stateOut) bind(c, name="hipLinkCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLinkCreate_
      integer(c_int),value :: numOptions
      type(c_ptr),value :: options
      type(c_ptr) :: optionValues
      type(c_ptr) :: stateOut
    end function
  end interface

  !>  @brief Deletes the linker instance.
  !>  @param [in] state link state instance
  !>
  !>  @returns `hipSuccess` `hipErrorInvalidValue`
  !>
  !>  @see hipSuccess
  interface hipLinkDestroy
#ifdef USE_CUDA_NAMES
    function hipLinkDestroy_(state) bind(c, name="cuLinkDestroy")
#else
    function hipLinkDestroy_(state) bind(c, name="hipLinkDestroy")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLinkDestroy_
      type(c_ptr),value :: state
    end function
  end interface

  !>  \addtogroup ModuleCooperativeG Cooperative groups kernel launch of Module management.
  !>  \ingroup Module
  !>
  !>
  !>  @brief launches kernel f with launch parameters and shared memory on stream with arguments
  !>  passed
  !>  to kernelParams, where thread blocks can cooperate and synchronize as they execute
  !>
  !>  @param [in] f              Kernel to launch.
  !>  @param [in] gridDimX       X grid dimension specified as multiple of blockDimX.
  !>  @param [in] gridDimY       Y grid dimension specified as multiple of blockDimY.
  !>  @param [in] gridDimZ       Z grid dimension specified as multiple of blockDimZ.
  !>  @param [in] blockDimX      X block dimension specified in work-items.
  !>  @param [in] blockDimY      Y block dimension specified in work-items.
  !>  @param [in] blockDimZ      Z block dimension specified in work-items.
  !>  @param [in] sharedMemBytes Amount of dynamic shared memory to allocate for this kernel. The
  !>  HIP-Clang compiler provides support for extern shared declarations.
  !>  @param [in] stream         Stream where the kernel should be dispatched. May be 0,
  !>  in which case the default stream is used with associated synchronization rules.
  !>  @param [in] kernelParams   A list of kernel arguments.
  !>
  !>  Please note, HIP does not support kernel launch with total work items defined in dimension
  !>  with
  !>  size \f$ gridDim \cdot blockDim &ge; 2^{32} \f$.
  !>
  !>  @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>  `hipErrorInvalidContext`,
  !>  `hipErrorInvalidHandle`, `hipErrorInvalidImage`, `hipErrorInvalidValue`,
  !>  `hipErrorInvalidConfiguration`, `hipErrorLaunchFailure`, `hipErrorLaunchOutOfResources`,
  !>  `hipErrorLaunchTimeOut`, `hipErrorCooperativeLaunchTooLarge`, `hipErrorSharedObjectInitFailed`
#ifndef USE_CUDA_NAMES
  interface hipModuleLaunchCooperativeKernel
    function hipModuleLaunchCooperativeKernel_(f,gridDimX,gridDimY,gridDimZ,blockDimX,blockDimY, &
        blockDimZ,sharedMemBytes,stream,kernelParams) &
        bind(c, name="hipModuleLaunchCooperativeKernel")
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLaunchCooperativeKernel_
      type(c_ptr),value :: f
      integer(c_int),value :: gridDimX
      integer(c_int),value :: gridDimY
      integer(c_int),value :: gridDimZ
      integer(c_int),value :: blockDimX
      integer(c_int),value :: blockDimY
      integer(c_int),value :: blockDimZ
      integer(c_int),value :: sharedMemBytes
      type(c_ptr),value :: stream
      type(c_ptr) :: kernelParams
    end function
  end interface
#endif

  !>  @brief Launches kernels on multiple devices where thread blocks can cooperate and
  !>  synchronize as they execute.
  !>
  !>  @param [in] launchParamsList         List of launch parameters, one per device.
  !>  @param [in] numDevices               Size of the launchParamsList array.
  !>  @param [in] flags                    Flags to control launch behavior.
  !>
  !>  @returns `hipSuccess`, `hipErrorDeinitialized`, `hipErrorNotInitialized`,
  !>  `hipErrorInvalidContext`,
  !>  `hipErrorInvalidHandle`, `hipErrorInvalidImage`, `hipErrorInvalidValue`,
  !>  `hipErrorInvalidConfiguration`, `hipErrorInvalidResourceHandle`, `hipErrorLaunchFailure`,
  !>  `hipErrorLaunchOutOfResources`, `hipErrorLaunchTimeOut`, `hipErrorCooperativeLaunchTooLarge`,
  !>  `hipErrorSharedObjectInitFailed`
#ifndef USE_CUDA_NAMES
  interface hipModuleLaunchCooperativeKernelMultiDevice
    function hipModuleLaunchCooperativeKernelMultiDevice_(launchParamsList,numDevices,flags) &
        bind(c, name="hipModuleLaunchCooperativeKernelMultiDevice")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLaunchCooperativeKernelMultiDevice_
      type(hipFunctionLaunchParams) :: launchParamsList
      integer(c_int),value :: numDevices
      integer(c_int),value :: flags
    end function
  end interface
#endif

  !>  @brief Launches a HIP kernel using a generic function pointer and the specified configuration.
  !>  @ingroup Execution
  !>
  !>  This function is equivalent to hipLaunchKernelEx but accepts the kernel as a generic function
  !>  pointer.
  !>
  !>  @param [in] config                 Pointer to the kernel launch configuration structure.
  !>  @param [in] fPtr                   Pointer to the device kernel function.
  !>  @param [in] args                   Array of pointers to the kernel arguments.
  !>
  !>  @returns `hipSuccess` if the kernel is launched successfully, otherwise an appropriate error
  !>  code.
  interface hipLaunchKernelExC
#ifdef USE_CUDA_NAMES
    function hipLaunchKernelExC_(config,fPtr,args) bind(c, name="cudaLaunchKernelExC")
#else
    function hipLaunchKernelExC_(config,fPtr,args) bind(c, name="hipLaunchKernelExC")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchKernelExC_
      type(hipLaunchConfig_t) :: config
      type(c_ptr),value :: fPtr
      type(c_ptr) :: args
    end function
  end interface

  !>  @brief Launches a HIP kernel using the driver API with the specified configuration.
  !>  @ingroup Execution
  !>
  !>  This function dispatches the device kernel represented by a HIP function object.
  !>  It passes both the kernel parameters and any extra configuration arguments to the kernel
  !>  launch.
  !>
  !>  @param [in] config  Pointer to the kernel launch configuration structure.
  !>  @param [in] f       HIP function object representing the device kernel to be launched.
  !>  @param [in] params  Array of pointers to the kernel parameters.
  !>  @param [in] extra   Array of pointers for additional launch parameters or extra configuration
  !>  data.
  !>
  !>  @returns `hipSuccess` if the kernel is launched successfully, otherwise an appropriate error
  !>  code.
#ifndef USE_CUDA_NAMES
  interface hipDrvLaunchKernelEx
    function hipDrvLaunchKernelEx_(config,f,params,extra) bind(c, name="hipDrvLaunchKernelEx")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvLaunchKernelEx_
      type(HIP_LAUNCH_CONFIG) :: config
      type(c_ptr),value :: f
      type(c_ptr) :: params
      type(c_ptr) :: extra
    end function
  end interface
#endif

  !>  @brief Returns a handle for the address range requested.
  !>
  !>  This function returns a handle to a device pointer created using either hipMalloc set of APIs
  !>  or through hipMemAddressReserve (as long as the ptr is mapped).
  !>
  !>  @param [out] handle     Ptr to the handle where the fd or other types will be returned.
  !>  @param [in] dptr        Device ptr for which we get the handle.
  !>  @param [in] size        Size of the address range.
  !>  @param [in] handleType  Type of the handle requested for the address range.
  !>  @param [in] flags       Any flags set regarding the handle requested.
  !>
  !>  @returns `hipSuccess` if the kernel is launched successfully, otherwise an appropriate error
  !>  code.
  interface hipMemGetHandleForAddressRange
#ifdef USE_CUDA_NAMES
    function hipMemGetHandleForAddressRange_(handle,dptr,mySize,handleType,flags) &
        bind(c, name="cuMemGetHandleForAddressRange")
#else
    function hipMemGetHandleForAddressRange_(handle,dptr,mySize,handleType,flags) &
        bind(c, name="hipMemGetHandleForAddressRange")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetHandleForAddressRange_
      type(c_ptr),value :: handle
      type(c_ptr),value :: dptr
      integer(c_size_t),value :: mySize
      integer(kind(hipMemRangeHandleTypeDmaBufFd)),value :: handleType
      integer(c_int64_t),value :: flags
    end function
  end interface

  !>  @brief Returns occupancy for a device function.
  !>
  !>  @param [out] numBlocks        Returned occupancy
  !>  @param [in]  f                Kernel function(hipFunction_t) for which occupancy is calulated
  !>  @param [in]  blockSize        Block size the kernel is intended to be launched with
  !>  @param [in]  dynSharedMemPerBlk Dynamic shared memory usage (in bytes) intended for each block
  !>  @param [in]  flags            Extra flags for occupancy calculation (only default supported)
  !>  @returns  `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_(numBlocks,f,blockSize, &
        dynSharedMemPerBlk,flags) &
        bind(c, name="hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags")
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_
      type(c_ptr),value :: numBlocks
      type(c_ptr),value :: f
      integer(c_int),value :: blockSize
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: flags
    end function
  end interface
#endif

  !>  @brief Returns dynamic shared memory available per block when launching numBlocks blocks on
  !>  SM.
  !>
  !>  @ingroup Occupancy
  !>  Returns in \p *dynamicSmemSize the maximum size of dynamic shared memory /
  !>  to allow numBlocks blocks per SM.
  !>
  !>  @param [out] dynamicSmemSize Returned maximum dynamic shared memory.
  !>  @param [in]  f               Kernel function for which occupancy is calculated.
  !>  @param [in]  numBlocks       Number of blocks to fit on SM
  !>  @param [in]  blockSize       Size of the block
  !>
  !>  @return `hipSuccess`, `hipErrorInvalidDevice`, `hipErrorInvalidDeviceFunction`,
  !>  `hipErrorInvalidValue`,
  !>  `hipErrorUnknown`
  interface hipOccupancyAvailableDynamicSMemPerBlock
#ifdef USE_CUDA_NAMES
    function hipOccupancyAvailableDynamicSMemPerBlock_(dynamicSmemSize,f,numBlocks,blockSize) &
        bind(c, name="cudaOccupancyAvailableDynamicSMemPerBlock")
#else
    function hipOccupancyAvailableDynamicSMemPerBlock_(dynamicSmemSize,f,numBlocks,blockSize) &
        bind(c, name="hipOccupancyAvailableDynamicSMemPerBlock")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyAvailableDynamicSMemPerBlock_
      type(c_ptr),value :: dynamicSmemSize
      type(c_ptr),value :: f
      integer(c_int),value :: numBlocks
      integer(c_int),value :: blockSize
    end function
  end interface

  !>  @brief Enqueues a host function call in a stream.
  !>
  !>  @param [in] stream - The stream to enqueue work in.
  !>  @param [in] fn - The function to call once enqueued preceeding operations are complete.
  !>  @param [in] userData - User-specified data to be passed to the function.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidResourceHandle`, `hipErrorInvalidValue`,
  !>  `hipErrorNotSupported`
  !>
  !>  The host function to call in this API will be executed after the preceding operations in
  !>  the stream are complete. The function is a blocking operation that blocks operations in the
  !>  stream that follow it, until the function is returned.
  !>  Event synchronization and internal callback functions make sure enqueued operations will
  !>  execute in order, in the stream.
  !>
  !>  The host function must not make any HIP API calls. The host function is non-reentrant. It must
  !>  not perform sychronization with any operation that may depend on other processing execution
  !>  but is not enqueued to run earlier in the stream.
  !>
  !>  Host functions that are enqueued respectively in different non-blocking streams can run
  !>  concurrently.
  !>
  !>  @warning  This API is marked as beta, meaning, while this is feature complete,
  !>  it is still open to changes and may have outstanding issues.
  interface hipLaunchHostFunc
#ifdef USE_CUDA_NAMES
    function hipLaunchHostFunc_(stream,fn,userData) bind(c, name="cudaLaunchHostFunc")
#else
    function hipLaunchHostFunc_(stream,fn,userData) bind(c, name="hipLaunchHostFunc")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchHostFunc_
      type(c_ptr),value :: stream
      type(c_funptr),value :: fn
      type(c_ptr),value :: userData
    end function
  end interface

  !>  @brief Gets the texture reference related with the symbol [Deprecated]
  !>
  !>  @param [out] texref  texture reference
  !>  @param [in] symbol  pointer to the symbol related with the texture for the reference
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>  @warning This API is deprecated.
#ifndef USE_CUDA_NAMES
  interface hipGetTextureReference
    function hipGetTextureReference_(texref,symbol) bind(c, name="hipGetTextureReference")
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetTextureReference_
      type(c_ptr) :: texref
      type(c_ptr),value :: symbol
    end function
  end interface
#endif

  !>  @brief Gets the border color used by a texture reference [Deprecated]
  !>
  !>  @param [out] pBorderColor  Returned Type and Value of RGBA color.
  !>  @param [in] texRef  Texture reference.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>  @warning This API is deprecated.
  interface hipTexRefGetBorderColor
#ifdef USE_CUDA_NAMES
    function hipTexRefGetBorderColor_(pBorderColor,texRef) bind(c, name="cuTexRefGetBorderColor")
#else
    function hipTexRefGetBorderColor_(pBorderColor,texRef) bind(c, name="hipTexRefGetBorderColor")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetBorderColor_
      type(c_ptr),value :: pBorderColor
      type(textureReference) :: texRef
    end function
  end interface

  !>  @brief Gets the array bound to a texture reference [Deprecated]
  !>
  !>
  !>  @param [in] pArray  Returned array.
  !>  @param [in] texRef  texture reference.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>  @warning This API is deprecated.
  interface hipTexRefGetArray
#ifdef USE_CUDA_NAMES
    function hipTexRefGetArray_(pArray,texRef) bind(c, name="cuTexRefGetArray")
#else
    function hipTexRefGetArray_(pArray,texRef) bind(c, name="hipTexRefGetArray")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetArray_
      type(c_ptr) :: pArray
      type(textureReference) :: texRef
    end function
  end interface

  !>   @defgroup Callback Callback Activity APIs
  !>
  !>   This section describes the callback/Activity of HIP runtime API.
  !>
  !>
  !>  @brief Returns HIP API name by ID.
  !>
  !>  @param [in] id ID of HIP API
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipApiName
    function hipApiName_(id) bind(c, name="hipApiName")
      use iso_c_binding
      use hipfort_enums
      implicit none
      character(c_char) :: hipApiName_
      integer(c_int32_t),value :: id
    end function
  end interface
#endif

  !>  @brief Returns kernel name reference by function name.
  !>
  !>  @param [in] f Name of function
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipKernelNameRef
    function hipKernelNameRef_(f) bind(c, name="hipKernelNameRef")
      use iso_c_binding
      use hipfort_enums
      implicit none
      character(c_char) :: hipKernelNameRef_
      type(c_ptr),value :: f
    end function
  end interface
#endif

  !>  @brief Retrives kernel for a given host pointer, unless stated otherwise.
  !>
  !>  @param [in] hostFunction Pointer of host function.
  !>  @param [in] stream Stream the kernel is executed on.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipKernelNameRefByPtr
    function hipKernelNameRefByPtr_(hostFunction,stream) bind(c, name="hipKernelNameRefByPtr")
      use iso_c_binding
      use hipfort_enums
      implicit none
      character(c_char) :: hipKernelNameRefByPtr_
      type(c_ptr),value :: hostFunction
      type(c_ptr),value :: stream
    end function
  end interface
#endif

  !>  @brief Returns device ID on the stream.
  !>
  !>  @param [in] stream Stream of device executed on.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipGetStreamDeviceId
    function hipGetStreamDeviceId_(stream) bind(c, name="hipGetStreamDeviceId")
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(c_int) :: hipGetStreamDeviceId_
      type(c_ptr),value :: stream
    end function
  end interface
#endif

  !>  @brief Begins graph capture on a stream to an existing graph.
  !>
  !>  @param [in] stream - Stream to initiate capture.
  !>  @param [in] graph - Graph to capture into.
  !>  @param [in] dependencies - Dependencies of the first node captured in the stream. Can be NULL
  !>  if
  !>  numDependencies is 0.
  !>  @param [in] dependencyData - Optional array of data associated with each dependency.
  !>  @param [in] numDependencies - Number of dependencies.
  !>  @param [in] mode - Controls the interaction of this capture sequence with other API calls that
  !> are not safe.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @warning param "const hipGraphEdgeData* dependencyData" is currently not supported and has to
  !>  be
  !> passed as nullptr. This API is marked as beta, meaning, while this is feature complete, it is
  !> still
  !> open to changes and may have outstanding issues.
  interface hipStreamBeginCaptureToGraph
#ifdef USE_CUDA_NAMES
    function hipStreamBeginCaptureToGraph_(stream,graph,dependencies,dependencyData, &
        numDependencies,mode) &
        bind(c, name="cudaStreamBeginCaptureToGraph")
#else
    function hipStreamBeginCaptureToGraph_(stream,graph,dependencies,dependencyData, &
        numDependencies,mode) &
        bind(c, name="hipStreamBeginCaptureToGraph")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipStreamBeginCaptureToGraph_
      type(c_ptr),value :: stream
      type(c_ptr),value :: graph
      type(c_ptr) :: dependencies
      type(hipGraphEdgeData) :: dependencyData
      integer(c_size_t),value :: numDependencies
      integer(kind(hipStreamCaptureModeGlobal)),value :: mode
    end function
  end interface

  !>  @brief Swaps the stream capture mode of a thread.
  !>
  !>  @param [in] mode - Pointer to mode value to swap with the current mode.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipThreadExchangeStreamCaptureMode
#ifdef USE_CUDA_NAMES
    function hipThreadExchangeStreamCaptureMode_(mode) &
        bind(c, name="cudaThreadExchangeStreamCaptureMode")
#else
    function hipThreadExchangeStreamCaptureMode_(mode) &
        bind(c, name="hipThreadExchangeStreamCaptureMode")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipThreadExchangeStreamCaptureMode_
      type(c_ptr),value :: mode
    end function
  end interface

  !>  @brief Creates an executable graph from a graph.
  !>
  !>  @param [out] pGraphExec - Pointer to instantiated executable graph.
  !>  @param [in] graph - Instance of graph to instantiate.
  !>  @param [in] instantiateParams - Graph instantiation Params
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphInstantiateWithParams
#ifdef USE_CUDA_NAMES
    function hipGraphInstantiateWithParams_(pGraphExec,graph,instantiateParams) &
        bind(c, name="cudaGraphInstantiateWithParams")
#else
    function hipGraphInstantiateWithParams_(pGraphExec,graph,instantiateParams) &
        bind(c, name="hipGraphInstantiateWithParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphInstantiateWithParams_
      type(c_ptr) :: pGraphExec
      type(c_ptr),value :: graph
      type(hipGraphInstantiateParams) :: instantiateParams
    end function
  end interface

  !>  @brief Uploads an executable graph to a stream
  !>
  !>  @param [in] graphExec - Instance of executable graph to be uploaded.
  !>  @param [in] stream - Instance of stream to which the executable graph is uploaded to.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphUpload
#ifdef USE_CUDA_NAMES
    function hipGraphUpload_(graphExec,stream) bind(c, name="cudaGraphUpload")
#else
    function hipGraphUpload_(graphExec,stream) bind(c, name="hipGraphUpload")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphUpload_
      type(c_ptr),value :: graphExec
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Creates a kernel execution node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - Pointer to kernel graph node that is created.
  !>  @param [in] graph - Instance of graph to add the created node to.
  !>  @param [in] pDependencies - Pointer to the dependencies on the kernel execution node.
  !>  @param [in] numDependencies - Number of dependencies.
  !>  @param [in] nodeParams - Pointer to the node parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`.
  interface hipGraphAddNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddNode_(pGraphNode,graph,pDependencies,numDependencies,nodeParams) &
        bind(c, name="cudaGraphAddNode")
#else
    function hipGraphAddNode_(pGraphNode,graph,pDependencies,numDependencies,nodeParams) &
        bind(c, name="hipGraphAddNode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(hipGraphNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Return the flags of an executable graph.
  !>
  !>  @param [in] graphExec - Executable graph to get the flags from.
  !>  @param [out] flags - Flags used to instantiate this executable graph.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`.
  interface hipGraphExecGetFlags
#ifdef USE_CUDA_NAMES
    function hipGraphExecGetFlags_(graphExec,flags) bind(c, name="cudaGraphExecGetFlags")
#else
    function hipGraphExecGetFlags_(graphExec,flags) bind(c, name="hipGraphExecGetFlags")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecGetFlags_
      type(c_ptr),value :: graphExec
      type(c_ptr),value :: flags
    end function
  end interface

  !>  @brief Updates parameters of a graph's node.
  !>
  !>  @param [in] node - Instance of the node to set parameters for.
  !>  @param [in] nodeParams - Pointer to the parameters to be set.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDeviceFunction`,
  !>  `hipErrorNotSupported`.
  interface hipGraphNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphNodeSetParams_(node,nodeParams) bind(c, name="cudaGraphNodeSetParams")
#else
    function hipGraphNodeSetParams_(node,nodeParams) bind(c, name="hipGraphNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeSetParams_
      type(c_ptr),value :: node
      type(hipGraphNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Updates parameters of an executable graph's node.
  !>
  !>  @param [in] graphExec - Instance of the executable graph.
  !>  @param [in] node - Instance of the node to set parameters to.
  !>  @param [in] nodeParams - Pointer to the parameters to be set.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidDeviceFunction`,
  !>  `hipErrorNotSupported`.
  interface hipGraphExecNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExecNodeSetParams_(graphExec,node,nodeParams) &
        bind(c, name="cudaGraphExecNodeSetParams")
#else
    function hipGraphExecNodeSetParams_(graphExec,node,nodeParams) &
        bind(c, name="hipGraphExecNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecNodeSetParams_
      type(c_ptr),value :: graphExec
      type(c_ptr),value :: node
      type(hipGraphNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Creates a memcpy node and adds it to a graph.
  !>
  !>  @param [out] phGraphNode - Pointer to graph node that is created.
  !>  @param [in] hGraph - Instance of graph to add the created node to.
  !>  @param [in] dependencies - const pointer to the dependencies of the memcpy execution node.
  !>  @param [in] numDependencies - The number of dependencies.
  !>  @param [in] copyParams - const pointer to the parameters for the memory copy.
  !>  @param [in] ctx - context related to current device.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipDrvGraphAddMemcpyNode
    function hipDrvGraphAddMemcpyNode_(phGraphNode,hGraph,dependencies,numDependencies,copyParams, &
        ctx) &
        bind(c, name="hipDrvGraphAddMemcpyNode")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvGraphAddMemcpyNode_
      type(c_ptr) :: phGraphNode
      type(c_ptr),value :: hGraph
      type(c_ptr) :: dependencies
      integer(c_size_t),value :: numDependencies
      type(HIP_MEMCPY3D) :: copyParams
      type(c_ptr),value :: ctx
    end function
  end interface
#endif

  !>  @brief Sets a node's attribute.
  !>
  !>  @param [in] hNode - Instance of the node to set parameters of.
  !>  @param [in] attr - The attribute type to be set.
  !>  @param [in] value - const pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphKernelNodeSetAttribute
#ifdef USE_CUDA_NAMES
    function hipGraphKernelNodeSetAttribute_(hNode,attr,myValue) &
        bind(c, name="cudaGraphKernelNodeSetAttribute")
#else
    function hipGraphKernelNodeSetAttribute_(hNode,attr,myValue) &
        bind(c, name="hipGraphKernelNodeSetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphKernelNodeSetAttribute_
      type(c_ptr),value :: hNode
      integer(kind(hipLaunchAttributeAccessPolicyWindow)),value :: attr
      type(c_ptr),value :: myValue
    end function
  end interface

  !>  @brief Gets a node's attribute.
  !>
  !>  @param [in] hNode - Instance of the node to set parameters of.
  !>  @param [in] attr - The attribute type to be set.
  !>  @param [in] value - const pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphKernelNodeGetAttribute
#ifdef USE_CUDA_NAMES
    function hipGraphKernelNodeGetAttribute_(hNode,attr,myValue) &
        bind(c, name="cudaGraphKernelNodeGetAttribute")
#else
    function hipGraphKernelNodeGetAttribute_(hNode,attr,myValue) &
        bind(c, name="hipGraphKernelNodeGetAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphKernelNodeGetAttribute_
      type(c_ptr),value :: hNode
      integer(kind(hipLaunchAttributeAccessPolicyWindow)),value :: attr
      type(c_ptr),value :: myValue
    end function
  end interface

  !>  @brief Creates a memory allocation node and adds it to a graph
  !>
  !>  @param [out] pGraphNode      - Pointer to the graph node to create and add to the graph
  !>  @param [in] graph            - Instance of the graph node to be added
  !>  @param [in] pDependencies    - Const pointer to the node dependencies
  !>  @param [in] numDependencies  - The number of dependencies
  !>  @param [in, out] pNodeParams - Node parameters for memory allocation, returns a pointer to the
  !>  allocated memory.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddMemAllocNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddMemAllocNode_(pGraphNode,graph,pDependencies,numDependencies,pNodeParams) &
        bind(c, name="cudaGraphAddMemAllocNode")
#else
    function hipGraphAddMemAllocNode_(pGraphNode,graph,pDependencies,numDependencies,pNodeParams) &
        bind(c, name="hipGraphAddMemAllocNode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddMemAllocNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(hipMemAllocNodeParams) :: pNodeParams
    end function
  end interface

  !>  @brief Returns parameters for memory allocation node
  !>
  !>  @param [in] node         - Memory allocation node to query
  !>  @param [out] pNodeParams - Parameters for the specified memory allocation node
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphMemAllocNodeGetParams
#ifdef USE_CUDA_NAMES
    function hipGraphMemAllocNodeGetParams_(node,pNodeParams) &
        bind(c, name="cudaGraphMemAllocNodeGetParams")
#else
    function hipGraphMemAllocNodeGetParams_(node,pNodeParams) &
        bind(c, name="hipGraphMemAllocNodeGetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphMemAllocNodeGetParams_
      type(c_ptr),value :: node
      type(hipMemAllocNodeParams) :: pNodeParams
    end function
  end interface

  !>  @brief Creates a memory free node and adds it to a graph
  !>
  !>  @param [out] pGraphNode      - Pointer to the graph node to create and add to the graph
  !>  @param [in] graph            - Instance of the graph node to be added
  !>  @param [in] pDependencies    - Const pointer to the node dependencies
  !>  @param [in] numDependencies  - The number of dependencies
  !>  @param [in] dev_ptr          - Pointer to the memory to be freed
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddMemFreeNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddMemFreeNode_(pGraphNode,graph,pDependencies,numDependencies,dev_ptr) &
        bind(c, name="cudaGraphAddMemFreeNode")
#else
    function hipGraphAddMemFreeNode_(pGraphNode,graph,pDependencies,numDependencies,dev_ptr) &
        bind(c, name="hipGraphAddMemFreeNode")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddMemFreeNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(c_ptr),value :: dev_ptr
    end function
  end interface

  !>  @brief Returns parameters for memory free node
  !>
  !>  @param [in] node     - Memory free node to query
  !>  @param [out] dev_ptr - Device pointer of the specified memory free node
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphMemFreeNodeGetParams
#ifdef USE_CUDA_NAMES
    function hipGraphMemFreeNodeGetParams_(node,dev_ptr) &
        bind(c, name="cudaGraphMemFreeNodeGetParams")
#else
    function hipGraphMemFreeNodeGetParams_(node,dev_ptr) &
        bind(c, name="hipGraphMemFreeNodeGetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphMemFreeNodeGetParams_
      type(c_ptr),value :: node
      type(c_ptr),value :: dev_ptr
    end function
  end interface

  !>  @brief Get the mem attribute for graphs.
  !>
  !>  @param [in] device - Device to get attributes from
  !>  @param [in] attr - Attribute type to be queried
  !>  @param [out] value - Value of the queried attribute
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`
  interface hipDeviceGetGraphMemAttribute
#ifdef USE_CUDA_NAMES
    function hipDeviceGetGraphMemAttribute_(device,attr,myValue) &
        bind(c, name="cudaDeviceGetGraphMemAttribute")
#else
    function hipDeviceGetGraphMemAttribute_(device,attr,myValue) &
        bind(c, name="hipDeviceGetGraphMemAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetGraphMemAttribute_
      integer(c_int),value :: device
      integer(kind(hipGraphMemAttrUsedMemCurrent)),value :: attr
      type(c_ptr),value :: myValue
    end function
  end interface

  !>  @brief Set the mem attribute for graphs.
  !>
  !>  @param [in] device - Device to set attribute of.
  !>  @param [in] attr - Attribute type to be set.
  !>  @param [in] value - Value of the attribute.
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`
  interface hipDeviceSetGraphMemAttribute
#ifdef USE_CUDA_NAMES
    function hipDeviceSetGraphMemAttribute_(device,attr,myValue) &
        bind(c, name="cudaDeviceSetGraphMemAttribute")
#else
    function hipDeviceSetGraphMemAttribute_(device,attr,myValue) &
        bind(c, name="hipDeviceSetGraphMemAttribute")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceSetGraphMemAttribute_
      integer(c_int),value :: device
      integer(kind(hipGraphMemAttrUsedMemCurrent)),value :: attr
      type(c_ptr),value :: myValue
    end function
  end interface

  !>  @brief Free unused memory reserved for graphs on a specific device and return it back to the
  !>  OS.
  !>
  !>  @param [in] device - Device for which memory should be trimmed
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`
  interface hipDeviceGraphMemTrim
#ifdef USE_CUDA_NAMES
    function hipDeviceGraphMemTrim_(device) bind(c, name="cudaDeviceGraphMemTrim")
#else
    function hipDeviceGraphMemTrim_(device) bind(c, name="hipDeviceGraphMemTrim")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGraphMemTrim_
      integer(c_int),value :: device
    end function
  end interface

  !>  @brief Create an instance of userObject to manage lifetime of a resource.
  !>
  !>  @param [out] object_out - pointer to instace of userobj.
  !>  @param [in] ptr - pointer to pass to destroy function.
  !>  @param [in] destroy - destroy callback to remove resource.
  !>  @param [in] initialRefcount - reference to resource.
  !>  @param [in] flags - flags passed to API.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipUserObjectCreate
#ifdef USE_CUDA_NAMES
    function hipUserObjectCreate_(object_out,ptr,destroy,initialRefcount,flags) &
        bind(c, name="cudaUserObjectCreate")
#else
    function hipUserObjectCreate_(object_out,ptr,destroy,initialRefcount,flags) &
        bind(c, name="hipUserObjectCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipUserObjectCreate_
      type(c_ptr) :: object_out
      type(c_ptr),value :: ptr
      type(c_funptr),value :: destroy
      integer(c_int),value :: initialRefcount
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Release number of references to resource.
  !>
  !>  @param [in] object - pointer to instace of userobj.
  !>  @param [in] count - reference to resource to be retained.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipUserObjectRelease
#ifdef USE_CUDA_NAMES
    function hipUserObjectRelease_(object,count) bind(c, name="cudaUserObjectRelease")
#else
    function hipUserObjectRelease_(object,count) bind(c, name="hipUserObjectRelease")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipUserObjectRelease_
      type(c_ptr),value :: object
      integer(c_int),value :: count
    end function
  end interface

  !>  @brief Retain number of references to resource.
  !>
  !>  @param [in] object - pointer to instace of userobj.
  !>  @param [in] count - reference to resource to be retained.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipUserObjectRetain
#ifdef USE_CUDA_NAMES
    function hipUserObjectRetain_(object,count) bind(c, name="cudaUserObjectRetain")
#else
    function hipUserObjectRetain_(object,count) bind(c, name="hipUserObjectRetain")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipUserObjectRetain_
      type(c_ptr),value :: object
      integer(c_int),value :: count
    end function
  end interface

  !>  @brief Retain user object for graphs.
  !>
  !>  @param [in] graph - pointer to graph to retain the user object for.
  !>  @param [in] object - pointer to instace of userobj.
  !>  @param [in] count - reference to resource to be retained.
  !>  @param [in] flags - flags passed to API.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphRetainUserObject
#ifdef USE_CUDA_NAMES
    function hipGraphRetainUserObject_(graph,object,count,flags) &
        bind(c, name="cudaGraphRetainUserObject")
#else
    function hipGraphRetainUserObject_(graph,object,count,flags) &
        bind(c, name="hipGraphRetainUserObject")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphRetainUserObject_
      type(c_ptr),value :: graph
      type(c_ptr),value :: object
      integer(c_int),value :: count
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Release user object from graphs.
  !>
  !>  @param [in] graph - pointer to graph to retain the user object for.
  !>  @param [in] object - pointer to instace of userobj.
  !>  @param [in] count - reference to resource to be retained.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphReleaseUserObject
#ifdef USE_CUDA_NAMES
    function hipGraphReleaseUserObject_(graph,object,count) &
        bind(c, name="cudaGraphReleaseUserObject")
#else
    function hipGraphReleaseUserObject_(graph,object,count) &
        bind(c, name="hipGraphReleaseUserObject")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphReleaseUserObject_
      type(c_ptr),value :: graph
      type(c_ptr),value :: object
      integer(c_int),value :: count
    end function
  end interface

  !>  @brief Write a DOT file describing graph structure.
  !>
  !>  @param [in] graph - graph object for which DOT file has to be generated.
  !>  @param [in] path - path to write the DOT file.
  !>  @param [in] flags - Flags from hipGraphDebugDotFlags to get additional node information.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorOperatingSystem`
  interface hipGraphDebugDotPrint
#ifdef USE_CUDA_NAMES
    function hipGraphDebugDotPrint_(graph,path,flags) bind(c, name="cudaGraphDebugDotPrint")
#else
    function hipGraphDebugDotPrint_(graph,path,flags) bind(c, name="hipGraphDebugDotPrint")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphDebugDotPrint_
      type(c_ptr),value :: graph
      type(c_ptr),value :: path
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Copies attributes from source node to destination node.
  !>
  !>  Copies attributes from source node to destination node.
  !>  Both node must have the same context.
  !>
  !>  @param [out] hDst - Destination node.
  !>  @param [in] hSrc - Source node.
  !>  For list of attributes see `hipKernelNodeAttrID`.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidContext`
  interface hipGraphKernelNodeCopyAttributes
#ifdef USE_CUDA_NAMES
    function hipGraphKernelNodeCopyAttributes_(hSrc,hDst) &
        bind(c, name="cudaGraphKernelNodeCopyAttributes")
#else
    function hipGraphKernelNodeCopyAttributes_(hSrc,hDst) &
        bind(c, name="hipGraphKernelNodeCopyAttributes")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphKernelNodeCopyAttributes_
      type(c_ptr),value :: hSrc
      type(c_ptr),value :: hDst
    end function
  end interface

  !>  @brief Enables or disables the specified node in the given graphExec
  !>
  !>  Sets hNode to be either enabled or disabled. Disabled nodes are functionally equivalent
  !>  to empty nodes until they are reenabled. Existing node parameters are not affected by
  !>  disabling/enabling the node.
  !>
  !>  The node is identified by the corresponding hNode in the non-executable graph, from which the
  !>  executable graph was instantiated.
  !>
  !>  hNode must not have been removed from the original graph.
  !>
  !>  @note Currently only kernel, memset and memcpy nodes are supported.
  !>
  !>  @param [in] hGraphExec - The executable graph in which to set the specified node.
  !>  @param [in] hNode      - Node from the graph from which graphExec was instantiated.
  !>  @param [in] isEnabled  - Node is enabled if != 0, otherwise the node is disabled.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`,
  interface hipGraphNodeSetEnabled
#ifdef USE_CUDA_NAMES
    function hipGraphNodeSetEnabled_(hGraphExec,hNode,isEnabled) &
        bind(c, name="cudaGraphNodeSetEnabled")
#else
    function hipGraphNodeSetEnabled_(hGraphExec,hNode,isEnabled) &
        bind(c, name="hipGraphNodeSetEnabled")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeSetEnabled_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: hNode
      integer(c_int),value :: isEnabled
    end function
  end interface

  !>  @brief Query whether a node in the given graphExec is enabled
  !>
  !>  Sets isEnabled to 1 if hNode is enabled, or 0 if it is disabled.
  !>
  !>  The node is identified by the corresponding node in the non-executable graph, from which the
  !>  executable graph was instantiated.
  !>
  !>  hNode must not have been removed from the original graph.
  !>
  !>  @note Currently only kernel, memset and memcpy nodes are supported.
  !>
  !>  @param [in]  hGraphExec - The executable graph in which to set the specified node.
  !>  @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
  !>  @param [out] isEnabled  - Location to return the enabled status of the node.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphNodeGetEnabled
#ifdef USE_CUDA_NAMES
    function hipGraphNodeGetEnabled_(hGraphExec,hNode,isEnabled) &
        bind(c, name="cudaGraphNodeGetEnabled")
#else
    function hipGraphNodeGetEnabled_(hGraphExec,hNode,isEnabled) &
        bind(c, name="hipGraphNodeGetEnabled")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetEnabled_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: hNode
      type(c_ptr),value :: isEnabled
    end function
  end interface

  !>  @brief Creates a external semaphor wait node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - pointer to the graph node to create.
  !>  @param [in] graph - instance of the graph to add the created node.
  !>  @param [in] pDependencies - const pointer to the dependencies on the memset execution node.
  !>  @param [in] numDependencies - the number of the dependencies.
  !>  @param [in] nodeParams -pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddExternalSemaphoresWaitNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddExternalSemaphoresWaitNode_(pGraphNode,graph,pDependencies, &
        numDependencies,nodeParams) &
        bind(c, name="cudaGraphAddExternalSemaphoresWaitNode")
#else
    function hipGraphAddExternalSemaphoresWaitNode_(pGraphNode,graph,pDependencies, &
        numDependencies,nodeParams) &
        bind(c, name="hipGraphAddExternalSemaphoresWaitNode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddExternalSemaphoresWaitNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Creates a external semaphor signal node and adds it to a graph.
  !>
  !>  @param [out] pGraphNode - pointer to the graph node to create.
  !>  @param [in] graph - instance of the graph to add the created node.
  !>  @param [in] pDependencies - const pointer to the dependencies on the memset execution node.
  !>  @param [in] numDependencies - the number of the dependencies.
  !>  @param [in] nodeParams -pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphAddExternalSemaphoresSignalNode
#ifdef USE_CUDA_NAMES
    function hipGraphAddExternalSemaphoresSignalNode_(pGraphNode,graph,pDependencies, &
        numDependencies,nodeParams) &
        bind(c, name="cudaGraphAddExternalSemaphoresSignalNode")
#else
    function hipGraphAddExternalSemaphoresSignalNode_(pGraphNode,graph,pDependencies, &
        numDependencies,nodeParams) &
        bind(c, name="hipGraphAddExternalSemaphoresSignalNode")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphAddExternalSemaphoresSignalNode_
      type(c_ptr) :: pGraphNode
      type(c_ptr),value :: graph
      type(c_ptr) :: pDependencies
      integer(c_size_t),value :: numDependencies
      type(hipExternalSemaphoreSignalNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Updates node parameters in the external semaphore signal node.
  !>
  !>  @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
  !>  @param [in]  nodeParams  - Pointer to the params to be set.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExternalSemaphoresSignalNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExternalSemaphoresSignalNodeSetParams_(hNode,nodeParams) &
        bind(c, name="cudaGraphExternalSemaphoresSignalNodeSetParams")
#else
    function hipGraphExternalSemaphoresSignalNodeSetParams_(hNode,nodeParams) &
        bind(c, name="hipGraphExternalSemaphoresSignalNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExternalSemaphoresSignalNodeSetParams_
      type(c_ptr),value :: hNode
      type(hipExternalSemaphoreSignalNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Updates node parameters in the external semaphore wait node.
  !>
  !>  @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
  !>  @param [in]  nodeParams  - Pointer to the params to be set.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExternalSemaphoresWaitNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExternalSemaphoresWaitNodeSetParams_(hNode,nodeParams) &
        bind(c, name="cudaGraphExternalSemaphoresWaitNodeSetParams")
#else
    function hipGraphExternalSemaphoresWaitNodeSetParams_(hNode,nodeParams) &
        bind(c, name="hipGraphExternalSemaphoresWaitNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExternalSemaphoresWaitNodeSetParams_
      type(c_ptr),value :: hNode
      type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Returns external semaphore signal node params.
  !>
  !>  @param [in]   hNode       - Node from the graph from which graphExec was instantiated.
  !>  @param [out]  params_out  - Pointer to params.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExternalSemaphoresSignalNodeGetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExternalSemaphoresSignalNodeGetParams_(hNode,params_out) &
        bind(c, name="cudaGraphExternalSemaphoresSignalNodeGetParams")
#else
    function hipGraphExternalSemaphoresSignalNodeGetParams_(hNode,params_out) &
        bind(c, name="hipGraphExternalSemaphoresSignalNodeGetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExternalSemaphoresSignalNodeGetParams_
      type(c_ptr),value :: hNode
      type(hipExternalSemaphoreSignalNodeParams) :: params_out
    end function
  end interface

  !>  @brief Returns external semaphore wait node params.
  !>
  !>  @param [in]   hNode       - Node from the graph from which graphExec was instantiated.
  !>  @param [out]  params_out  - Pointer to params.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExternalSemaphoresWaitNodeGetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExternalSemaphoresWaitNodeGetParams_(hNode,params_out) &
        bind(c, name="cudaGraphExternalSemaphoresWaitNodeGetParams")
#else
    function hipGraphExternalSemaphoresWaitNodeGetParams_(hNode,params_out) &
        bind(c, name="hipGraphExternalSemaphoresWaitNodeGetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExternalSemaphoresWaitNodeGetParams_
      type(c_ptr),value :: hNode
      type(hipExternalSemaphoreWaitNodeParams) :: params_out
    end function
  end interface

  !>  @brief Updates node parameters in the external semaphore signal node in the given graphExec.
  !>
  !>  @param [in]  hGraphExec - The executable graph in which to set the specified node.
  !>  @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
  !>  @param [in]  nodeParams  - Pointer to the params to be set.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecExternalSemaphoresSignalNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExecExternalSemaphoresSignalNodeSetParams_(hGraphExec,hNode,nodeParams) &
        bind(c, name="cudaGraphExecExternalSemaphoresSignalNodeSetParams")
#else
    function hipGraphExecExternalSemaphoresSignalNodeSetParams_(hGraphExec,hNode,nodeParams) &
        bind(c, name="hipGraphExecExternalSemaphoresSignalNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecExternalSemaphoresSignalNodeSetParams_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: hNode
      type(hipExternalSemaphoreSignalNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Updates node parameters in the external semaphore wait node in the given graphExec.
  !>
  !>  @param [in]  hGraphExec - The executable graph in which to set the specified node.
  !>  @param [in]  hNode      - Node from the graph from which graphExec was instantiated.
  !>  @param [in]  nodeParams  - Pointer to the params to be set.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphExecExternalSemaphoresWaitNodeSetParams
#ifdef USE_CUDA_NAMES
    function hipGraphExecExternalSemaphoresWaitNodeSetParams_(hGraphExec,hNode,nodeParams) &
        bind(c, name="cudaGraphExecExternalSemaphoresWaitNodeSetParams")
#else
    function hipGraphExecExternalSemaphoresWaitNodeSetParams_(hGraphExec,hNode,nodeParams) &
        bind(c, name="hipGraphExecExternalSemaphoresWaitNodeSetParams")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecExternalSemaphoresWaitNodeSetParams_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: hNode
      type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
    end function
  end interface

  !>  @brief Gets a memcpy node's parameters.
  !>
  !>  @param [in] hNode - instance of the node to get parameters from.
  !>  @param [out] nodeParams - pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipDrvGraphMemcpyNodeGetParams
    function hipDrvGraphMemcpyNodeGetParams_(hNode,nodeParams) &
        bind(c, name="hipDrvGraphMemcpyNodeGetParams")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvGraphMemcpyNodeGetParams_
      type(c_ptr),value :: hNode
      type(HIP_MEMCPY3D) :: nodeParams
    end function
  end interface
#endif

  !>  @brief Sets a memcpy node's parameters.
  !>
  !>  @param [in] hNode - instance of the node to Set parameters for.
  !>  @param [out] nodeParams - pointer to the parameters.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipDrvGraphMemcpyNodeSetParams
    function hipDrvGraphMemcpyNodeSetParams_(hNode,nodeParams) &
        bind(c, name="hipDrvGraphMemcpyNodeSetParams")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvGraphMemcpyNodeSetParams_
      type(c_ptr),value :: hNode
      type(HIP_MEMCPY3D) :: nodeParams
    end function
  end interface
#endif

  !>  @brief Creates a memset node and adds it to a graph.
  !>
  !>  @param [out] phGraphNode - pointer to graph node to create.
  !>  @param [in] hGraph - instance of graph to add the created node to.
  !>  @param [in] dependencies - const pointer to the dependencies on the memset execution node.
  !>  @param [in] numDependencies - number of the dependencies.
  !>  @param [in] memsetParams - const pointer to the parameters for the memory set.
  !>  @param [in] ctx - cotext related to current device.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipDrvGraphAddMemsetNode
    function hipDrvGraphAddMemsetNode_(phGraphNode,hGraph,dependencies,numDependencies, &
        memsetParams,ctx) &
        bind(c, name="hipDrvGraphAddMemsetNode")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvGraphAddMemsetNode_
      type(c_ptr) :: phGraphNode
      type(c_ptr),value :: hGraph
      type(c_ptr) :: dependencies
      integer(c_size_t),value :: numDependencies
      type(hipMemsetParams) :: memsetParams
      type(c_ptr),value :: ctx
    end function
  end interface
#endif

  !>  @brief Creates a memory free node and adds it to a graph
  !>
  !>  @param [out] phGraphNode - Pointer to the graph node to create and add to the graph
  !>  @param [in]  hGraph - Instance of the graph the node to be added
  !>  @param [in]  dependencies - Const pointer to the node dependencies
  !>  @param [in]  numDependencies - The number of dependencies
  !>  @param [in]  dptr - Pointer to the memory to be freed
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipDrvGraphAddMemFreeNode
    function hipDrvGraphAddMemFreeNode_(phGraphNode,hGraph,dependencies,numDependencies,dptr) &
        bind(c, name="hipDrvGraphAddMemFreeNode")
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDrvGraphAddMemFreeNode_
      type(c_ptr) :: phGraphNode
      type(c_ptr),value :: hGraph
      type(c_ptr) :: dependencies
      integer(c_size_t),value :: numDependencies
      type(c_ptr),value :: dptr
    end function
  end interface
#endif

  !>  @brief Sets the parameters for a memcpy node in the given graphExec.
  !>
  !>  @param [in] hGraphExec - instance of the executable graph with the node.
  !>  @param [in] hNode - instance of the node to set parameters to.
  !>  @param [in] copyParams - const pointer to the memcpy node params.
  !>  @param [in] ctx - cotext related to current device.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipDrvGraphExecMemcpyNodeSetParams
    function hipDrvGraphExecMemcpyNodeSetParams_(hGraphExec,hNode,copyParams,ctx) &
        bind(c, name="hipDrvGraphExecMemcpyNodeSetParams")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvGraphExecMemcpyNodeSetParams_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: hNode
      type(HIP_MEMCPY3D) :: copyParams
      type(c_ptr),value :: ctx
    end function
  end interface
#endif

  !>  @brief Sets the parameters for a memset node in the given graphExec.
  !>
  !>  @param [in] hGraphExec - instance of the executable graph with the node.
  !>  @param [in] hNode - instance of the node to set parameters to.
  !>  @param [in] memsetParams - pointer to the parameters.
  !>  @param [in] ctx - cotext related to current device.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
#ifndef USE_CUDA_NAMES
  interface hipDrvGraphExecMemsetNodeSetParams
    function hipDrvGraphExecMemsetNodeSetParams_(hGraphExec,hNode,memsetParams,ctx) &
        bind(c, name="hipDrvGraphExecMemsetNodeSetParams")
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipDrvGraphExecMemsetNodeSetParams_
      type(c_ptr),value :: hGraphExec
      type(c_ptr),value :: hNode
      type(hipMemsetParams) :: memsetParams
      type(c_ptr),value :: ctx
    end function
  end interface
#endif

  !>  @brief Frees an address range reservation made via hipMemAddressReserve
  !>
  !>  @param [in] devPtr - starting address of the range.
  !>  @param [in] size - size of the range.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemAddressFree
#ifdef USE_CUDA_NAMES
    function hipMemAddressFree_(devPtr,mySize) bind(c, name="cuMemAddressFree")
#else
    function hipMemAddressFree_(devPtr,mySize) bind(c, name="hipMemAddressFree")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemAddressFree_
      type(c_ptr),value :: devPtr
      integer(c_size_t),value :: mySize
    end function
  end interface

  !>  @brief Reserves an address range
  !>
  !>  @param [out] ptr - starting address of the reserved range.
  !>  @param [in] size - size of the reservation.
  !>  @param [in] alignment - alignment of the address.
  !>  @param [in] addr - requested starting address of the range.
  !>  @param [in] flags - currently unused, must be zero.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemAddressReserve
#ifdef USE_CUDA_NAMES
    function hipMemAddressReserve_(ptr,mySize,alignment,addr,flags) &
        bind(c, name="cuMemAddressReserve")
#else
    function hipMemAddressReserve_(ptr,mySize,alignment,addr,flags) &
        bind(c, name="hipMemAddressReserve")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemAddressReserve_
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
      integer(c_size_t),value :: alignment
      type(c_ptr),value :: addr
      integer(c_int64_t),value :: flags
    end function
  end interface

  !>  @brief Creates a memory allocation described by the properties and size
  !>
  !>  @param [out] handle - value of the returned handle.
  !>  @param [in] size - size of the allocation.
  !>  @param [in] prop - properties of the allocation.
  !>  @param [in] flags - currently unused, must be zero.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemCreate
#ifdef USE_CUDA_NAMES
    function hipMemCreate_(handle,mySize,prop,flags) bind(c, name="cuMemCreate")
#else
    function hipMemCreate_(handle,mySize,prop,flags) bind(c, name="hipMemCreate")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemCreate_
      type(c_ptr) :: handle
      integer(c_size_t),value :: mySize
      type(hipMemAllocationProp) :: prop
      integer(c_int64_t),value :: flags
    end function
  end interface

  !>  @brief Exports an allocation to a requested shareable handle type.
  !>
  !>  @param [out] shareableHandle - value of the returned handle.
  !>  @param [in] handle - handle to share.
  !>  @param [in] handleType - type of the shareable handle.
  !>  @param [in] flags - currently unused, must be zero.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemExportToShareableHandle
#ifdef USE_CUDA_NAMES
    function hipMemExportToShareableHandle_(shareableHandle,handle,handleType,flags) &
        bind(c, name="cuMemExportToShareableHandle")
#else
    function hipMemExportToShareableHandle_(shareableHandle,handle,handleType,flags) &
        bind(c, name="hipMemExportToShareableHandle")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemExportToShareableHandle_
      type(c_ptr),value :: shareableHandle
      type(c_ptr),value :: handle
      integer(kind(hipMemHandleTypeNone)),value :: handleType
      integer(c_int64_t),value :: flags
    end function
  end interface

  !>  @brief Get the access flags set for the given location and ptr.
  !>
  !>  @param [out] flags - flags for this location.
  !>  @param [in] location - target location.
  !>  @param [in] ptr - address to check the access flags.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemGetAccess
#ifdef USE_CUDA_NAMES
    function hipMemGetAccess_(flags,location,ptr) bind(c, name="cuMemGetAccess")
#else
    function hipMemGetAccess_(flags,location,ptr) bind(c, name="hipMemGetAccess")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetAccess_
      type(c_ptr),value :: flags
      type(hipMemLocation) :: location
      type(c_ptr),value :: ptr
    end function
  end interface

  !>  @brief Calculates either the minimal or recommended granularity.
  !>
  !>  @param [out] granularity - returned granularity.
  !>  @param [in] prop - location properties.
  !>  @param [in] option - determines which granularity to return.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemGetAllocationGranularity
#ifdef USE_CUDA_NAMES
    function hipMemGetAllocationGranularity_(granularity,prop,option) &
        bind(c, name="cuMemGetAllocationGranularity")
#else
    function hipMemGetAllocationGranularity_(granularity,prop,option) &
        bind(c, name="hipMemGetAllocationGranularity")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetAllocationGranularity_
      type(c_ptr),value :: granularity
      type(hipMemAllocationProp) :: prop
      integer(kind(hipMemAllocationGranularityMinimum)),value :: option
    end function
  end interface

  !>  @brief Retrieve the property structure of the given handle.
  !>
  !>  @param [out] prop - properties of the given handle.
  !>  @param [in] handle - handle to perform the query on.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemGetAllocationPropertiesFromHandle
#ifdef USE_CUDA_NAMES
    function hipMemGetAllocationPropertiesFromHandle_(prop,handle) &
        bind(c, name="cuMemGetAllocationPropertiesFromHandle")
#else
    function hipMemGetAllocationPropertiesFromHandle_(prop,handle) &
        bind(c, name="hipMemGetAllocationPropertiesFromHandle")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetAllocationPropertiesFromHandle_
      type(hipMemAllocationProp) :: prop
      type(c_ptr),value :: handle
    end function
  end interface

  !>  @brief Imports an allocation from a requested shareable handle type.
  !>
  !>  @param [out] handle - returned value.
  !>  @param [in] osHandle - shareable handle representing the memory allocation.
  !>  @param [in] shHandleType - handle type.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemImportFromShareableHandle
#ifdef USE_CUDA_NAMES
    function hipMemImportFromShareableHandle_(handle,osHandle,shHandleType) &
        bind(c, name="cuMemImportFromShareableHandle")
#else
    function hipMemImportFromShareableHandle_(handle,osHandle,shHandleType) &
        bind(c, name="hipMemImportFromShareableHandle")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemImportFromShareableHandle_
      type(c_ptr) :: handle
      type(c_ptr),value :: osHandle
      integer(kind(hipMemHandleTypeNone)),value :: shHandleType
    end function
  end interface

  !>  @brief Maps an allocation handle to a reserved virtual address range.
  !>
  !>  @param [in] ptr - address where the memory will be mapped.
  !>  @param [in] size - size of the mapping.
  !>  @param [in] offset - offset into the memory, currently must be zero.
  !>  @param [in] handle - memory allocation to be mapped.
  !>  @param [in] flags - currently unused, must be zero.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemMap
#ifdef USE_CUDA_NAMES
    function hipMemMap_(ptr,mySize,offset,handle,flags) bind(c, name="cuMemMap")
#else
    function hipMemMap_(ptr,mySize,offset,handle,flags) bind(c, name="hipMemMap")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemMap_
      type(c_ptr),value :: ptr
      integer(c_size_t),value :: mySize
      integer(c_size_t),value :: offset
      type(c_ptr),value :: handle
      integer(c_int64_t),value :: flags
    end function
  end interface

  !>  @brief Maps or unmaps subregions of sparse HIP arrays and sparse HIP mipmapped arrays.
  !>
  !>  @param [in] mapInfoList - list of hipArrayMapInfo.
  !>  @param [in] count - number of hipArrayMapInfo in mapInfoList.
  !>  @param [in] stream - stream identifier for the stream to use for map or unmap operations.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is under development. Currently it is not supported on AMD
  !>           GPUs and returns `hipErrorNotSupported`.
  interface hipMemMapArrayAsync
#ifdef USE_CUDA_NAMES
    function hipMemMapArrayAsync_(mapInfoList,count,stream) bind(c, name="cuMemMapArrayAsync")
#else
    function hipMemMapArrayAsync_(mapInfoList,count,stream) bind(c, name="hipMemMapArrayAsync")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemMapArrayAsync_
      type(hipArrayMapInfo) :: mapInfoList
      integer(c_int),value :: count
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Release a memory handle representing a memory allocation which was previously allocated
  !>  through hipMemCreate.
  !>
  !>  @param [in] handle - handle of the memory allocation.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemRelease
#ifdef USE_CUDA_NAMES
    function hipMemRelease_(handle) bind(c, name="cuMemRelease")
#else
    function hipMemRelease_(handle) bind(c, name="hipMemRelease")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemRelease_
      type(c_ptr),value :: handle
    end function
  end interface

  !>  @brief Returns the allocation handle of the backing memory allocation given the address.
  !>
  !>  @param [out] handle - handle representing addr.
  !>  @param [in] addr - address to look up.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemRetainAllocationHandle
#ifdef USE_CUDA_NAMES
    function hipMemRetainAllocationHandle_(handle,addr) bind(c, name="cuMemRetainAllocationHandle")
#else
    function hipMemRetainAllocationHandle_(handle,addr) bind(c, name="hipMemRetainAllocationHandle")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemRetainAllocationHandle_
      type(c_ptr) :: handle
      type(c_ptr),value :: addr
    end function
  end interface

  !>  @brief Set the access flags for each location specified in desc for the given virtual address
  !>  range.
  !>
  !>  @param [in] ptr - starting address of the virtual address range.
  !>  @param [in] size - size of the range.
  !>  @param [in] desc - array of hipMemAccessDesc.
  !>  @param [in] count - number of hipMemAccessDesc in desc.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemSetAccess
#ifdef USE_CUDA_NAMES
    function hipMemSetAccess_(ptr,mySize,desc,count) bind(c, name="cuMemSetAccess")
#else
    function hipMemSetAccess_(ptr,mySize,desc,count) bind(c, name="hipMemSetAccess")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemSetAccess_
      type(c_ptr),value :: ptr
      integer(c_size_t),value :: mySize
      type(hipMemAccessDesc) :: desc
      integer(c_size_t),value :: count
    end function
  end interface

  !>  @brief Unmap memory allocation of a given address range.
  !>
  !>  @param [in] ptr - starting address of the range to unmap.
  !>  @param [in] size - size of the virtual address range.
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorNotSupported`
  !>  @warning This API is marked as Beta. While this feature is complete, it can
  !>           change and might have outstanding issues.
  !>
  !>  @note  This API is implemented on Linux and is under development on Microsoft Windows.
  interface hipMemUnmap
#ifdef USE_CUDA_NAMES
    function hipMemUnmap_(ptr,mySize) bind(c, name="cuMemUnmap")
#else
    function hipMemUnmap_(ptr,mySize) bind(c, name="hipMemUnmap")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemUnmap_
      type(c_ptr),value :: ptr
      integer(c_size_t),value :: mySize
    end function
  end interface

  !>  @brief Maps a graphics resource for access.
  !>
  !>  @param [in] count - Number of resources to map.
  !>  @param [in] resources - Pointer of resources to map.
  !>  @param [in] stream - Stream for synchronization.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorUnknown`,
  !>  `hipErrorInvalidResourceHandle`
  interface hipGraphicsMapResources
#ifdef USE_CUDA_NAMES
    function hipGraphicsMapResources_(count,resources,stream) &
        bind(c, name="cudaGraphicsMapResources")
#else
    function hipGraphicsMapResources_(count,resources,stream) &
        bind(c, name="hipGraphicsMapResources")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphicsMapResources_
      integer(c_int),value :: count
      type(c_ptr) :: resources
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Get an array through which to access a subresource of a mapped graphics resource.
  !>
  !>  @param [out] array - Pointer of array through which a subresource of resource may be accessed.
  !>  @param [in] resource - Mapped resource to access.
  !>  @param [in] arrayIndex - Array index for the subresource to access.
  !>  @param [in] mipLevel - Mipmap level for the subresource to access.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>  @note  In this API, the value of arrayIndex higher than zero is currently not supported.
  interface hipGraphicsSubResourceGetMappedArray
#ifdef USE_CUDA_NAMES
    function hipGraphicsSubResourceGetMappedArray_(array,resource,arrayIndex,mipLevel) &
        bind(c, name="cudaGraphicsSubResourceGetMappedArray")
#else
    function hipGraphicsSubResourceGetMappedArray_(array,resource,arrayIndex,mipLevel) &
        bind(c, name="hipGraphicsSubResourceGetMappedArray")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphicsSubResourceGetMappedArray_
      type(c_ptr) :: array
      type(c_ptr),value :: resource
      integer(c_int),value :: arrayIndex
      integer(c_int),value :: mipLevel
    end function
  end interface

  !>  @brief Gets device accessible address of a graphics resource.
  !>
  !>  @param [out] devPtr - Pointer of device through which graphic resource may be accessed.
  !>  @param [out] size - Size of the buffer accessible from devPtr.
  !>  @param [in] resource - Mapped resource to access.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipGraphicsResourceGetMappedPointer
#ifdef USE_CUDA_NAMES
    function hipGraphicsResourceGetMappedPointer_(devPtr,mySize,resource) &
        bind(c, name="cudaGraphicsResourceGetMappedPointer")
#else
    function hipGraphicsResourceGetMappedPointer_(devPtr,mySize,resource) &
        bind(c, name="hipGraphicsResourceGetMappedPointer")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphicsResourceGetMappedPointer_
      type(c_ptr) :: devPtr
      type(c_ptr),value :: mySize
      type(c_ptr),value :: resource
    end function
  end interface

  !>  @brief Unmaps graphics resources.
  !>
  !>  @param [in] count - Number of resources to unmap.
  !>  @param [in] resources - Pointer of resources to unmap.
  !>  @param [in] stream - Stream for synchronization.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorUnknown`, `hipErrorContextIsDestroyed`
  interface hipGraphicsUnmapResources
#ifdef USE_CUDA_NAMES
    function hipGraphicsUnmapResources_(count,resources,stream) &
        bind(c, name="cudaGraphicsUnmapResources")
#else
    function hipGraphicsUnmapResources_(count,resources,stream) &
        bind(c, name="hipGraphicsUnmapResources")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphicsUnmapResources_
      integer(c_int),value :: count
      type(c_ptr) :: resources
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Unregisters a graphics resource.
  !>
  !>  @param [in] resource - Graphics resources to unregister.
  !>
  !>  @returns `hipSuccess`
  interface hipGraphicsUnregisterResource
#ifdef USE_CUDA_NAMES
    function hipGraphicsUnregisterResource_(resource) bind(c, name="cudaGraphicsUnregisterResource")
#else
    function hipGraphicsUnregisterResource_(resource) bind(c, name="hipGraphicsUnregisterResource")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphicsUnregisterResource_
      type(c_ptr),value :: resource
    end function
  end interface

  !>  @brief Create a surface object.
  !>
  !>  @param [out] pSurfObject  Pointer of surface object to be created.
  !>  @param [in] pResDesc  Pointer of suface object descriptor.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipCreateSurfaceObject
#ifdef USE_CUDA_NAMES
    function hipCreateSurfaceObject_(pSurfObject,pResDesc) bind(c, name="cudaCreateSurfaceObject")
#else
    function hipCreateSurfaceObject_(pSurfObject,pResDesc) bind(c, name="hipCreateSurfaceObject")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipCreateSurfaceObject_
      type(c_ptr) :: pSurfObject
      type(hipResourceDesc) :: pResDesc
    end function
  end interface

  !>  @brief Destroy a surface object.
  !>
  !>  @param [in] surfaceObject  Surface object to be destroyed.
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipDestroySurfaceObject
#ifdef USE_CUDA_NAMES
    function hipDestroySurfaceObject_(surfaceObject) bind(c, name="cudaDestroySurfaceObject")
#else
    function hipDestroySurfaceObject_(surfaceObject) bind(c, name="hipDestroySurfaceObject")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipDestroySurfaceObject_
      type(c_ptr),value :: surfaceObject
    end function
  end interface

  interface hipMemcpy_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpy_spt_(dst,src,sizeBytes,myKind) bind(c, name="cudaMemcpy_ptds")
#else
    function hipMemcpy_spt_(dst,src,sizeBytes,myKind) bind(c, name="hipMemcpy_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy_spt_
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  interface hipMemcpyToSymbol_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpyToSymbol_spt_(symbol,src,sizeBytes,offset,myKind) &
        bind(c, name="cudaMemcpyToSymbol_ptds")
#else
    function hipMemcpyToSymbol_spt_(symbol,src,sizeBytes,offset,myKind) &
        bind(c, name="hipMemcpyToSymbol_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyToSymbol_spt_
      type(c_ptr),value :: symbol
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  interface hipMemcpyFromSymbol_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpyFromSymbol_spt_(dst,symbol,sizeBytes,offset,myKind) &
        bind(c, name="cudaMemcpyFromSymbol_ptds")
#else
    function hipMemcpyFromSymbol_spt_(dst,symbol,sizeBytes,offset,myKind) &
        bind(c, name="hipMemcpyFromSymbol_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyFromSymbol_spt_
      type(c_ptr),value :: dst
      type(c_ptr),value :: symbol
      integer(c_size_t),value :: sizeBytes
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  interface hipMemcpy2D_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpy2D_spt_(dst,dpitch,src,spitch,width,height,myKind) &
        bind(c, name="cudaMemcpy2D_ptds")
#else
    function hipMemcpy2D_spt_(dst,dpitch,src,spitch,width,height,myKind) &
        bind(c, name="hipMemcpy2D_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2D_spt_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dpitch
      type(c_ptr),value :: src
      integer(c_size_t),value :: spitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  interface hipMemcpy2DFromArray_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DFromArray_spt_(dst,dpitch,src,wOffset,hOffset,width,height,myKind) &
        bind(c, name="cudaMemcpy2DFromArray_ptds")
#else
    function hipMemcpy2DFromArray_spt_(dst,dpitch,src,wOffset,hOffset,width,height,myKind) &
        bind(c, name="hipMemcpy2DFromArray_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DFromArray_spt_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dpitch
      type(c_ptr),value :: src
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  interface hipMemcpy3D_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpy3D_spt_(p) bind(c, name="cudaMemcpy3D_ptds")
#else
    function hipMemcpy3D_spt_(p) bind(c, name="hipMemcpy3D_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3D_spt_
      type(hipMemcpy3DParms) :: p
    end function
  end interface

  interface hipMemset_spt
#ifdef USE_CUDA_NAMES
    function hipMemset_spt_(dst,myValue,sizeBytes) bind(c, name="cudaMemset_ptds")
#else
    function hipMemset_spt_(dst,myValue,sizeBytes) bind(c, name="hipMemset_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemset_spt_
      type(c_ptr),value :: dst
      integer(c_int),value :: myValue
      integer(c_size_t),value :: sizeBytes
    end function
  end interface

  interface hipMemsetAsync_spt
#ifdef USE_CUDA_NAMES
    function hipMemsetAsync_spt_(dst,myValue,sizeBytes,stream) bind(c, name="cudaMemsetAsync_ptsz")
#else
    function hipMemsetAsync_spt_(dst,myValue,sizeBytes,stream) bind(c, name="hipMemsetAsync_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemsetAsync_spt_
      type(c_ptr),value :: dst
      integer(c_int),value :: myValue
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipMemset2D_spt
#ifdef USE_CUDA_NAMES
    function hipMemset2D_spt_(dst,pitch,myValue,width,height) bind(c, name="cudaMemset2D_ptds")
#else
    function hipMemset2D_spt_(dst,pitch,myValue,width,height) bind(c, name="hipMemset2D_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemset2D_spt_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: pitch
      integer(c_int),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
    end function
  end interface

  interface hipMemset2DAsync_spt
#ifdef USE_CUDA_NAMES
    function hipMemset2DAsync_spt_(dst,pitch,myValue,width,height,stream) &
        bind(c, name="cudaMemset2DAsync_ptsz")
#else
    function hipMemset2DAsync_spt_(dst,pitch,myValue,width,height,stream) &
        bind(c, name="hipMemset2DAsync_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemset2DAsync_spt_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: pitch
      integer(c_int),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipMemset3DAsync_spt
#ifdef USE_CUDA_NAMES
    function hipMemset3DAsync_spt_(pitchedDevPtr,myValue,extent,stream) &
        bind(c, name="cudaMemset3DAsync_ptsz")
#else
    function hipMemset3DAsync_spt_(pitchedDevPtr,myValue,extent,stream) &
        bind(c, name="hipMemset3DAsync_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemset3DAsync_spt_
      type(c_ptr),value :: pitchedDevPtr
      integer(c_int),value :: myValue
      type(c_ptr),value :: extent
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipMemset3D_spt
#ifdef USE_CUDA_NAMES
    function hipMemset3D_spt_(pitchedDevPtr,myValue,extent) bind(c, name="cudaMemset3D_ptds")
#else
    function hipMemset3D_spt_(pitchedDevPtr,myValue,extent) bind(c, name="hipMemset3D_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemset3D_spt_
      type(c_ptr),value :: pitchedDevPtr
      integer(c_int),value :: myValue
      type(c_ptr),value :: extent
    end function
  end interface

  interface hipMemcpyAsync_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpyAsync_spt_(dst,src,sizeBytes,myKind,stream) &
        bind(c, name="cudaMemcpyAsync_ptsz")
#else
    function hipMemcpyAsync_spt_(dst,src,sizeBytes,myKind,stream) bind(c, name="hipMemcpyAsync_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyAsync_spt_
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipMemcpy3DAsync_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpy3DAsync_spt_(p,stream) bind(c, name="cudaMemcpy3DAsync_ptsz")
#else
    function hipMemcpy3DAsync_spt_(p,stream) bind(c, name="hipMemcpy3DAsync_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3DAsync_spt_
      type(hipMemcpy3DParms) :: p
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipMemcpy2DAsync_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DAsync_spt_(dst,dpitch,src,spitch,width,height,myKind,stream) &
        bind(c, name="cudaMemcpy2DAsync_ptsz")
#else
    function hipMemcpy2DAsync_spt_(dst,dpitch,src,spitch,width,height,myKind,stream) &
        bind(c, name="hipMemcpy2DAsync_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DAsync_spt_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dpitch
      type(c_ptr),value :: src
      integer(c_size_t),value :: spitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipMemcpyFromSymbolAsync_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpyFromSymbolAsync_spt_(dst,symbol,sizeBytes,offset,myKind,stream) &
        bind(c, name="cudaMemcpyFromSymbolAsync_ptsz")
#else
    function hipMemcpyFromSymbolAsync_spt_(dst,symbol,sizeBytes,offset,myKind,stream) &
        bind(c, name="hipMemcpyFromSymbolAsync_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyFromSymbolAsync_spt_
      type(c_ptr),value :: dst
      type(c_ptr),value :: symbol
      integer(c_size_t),value :: sizeBytes
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipMemcpyToSymbolAsync_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpyToSymbolAsync_spt_(symbol,src,sizeBytes,offset,myKind,stream) &
        bind(c, name="cudaMemcpyToSymbolAsync_ptsz")
#else
    function hipMemcpyToSymbolAsync_spt_(symbol,src,sizeBytes,offset,myKind,stream) &
        bind(c, name="hipMemcpyToSymbolAsync_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyToSymbolAsync_spt_
      type(c_ptr),value :: symbol
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipMemcpyFromArray_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpyFromArray_spt_(dst,src,wOffsetSrc,hOffset,count,myKind) &
        bind(c, name="cudaMemcpyFromArray_ptds")
#else
    function hipMemcpyFromArray_spt_(dst,src,wOffsetSrc,hOffset,count,myKind) &
        bind(c, name="hipMemcpyFromArray_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyFromArray_spt_
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: wOffsetSrc
      integer(c_size_t),value :: hOffset
      integer(c_size_t),value :: count
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  interface hipMemcpy2DToArray_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DToArray_spt_(dst,wOffset,hOffset,src,spitch,width,height,myKind) &
        bind(c, name="cudaMemcpy2DToArray_ptds")
#else
    function hipMemcpy2DToArray_spt_(dst,wOffset,hOffset,src,spitch,width,height,myKind) &
        bind(c, name="hipMemcpy2DToArray_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DToArray_spt_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      type(c_ptr),value :: src
      integer(c_size_t),value :: spitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function
  end interface

  interface hipMemcpy2DFromArrayAsync_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DFromArrayAsync_spt_(dst,dpitch,src,wOffsetSrc,hOffsetSrc,width,height, &
        myKind,stream) &
        bind(c, name="cudaMemcpy2DFromArrayAsync_ptsz")
#else
    function hipMemcpy2DFromArrayAsync_spt_(dst,dpitch,src,wOffsetSrc,hOffsetSrc,width,height, &
        myKind,stream) &
        bind(c, name="hipMemcpy2DFromArrayAsync_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DFromArrayAsync_spt_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dpitch
      type(c_ptr),value :: src
      integer(c_size_t),value :: wOffsetSrc
      integer(c_size_t),value :: hOffsetSrc
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipMemcpy2DToArrayAsync_spt
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DToArrayAsync_spt_(dst,wOffset,hOffset,src,spitch,width,height,myKind, &
        stream) &
        bind(c, name="cudaMemcpy2DToArrayAsync_ptsz")
#else
    function hipMemcpy2DToArrayAsync_spt_(dst,wOffset,hOffset,src,spitch,width,height,myKind, &
        stream) &
        bind(c, name="hipMemcpy2DToArrayAsync_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy2DToArrayAsync_spt_
      type(c_ptr),value :: dst
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      type(c_ptr),value :: src
      integer(c_size_t),value :: spitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipStreamQuery_spt
#ifdef USE_CUDA_NAMES
    function hipStreamQuery_spt_(stream) bind(c, name="cudaStreamQuery_ptsz")
#else
    function hipStreamQuery_spt_(stream) bind(c, name="hipStreamQuery_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamQuery_spt_
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipStreamSynchronize_spt
#ifdef USE_CUDA_NAMES
    function hipStreamSynchronize_spt_(stream) bind(c, name="cudaStreamSynchronize_ptsz")
#else
    function hipStreamSynchronize_spt_(stream) bind(c, name="hipStreamSynchronize_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamSynchronize_spt_
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipStreamGetPriority_spt
#ifdef USE_CUDA_NAMES
    function hipStreamGetPriority_spt_(stream,priority) bind(c, name="cudaStreamGetPriority_ptsz")
#else
    function hipStreamGetPriority_spt_(stream,priority) bind(c, name="hipStreamGetPriority_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetPriority_spt_
      type(c_ptr),value :: stream
      type(c_ptr),value :: priority
    end function
  end interface

  interface hipStreamWaitEvent_spt
#ifdef USE_CUDA_NAMES
    function hipStreamWaitEvent_spt_(stream,event,flags) bind(c, name="cudaStreamWaitEvent_ptsz")
#else
    function hipStreamWaitEvent_spt_(stream,event,flags) bind(c, name="hipStreamWaitEvent_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamWaitEvent_spt_
      type(c_ptr),value :: stream
      type(c_ptr),value :: event
      integer(c_int),value :: flags
    end function
  end interface

  interface hipStreamGetFlags_spt
#ifdef USE_CUDA_NAMES
    function hipStreamGetFlags_spt_(stream,flags) bind(c, name="cudaStreamGetFlags_ptsz")
#else
    function hipStreamGetFlags_spt_(stream,flags) bind(c, name="hipStreamGetFlags_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetFlags_spt_
      type(c_ptr),value :: stream
      type(c_ptr),value :: flags
    end function
  end interface

  interface hipStreamAddCallback_spt
#ifdef USE_CUDA_NAMES
    function hipStreamAddCallback_spt_(stream,callback,userData,flags) &
        bind(c, name="cudaStreamAddCallback_ptsz")
#else
    function hipStreamAddCallback_spt_(stream,callback,userData,flags) &
        bind(c, name="hipStreamAddCallback_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamAddCallback_spt_
      type(c_ptr),value :: stream
      type(c_funptr),value :: callback
      type(c_ptr),value :: userData
      integer(c_int),value :: flags
    end function
  end interface

  interface hipEventRecord_spt
#ifdef USE_CUDA_NAMES
    function hipEventRecord_spt_(event,stream) bind(c, name="cudaEventRecord_ptsz")
#else
    function hipEventRecord_spt_(event,stream) bind(c, name="hipEventRecord_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipEventRecord_spt_
      type(c_ptr),value :: event
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipLaunchCooperativeKernel_spt
#ifdef USE_CUDA_NAMES
    function hipLaunchCooperativeKernel_spt_(f,gridDim,blockDim,kernelParams,sharedMemBytes, &
        hStream) &
        bind(c, name="cudaLaunchCooperativeKernel_ptsz")
#else
    function hipLaunchCooperativeKernel_spt_(f,gridDim,blockDim,kernelParams,sharedMemBytes, &
        hStream) &
        bind(c, name="hipLaunchCooperativeKernel_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchCooperativeKernel_spt_
      type(c_ptr),value :: f
      type(c_ptr),value :: gridDim
      type(c_ptr),value :: blockDim
      type(c_ptr) :: kernelParams
      integer(c_int32_t),value :: sharedMemBytes
      type(c_ptr),value :: hStream
    end function
  end interface

  interface hipLaunchKernel_spt
#ifdef USE_CUDA_NAMES
    function hipLaunchKernel_spt_(function_address,numBlocks,dimBlocks,args,sharedMemBytes,stream) &
        bind(c, name="cudaLaunchKernel_ptsz")
#else
    function hipLaunchKernel_spt_(function_address,numBlocks,dimBlocks,args,sharedMemBytes,stream) &
        bind(c, name="hipLaunchKernel_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchKernel_spt_
      type(c_ptr),value :: function_address
      type(c_ptr),value :: numBlocks
      type(c_ptr),value :: dimBlocks
      type(c_ptr) :: args
      integer(c_size_t),value :: sharedMemBytes
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipGraphLaunch_spt
#ifdef USE_CUDA_NAMES
    function hipGraphLaunch_spt_(graphExec,stream) bind(c, name="cudaGraphLaunch_ptsz")
#else
    function hipGraphLaunch_spt_(graphExec,stream) bind(c, name="hipGraphLaunch_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGraphLaunch_spt_
      type(c_ptr),value :: graphExec
      type(c_ptr),value :: stream
    end function
  end interface

  interface hipStreamBeginCapture_spt
#ifdef USE_CUDA_NAMES
    function hipStreamBeginCapture_spt_(stream,mode) bind(c, name="cudaStreamBeginCapture_ptsz")
#else
    function hipStreamBeginCapture_spt_(stream,mode) bind(c, name="hipStreamBeginCapture_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamBeginCapture_spt_
      type(c_ptr),value :: stream
      integer(kind(hipStreamCaptureModeGlobal)),value :: mode
    end function
  end interface

  interface hipStreamEndCapture_spt
#ifdef USE_CUDA_NAMES
    function hipStreamEndCapture_spt_(stream,pGraph) bind(c, name="cudaStreamEndCapture_ptsz")
#else
    function hipStreamEndCapture_spt_(stream,pGraph) bind(c, name="hipStreamEndCapture_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamEndCapture_spt_
      type(c_ptr),value :: stream
      type(c_ptr) :: pGraph
    end function
  end interface

  interface hipStreamIsCapturing_spt
#ifdef USE_CUDA_NAMES
    function hipStreamIsCapturing_spt_(stream,pCaptureStatus) &
        bind(c, name="cudaStreamIsCapturing_ptsz")
#else
    function hipStreamIsCapturing_spt_(stream,pCaptureStatus) &
        bind(c, name="hipStreamIsCapturing_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_spt_
      type(c_ptr),value :: stream
      type(c_ptr),value :: pCaptureStatus
    end function
  end interface

  interface hipStreamGetCaptureInfo_spt
#ifdef USE_CUDA_NAMES
    function hipStreamGetCaptureInfo_spt_(stream,pCaptureStatus,pId) &
        bind(c, name="cudaStreamGetCaptureInfo_ptsz")
#else
    function hipStreamGetCaptureInfo_spt_(stream,pCaptureStatus,pId) &
        bind(c, name="hipStreamGetCaptureInfo_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_spt_
      type(c_ptr),value :: stream
      type(c_ptr),value :: pCaptureStatus
      type(c_ptr),value :: pId
    end function
  end interface

  interface hipStreamGetCaptureInfo_v2_spt
#ifdef USE_CUDA_NAMES
    function hipStreamGetCaptureInfo_v2_spt_(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out) &
        bind(c, name="cuStreamGetCaptureInfo_v2_ptsz")
#else
    function hipStreamGetCaptureInfo_v2_spt_(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out) &
        bind(c, name="hipStreamGetCaptureInfo_v2_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_spt_
      type(c_ptr),value :: stream
      type(c_ptr),value :: captureStatus_out
      type(c_ptr),value :: id_out
      type(c_ptr) :: graph_out
      type(c_ptr) :: dependencies_out
      type(c_ptr),value :: numDependencies_out
    end function
  end interface

  interface hipLaunchHostFunc_spt
#ifdef USE_CUDA_NAMES
    function hipLaunchHostFunc_spt_(stream,fn,userData) bind(c, name="cudaLaunchHostFunc_ptsz")
#else
    function hipLaunchHostFunc_spt_(stream,fn,userData) bind(c, name="hipLaunchHostFunc_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipLaunchHostFunc_spt_
      type(c_ptr),value :: stream
      type(c_funptr),value :: fn
      type(c_ptr),value :: userData
    end function
  end interface

  interface hipGetDriverEntryPoint_spt
#ifdef USE_CUDA_NAMES
    function hipGetDriverEntryPoint_spt_(symbol,funcPtr,flags,status) &
        bind(c, name="cudaGetDriverEntryPoint_ptsz")
#else
    function hipGetDriverEntryPoint_spt_(symbol,funcPtr,flags,status) &
        bind(c, name="hipGetDriverEntryPoint_spt")
#endif
      use iso_c_binding
      use hipfort_enums
      implicit none
      integer(kind(hipSuccess)) :: hipGetDriverEntryPoint_spt_
      type(c_ptr),value :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t),value :: flags
      type(c_ptr),value :: status
    end function
  end interface

  !>  @brief Device which matches hipDeviceProp_t is returned
  !>
  !>  @param [out] device Pointer of the device
  !>  @param [in]  prop Pointer of the properties
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidValue`
  interface hipChooseDevice
#ifdef USE_CUDA_NAMES
    function hipChooseDevice_(device,prop) bind(c, name="cudaChooseDevice")
#else
    function hipChooseDevice_(device,prop) bind(c, name="hipChooseDeviceR0600")
#endif
      use iso_c_binding
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(kind(hipSuccess)) :: hipChooseDevice_
      type(c_ptr),value :: device
      type(hipDeviceProp_t) :: prop
    end function
  end interface

end module hipfort
