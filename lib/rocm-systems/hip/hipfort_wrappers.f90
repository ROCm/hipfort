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

! Typed-handle wrappers, included into the module contains section.

    function hipDeviceGetName_cstr(name, len_, device) result(DeviceGetName)
      use, intrinsic :: iso_c_binding
      implicit none
      character(len=*), intent(out) :: name
      integer(c_int), value :: len_
      integer(c_int), value :: device
      integer(kind(hipSuccess)) :: DeviceGetName
      character(len=len(name)+1, kind=c_char), target :: name__c
      integer :: i__c
      name__c = repeat(c_null_char, len(name)+1)
      DeviceGetName = hipDeviceGetName_(c_loc(name__c), len_, device)
      name = ""
      do i__c = 1, len(name)
        if (name__c(i__c:i__c) == c_null_char) exit
        name(i__c:i__c) = name__c(i__c:i__c)
      end do
    end function hipDeviceGetName_cstr

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipDeviceGetP2PAttribute_assumed_rank(myValue,attr,srcDevice,dstDevice)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetP2PAttribute_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: myValue
      integer(kind(hipDevP2PAttrPerformanceRank)) :: attr
      integer(c_int) :: srcDevice
      integer(c_int) :: dstDevice
      !
      hipDeviceGetP2PAttribute_assumed_rank = hipDeviceGetP2PAttribute_(c_loc(myValue),attr, &
        srcDevice,dstDevice)
    end function

#else
    function hipDeviceGetP2PAttribute_rank_0(myValue,attr,srcDevice,dstDevice)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetP2PAttribute_rank_0
      integer(c_int),target :: myValue
      integer(kind(hipDevP2PAttrPerformanceRank)) :: attr
      integer(c_int) :: srcDevice
      integer(c_int) :: dstDevice
      !
      hipDeviceGetP2PAttribute_rank_0 = hipDeviceGetP2PAttribute_(c_loc(myValue),attr,srcDevice, &
        dstDevice)
    end function

    function hipDeviceGetP2PAttribute_rank_1(myValue,attr,srcDevice,dstDevice)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetP2PAttribute_rank_1
      integer(c_int),target,dimension(:) :: myValue
      integer(kind(hipDevP2PAttrPerformanceRank)) :: attr
      integer(c_int) :: srcDevice
      integer(c_int) :: dstDevice
      !
      hipDeviceGetP2PAttribute_rank_1 = hipDeviceGetP2PAttribute_(c_loc(myValue),attr,srcDevice, &
        dstDevice)
    end function

#endif
    function hipDeviceGetPCIBusId_cstr(pciBusId, len_, device) result(DeviceGetPCIBusId)
      use, intrinsic :: iso_c_binding
      implicit none
      character(len=*), intent(out) :: pciBusId
      integer(c_int), value :: len_
      integer(c_int), value :: device
      integer(kind(hipSuccess)) :: DeviceGetPCIBusId
      character(len=len(pciBusId)+1, kind=c_char), target :: pciBusId__c
      integer :: i__c
      pciBusId__c = repeat(c_null_char, len(pciBusId)+1)
      DeviceGetPCIBusId = hipDeviceGetPCIBusId_(c_loc(pciBusId__c), len_, device)
      pciBusId = ""
      do i__c = 1, len(pciBusId)
        if (pciBusId__c(i__c:i__c) == c_null_char) exit
        pciBusId(i__c:i__c) = pciBusId__c(i__c:i__c)
      end do
    end function hipDeviceGetPCIBusId_cstr

    function hipDeviceGetByPCIBusId_cstr(device, pciBusId) result(DeviceGetByPCIBusId)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int) :: device
      character(len=*), intent(in) :: pciBusId
      integer(kind(hipSuccess)) :: DeviceGetByPCIBusId
      character(len=len_trim(pciBusId)+1, kind=c_char), target :: pciBusId__c
      pciBusId__c = trim(pciBusId)//c_null_char
      DeviceGetByPCIBusId = hipDeviceGetByPCIBusId_(device, c_loc(pciBusId__c))
    end function hipDeviceGetByPCIBusId_cstr

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipSetValidDevices_assumed_rank(device_arr,len)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipSetValidDevices_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: device_arr
      integer(c_int) :: len
      !
      hipSetValidDevices_assumed_rank = hipSetValidDevices_(c_loc(device_arr),len)
    end function

#else
    function hipSetValidDevices_rank_0(device_arr,len)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipSetValidDevices_rank_0
      integer(c_int),target :: device_arr
      integer(c_int) :: len
      !
      hipSetValidDevices_rank_0 = hipSetValidDevices_(c_loc(device_arr),len)
    end function

    function hipSetValidDevices_rank_1(device_arr,len)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipSetValidDevices_rank_1
      integer(c_int),target,dimension(:) :: device_arr
      integer(c_int) :: len
      !
      hipSetValidDevices_rank_1 = hipSetValidDevices_(c_loc(device_arr),len)
    end function

#endif
    function hipDeviceGetDefaultMemPool_typed(mem_pool, device) result(DeviceGetDefaultMemPool)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t) :: mem_pool
      integer(c_int), value :: device
      integer(kind(hipSuccess)) :: DeviceGetDefaultMemPool
      DeviceGetDefaultMemPool = hipDeviceGetDefaultMemPool_(mem_pool%ptr, device)
    end function hipDeviceGetDefaultMemPool_typed

    function hipDeviceSetMemPool_typed(device, mem_pool) result(DeviceSetMemPool)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int), value :: device
      type(hipMemPool_t), value :: mem_pool
      integer(kind(hipSuccess)) :: DeviceSetMemPool
      DeviceSetMemPool = hipDeviceSetMemPool_(device, mem_pool%ptr)
    end function hipDeviceSetMemPool_typed

    function hipDeviceGetMemPool_typed(mem_pool, device) result(DeviceGetMemPool)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t) :: mem_pool
      integer(c_int), value :: device
      integer(kind(hipSuccess)) :: DeviceGetMemPool
      DeviceGetMemPool = hipDeviceGetMemPool_(mem_pool%ptr, device)
    end function hipDeviceGetMemPool_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipDeviceGetTexture1DLinearMaxWidth_assumed_rank(max_width,desc,device)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetTexture1DLinearMaxWidth_assumed_rank
      integer(c_size_t),target,contiguous,dimension(..) :: max_width
      type(hipChannelFormatDesc) :: desc
      integer(c_int) :: device
      !
      hipDeviceGetTexture1DLinearMaxWidth_assumed_rank = hipDeviceGetTexture1DLinearMaxWidth_( &
        c_loc(max_width),desc,device)
    end function

#else
    function hipDeviceGetTexture1DLinearMaxWidth_rank_0(max_width,desc,device)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetTexture1DLinearMaxWidth_rank_0
      integer(c_size_t),target :: max_width
      type(hipChannelFormatDesc) :: desc
      integer(c_int) :: device
      !
      hipDeviceGetTexture1DLinearMaxWidth_rank_0 = hipDeviceGetTexture1DLinearMaxWidth_(c_loc( &
        max_width),desc,device)
    end function

    function hipDeviceGetTexture1DLinearMaxWidth_rank_1(max_width,desc,device)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetTexture1DLinearMaxWidth_rank_1
      integer(c_size_t),target,dimension(:) :: max_width
      type(hipChannelFormatDesc) :: desc
      integer(c_int) :: device
      !
      hipDeviceGetTexture1DLinearMaxWidth_rank_1 = hipDeviceGetTexture1DLinearMaxWidth_(c_loc( &
        max_width),desc,device)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipDeviceGetCacheConfig_assumed_rank(cacheConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetCacheConfig_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: cacheConfig
      !
      hipDeviceGetCacheConfig_assumed_rank = hipDeviceGetCacheConfig_(c_loc(cacheConfig))
    end function

#else
    function hipDeviceGetCacheConfig_rank_0(cacheConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetCacheConfig_rank_0
      integer(c_int),target :: cacheConfig
      !
      hipDeviceGetCacheConfig_rank_0 = hipDeviceGetCacheConfig_(c_loc(cacheConfig))
    end function

    function hipDeviceGetCacheConfig_rank_1(cacheConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetCacheConfig_rank_1
      integer(c_int),target,dimension(:) :: cacheConfig
      !
      hipDeviceGetCacheConfig_rank_1 = hipDeviceGetCacheConfig_(c_loc(cacheConfig))
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipDeviceGetSharedMemConfig_assumed_rank(pConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetSharedMemConfig_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: pConfig
      !
      hipDeviceGetSharedMemConfig_assumed_rank = hipDeviceGetSharedMemConfig_(c_loc(pConfig))
    end function

#else
    function hipDeviceGetSharedMemConfig_rank_0(pConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetSharedMemConfig_rank_0
      integer(c_int),target :: pConfig
      !
      hipDeviceGetSharedMemConfig_rank_0 = hipDeviceGetSharedMemConfig_(c_loc(pConfig))
    end function

    function hipDeviceGetSharedMemConfig_rank_1(pConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDeviceGetSharedMemConfig_rank_1
      integer(c_int),target,dimension(:) :: pConfig
      !
      hipDeviceGetSharedMemConfig_rank_1 = hipDeviceGetSharedMemConfig_(c_loc(pConfig))
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipChooseDeviceR0600_assumed_rank(device,prop)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipChooseDeviceR0600_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: device
      type(hipDeviceProp_t) :: prop
      !
      hipChooseDeviceR0600_assumed_rank = hipChooseDeviceR0600_(c_loc(device),prop)
    end function

#else
    function hipChooseDeviceR0600_rank_0(device,prop)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipChooseDeviceR0600_rank_0
      integer(c_int),target :: device
      type(hipDeviceProp_t) :: prop
      !
      hipChooseDeviceR0600_rank_0 = hipChooseDeviceR0600_(c_loc(device),prop)
    end function

    function hipChooseDeviceR0600_rank_1(device,prop)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipChooseDeviceR0600_rank_1
      integer(c_int),target,dimension(:) :: device
      type(hipDeviceProp_t) :: prop
      !
      hipChooseDeviceR0600_rank_1 = hipChooseDeviceR0600_(c_loc(device),prop)
    end function

#endif
    function hipIpcGetEventHandle_typed(handle, event) result(IpcGetEventHandle)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipIpcEventHandle_t) :: handle
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: IpcGetEventHandle
      IpcGetEventHandle = hipIpcGetEventHandle_(handle, event%ptr)
    end function hipIpcGetEventHandle_typed

    function hipIpcOpenEventHandle_typed(event, handle) result(IpcOpenEventHandle)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t) :: event
      type(hipIpcEventHandle_t), value :: handle
      integer(kind(hipSuccess)) :: IpcOpenEventHandle
      IpcOpenEventHandle = hipIpcOpenEventHandle_(event%ptr, handle)
    end function hipIpcOpenEventHandle_typed

    function hipKernelGetFunction_typed(pFunc, kernel) result(KernelGetFunction)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipFunction_t) :: pFunc
      type(c_ptr), value :: kernel
      integer(kind(hipSuccess)) :: KernelGetFunction
      KernelGetFunction = hipKernelGetFunction_(pFunc%ptr, kernel)
    end function hipKernelGetFunction_typed

    function hipStreamCreate_typed(stream) result(StreamCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t) :: stream
      integer(kind(hipSuccess)) :: StreamCreate
      StreamCreate = hipStreamCreate_(stream%ptr)
    end function hipStreamCreate_typed

    function hipStreamCreateWithFlags_typed(stream, flags) result(StreamCreateWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t) :: stream
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: StreamCreateWithFlags
      StreamCreateWithFlags = hipStreamCreateWithFlags_(stream%ptr, flags)
    end function hipStreamCreateWithFlags_typed

    function hipStreamCreateWithPriority_typed(stream, flags, &
        priority) result(StreamCreateWithPriority)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t) :: stream
      integer(c_int), value :: flags
      integer(c_int), value :: priority
      integer(kind(hipSuccess)) :: StreamCreateWithPriority
      StreamCreateWithPriority = hipStreamCreateWithPriority_(stream%ptr, flags, priority)
    end function hipStreamCreateWithPriority_typed

    function hipStreamDestroy_typed(stream) result(StreamDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: StreamDestroy
      StreamDestroy = hipStreamDestroy_(stream%ptr)
    end function hipStreamDestroy_typed

    function hipStreamQuery_typed(stream) result(StreamQuery)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: StreamQuery
      StreamQuery = hipStreamQuery_(stream%ptr)
    end function hipStreamQuery_typed

    function hipStreamSynchronize_typed(stream) result(StreamSynchronize)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: StreamSynchronize
      StreamSynchronize = hipStreamSynchronize_(stream%ptr)
    end function hipStreamSynchronize_typed

    function hipStreamWaitEvent_typed(stream, event, flags) result(StreamWaitEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(hipEvent_t), value :: event
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: StreamWaitEvent
      StreamWaitEvent = hipStreamWaitEvent_(stream%ptr, event%ptr, flags)
    end function hipStreamWaitEvent_typed

    function hipStreamGetFlags_typed(stream, flags) result(StreamGetFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int) :: flags
      integer(kind(hipSuccess)) :: StreamGetFlags
      StreamGetFlags = hipStreamGetFlags_(stream%ptr, flags)
    end function hipStreamGetFlags_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipStreamGetId_assumed_rank(stream,streamId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetId_assumed_rank
      type(hipStream_t) :: stream
      integer(c_int64_t),target,contiguous,dimension(..) :: streamId
      !
      hipStreamGetId_assumed_rank = hipStreamGetId_(stream%ptr,c_loc(streamId))
    end function

    function hipStreamGetId_assumed_rank_cptr(stream,streamId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetId_assumed_rank_cptr
      type(c_ptr) :: stream
      integer(c_int64_t),target,contiguous,dimension(..) :: streamId
      !
      hipStreamGetId_assumed_rank_cptr = hipStreamGetId_(stream,c_loc(streamId))
    end function

#else
    function hipStreamGetId_rank_0(stream,streamId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetId_rank_0
      type(hipStream_t) :: stream
      integer(c_int64_t),target :: streamId
      !
      hipStreamGetId_rank_0 = hipStreamGetId_(stream%ptr,c_loc(streamId))
    end function

    function hipStreamGetId_rank_0_cptr(stream,streamId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetId_rank_0_cptr
      type(c_ptr) :: stream
      integer(c_int64_t),target :: streamId
      !
      hipStreamGetId_rank_0_cptr = hipStreamGetId_(stream,c_loc(streamId))
    end function

    function hipStreamGetId_rank_1(stream,streamId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetId_rank_1
      type(hipStream_t) :: stream
      integer(c_int64_t),target,dimension(:) :: streamId
      !
      hipStreamGetId_rank_1 = hipStreamGetId_(stream%ptr,c_loc(streamId))
    end function

    function hipStreamGetId_rank_1_cptr(stream,streamId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetId_rank_1_cptr
      type(c_ptr) :: stream
      integer(c_int64_t),target,dimension(:) :: streamId
      !
      hipStreamGetId_rank_1_cptr = hipStreamGetId_(stream,c_loc(streamId))
    end function

#endif
    function hipStreamGetId_typed(stream, streamId) result(StreamGetId)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: streamId
      integer(kind(hipSuccess)) :: StreamGetId
      StreamGetId = hipStreamGetId_(stream%ptr, streamId)
    end function hipStreamGetId_typed

    function hipStreamGetPriority_typed(stream, priority) result(StreamGetPriority)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int) :: priority
      integer(kind(hipSuccess)) :: StreamGetPriority
      StreamGetPriority = hipStreamGetPriority_(stream%ptr, priority)
    end function hipStreamGetPriority_typed

    function hipStreamGetDevice_typed(stream, device) result(StreamGetDevice)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int) :: device
      integer(kind(hipSuccess)) :: StreamGetDevice
      StreamGetDevice = hipStreamGetDevice_(stream%ptr, device)
    end function hipStreamGetDevice_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipExtStreamCreateWithCUMask_assumed_rank(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamCreateWithCUMask_assumed_rank
      type(hipStream_t) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target,contiguous,dimension(..) :: cuMask
      !
      hipExtStreamCreateWithCUMask_assumed_rank = hipExtStreamCreateWithCUMask_(stream%ptr, &
        cuMaskSize,c_loc(cuMask))
    end function

    function hipExtStreamCreateWithCUMask_assumed_rank_cptr(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamCreateWithCUMask_assumed_rank_cptr
      type(c_ptr) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target,contiguous,dimension(..) :: cuMask
      !
      hipExtStreamCreateWithCUMask_assumed_rank_cptr = hipExtStreamCreateWithCUMask_(stream, &
        cuMaskSize,c_loc(cuMask))
    end function

#else
    function hipExtStreamCreateWithCUMask_rank_0(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamCreateWithCUMask_rank_0
      type(hipStream_t) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target :: cuMask
      !
      hipExtStreamCreateWithCUMask_rank_0 = hipExtStreamCreateWithCUMask_(stream%ptr,cuMaskSize, &
        c_loc(cuMask))
    end function

    function hipExtStreamCreateWithCUMask_rank_0_cptr(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamCreateWithCUMask_rank_0_cptr
      type(c_ptr) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target :: cuMask
      !
      hipExtStreamCreateWithCUMask_rank_0_cptr = hipExtStreamCreateWithCUMask_(stream,cuMaskSize, &
        c_loc(cuMask))
    end function

    function hipExtStreamCreateWithCUMask_rank_1(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamCreateWithCUMask_rank_1
      type(hipStream_t) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target,dimension(:) :: cuMask
      !
      hipExtStreamCreateWithCUMask_rank_1 = hipExtStreamCreateWithCUMask_(stream%ptr,cuMaskSize, &
        c_loc(cuMask))
    end function

    function hipExtStreamCreateWithCUMask_rank_1_cptr(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamCreateWithCUMask_rank_1_cptr
      type(c_ptr) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target,dimension(:) :: cuMask
      !
      hipExtStreamCreateWithCUMask_rank_1_cptr = hipExtStreamCreateWithCUMask_(stream,cuMaskSize, &
        c_loc(cuMask))
    end function

#endif
    function hipExtStreamCreateWithCUMask_typed(stream, cuMaskSize, &
        cuMask) result(ExtStreamCreateWithCUMask)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t) :: stream
      integer(c_int32_t), value :: cuMaskSize
      type(c_ptr), value :: cuMask
      integer(kind(hipSuccess)) :: ExtStreamCreateWithCUMask
      ExtStreamCreateWithCUMask = hipExtStreamCreateWithCUMask_(stream%ptr, cuMaskSize, cuMask)
    end function hipExtStreamCreateWithCUMask_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipExtStreamGetCUMask_assumed_rank(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamGetCUMask_assumed_rank
      type(hipStream_t) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target,contiguous,dimension(..) :: cuMask
      !
      hipExtStreamGetCUMask_assumed_rank = hipExtStreamGetCUMask_(stream%ptr,cuMaskSize, &
        c_loc(cuMask))
    end function

    function hipExtStreamGetCUMask_assumed_rank_cptr(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamGetCUMask_assumed_rank_cptr
      type(c_ptr) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target,contiguous,dimension(..) :: cuMask
      !
      hipExtStreamGetCUMask_assumed_rank_cptr = hipExtStreamGetCUMask_(stream,cuMaskSize, &
        c_loc(cuMask))
    end function

#else
    function hipExtStreamGetCUMask_rank_0(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamGetCUMask_rank_0
      type(hipStream_t) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target :: cuMask
      !
      hipExtStreamGetCUMask_rank_0 = hipExtStreamGetCUMask_(stream%ptr,cuMaskSize,c_loc(cuMask))
    end function

    function hipExtStreamGetCUMask_rank_0_cptr(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamGetCUMask_rank_0_cptr
      type(c_ptr) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target :: cuMask
      !
      hipExtStreamGetCUMask_rank_0_cptr = hipExtStreamGetCUMask_(stream,cuMaskSize,c_loc(cuMask))
    end function

    function hipExtStreamGetCUMask_rank_1(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamGetCUMask_rank_1
      type(hipStream_t) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target,dimension(:) :: cuMask
      !
      hipExtStreamGetCUMask_rank_1 = hipExtStreamGetCUMask_(stream%ptr,cuMaskSize,c_loc(cuMask))
    end function

    function hipExtStreamGetCUMask_rank_1_cptr(stream,cuMaskSize,cuMask)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExtStreamGetCUMask_rank_1_cptr
      type(c_ptr) :: stream
      integer(c_int32_t) :: cuMaskSize
      integer(c_int32_t),target,dimension(:) :: cuMask
      !
      hipExtStreamGetCUMask_rank_1_cptr = hipExtStreamGetCUMask_(stream,cuMaskSize,c_loc(cuMask))
    end function

#endif
    function hipExtStreamGetCUMask_typed(stream, cuMaskSize, cuMask) result(ExtStreamGetCUMask)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int32_t), value :: cuMaskSize
      type(c_ptr), value :: cuMask
      integer(kind(hipSuccess)) :: ExtStreamGetCUMask
      ExtStreamGetCUMask = hipExtStreamGetCUMask_(stream%ptr, cuMaskSize, cuMask)
    end function hipExtStreamGetCUMask_typed

    function hipStreamAddCallback_typed(stream, callback, userData, flags) result(StreamAddCallback)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_funptr), value :: callback
      type(c_ptr), value :: userData
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: StreamAddCallback
      StreamAddCallback = hipStreamAddCallback_(stream%ptr, callback, userData, flags)
    end function hipStreamAddCallback_typed

    function hipStreamSetAttribute_typed(stream, attr, myValue) result(StreamSetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(kind(hipLaunchAttributeIgnore)), value :: attr
      type(c_ptr), value :: myValue
      integer(kind(hipSuccess)) :: StreamSetAttribute
      StreamSetAttribute = hipStreamSetAttribute_(stream%ptr, attr, myValue)
    end function hipStreamSetAttribute_typed

    function hipStreamGetAttribute_typed(stream, attr, value_out) result(StreamGetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(kind(hipLaunchAttributeIgnore)), value :: attr
      type(c_ptr), value :: value_out
      integer(kind(hipSuccess)) :: StreamGetAttribute
      StreamGetAttribute = hipStreamGetAttribute_(stream%ptr, attr, value_out)
    end function hipStreamGetAttribute_typed

    function hipStreamCopyAttributes_typed(dst, src) result(StreamCopyAttributes)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: dst
      type(hipStream_t), value :: src
      integer(kind(hipSuccess)) :: StreamCopyAttributes
      StreamCopyAttributes = hipStreamCopyAttributes_(dst%ptr, src%ptr)
    end function hipStreamCopyAttributes_typed

    function hipStreamWaitValue32_typed(stream, ptr, myValue, flags, mask) result(StreamWaitValue32)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: ptr
      integer(c_int32_t), value :: myValue
      integer(c_int), value :: flags
      integer(c_int32_t), value :: mask
      integer(kind(hipSuccess)) :: StreamWaitValue32
      StreamWaitValue32 = hipStreamWaitValue32_(stream%ptr, ptr, myValue, flags, mask)
    end function hipStreamWaitValue32_typed

    function hipStreamWaitValue64_typed(stream, ptr, myValue, flags, mask) result(StreamWaitValue64)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: ptr
      integer(c_int64_t), value :: myValue
      integer(c_int), value :: flags
      integer(c_int64_t), value :: mask
      integer(kind(hipSuccess)) :: StreamWaitValue64
      StreamWaitValue64 = hipStreamWaitValue64_(stream%ptr, ptr, myValue, flags, mask)
    end function hipStreamWaitValue64_typed

    function hipStreamWriteValue32_typed(stream, ptr, myValue, flags) result(StreamWriteValue32)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: ptr
      integer(c_int32_t), value :: myValue
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: StreamWriteValue32
      StreamWriteValue32 = hipStreamWriteValue32_(stream%ptr, ptr, myValue, flags)
    end function hipStreamWriteValue32_typed

    function hipStreamWriteValue64_typed(stream, ptr, myValue, flags) result(StreamWriteValue64)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: ptr
      integer(c_int64_t), value :: myValue
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: StreamWriteValue64
      StreamWriteValue64 = hipStreamWriteValue64_(stream%ptr, ptr, myValue, flags)
    end function hipStreamWriteValue64_typed

    function hipStreamBatchMemOp_typed(stream, count, paramArray, flags) result(StreamBatchMemOp)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int), value :: count
      type(c_ptr), value :: paramArray
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: StreamBatchMemOp
      StreamBatchMemOp = hipStreamBatchMemOp_(stream%ptr, count, paramArray, flags)
    end function hipStreamBatchMemOp_typed

    function hipGraphAddBatchMemOpNode_typed(phGraphNode, hGraph, dependencies, numDependencies, &
        nodeParams) result(GraphAddBatchMemOpNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: phGraphNode
      type(hipGraph_t), value :: hGraph
      type(hipGraphNode_t) :: dependencies
      integer(c_size_t), value :: numDependencies
      type(hipBatchMemOpNodeParams) :: nodeParams
      integer(kind(hipSuccess)) :: GraphAddBatchMemOpNode
      GraphAddBatchMemOpNode = hipGraphAddBatchMemOpNode_(phGraphNode%ptr, hGraph%ptr, &
        dependencies%ptr, numDependencies, nodeParams)
    end function hipGraphAddBatchMemOpNode_typed

    function hipGraphBatchMemOpNodeGetParams_typed(hNode, &
        nodeParams_out) result(GraphBatchMemOpNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipBatchMemOpNodeParams) :: nodeParams_out
      integer(kind(hipSuccess)) :: GraphBatchMemOpNodeGetParams
      GraphBatchMemOpNodeGetParams = hipGraphBatchMemOpNodeGetParams_(hNode%ptr, nodeParams_out)
    end function hipGraphBatchMemOpNodeGetParams_typed

    function hipGraphBatchMemOpNodeSetParams_typed(hNode, &
        nodeParams) result(GraphBatchMemOpNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipBatchMemOpNodeParams) :: nodeParams
      integer(kind(hipSuccess)) :: GraphBatchMemOpNodeSetParams
      GraphBatchMemOpNodeSetParams = hipGraphBatchMemOpNodeSetParams_(hNode%ptr, nodeParams)
    end function hipGraphBatchMemOpNodeSetParams_typed

    function hipGraphExecBatchMemOpNodeSetParams_typed(hGraphExec, hNode, &
        nodeParams) result(GraphExecBatchMemOpNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(hipBatchMemOpNodeParams) :: nodeParams
      integer(kind(hipSuccess)) :: GraphExecBatchMemOpNodeSetParams
      GraphExecBatchMemOpNodeSetParams = hipGraphExecBatchMemOpNodeSetParams_(hGraphExec%ptr, &
        hNode%ptr, nodeParams)
    end function hipGraphExecBatchMemOpNodeSetParams_typed

    function hipEventCreateWithFlags_typed(event, flags) result(EventCreateWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t) :: event
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: EventCreateWithFlags
      EventCreateWithFlags = hipEventCreateWithFlags_(event%ptr, flags)
    end function hipEventCreateWithFlags_typed

    function hipEventCreate_typed(event) result(EventCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t) :: event
      integer(kind(hipSuccess)) :: EventCreate
      EventCreate = hipEventCreate_(event%ptr)
    end function hipEventCreate_typed

    function hipEventRecordWithFlags_typed(event, stream, flags) result(EventRecordWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      type(hipStream_t), value :: stream
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: EventRecordWithFlags
      EventRecordWithFlags = hipEventRecordWithFlags_(event%ptr, stream%ptr, flags)
    end function hipEventRecordWithFlags_typed

    function hipEventRecord_typed(event, stream) result(EventRecord)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: EventRecord
      EventRecord = hipEventRecord_(event%ptr, stream%ptr)
    end function hipEventRecord_typed

    function hipEventDestroy_typed(event) result(EventDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: EventDestroy
      EventDestroy = hipEventDestroy_(event%ptr)
    end function hipEventDestroy_typed

    function hipEventSynchronize_typed(event) result(EventSynchronize)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: EventSynchronize
      EventSynchronize = hipEventSynchronize_(event%ptr)
    end function hipEventSynchronize_typed

    function hipEventElapsedTime_typed(ms, start, myStop) result(EventElapsedTime)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      real(c_float) :: ms
      type(hipEvent_t), value :: start
      type(hipEvent_t), value :: myStop
      integer(kind(hipSuccess)) :: EventElapsedTime
      EventElapsedTime = hipEventElapsedTime_(ms, start%ptr, myStop%ptr)
    end function hipEventElapsedTime_typed

    function hipEventQuery_typed(event) result(EventQuery)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: EventQuery
      EventQuery = hipEventQuery_(event%ptr)
    end function hipEventQuery_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipDrvPointerGetAttributes_assumed_rank(numAttributes,attributes,myData,ptr)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvPointerGetAttributes_assumed_rank
      integer(c_int) :: numAttributes
      integer(c_int),target,contiguous,dimension(..) :: attributes
      type(c_ptr) :: myData
      type(c_ptr) :: ptr
      !
      hipDrvPointerGetAttributes_assumed_rank = hipDrvPointerGetAttributes_(numAttributes, &
        c_loc(attributes),myData,ptr)
    end function

#else
    function hipDrvPointerGetAttributes_rank_0(numAttributes,attributes,myData,ptr)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvPointerGetAttributes_rank_0
      integer(c_int) :: numAttributes
      integer(c_int),target :: attributes
      type(c_ptr) :: myData
      type(c_ptr) :: ptr
      !
      hipDrvPointerGetAttributes_rank_0 = hipDrvPointerGetAttributes_(numAttributes, &
        c_loc(attributes),myData,ptr)
    end function

    function hipDrvPointerGetAttributes_rank_1(numAttributes,attributes,myData,ptr)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvPointerGetAttributes_rank_1
      integer(c_int) :: numAttributes
      integer(c_int),target,dimension(:) :: attributes
      type(c_ptr) :: myData
      type(c_ptr) :: ptr
      !
      hipDrvPointerGetAttributes_rank_1 = hipDrvPointerGetAttributes_(numAttributes, &
        c_loc(attributes),myData,ptr)
    end function

#endif
    function hipImportExternalSemaphore_typed(extSem_out, &
        semHandleDesc) result(ImportExternalSemaphore)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipExternalSemaphore_t) :: extSem_out
      type(hipExternalSemaphoreHandleDesc) :: semHandleDesc
      integer(kind(hipSuccess)) :: ImportExternalSemaphore
      ImportExternalSemaphore = hipImportExternalSemaphore_(extSem_out%ptr, semHandleDesc)
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
      integer(kind(hipSuccess)) :: SignalExternalSemaphoresAsync
      SignalExternalSemaphoresAsync = hipSignalExternalSemaphoresAsync_(extSemArray%ptr, &
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
      integer(kind(hipSuccess)) :: WaitExternalSemaphoresAsync
      WaitExternalSemaphoresAsync = hipWaitExternalSemaphoresAsync_(extSemArray%ptr, paramsArray, &
        numExtSems, stream%ptr)
    end function hipWaitExternalSemaphoresAsync_typed

    function hipDestroyExternalSemaphore_typed(extSem) result(DestroyExternalSemaphore)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipExternalSemaphore_t), value :: extSem
      integer(kind(hipSuccess)) :: DestroyExternalSemaphore
      DestroyExternalSemaphore = hipDestroyExternalSemaphore_(extSem%ptr)
    end function hipDestroyExternalSemaphore_typed

    function hipImportExternalMemory_typed(extMem_out, memHandleDesc) result(ImportExternalMemory)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipExternalMemory_t) :: extMem_out
      type(hipExternalMemoryHandleDesc) :: memHandleDesc
      integer(kind(hipSuccess)) :: ImportExternalMemory
      ImportExternalMemory = hipImportExternalMemory_(extMem_out%ptr, memHandleDesc)
    end function hipImportExternalMemory_typed

    function hipExternalMemoryGetMappedBuffer_typed(devPtr, extMem, &
        bufferDesc) result(ExternalMemoryGetMappedBuffer)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: devPtr
      type(hipExternalMemory_t), value :: extMem
      type(hipExternalMemoryBufferDesc) :: bufferDesc
      integer(kind(hipSuccess)) :: ExternalMemoryGetMappedBuffer
      ExternalMemoryGetMappedBuffer = hipExternalMemoryGetMappedBuffer_(devPtr, extMem%ptr, &
        bufferDesc)
    end function hipExternalMemoryGetMappedBuffer_typed

    function hipDestroyExternalMemory_typed(extMem) result(DestroyExternalMemory)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipExternalMemory_t), value :: extMem
      integer(kind(hipSuccess)) :: DestroyExternalMemory
      DestroyExternalMemory = hipDestroyExternalMemory_(extMem%ptr)
    end function hipDestroyExternalMemory_typed

    function hipExternalMemoryGetMappedMipmappedArray_typed(mipmap, extMem, &
        mipmapDesc) result(ExternalMemoryGetMappedMipmappedArray)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: mipmap
      type(hipExternalMemory_t), value :: extMem
      type(hipExternalMemoryMipmappedArrayDesc) :: mipmapDesc
      integer(kind(hipSuccess)) :: ExternalMemoryGetMappedMipmappedArray
      ExternalMemoryGetMappedMipmappedArray = hipExternalMemoryGetMappedMipmappedArray_(mipmap, &
        extMem%ptr, mipmapDesc)
    end function hipExternalMemoryGetMappedMipmappedArray_typed

    function hipMemPrefetchAsync_typed(dev_ptr, count, device, stream) result(MemPrefetchAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dev_ptr
      integer(c_size_t), value :: count
      integer(c_int), value :: device
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemPrefetchAsync
      MemPrefetchAsync = hipMemPrefetchAsync_(dev_ptr, count, device, stream%ptr)
    end function hipMemPrefetchAsync_typed

    function hipMemPrefetchAsync_v2_typed(dev_ptr, count, location, flags, &
        stream) result(MemPrefetchAsync_v2)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dev_ptr
      integer(c_size_t), value :: count
      type(hipMemLocation), value :: location
      integer(c_int), value :: flags
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemPrefetchAsync_v2
      MemPrefetchAsync_v2 = hipMemPrefetchAsync_v2_(dev_ptr, count, location, flags, stream%ptr)
    end function hipMemPrefetchAsync_v2_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipMemPrefetchBatchAsync_assumed_rank(dev_ptrs,sizes,count,prefetch_locs, &
        prefetch_loc_idxs,num_prefetch_locs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPrefetchBatchAsync_assumed_rank
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetch_locs
      integer(c_size_t),target,contiguous,dimension(..) :: prefetch_loc_idxs
      integer(c_size_t) :: num_prefetch_locs
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemPrefetchBatchAsync_assumed_rank = hipMemPrefetchBatchAsync_(dev_ptrs,c_loc(sizes), &
        count,prefetch_locs,c_loc(prefetch_loc_idxs),num_prefetch_locs,flags,stream%ptr)
    end function

    function hipMemPrefetchBatchAsync_assumed_rank_cptr(dev_ptrs,sizes,count,prefetch_locs, &
        prefetch_loc_idxs,num_prefetch_locs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPrefetchBatchAsync_assumed_rank_cptr
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetch_locs
      integer(c_size_t),target,contiguous,dimension(..) :: prefetch_loc_idxs
      integer(c_size_t) :: num_prefetch_locs
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemPrefetchBatchAsync_assumed_rank_cptr = hipMemPrefetchBatchAsync_(dev_ptrs, &
        c_loc(sizes),count,prefetch_locs,c_loc(prefetch_loc_idxs),num_prefetch_locs,flags,stream)
    end function

#else
    function hipMemPrefetchBatchAsync_rank_0(dev_ptrs,sizes,count,prefetch_locs,prefetch_loc_idxs, &
        num_prefetch_locs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPrefetchBatchAsync_rank_0
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetch_locs
      integer(c_size_t),target :: prefetch_loc_idxs
      integer(c_size_t) :: num_prefetch_locs
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemPrefetchBatchAsync_rank_0 = hipMemPrefetchBatchAsync_(dev_ptrs,c_loc(sizes),count, &
        prefetch_locs,c_loc(prefetch_loc_idxs),num_prefetch_locs,flags,stream%ptr)
    end function

    function hipMemPrefetchBatchAsync_rank_0_cptr(dev_ptrs,sizes,count,prefetch_locs, &
        prefetch_loc_idxs,num_prefetch_locs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPrefetchBatchAsync_rank_0_cptr
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetch_locs
      integer(c_size_t),target :: prefetch_loc_idxs
      integer(c_size_t) :: num_prefetch_locs
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemPrefetchBatchAsync_rank_0_cptr = hipMemPrefetchBatchAsync_(dev_ptrs,c_loc(sizes), &
        count,prefetch_locs,c_loc(prefetch_loc_idxs),num_prefetch_locs,flags,stream)
    end function

    function hipMemPrefetchBatchAsync_rank_1(dev_ptrs,sizes,count,prefetch_locs,prefetch_loc_idxs, &
        num_prefetch_locs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPrefetchBatchAsync_rank_1
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetch_locs
      integer(c_size_t),target,dimension(:) :: prefetch_loc_idxs
      integer(c_size_t) :: num_prefetch_locs
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemPrefetchBatchAsync_rank_1 = hipMemPrefetchBatchAsync_(dev_ptrs,c_loc(sizes),count, &
        prefetch_locs,c_loc(prefetch_loc_idxs),num_prefetch_locs,flags,stream%ptr)
    end function

    function hipMemPrefetchBatchAsync_rank_1_cptr(dev_ptrs,sizes,count,prefetch_locs, &
        prefetch_loc_idxs,num_prefetch_locs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPrefetchBatchAsync_rank_1_cptr
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetch_locs
      integer(c_size_t),target,dimension(:) :: prefetch_loc_idxs
      integer(c_size_t) :: num_prefetch_locs
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemPrefetchBatchAsync_rank_1_cptr = hipMemPrefetchBatchAsync_(dev_ptrs,c_loc(sizes), &
        count,prefetch_locs,c_loc(prefetch_loc_idxs),num_prefetch_locs,flags,stream)
    end function

#endif
    function hipMemPrefetchBatchAsync_typed(dev_ptrs, sizes, count, prefetch_locs, &
        prefetch_loc_idxs, num_prefetch_locs, flags, stream) result(MemPrefetchBatchAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dev_ptrs
      type(c_ptr), value :: sizes
      integer(c_size_t), value :: count
      type(hipMemLocation) :: prefetch_locs
      type(c_ptr), value :: prefetch_loc_idxs
      integer(c_size_t), value :: num_prefetch_locs
      integer(c_int64_t), value :: flags
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemPrefetchBatchAsync
      MemPrefetchBatchAsync = hipMemPrefetchBatchAsync_(dev_ptrs, sizes, count, prefetch_locs, &
        prefetch_loc_idxs, num_prefetch_locs, flags, stream%ptr)
    end function hipMemPrefetchBatchAsync_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipMemDiscardBatchAsync_assumed_rank(dev_ptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardBatchAsync_assumed_rank
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemDiscardBatchAsync_assumed_rank = hipMemDiscardBatchAsync_(dev_ptrs,c_loc(sizes),count, &
        flags,stream%ptr)
    end function

    function hipMemDiscardBatchAsync_assumed_rank_cptr(dev_ptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardBatchAsync_assumed_rank_cptr
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemDiscardBatchAsync_assumed_rank_cptr = hipMemDiscardBatchAsync_(dev_ptrs,c_loc(sizes), &
        count,flags,stream)
    end function

#else
    function hipMemDiscardBatchAsync_rank_0(dev_ptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardBatchAsync_rank_0
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemDiscardBatchAsync_rank_0 = hipMemDiscardBatchAsync_(dev_ptrs,c_loc(sizes),count,flags, &
        stream%ptr)
    end function

    function hipMemDiscardBatchAsync_rank_0_cptr(dev_ptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardBatchAsync_rank_0_cptr
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemDiscardBatchAsync_rank_0_cptr = hipMemDiscardBatchAsync_(dev_ptrs,c_loc(sizes),count, &
        flags,stream)
    end function

    function hipMemDiscardBatchAsync_rank_1(dev_ptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardBatchAsync_rank_1
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemDiscardBatchAsync_rank_1 = hipMemDiscardBatchAsync_(dev_ptrs,c_loc(sizes),count,flags, &
        stream%ptr)
    end function

    function hipMemDiscardBatchAsync_rank_1_cptr(dev_ptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardBatchAsync_rank_1_cptr
      type(c_ptr) :: dev_ptrs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemDiscardBatchAsync_rank_1_cptr = hipMemDiscardBatchAsync_(dev_ptrs,c_loc(sizes),count, &
        flags,stream)
    end function

#endif
    function hipMemDiscardBatchAsync_typed(dev_ptrs, sizes, count, flags, &
        stream) result(MemDiscardBatchAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dev_ptrs
      type(c_ptr), value :: sizes
      integer(c_size_t), value :: count
      integer(c_int64_t), value :: flags
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemDiscardBatchAsync
      MemDiscardBatchAsync = hipMemDiscardBatchAsync_(dev_ptrs, sizes, count, flags, stream%ptr)
    end function hipMemDiscardBatchAsync_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipDrvMemDiscardBatchAsync_assumed_rank(dptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardBatchAsync_assumed_rank
      type(c_ptr) :: dptrs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipDrvMemDiscardBatchAsync_assumed_rank = hipDrvMemDiscardBatchAsync_(dptrs,c_loc(sizes), &
        count,flags,stream%ptr)
    end function

    function hipDrvMemDiscardBatchAsync_assumed_rank_cptr(dptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardBatchAsync_assumed_rank_cptr
      type(c_ptr) :: dptrs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipDrvMemDiscardBatchAsync_assumed_rank_cptr = hipDrvMemDiscardBatchAsync_(dptrs, &
        c_loc(sizes),count,flags,stream)
    end function

#else
    function hipDrvMemDiscardBatchAsync_rank_0(dptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardBatchAsync_rank_0
      type(c_ptr) :: dptrs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipDrvMemDiscardBatchAsync_rank_0 = hipDrvMemDiscardBatchAsync_(dptrs,c_loc(sizes),count, &
        flags,stream%ptr)
    end function

    function hipDrvMemDiscardBatchAsync_rank_0_cptr(dptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardBatchAsync_rank_0_cptr
      type(c_ptr) :: dptrs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipDrvMemDiscardBatchAsync_rank_0_cptr = hipDrvMemDiscardBatchAsync_(dptrs,c_loc(sizes), &
        count,flags,stream)
    end function

    function hipDrvMemDiscardBatchAsync_rank_1(dptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardBatchAsync_rank_1
      type(c_ptr) :: dptrs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipDrvMemDiscardBatchAsync_rank_1 = hipDrvMemDiscardBatchAsync_(dptrs,c_loc(sizes),count, &
        flags,stream%ptr)
    end function

    function hipDrvMemDiscardBatchAsync_rank_1_cptr(dptrs,sizes,count,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardBatchAsync_rank_1_cptr
      type(c_ptr) :: dptrs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipDrvMemDiscardBatchAsync_rank_1_cptr = hipDrvMemDiscardBatchAsync_(dptrs,c_loc(sizes), &
        count,flags,stream)
    end function

#endif
    function hipDrvMemDiscardBatchAsync_typed(dptrs, sizes, count, flags, &
        stream) result(DrvMemDiscardBatchAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dptrs
      type(c_ptr), value :: sizes
      integer(c_size_t), value :: count
      integer(c_int64_t), value :: flags
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: DrvMemDiscardBatchAsync
      DrvMemDiscardBatchAsync = hipDrvMemDiscardBatchAsync_(dptrs, sizes, count, flags, stream%ptr)
    end function hipDrvMemDiscardBatchAsync_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipMemDiscardAndPrefetchBatchAsync_assumed_rank(dptrs,sizes,count,prefetchLocs, &
        prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardAndPrefetchBatchAsync_assumed_rank
      type(c_ptr) :: dptrs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target,contiguous,dimension(..) :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemDiscardAndPrefetchBatchAsync_assumed_rank = hipMemDiscardAndPrefetchBatchAsync_(dptrs, &
        c_loc(sizes),count,prefetchLocs,c_loc(prefetchLocIdxs),numPrefetchLocs,flags,stream%ptr)
    end function

    function hipMemDiscardAndPrefetchBatchAsync_assumed_rank_cptr(dptrs,sizes,count,prefetchLocs, &
        prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardAndPrefetchBatchAsync_assumed_rank_cptr
      type(c_ptr) :: dptrs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target,contiguous,dimension(..) :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemDiscardAndPrefetchBatchAsync_assumed_rank_cptr = hipMemDiscardAndPrefetchBatchAsync_( &
        dptrs,c_loc(sizes),count,prefetchLocs,c_loc(prefetchLocIdxs),numPrefetchLocs,flags,stream)
    end function

#else
    function hipMemDiscardAndPrefetchBatchAsync_rank_0(dptrs,sizes,count,prefetchLocs, &
        prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardAndPrefetchBatchAsync_rank_0
      type(c_ptr) :: dptrs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemDiscardAndPrefetchBatchAsync_rank_0 = hipMemDiscardAndPrefetchBatchAsync_(dptrs, &
        c_loc(sizes),count,prefetchLocs,c_loc(prefetchLocIdxs),numPrefetchLocs,flags,stream%ptr)
    end function

    function hipMemDiscardAndPrefetchBatchAsync_rank_0_cptr(dptrs,sizes,count,prefetchLocs, &
        prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardAndPrefetchBatchAsync_rank_0_cptr
      type(c_ptr) :: dptrs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemDiscardAndPrefetchBatchAsync_rank_0_cptr = hipMemDiscardAndPrefetchBatchAsync_(dptrs, &
        c_loc(sizes),count,prefetchLocs,c_loc(prefetchLocIdxs),numPrefetchLocs,flags,stream)
    end function

    function hipMemDiscardAndPrefetchBatchAsync_rank_1(dptrs,sizes,count,prefetchLocs, &
        prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardAndPrefetchBatchAsync_rank_1
      type(c_ptr) :: dptrs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target,dimension(:) :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemDiscardAndPrefetchBatchAsync_rank_1 = hipMemDiscardAndPrefetchBatchAsync_(dptrs, &
        c_loc(sizes),count,prefetchLocs,c_loc(prefetchLocIdxs),numPrefetchLocs,flags,stream%ptr)
    end function

    function hipMemDiscardAndPrefetchBatchAsync_rank_1_cptr(dptrs,sizes,count,prefetchLocs, &
        prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemDiscardAndPrefetchBatchAsync_rank_1_cptr
      type(c_ptr) :: dptrs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target,dimension(:) :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemDiscardAndPrefetchBatchAsync_rank_1_cptr = hipMemDiscardAndPrefetchBatchAsync_(dptrs, &
        c_loc(sizes),count,prefetchLocs,c_loc(prefetchLocIdxs),numPrefetchLocs,flags,stream)
    end function

#endif
    function hipMemDiscardAndPrefetchBatchAsync_typed(dptrs, sizes, count, prefetchLocs, &
        prefetchLocIdxs, numPrefetchLocs, flags, stream) result(MemDiscardAndPrefetchBatchAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dptrs
      type(c_ptr), value :: sizes
      integer(c_size_t), value :: count
      type(hipMemLocation) :: prefetchLocs
      type(c_ptr), value :: prefetchLocIdxs
      integer(c_size_t), value :: numPrefetchLocs
      integer(c_int64_t), value :: flags
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemDiscardAndPrefetchBatchAsync
      MemDiscardAndPrefetchBatchAsync = hipMemDiscardAndPrefetchBatchAsync_(dptrs, sizes, count, &
        prefetchLocs, prefetchLocIdxs, numPrefetchLocs, flags, stream%ptr)
    end function hipMemDiscardAndPrefetchBatchAsync_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipDrvMemDiscardAndPrefetchBatchAsync_assumed_rank(dptrs,sizes,count,prefetchLocs, &
        prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardAndPrefetchBatchAsync_assumed_rank
      type(c_ptr) :: dptrs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target,contiguous,dimension(..) :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipDrvMemDiscardAndPrefetchBatchAsync_assumed_rank = hipDrvMemDiscardAndPrefetchBatchAsync_( &
        dptrs,c_loc(sizes),count,prefetchLocs,c_loc(prefetchLocIdxs),numPrefetchLocs,flags, &
        stream%ptr)
    end function

    function hipDrvMemDiscardAndPrefetchBatchAsync_assumed_rank_cptr(dptrs,sizes,count, &
        prefetchLocs,prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardAndPrefetchBatchAsync_assumed_rank_cptr
      type(c_ptr) :: dptrs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target,contiguous,dimension(..) :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipDrvMemDiscardAndPrefetchBatchAsync_assumed_rank_cptr = &
        hipDrvMemDiscardAndPrefetchBatchAsync_(dptrs,c_loc(sizes),count,prefetchLocs, &
        c_loc(prefetchLocIdxs),numPrefetchLocs,flags,stream)
    end function

#else
    function hipDrvMemDiscardAndPrefetchBatchAsync_rank_0(dptrs,sizes,count,prefetchLocs, &
        prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardAndPrefetchBatchAsync_rank_0
      type(c_ptr) :: dptrs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipDrvMemDiscardAndPrefetchBatchAsync_rank_0 = hipDrvMemDiscardAndPrefetchBatchAsync_(dptrs, &
        c_loc(sizes),count,prefetchLocs,c_loc(prefetchLocIdxs),numPrefetchLocs,flags,stream%ptr)
    end function

    function hipDrvMemDiscardAndPrefetchBatchAsync_rank_0_cptr(dptrs,sizes,count,prefetchLocs, &
        prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardAndPrefetchBatchAsync_rank_0_cptr
      type(c_ptr) :: dptrs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipDrvMemDiscardAndPrefetchBatchAsync_rank_0_cptr = hipDrvMemDiscardAndPrefetchBatchAsync_( &
        dptrs,c_loc(sizes),count,prefetchLocs,c_loc(prefetchLocIdxs),numPrefetchLocs,flags,stream)
    end function

    function hipDrvMemDiscardAndPrefetchBatchAsync_rank_1(dptrs,sizes,count,prefetchLocs, &
        prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardAndPrefetchBatchAsync_rank_1
      type(c_ptr) :: dptrs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target,dimension(:) :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipDrvMemDiscardAndPrefetchBatchAsync_rank_1 = hipDrvMemDiscardAndPrefetchBatchAsync_(dptrs, &
        c_loc(sizes),count,prefetchLocs,c_loc(prefetchLocIdxs),numPrefetchLocs,flags,stream%ptr)
    end function

    function hipDrvMemDiscardAndPrefetchBatchAsync_rank_1_cptr(dptrs,sizes,count,prefetchLocs, &
        prefetchLocIdxs,numPrefetchLocs,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDrvMemDiscardAndPrefetchBatchAsync_rank_1_cptr
      type(c_ptr) :: dptrs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      type(hipMemLocation) :: prefetchLocs
      integer(c_size_t),target,dimension(:) :: prefetchLocIdxs
      integer(c_size_t) :: numPrefetchLocs
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipDrvMemDiscardAndPrefetchBatchAsync_rank_1_cptr = hipDrvMemDiscardAndPrefetchBatchAsync_( &
        dptrs,c_loc(sizes),count,prefetchLocs,c_loc(prefetchLocIdxs),numPrefetchLocs,flags,stream)
    end function

#endif
    function hipDrvMemDiscardAndPrefetchBatchAsync_typed(dptrs, sizes, count, prefetchLocs, &
        prefetchLocIdxs, numPrefetchLocs, flags, stream) result(DrvMemDiscardAndPrefetchBatchAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dptrs
      type(c_ptr), value :: sizes
      integer(c_size_t), value :: count
      type(hipMemLocation) :: prefetchLocs
      type(c_ptr), value :: prefetchLocIdxs
      integer(c_size_t), value :: numPrefetchLocs
      integer(c_int64_t), value :: flags
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: DrvMemDiscardAndPrefetchBatchAsync
      DrvMemDiscardAndPrefetchBatchAsync = hipDrvMemDiscardAndPrefetchBatchAsync_(dptrs, sizes, &
        count, prefetchLocs, prefetchLocIdxs, numPrefetchLocs, flags, stream%ptr)
    end function hipDrvMemDiscardAndPrefetchBatchAsync_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipMemRangeGetAttributes_assumed_rank(myData,data_sizes,attributes,num_attributes, &
        dev_ptr,count)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemRangeGetAttributes_assumed_rank
      type(c_ptr) :: myData
      integer(c_size_t),target,contiguous,dimension(..) :: data_sizes
      integer(c_int),target,contiguous,dimension(..) :: attributes
      integer(c_size_t) :: num_attributes
      type(c_ptr) :: dev_ptr
      integer(c_size_t) :: count
      !
      hipMemRangeGetAttributes_assumed_rank = hipMemRangeGetAttributes_(myData,c_loc(data_sizes), &
        c_loc(attributes),num_attributes,dev_ptr,count)
    end function

#else
    function hipMemRangeGetAttributes_rank_0(myData,data_sizes,attributes,num_attributes,dev_ptr, &
        count)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemRangeGetAttributes_rank_0
      type(c_ptr) :: myData
      integer(c_size_t),target :: data_sizes
      integer(c_int),target :: attributes
      integer(c_size_t) :: num_attributes
      type(c_ptr) :: dev_ptr
      integer(c_size_t) :: count
      !
      hipMemRangeGetAttributes_rank_0 = hipMemRangeGetAttributes_(myData,c_loc(data_sizes), &
        c_loc(attributes),num_attributes,dev_ptr,count)
    end function

    function hipMemRangeGetAttributes_rank_1(myData,data_sizes,attributes,num_attributes,dev_ptr, &
        count)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemRangeGetAttributes_rank_1
      type(c_ptr) :: myData
      integer(c_size_t),target,dimension(:) :: data_sizes
      integer(c_int),target,dimension(:) :: attributes
      integer(c_size_t) :: num_attributes
      type(c_ptr) :: dev_ptr
      integer(c_size_t) :: count
      !
      hipMemRangeGetAttributes_rank_1 = hipMemRangeGetAttributes_(myData,c_loc(data_sizes), &
        c_loc(attributes),num_attributes,dev_ptr,count)
    end function

#endif
    function hipStreamAttachMemAsync_typed(stream, dev_ptr, length, &
        flags) result(StreamAttachMemAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: dev_ptr
      integer(c_size_t), value :: length
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: StreamAttachMemAsync
      StreamAttachMemAsync = hipStreamAttachMemAsync_(stream%ptr, dev_ptr, length, flags)
    end function hipStreamAttachMemAsync_typed

    function hipMallocAsync_typed(dev_ptr, mySize, stream) result(MallocAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dev_ptr
      integer(c_size_t), value :: mySize
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MallocAsync
      MallocAsync = hipMallocAsync_(dev_ptr, mySize, stream%ptr)
    end function hipMallocAsync_typed

    function hipFreeAsync_typed(dev_ptr, stream) result(FreeAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dev_ptr
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: FreeAsync
      FreeAsync = hipFreeAsync_(dev_ptr, stream%ptr)
    end function hipFreeAsync_typed

    function hipMemPoolTrimTo_typed(mem_pool, min_bytes_to_hold) result(MemPoolTrimTo)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t), value :: mem_pool
      integer(c_size_t), value :: min_bytes_to_hold
      integer(kind(hipSuccess)) :: MemPoolTrimTo
      MemPoolTrimTo = hipMemPoolTrimTo_(mem_pool%ptr, min_bytes_to_hold)
    end function hipMemPoolTrimTo_typed

    function hipMemPoolSetAttribute_typed(mem_pool, attr, myValue) result(MemPoolSetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t), value :: mem_pool
      integer(kind(hipMemPoolReuseFollowEventDependencies)), value :: attr
      type(c_ptr), value :: myValue
      integer(kind(hipSuccess)) :: MemPoolSetAttribute
      MemPoolSetAttribute = hipMemPoolSetAttribute_(mem_pool%ptr, attr, myValue)
    end function hipMemPoolSetAttribute_typed

    function hipMemPoolGetAttribute_typed(mem_pool, attr, myValue) result(MemPoolGetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t), value :: mem_pool
      integer(kind(hipMemPoolReuseFollowEventDependencies)), value :: attr
      type(c_ptr), value :: myValue
      integer(kind(hipSuccess)) :: MemPoolGetAttribute
      MemPoolGetAttribute = hipMemPoolGetAttribute_(mem_pool%ptr, attr, myValue)
    end function hipMemPoolGetAttribute_typed

    function hipMemPoolSetAccess_typed(mem_pool, desc_list, count) result(MemPoolSetAccess)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t), value :: mem_pool
      type(hipMemAccessDesc) :: desc_list
      integer(c_size_t), value :: count
      integer(kind(hipSuccess)) :: MemPoolSetAccess
      MemPoolSetAccess = hipMemPoolSetAccess_(mem_pool%ptr, desc_list, count)
    end function hipMemPoolSetAccess_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipMemPoolGetAccess_assumed_rank(flags,mem_pool,location)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolGetAccess_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: flags
      type(hipMemPool_t) :: mem_pool
      type(hipMemLocation) :: location
      !
      hipMemPoolGetAccess_assumed_rank = hipMemPoolGetAccess_(c_loc(flags),mem_pool%ptr,location)
    end function

    function hipMemPoolGetAccess_assumed_rank_cptr(flags,mem_pool,location)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolGetAccess_assumed_rank_cptr
      integer(c_int),target,contiguous,dimension(..) :: flags
      type(c_ptr) :: mem_pool
      type(hipMemLocation) :: location
      !
      hipMemPoolGetAccess_assumed_rank_cptr = hipMemPoolGetAccess_(c_loc(flags),mem_pool,location)
    end function

#else
    function hipMemPoolGetAccess_rank_0(flags,mem_pool,location)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolGetAccess_rank_0
      integer(c_int),target :: flags
      type(hipMemPool_t) :: mem_pool
      type(hipMemLocation) :: location
      !
      hipMemPoolGetAccess_rank_0 = hipMemPoolGetAccess_(c_loc(flags),mem_pool%ptr,location)
    end function

    function hipMemPoolGetAccess_rank_0_cptr(flags,mem_pool,location)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolGetAccess_rank_0_cptr
      integer(c_int),target :: flags
      type(c_ptr) :: mem_pool
      type(hipMemLocation) :: location
      !
      hipMemPoolGetAccess_rank_0_cptr = hipMemPoolGetAccess_(c_loc(flags),mem_pool,location)
    end function

    function hipMemPoolGetAccess_rank_1(flags,mem_pool,location)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolGetAccess_rank_1
      integer(c_int),target,dimension(:) :: flags
      type(hipMemPool_t) :: mem_pool
      type(hipMemLocation) :: location
      !
      hipMemPoolGetAccess_rank_1 = hipMemPoolGetAccess_(c_loc(flags),mem_pool%ptr,location)
    end function

    function hipMemPoolGetAccess_rank_1_cptr(flags,mem_pool,location)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemPoolGetAccess_rank_1_cptr
      integer(c_int),target,dimension(:) :: flags
      type(c_ptr) :: mem_pool
      type(hipMemLocation) :: location
      !
      hipMemPoolGetAccess_rank_1_cptr = hipMemPoolGetAccess_(c_loc(flags),mem_pool,location)
    end function

#endif
    function hipMemPoolGetAccess_typed(flags, mem_pool, location) result(MemPoolGetAccess)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: flags
      type(hipMemPool_t), value :: mem_pool
      type(hipMemLocation) :: location
      integer(kind(hipSuccess)) :: MemPoolGetAccess
      MemPoolGetAccess = hipMemPoolGetAccess_(flags, mem_pool%ptr, location)
    end function hipMemPoolGetAccess_typed

    function hipMemPoolCreate_typed(mem_pool, pool_props) result(MemPoolCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t) :: mem_pool
      type(hipMemPoolProps) :: pool_props
      integer(kind(hipSuccess)) :: MemPoolCreate
      MemPoolCreate = hipMemPoolCreate_(mem_pool%ptr, pool_props)
    end function hipMemPoolCreate_typed

    function hipMemPoolDestroy_typed(mem_pool) result(MemPoolDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t), value :: mem_pool
      integer(kind(hipSuccess)) :: MemPoolDestroy
      MemPoolDestroy = hipMemPoolDestroy_(mem_pool%ptr)
    end function hipMemPoolDestroy_typed

    function hipMallocFromPoolAsync_typed(dev_ptr, mySize, mem_pool, &
        stream) result(MallocFromPoolAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dev_ptr
      integer(c_size_t), value :: mySize
      type(hipMemPool_t), value :: mem_pool
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MallocFromPoolAsync
      MallocFromPoolAsync = hipMallocFromPoolAsync_(dev_ptr, mySize, mem_pool%ptr, stream%ptr)
    end function hipMallocFromPoolAsync_typed

    function hipMemPoolExportToShareableHandle_typed(shared_handle, mem_pool, handle_type, &
        flags) result(MemPoolExportToShareableHandle)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: shared_handle
      type(hipMemPool_t), value :: mem_pool
      integer(kind(hipMemHandleTypeNone)), value :: handle_type
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: MemPoolExportToShareableHandle
      MemPoolExportToShareableHandle = hipMemPoolExportToShareableHandle_(shared_handle, &
        mem_pool%ptr, handle_type, flags)
    end function hipMemPoolExportToShareableHandle_typed

    function hipMemPoolImportFromShareableHandle_typed(mem_pool, shared_handle, handle_type, &
        flags) result(MemPoolImportFromShareableHandle)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t) :: mem_pool
      type(c_ptr), value :: shared_handle
      integer(kind(hipMemHandleTypeNone)), value :: handle_type
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: MemPoolImportFromShareableHandle
      MemPoolImportFromShareableHandle = hipMemPoolImportFromShareableHandle_(mem_pool%ptr, &
        shared_handle, handle_type, flags)
    end function hipMemPoolImportFromShareableHandle_typed

    function hipMemPoolImportPointer_typed(dev_ptr, mem_pool, &
        export_data) result(MemPoolImportPointer)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dev_ptr
      type(hipMemPool_t), value :: mem_pool
      type(hipMemPoolPtrExportData) :: export_data
      integer(kind(hipSuccess)) :: MemPoolImportPointer
      MemPoolImportPointer = hipMemPoolImportPointer_(dev_ptr, mem_pool%ptr, export_data)
    end function hipMemPoolImportPointer_typed

    function hipMemSetMemPool_typed(location, myType, pool) result(MemSetMemPool)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemLocation) :: location
      integer(kind(hipMemAllocationTypeInvalid)), value :: myType
      type(hipMemPool_t), value :: pool
      integer(kind(hipSuccess)) :: MemSetMemPool
      MemSetMemPool = hipMemSetMemPool_(location, myType, pool%ptr)
    end function hipMemSetMemPool_typed

    function hipMemGetMemPool_typed(pool, location, myType) result(MemGetMemPool)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t) :: pool
      type(hipMemLocation) :: location
      integer(kind(hipMemAllocationTypeInvalid)), value :: myType
      integer(kind(hipSuccess)) :: MemGetMemPool
      MemGetMemPool = hipMemGetMemPool_(pool%ptr, location, myType)
    end function hipMemGetMemPool_typed

    function hipMemGetDefaultMemPool_typed(memPool, location, myType) result(MemGetDefaultMemPool)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemPool_t) :: memPool
      type(hipMemLocation) :: location
      integer(kind(hipMemAllocationTypeInvalid)), value :: myType
      integer(kind(hipSuccess)) :: MemGetDefaultMemPool
      MemGetDefaultMemPool = hipMemGetDefaultMemPool_(memPool%ptr, location, myType)
    end function hipMemGetDefaultMemPool_typed

    function hipMemcpyWithStream_typed(dst, src, sizeBytes, myKind, stream) result(MemcpyWithStream)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_size_t), value :: sizeBytes
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyWithStream
      MemcpyWithStream = hipMemcpyWithStream_(dst, src, sizeBytes, myKind, stream%ptr)
    end function hipMemcpyWithStream_typed

    function hipMemcpyHtoDAsync_typed(dst, src, sizeBytes, stream) result(MemcpyHtoDAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_size_t), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyHtoDAsync
      MemcpyHtoDAsync = hipMemcpyHtoDAsync_(dst, src, sizeBytes, stream%ptr)
    end function hipMemcpyHtoDAsync_typed

    function hipMemcpyDtoHAsync_typed(dst, src, sizeBytes, stream) result(MemcpyDtoHAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_size_t), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyDtoHAsync
      MemcpyDtoHAsync = hipMemcpyDtoHAsync_(dst, src, sizeBytes, stream%ptr)
    end function hipMemcpyDtoHAsync_typed

    function hipMemcpyDtoDAsync_typed(dst, src, sizeBytes, stream) result(MemcpyDtoDAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_size_t), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyDtoDAsync
      MemcpyDtoDAsync = hipMemcpyDtoDAsync_(dst, src, sizeBytes, stream%ptr)
    end function hipMemcpyDtoDAsync_typed

    function hipMemcpyAtoHAsync_typed(dstHost, srcArray, srcOffset, ByteCount, &
        stream) result(MemcpyAtoHAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dstHost
      type(c_ptr), value :: srcArray
      integer(c_size_t), value :: srcOffset
      integer(c_size_t), value :: ByteCount
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyAtoHAsync
      MemcpyAtoHAsync = hipMemcpyAtoHAsync_(dstHost, srcArray, srcOffset, ByteCount, stream%ptr)
    end function hipMemcpyAtoHAsync_typed

    function hipMemcpyHtoAAsync_typed(dstArray, dstOffset, srcHost, ByteCount, &
        stream) result(MemcpyHtoAAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dstArray
      integer(c_size_t), value :: dstOffset
      type(c_ptr), value :: srcHost
      integer(c_size_t), value :: ByteCount
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyHtoAAsync
      MemcpyHtoAAsync = hipMemcpyHtoAAsync_(dstArray, dstOffset, srcHost, ByteCount, stream%ptr)
    end function hipMemcpyHtoAAsync_typed

    function hipModuleGetGlobal_typed(dptr, bytes, hmod, name) result(ModuleGetGlobal)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dptr
      integer(c_size_t) :: bytes
      type(hipModule_t), value :: hmod
      type(c_ptr), value :: name
      integer(kind(hipSuccess)) :: ModuleGetGlobal
      ModuleGetGlobal = hipModuleGetGlobal_(dptr, bytes, hmod%ptr, name)
    end function hipModuleGetGlobal_typed

    function hipModuleGetGlobal_cstr(dptr, bytes, hmod, name) result(ModuleGetGlobal)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: dptr
      integer(c_size_t) :: bytes
      type(c_ptr), value :: hmod
      character(len=*), intent(in) :: name
      integer(kind(hipSuccess)) :: ModuleGetGlobal
      character(len=len_trim(name)+1, kind=c_char), target :: name__c
      name__c = trim(name)//c_null_char
      ModuleGetGlobal = hipModuleGetGlobal_(dptr, bytes, hmod, c_loc(name__c))
    end function hipModuleGetGlobal_cstr

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGetProcAddress_assumed_rank(symbol,pfn,hipVersion,flags,symbolStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetProcAddress_assumed_rank
      type(c_ptr) :: symbol
      type(c_ptr) :: pfn
      integer(c_int) :: hipVersion
      integer(c_int64_t) :: flags
      integer(c_int),target,contiguous,dimension(..) :: symbolStatus
      !
      hipGetProcAddress_assumed_rank = hipGetProcAddress_(symbol,pfn,hipVersion,flags, &
        c_loc(symbolStatus))
    end function

#else
    function hipGetProcAddress_rank_0(symbol,pfn,hipVersion,flags,symbolStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetProcAddress_rank_0
      type(c_ptr) :: symbol
      type(c_ptr) :: pfn
      integer(c_int) :: hipVersion
      integer(c_int64_t) :: flags
      integer(c_int),target :: symbolStatus
      !
      hipGetProcAddress_rank_0 = hipGetProcAddress_(symbol,pfn,hipVersion,flags,c_loc(symbolStatus))
    end function

    function hipGetProcAddress_rank_1(symbol,pfn,hipVersion,flags,symbolStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetProcAddress_rank_1
      type(c_ptr) :: symbol
      type(c_ptr) :: pfn
      integer(c_int) :: hipVersion
      integer(c_int64_t) :: flags
      integer(c_int),target,dimension(:) :: symbolStatus
      !
      hipGetProcAddress_rank_1 = hipGetProcAddress_(symbol,pfn,hipVersion,flags,c_loc(symbolStatus))
    end function

#endif
    function hipGetProcAddress_cstr(symbol, pfn, hipVersion, flags, &
        symbolStatus) result(GetProcAddress)
      use, intrinsic :: iso_c_binding
      implicit none
      character(len=*), intent(in) :: symbol
      type(c_ptr) :: pfn
      integer(c_int), value :: hipVersion
      integer(c_int64_t), value :: flags
      type(c_ptr), value :: symbolStatus
      integer(kind(hipSuccess)) :: GetProcAddress
      character(len=len_trim(symbol)+1, kind=c_char), target :: symbol__c
      symbol__c = trim(symbol)//c_null_char
      GetProcAddress = hipGetProcAddress_(c_loc(symbol__c), pfn, hipVersion, flags, symbolStatus)
    end function hipGetProcAddress_cstr

    function hipMemcpyToSymbolAsync_typed(symbol, src, sizeBytes, offset, myKind, &
        stream) result(MemcpyToSymbolAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: symbol
      type(c_ptr), value :: src
      integer(c_size_t), value :: sizeBytes
      integer(c_size_t), value :: offset
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyToSymbolAsync
      MemcpyToSymbolAsync = hipMemcpyToSymbolAsync_(symbol, src, sizeBytes, offset, myKind, &
        stream%ptr)
    end function hipMemcpyToSymbolAsync_typed

    function hipMemcpyFromSymbolAsync_typed(dst, symbol, sizeBytes, offset, myKind, &
        stream) result(MemcpyFromSymbolAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: symbol
      integer(c_size_t), value :: sizeBytes
      integer(c_size_t), value :: offset
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyFromSymbolAsync
      MemcpyFromSymbolAsync = hipMemcpyFromSymbolAsync_(dst, symbol, sizeBytes, offset, myKind, &
        stream%ptr)
    end function hipMemcpyFromSymbolAsync_typed

    function hipMemsetD8Async_typed(dest, myValue, count, stream) result(MemsetD8Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dest
      character(c_char), value :: myValue
      integer(c_size_t), value :: count
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemsetD8Async
      MemsetD8Async = hipMemsetD8Async_(dest, myValue, count, stream%ptr)
    end function hipMemsetD8Async_typed

    function hipMemsetD16Async_typed(dest, myValue, count, stream) result(MemsetD16Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dest
      integer(c_short), value :: myValue
      integer(c_size_t), value :: count
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemsetD16Async
      MemsetD16Async = hipMemsetD16Async_(dest, myValue, count, stream%ptr)
    end function hipMemsetD16Async_typed

    function hipMemsetAsync_typed(dst, myValue, sizeBytes, stream) result(MemsetAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_int), value :: myValue
      integer(c_size_t), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemsetAsync
      MemsetAsync = hipMemsetAsync_(dst, myValue, sizeBytes, stream%ptr)
    end function hipMemsetAsync_typed

    function hipMemsetD32Async_typed(dst, myValue, count, stream) result(MemsetD32Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_int), value :: myValue
      integer(c_size_t), value :: count
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemsetD32Async
      MemsetD32Async = hipMemsetD32Async_(dst, myValue, count, stream%ptr)
    end function hipMemsetD32Async_typed

    function hipMemset2DAsync_typed(dst, pitch, myValue, width, height, &
        stream) result(Memset2DAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_size_t), value :: pitch
      integer(c_int), value :: myValue
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memset2DAsync
      Memset2DAsync = hipMemset2DAsync_(dst, pitch, myValue, width, height, stream%ptr)
    end function hipMemset2DAsync_typed

    function hipMemset3DAsync_typed(pitchedDevPtr, myValue, extent, stream) result(Memset3DAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipPitchedPtr), value :: pitchedDevPtr
      integer(c_int), value :: myValue
      type(hipExtent), value :: extent
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memset3DAsync
      Memset3DAsync = hipMemset3DAsync_(pitchedDevPtr, myValue, extent, stream%ptr)
    end function hipMemset3DAsync_typed

    function hipMemsetD2D8Async_typed(dst, dstPitch, myValue, width, height, &
        stream) result(MemsetD2D8Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_size_t), value :: dstPitch
      character(c_char), value :: myValue
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemsetD2D8Async
      MemsetD2D8Async = hipMemsetD2D8Async_(dst, dstPitch, myValue, width, height, stream%ptr)
    end function hipMemsetD2D8Async_typed

    function hipMemsetD2D16Async_typed(dst, dstPitch, myValue, width, height, &
        stream) result(MemsetD2D16Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_size_t), value :: dstPitch
      integer(c_short), value :: myValue
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemsetD2D16Async
      MemsetD2D16Async = hipMemsetD2D16Async_(dst, dstPitch, myValue, width, height, stream%ptr)
    end function hipMemsetD2D16Async_typed

    function hipMemsetD2D32Async_typed(dst, dstPitch, myValue, width, height, &
        stream) result(MemsetD2D32Async)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_size_t), value :: dstPitch
      integer(c_int), value :: myValue
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemsetD2D32Async
      MemsetD2D32Async = hipMemsetD2D32Async_(dst, dstPitch, myValue, width, height, stream%ptr)
    end function hipMemsetD2D32Async_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipArrayGetInfo_assumed_rank(desc,extent,flags,array)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipArrayGetInfo_assumed_rank
      type(hipChannelFormatDesc) :: desc
      type(hipExtent) :: extent
      integer(c_int),target,contiguous,dimension(..) :: flags
      type(c_ptr) :: array
      !
      hipArrayGetInfo_assumed_rank = hipArrayGetInfo_(desc,extent,c_loc(flags),array)
    end function

#else
    function hipArrayGetInfo_rank_0(desc,extent,flags,array)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipArrayGetInfo_rank_0
      type(hipChannelFormatDesc) :: desc
      type(hipExtent) :: extent
      integer(c_int),target :: flags
      type(c_ptr) :: array
      !
      hipArrayGetInfo_rank_0 = hipArrayGetInfo_(desc,extent,c_loc(flags),array)
    end function

    function hipArrayGetInfo_rank_1(desc,extent,flags,array)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipArrayGetInfo_rank_1
      type(hipChannelFormatDesc) :: desc
      type(hipExtent) :: extent
      integer(c_int),target,dimension(:) :: flags
      type(c_ptr) :: array
      !
      hipArrayGetInfo_rank_1 = hipArrayGetInfo_(desc,extent,c_loc(flags),array)
    end function

#endif
    function hipMemcpyParam2DAsync_typed(pCopy, stream) result(MemcpyParam2DAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hip_Memcpy2D) :: pCopy
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyParam2DAsync
      MemcpyParam2DAsync = hipMemcpyParam2DAsync_(pCopy, stream%ptr)
    end function hipMemcpyParam2DAsync_typed

    function hipMemcpy2DToArrayAsync_typed(dst, wOffset, hOffset, src, spitch, width, height, &
        myKind, stream) result(Memcpy2DToArrayAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_size_t), value :: wOffset
      integer(c_size_t), value :: hOffset
      type(c_ptr), value :: src
      integer(c_size_t), value :: spitch
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memcpy2DToArrayAsync
      Memcpy2DToArrayAsync = hipMemcpy2DToArrayAsync_(dst, wOffset, hOffset, src, spitch, width, &
        height, myKind, stream%ptr)
    end function hipMemcpy2DToArrayAsync_typed

    function hipMemcpy2DFromArrayAsync_typed(dst, dpitch, src, wOffset, hOffset, width, height, &
        myKind, stream) result(Memcpy2DFromArrayAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_size_t), value :: dpitch
      type(c_ptr), value :: src
      integer(c_size_t), value :: wOffset
      integer(c_size_t), value :: hOffset
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memcpy2DFromArrayAsync
      Memcpy2DFromArrayAsync = hipMemcpy2DFromArrayAsync_(dst, dpitch, src, wOffset, hOffset, &
        width, height, myKind, stream%ptr)
    end function hipMemcpy2DFromArrayAsync_typed

    function hipMemcpy3DAsync_typed(p, stream) result(Memcpy3DAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemcpy3DParms) :: p
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memcpy3DAsync
      Memcpy3DAsync = hipMemcpy3DAsync_(p, stream%ptr)
    end function hipMemcpy3DAsync_typed

    function hipDrvMemcpy3DAsync_typed(pCopy, stream) result(DrvMemcpy3DAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(HIP_MEMCPY3D) :: pCopy
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: DrvMemcpy3DAsync
      DrvMemcpy3DAsync = hipDrvMemcpy3DAsync_(pCopy, stream%ptr)
    end function hipDrvMemcpy3DAsync_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipMemcpyBatchAsync_assumed_rank(dsts,srcs,sizes,count,attrs,attrsIdxs,numAttrs, &
        failIdx,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyBatchAsync_assumed_rank
      type(c_ptr) :: dsts
      type(c_ptr) :: srcs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      type(hipMemcpyAttributes) :: attrs
      integer(c_size_t),target,contiguous,dimension(..) :: attrsIdxs
      integer(c_size_t) :: numAttrs
      integer(c_size_t),target,contiguous,dimension(..) :: failIdx
      type(hipStream_t) :: stream
      !
      hipMemcpyBatchAsync_assumed_rank = hipMemcpyBatchAsync_(dsts,srcs,c_loc(sizes),count,attrs, &
        c_loc(attrsIdxs),numAttrs,c_loc(failIdx),stream%ptr)
    end function

    function hipMemcpyBatchAsync_assumed_rank_cptr(dsts,srcs,sizes,count,attrs,attrsIdxs,numAttrs, &
        failIdx,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyBatchAsync_assumed_rank_cptr
      type(c_ptr) :: dsts
      type(c_ptr) :: srcs
      integer(c_size_t),target,contiguous,dimension(..) :: sizes
      integer(c_size_t) :: count
      type(hipMemcpyAttributes) :: attrs
      integer(c_size_t),target,contiguous,dimension(..) :: attrsIdxs
      integer(c_size_t) :: numAttrs
      integer(c_size_t),target,contiguous,dimension(..) :: failIdx
      type(c_ptr) :: stream
      !
      hipMemcpyBatchAsync_assumed_rank_cptr = hipMemcpyBatchAsync_(dsts,srcs,c_loc(sizes),count, &
        attrs,c_loc(attrsIdxs),numAttrs,c_loc(failIdx),stream)
    end function

#else
    function hipMemcpyBatchAsync_rank_0(dsts,srcs,sizes,count,attrs,attrsIdxs,numAttrs,failIdx, &
        stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyBatchAsync_rank_0
      type(c_ptr) :: dsts
      type(c_ptr) :: srcs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      type(hipMemcpyAttributes) :: attrs
      integer(c_size_t),target :: attrsIdxs
      integer(c_size_t) :: numAttrs
      integer(c_size_t),target :: failIdx
      type(hipStream_t) :: stream
      !
      hipMemcpyBatchAsync_rank_0 = hipMemcpyBatchAsync_(dsts,srcs,c_loc(sizes),count,attrs, &
        c_loc(attrsIdxs),numAttrs,c_loc(failIdx),stream%ptr)
    end function

    function hipMemcpyBatchAsync_rank_0_cptr(dsts,srcs,sizes,count,attrs,attrsIdxs,numAttrs, &
        failIdx,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyBatchAsync_rank_0_cptr
      type(c_ptr) :: dsts
      type(c_ptr) :: srcs
      integer(c_size_t),target :: sizes
      integer(c_size_t) :: count
      type(hipMemcpyAttributes) :: attrs
      integer(c_size_t),target :: attrsIdxs
      integer(c_size_t) :: numAttrs
      integer(c_size_t),target :: failIdx
      type(c_ptr) :: stream
      !
      hipMemcpyBatchAsync_rank_0_cptr = hipMemcpyBatchAsync_(dsts,srcs,c_loc(sizes),count,attrs, &
        c_loc(attrsIdxs),numAttrs,c_loc(failIdx),stream)
    end function

    function hipMemcpyBatchAsync_rank_1(dsts,srcs,sizes,count,attrs,attrsIdxs,numAttrs,failIdx, &
        stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyBatchAsync_rank_1
      type(c_ptr) :: dsts
      type(c_ptr) :: srcs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      type(hipMemcpyAttributes) :: attrs
      integer(c_size_t),target,dimension(:) :: attrsIdxs
      integer(c_size_t) :: numAttrs
      integer(c_size_t),target,dimension(:) :: failIdx
      type(hipStream_t) :: stream
      !
      hipMemcpyBatchAsync_rank_1 = hipMemcpyBatchAsync_(dsts,srcs,c_loc(sizes),count,attrs, &
        c_loc(attrsIdxs),numAttrs,c_loc(failIdx),stream%ptr)
    end function

    function hipMemcpyBatchAsync_rank_1_cptr(dsts,srcs,sizes,count,attrs,attrsIdxs,numAttrs, &
        failIdx,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpyBatchAsync_rank_1_cptr
      type(c_ptr) :: dsts
      type(c_ptr) :: srcs
      integer(c_size_t),target,dimension(:) :: sizes
      integer(c_size_t) :: count
      type(hipMemcpyAttributes) :: attrs
      integer(c_size_t),target,dimension(:) :: attrsIdxs
      integer(c_size_t) :: numAttrs
      integer(c_size_t),target,dimension(:) :: failIdx
      type(c_ptr) :: stream
      !
      hipMemcpyBatchAsync_rank_1_cptr = hipMemcpyBatchAsync_(dsts,srcs,c_loc(sizes),count,attrs, &
        c_loc(attrsIdxs),numAttrs,c_loc(failIdx),stream)
    end function

#endif
    function hipMemcpyBatchAsync_typed(dsts, srcs, sizes, count, attrs, attrsIdxs, numAttrs, &
        failIdx, stream) result(MemcpyBatchAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: dsts
      type(c_ptr) :: srcs
      type(c_ptr), value :: sizes
      integer(c_size_t), value :: count
      type(hipMemcpyAttributes) :: attrs
      type(c_ptr), value :: attrsIdxs
      integer(c_size_t), value :: numAttrs
      type(c_ptr), value :: failIdx
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyBatchAsync
      MemcpyBatchAsync = hipMemcpyBatchAsync_(dsts, srcs, sizes, count, attrs, attrsIdxs, &
        numAttrs, failIdx, stream%ptr)
    end function hipMemcpyBatchAsync_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipMemcpy3DBatchAsync_assumed_rank(numOps,opList,failIdx,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3DBatchAsync_assumed_rank
      integer(c_size_t) :: numOps
      type(hipMemcpy3DBatchOp) :: opList
      integer(c_size_t),target,contiguous,dimension(..) :: failIdx
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemcpy3DBatchAsync_assumed_rank = hipMemcpy3DBatchAsync_(numOps,opList,c_loc(failIdx), &
        flags,stream%ptr)
    end function

    function hipMemcpy3DBatchAsync_assumed_rank_cptr(numOps,opList,failIdx,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3DBatchAsync_assumed_rank_cptr
      integer(c_size_t) :: numOps
      type(hipMemcpy3DBatchOp) :: opList
      integer(c_size_t),target,contiguous,dimension(..) :: failIdx
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemcpy3DBatchAsync_assumed_rank_cptr = hipMemcpy3DBatchAsync_(numOps,opList, &
        c_loc(failIdx),flags,stream)
    end function

#else
    function hipMemcpy3DBatchAsync_rank_0(numOps,opList,failIdx,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3DBatchAsync_rank_0
      integer(c_size_t) :: numOps
      type(hipMemcpy3DBatchOp) :: opList
      integer(c_size_t),target :: failIdx
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemcpy3DBatchAsync_rank_0 = hipMemcpy3DBatchAsync_(numOps,opList,c_loc(failIdx),flags, &
        stream%ptr)
    end function

    function hipMemcpy3DBatchAsync_rank_0_cptr(numOps,opList,failIdx,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3DBatchAsync_rank_0_cptr
      integer(c_size_t) :: numOps
      type(hipMemcpy3DBatchOp) :: opList
      integer(c_size_t),target :: failIdx
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemcpy3DBatchAsync_rank_0_cptr = hipMemcpy3DBatchAsync_(numOps,opList,c_loc(failIdx), &
        flags,stream)
    end function

    function hipMemcpy3DBatchAsync_rank_1(numOps,opList,failIdx,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3DBatchAsync_rank_1
      integer(c_size_t) :: numOps
      type(hipMemcpy3DBatchOp) :: opList
      integer(c_size_t),target,dimension(:) :: failIdx
      integer(c_int64_t) :: flags
      type(hipStream_t) :: stream
      !
      hipMemcpy3DBatchAsync_rank_1 = hipMemcpy3DBatchAsync_(numOps,opList,c_loc(failIdx),flags, &
        stream%ptr)
    end function

    function hipMemcpy3DBatchAsync_rank_1_cptr(numOps,opList,failIdx,flags,stream)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemcpy3DBatchAsync_rank_1_cptr
      integer(c_size_t) :: numOps
      type(hipMemcpy3DBatchOp) :: opList
      integer(c_size_t),target,dimension(:) :: failIdx
      integer(c_int64_t) :: flags
      type(c_ptr) :: stream
      !
      hipMemcpy3DBatchAsync_rank_1_cptr = hipMemcpy3DBatchAsync_(numOps,opList,c_loc(failIdx), &
        flags,stream)
    end function

#endif
    function hipMemcpy3DBatchAsync_typed(numOps, opList, failIdx, flags, &
        stream) result(Memcpy3DBatchAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_size_t), value :: numOps
      type(hipMemcpy3DBatchOp) :: opList
      type(c_ptr), value :: failIdx
      integer(c_int64_t), value :: flags
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memcpy3DBatchAsync
      Memcpy3DBatchAsync = hipMemcpy3DBatchAsync_(numOps, opList, failIdx, flags, stream%ptr)
    end function hipMemcpy3DBatchAsync_typed

    function hipMemcpy3DPeerAsync_typed(p, stream) result(Memcpy3DPeerAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemcpy3DPeerParms) :: p
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memcpy3DPeerAsync
      Memcpy3DPeerAsync = hipMemcpy3DPeerAsync_(p, stream%ptr)
    end function hipMemcpy3DPeerAsync_typed

    function hipMemcpyPeerAsync_typed(dst, dstDeviceId, src, srcDevice, sizeBytes, &
        stream) result(MemcpyPeerAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_int), value :: dstDeviceId
      type(c_ptr), value :: src
      integer(c_int), value :: srcDevice
      integer(c_size_t), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyPeerAsync
      MemcpyPeerAsync = hipMemcpyPeerAsync_(dst, dstDeviceId, src, srcDevice, sizeBytes, stream%ptr)
    end function hipMemcpyPeerAsync_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipDevSmResourceSplitByCount_assumed_rank(myResult,nbGroups,input,remainder,flags, &
        minCount)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDevSmResourceSplitByCount_assumed_rank
      type(hipDevResource) :: myResult
      integer(c_int),target,contiguous,dimension(..) :: nbGroups
      type(hipDevResource) :: input
      type(hipDevResource) :: remainder
      integer(c_int) :: flags
      integer(c_int) :: minCount
      !
      hipDevSmResourceSplitByCount_assumed_rank = hipDevSmResourceSplitByCount_(myResult, &
        c_loc(nbGroups),input,remainder,flags,minCount)
    end function

#else
    function hipDevSmResourceSplitByCount_rank_0(myResult,nbGroups,input,remainder,flags,minCount)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDevSmResourceSplitByCount_rank_0
      type(hipDevResource) :: myResult
      integer(c_int),target :: nbGroups
      type(hipDevResource) :: input
      type(hipDevResource) :: remainder
      integer(c_int) :: flags
      integer(c_int) :: minCount
      !
      hipDevSmResourceSplitByCount_rank_0 = hipDevSmResourceSplitByCount_(myResult, &
        c_loc(nbGroups),input,remainder,flags,minCount)
    end function

    function hipDevSmResourceSplitByCount_rank_1(myResult,nbGroups,input,remainder,flags,minCount)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipDevSmResourceSplitByCount_rank_1
      type(hipDevResource) :: myResult
      integer(c_int),target,dimension(:) :: nbGroups
      type(hipDevResource) :: input
      type(hipDevResource) :: remainder
      integer(c_int) :: flags
      integer(c_int) :: minCount
      !
      hipDevSmResourceSplitByCount_rank_1 = hipDevSmResourceSplitByCount_(myResult, &
        c_loc(nbGroups),input,remainder,flags,minCount)
    end function

#endif
    function hipExecutionCtxStreamCreate_typed(stream, greenctx, flags, &
        priority) result(ExecutionCtxStreamCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t) :: stream
      type(c_ptr), value :: greenctx
      integer(c_int), value :: flags
      integer(c_int), value :: priority
      integer(kind(hipSuccess)) :: ExecutionCtxStreamCreate
      ExecutionCtxStreamCreate = hipExecutionCtxStreamCreate_(stream%ptr, greenctx, flags, priority)
    end function hipExecutionCtxStreamCreate_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipExecutionCtxGetDevice_assumed_rank(device,ctx)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExecutionCtxGetDevice_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: device
      type(c_ptr) :: ctx
      !
      hipExecutionCtxGetDevice_assumed_rank = hipExecutionCtxGetDevice_(c_loc(device),ctx)
    end function

#else
    function hipExecutionCtxGetDevice_rank_0(device,ctx)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExecutionCtxGetDevice_rank_0
      integer(c_int),target :: device
      type(c_ptr) :: ctx
      !
      hipExecutionCtxGetDevice_rank_0 = hipExecutionCtxGetDevice_(c_loc(device),ctx)
    end function

    function hipExecutionCtxGetDevice_rank_1(device,ctx)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExecutionCtxGetDevice_rank_1
      integer(c_int),target,dimension(:) :: device
      type(c_ptr) :: ctx
      !
      hipExecutionCtxGetDevice_rank_1 = hipExecutionCtxGetDevice_(c_loc(device),ctx)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipExecutionCtxGetId_assumed_rank(ctx,ctxId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExecutionCtxGetId_assumed_rank
      type(c_ptr) :: ctx
      integer(c_int64_t),target,contiguous,dimension(..) :: ctxId
      !
      hipExecutionCtxGetId_assumed_rank = hipExecutionCtxGetId_(ctx,c_loc(ctxId))
    end function

#else
    function hipExecutionCtxGetId_rank_0(ctx,ctxId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExecutionCtxGetId_rank_0
      type(c_ptr) :: ctx
      integer(c_int64_t),target :: ctxId
      !
      hipExecutionCtxGetId_rank_0 = hipExecutionCtxGetId_(ctx,c_loc(ctxId))
    end function

    function hipExecutionCtxGetId_rank_1(ctx,ctxId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipExecutionCtxGetId_rank_1
      type(c_ptr) :: ctx
      integer(c_int64_t),target,dimension(:) :: ctxId
      !
      hipExecutionCtxGetId_rank_1 = hipExecutionCtxGetId_(ctx,c_loc(ctxId))
    end function

#endif
    function hipStreamGetDevResource_typed(hStream, resource, myType) result(StreamGetDevResource)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: hStream
      type(hipDevResource) :: resource
      integer(kind(hipDevResourceTypeInvalid)), value :: myType
      integer(kind(hipSuccess)) :: StreamGetDevResource
      StreamGetDevResource = hipStreamGetDevResource_(hStream%ptr, resource, myType)
    end function hipStreamGetDevResource_typed

    function hipExecutionCtxRecordEvent_typed(ctx, event) result(ExecutionCtxRecordEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: ctx
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: ExecutionCtxRecordEvent
      ExecutionCtxRecordEvent = hipExecutionCtxRecordEvent_(ctx, event%ptr)
    end function hipExecutionCtxRecordEvent_typed

    function hipExecutionCtxWaitEvent_typed(ctx, event) result(ExecutionCtxWaitEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: ctx
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: ExecutionCtxWaitEvent
      ExecutionCtxWaitEvent = hipExecutionCtxWaitEvent_(ctx, event%ptr)
    end function hipExecutionCtxWaitEvent_typed

    function hipCtxCreate_typed(ctx, flags, device) result(CtxCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t) :: ctx
      integer(c_int), value :: flags
      integer(c_int), value :: device
      integer(kind(hipSuccess)) :: CtxCreate
      CtxCreate = hipCtxCreate_(ctx%ptr, flags, device)
    end function hipCtxCreate_typed

    function hipCtxDestroy_typed(ctx) result(CtxDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: ctx
      integer(kind(hipSuccess)) :: CtxDestroy
      CtxDestroy = hipCtxDestroy_(ctx%ptr)
    end function hipCtxDestroy_typed

    function hipCtxPopCurrent_typed(ctx) result(CtxPopCurrent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t) :: ctx
      integer(kind(hipSuccess)) :: CtxPopCurrent
      CtxPopCurrent = hipCtxPopCurrent_(ctx%ptr)
    end function hipCtxPopCurrent_typed

    function hipCtxPushCurrent_typed(ctx) result(CtxPushCurrent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: ctx
      integer(kind(hipSuccess)) :: CtxPushCurrent
      CtxPushCurrent = hipCtxPushCurrent_(ctx%ptr)
    end function hipCtxPushCurrent_typed

    function hipCtxSetCurrent_typed(ctx) result(CtxSetCurrent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: ctx
      integer(kind(hipSuccess)) :: CtxSetCurrent
      CtxSetCurrent = hipCtxSetCurrent_(ctx%ptr)
    end function hipCtxSetCurrent_typed

    function hipCtxGetCurrent_typed(ctx) result(CtxGetCurrent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t) :: ctx
      integer(kind(hipSuccess)) :: CtxGetCurrent
      CtxGetCurrent = hipCtxGetCurrent_(ctx%ptr)
    end function hipCtxGetCurrent_typed

    function hipCtxGetApiVersion_typed(ctx, apiVersion) result(CtxGetApiVersion)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: ctx
      integer(c_int) :: apiVersion
      integer(kind(hipSuccess)) :: CtxGetApiVersion
      CtxGetApiVersion = hipCtxGetApiVersion_(ctx%ptr, apiVersion)
    end function hipCtxGetApiVersion_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipCtxGetCacheConfig_assumed_rank(cacheConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetCacheConfig_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: cacheConfig
      !
      hipCtxGetCacheConfig_assumed_rank = hipCtxGetCacheConfig_(c_loc(cacheConfig))
    end function

#else
    function hipCtxGetCacheConfig_rank_0(cacheConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetCacheConfig_rank_0
      integer(c_int),target :: cacheConfig
      !
      hipCtxGetCacheConfig_rank_0 = hipCtxGetCacheConfig_(c_loc(cacheConfig))
    end function

    function hipCtxGetCacheConfig_rank_1(cacheConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetCacheConfig_rank_1
      integer(c_int),target,dimension(:) :: cacheConfig
      !
      hipCtxGetCacheConfig_rank_1 = hipCtxGetCacheConfig_(c_loc(cacheConfig))
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipCtxGetSharedMemConfig_assumed_rank(pConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetSharedMemConfig_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: pConfig
      !
      hipCtxGetSharedMemConfig_assumed_rank = hipCtxGetSharedMemConfig_(c_loc(pConfig))
    end function

#else
    function hipCtxGetSharedMemConfig_rank_0(pConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetSharedMemConfig_rank_0
      integer(c_int),target :: pConfig
      !
      hipCtxGetSharedMemConfig_rank_0 = hipCtxGetSharedMemConfig_(c_loc(pConfig))
    end function

    function hipCtxGetSharedMemConfig_rank_1(pConfig)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipCtxGetSharedMemConfig_rank_1
      integer(c_int),target,dimension(:) :: pConfig
      !
      hipCtxGetSharedMemConfig_rank_1 = hipCtxGetSharedMemConfig_(c_loc(pConfig))
    end function

#endif
    function hipCtxEnablePeerAccess_typed(peerCtx, flags) result(CtxEnablePeerAccess)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: peerCtx
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: CtxEnablePeerAccess
      CtxEnablePeerAccess = hipCtxEnablePeerAccess_(peerCtx%ptr, flags)
    end function hipCtxEnablePeerAccess_typed

    function hipCtxDisablePeerAccess_typed(peerCtx) result(CtxDisablePeerAccess)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t), value :: peerCtx
      integer(kind(hipSuccess)) :: CtxDisablePeerAccess
      CtxDisablePeerAccess = hipCtxDisablePeerAccess_(peerCtx%ptr)
    end function hipCtxDisablePeerAccess_typed

    function hipDevicePrimaryCtxRetain_typed(pctx, dev) result(DevicePrimaryCtxRetain)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipCtx_t) :: pctx
      integer(c_int), value :: dev
      integer(kind(hipSuccess)) :: DevicePrimaryCtxRetain
      DevicePrimaryCtxRetain = hipDevicePrimaryCtxRetain_(pctx%ptr, dev)
    end function hipDevicePrimaryCtxRetain_typed

    function hipModuleLoadFatBinary_typed(myModule, fatbin) result(ModuleLoadFatBinary)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipModule_t) :: myModule
      type(c_ptr), value :: fatbin
      integer(kind(hipSuccess)) :: ModuleLoadFatBinary
      ModuleLoadFatBinary = hipModuleLoadFatBinary_(myModule%ptr, fatbin)
    end function hipModuleLoadFatBinary_typed

    function hipModuleLoad_typed(myModule, fname) result(ModuleLoad)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipModule_t) :: myModule
      type(c_ptr), value :: fname
      integer(kind(hipSuccess)) :: ModuleLoad
      ModuleLoad = hipModuleLoad_(myModule%ptr, fname)
    end function hipModuleLoad_typed

    function hipModuleLoad_cstr(myModule, fname) result(ModuleLoad)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: myModule
      character(len=*), intent(in) :: fname
      integer(kind(hipSuccess)) :: ModuleLoad
      character(len=len_trim(fname)+1, kind=c_char), target :: fname__c
      fname__c = trim(fname)//c_null_char
      ModuleLoad = hipModuleLoad_(myModule, c_loc(fname__c))
    end function hipModuleLoad_cstr

    function hipModuleUnload_typed(myModule) result(ModuleUnload)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipModule_t), value :: myModule
      integer(kind(hipSuccess)) :: ModuleUnload
      ModuleUnload = hipModuleUnload_(myModule%ptr)
    end function hipModuleUnload_typed

    function hipModuleGetFunction_typed(myFunction, myModule, kname) result(ModuleGetFunction)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipFunction_t) :: myFunction
      type(hipModule_t), value :: myModule
      type(c_ptr), value :: kname
      integer(kind(hipSuccess)) :: ModuleGetFunction
      ModuleGetFunction = hipModuleGetFunction_(myFunction%ptr, myModule%ptr, kname)
    end function hipModuleGetFunction_typed

    function hipModuleGetFunction_cstr(myFunction, myModule, kname) result(ModuleGetFunction)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: myFunction
      type(c_ptr), value :: myModule
      character(len=*), intent(in) :: kname
      integer(kind(hipSuccess)) :: ModuleGetFunction
      character(len=len_trim(kname)+1, kind=c_char), target :: kname__c
      kname__c = trim(kname)//c_null_char
      ModuleGetFunction = hipModuleGetFunction_(myFunction, myModule, c_loc(kname__c))
    end function hipModuleGetFunction_cstr

    function hipModuleGetFunctionCount_typed(count, mod) result(ModuleGetFunctionCount)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int) :: count
      type(hipModule_t), value :: mod
      integer(kind(hipSuccess)) :: ModuleGetFunctionCount
      ModuleGetFunctionCount = hipModuleGetFunctionCount_(count, mod%ptr)
    end function hipModuleGetFunctionCount_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipKernelGetAttribute_assumed_rank(pi,attrib,kernel,dev)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipKernelGetAttribute_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: pi
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)) :: attrib
      type(c_ptr) :: kernel
      integer(c_int) :: dev
      !
      hipKernelGetAttribute_assumed_rank = hipKernelGetAttribute_(c_loc(pi),attrib,kernel,dev)
    end function

#else
    function hipKernelGetAttribute_rank_0(pi,attrib,kernel,dev)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipKernelGetAttribute_rank_0
      integer(c_int),target :: pi
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)) :: attrib
      type(c_ptr) :: kernel
      integer(c_int) :: dev
      !
      hipKernelGetAttribute_rank_0 = hipKernelGetAttribute_(c_loc(pi),attrib,kernel,dev)
    end function

    function hipKernelGetAttribute_rank_1(pi,attrib,kernel,dev)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipKernelGetAttribute_rank_1
      integer(c_int),target,dimension(:) :: pi
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)) :: attrib
      type(c_ptr) :: kernel
      integer(c_int) :: dev
      !
      hipKernelGetAttribute_rank_1 = hipKernelGetAttribute_(c_loc(pi),attrib,kernel,dev)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipLibraryLoadData_assumed_rank(library,code,jitOptions,jitOptionsValues, &
        numJitOptions,libraryOptions,libraryOptionValues,numLibraryOptions)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryLoadData_assumed_rank
      type(c_ptr) :: library
      type(c_ptr) :: code
      integer(c_int),target,contiguous,dimension(..) :: jitOptions
      type(c_ptr) :: jitOptionsValues
      integer(c_int) :: numJitOptions
      integer(c_int),target,contiguous,dimension(..) :: libraryOptions
      type(c_ptr) :: libraryOptionValues
      integer(c_int) :: numLibraryOptions
      !
      hipLibraryLoadData_assumed_rank = hipLibraryLoadData_(library,code,c_loc(jitOptions), &
        jitOptionsValues,numJitOptions,c_loc(libraryOptions),libraryOptionValues,numLibraryOptions)
    end function

#else
    function hipLibraryLoadData_rank_0(library,code,jitOptions,jitOptionsValues,numJitOptions, &
        libraryOptions,libraryOptionValues,numLibraryOptions)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryLoadData_rank_0
      type(c_ptr) :: library
      type(c_ptr) :: code
      integer(c_int),target :: jitOptions
      type(c_ptr) :: jitOptionsValues
      integer(c_int) :: numJitOptions
      integer(c_int),target :: libraryOptions
      type(c_ptr) :: libraryOptionValues
      integer(c_int) :: numLibraryOptions
      !
      hipLibraryLoadData_rank_0 = hipLibraryLoadData_(library,code,c_loc(jitOptions), &
        jitOptionsValues,numJitOptions,c_loc(libraryOptions),libraryOptionValues,numLibraryOptions)
    end function

    function hipLibraryLoadData_rank_1(library,code,jitOptions,jitOptionsValues,numJitOptions, &
        libraryOptions,libraryOptionValues,numLibraryOptions)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryLoadData_rank_1
      type(c_ptr) :: library
      type(c_ptr) :: code
      integer(c_int),target,dimension(:) :: jitOptions
      type(c_ptr) :: jitOptionsValues
      integer(c_int) :: numJitOptions
      integer(c_int),target,dimension(:) :: libraryOptions
      type(c_ptr) :: libraryOptionValues
      integer(c_int) :: numLibraryOptions
      !
      hipLibraryLoadData_rank_1 = hipLibraryLoadData_(library,code,c_loc(jitOptions), &
        jitOptionsValues,numJitOptions,c_loc(libraryOptions),libraryOptionValues,numLibraryOptions)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipLibraryLoadFromFile_assumed_rank(library,fileName,jitOptions,jitOptionsValues, &
        numJitOptions,libraryOptions,libraryOptionValues,numLibraryOptions)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryLoadFromFile_assumed_rank
      type(c_ptr) :: library
      type(c_ptr) :: fileName
      integer(c_int),target,contiguous,dimension(..) :: jitOptions
      type(c_ptr) :: jitOptionsValues
      integer(c_int) :: numJitOptions
      integer(c_int),target,contiguous,dimension(..) :: libraryOptions
      type(c_ptr) :: libraryOptionValues
      integer(c_int) :: numLibraryOptions
      !
      hipLibraryLoadFromFile_assumed_rank = hipLibraryLoadFromFile_(library,fileName, &
        c_loc(jitOptions),jitOptionsValues,numJitOptions,c_loc(libraryOptions), &
        libraryOptionValues,numLibraryOptions)
    end function

#else
    function hipLibraryLoadFromFile_rank_0(library,fileName,jitOptions,jitOptionsValues, &
        numJitOptions,libraryOptions,libraryOptionValues,numLibraryOptions)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryLoadFromFile_rank_0
      type(c_ptr) :: library
      type(c_ptr) :: fileName
      integer(c_int),target :: jitOptions
      type(c_ptr) :: jitOptionsValues
      integer(c_int) :: numJitOptions
      integer(c_int),target :: libraryOptions
      type(c_ptr) :: libraryOptionValues
      integer(c_int) :: numLibraryOptions
      !
      hipLibraryLoadFromFile_rank_0 = hipLibraryLoadFromFile_(library,fileName,c_loc(jitOptions), &
        jitOptionsValues,numJitOptions,c_loc(libraryOptions),libraryOptionValues,numLibraryOptions)
    end function

    function hipLibraryLoadFromFile_rank_1(library,fileName,jitOptions,jitOptionsValues, &
        numJitOptions,libraryOptions,libraryOptionValues,numLibraryOptions)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryLoadFromFile_rank_1
      type(c_ptr) :: library
      type(c_ptr) :: fileName
      integer(c_int),target,dimension(:) :: jitOptions
      type(c_ptr) :: jitOptionsValues
      integer(c_int) :: numJitOptions
      integer(c_int),target,dimension(:) :: libraryOptions
      type(c_ptr) :: libraryOptionValues
      integer(c_int) :: numLibraryOptions
      !
      hipLibraryLoadFromFile_rank_1 = hipLibraryLoadFromFile_(library,fileName,c_loc(jitOptions), &
        jitOptionsValues,numJitOptions,c_loc(libraryOptions),libraryOptionValues,numLibraryOptions)
    end function

#endif
    function hipLibraryLoadFromFile_cstr(library, fileName, jitOptions, jitOptionsValues, &
        numJitOptions, libraryOptions, libraryOptionValues, &
        numLibraryOptions) result(LibraryLoadFromFile)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: library
      character(len=*), intent(in) :: fileName
      type(c_ptr), value :: jitOptions
      type(c_ptr) :: jitOptionsValues
      integer(c_int), value :: numJitOptions
      type(c_ptr), value :: libraryOptions
      type(c_ptr) :: libraryOptionValues
      integer(c_int), value :: numLibraryOptions
      integer(kind(hipSuccess)) :: LibraryLoadFromFile
      character(len=len_trim(fileName)+1, kind=c_char), target :: fileName__c
      fileName__c = trim(fileName)//c_null_char
      LibraryLoadFromFile = hipLibraryLoadFromFile_(library, c_loc(fileName__c), jitOptions, &
        jitOptionsValues, numJitOptions, libraryOptions, libraryOptionValues, numLibraryOptions)
    end function hipLibraryLoadFromFile_cstr

    function hipLibraryGetKernel_cstr(pKernel, library, name) result(LibraryGetKernel)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: pKernel
      type(c_ptr), value :: library
      character(len=*), intent(in) :: name
      integer(kind(hipSuccess)) :: LibraryGetKernel
      character(len=len_trim(name)+1, kind=c_char), target :: name__c
      name__c = trim(name)//c_null_char
      LibraryGetKernel = hipLibraryGetKernel_(pKernel, library, c_loc(name__c))
    end function hipLibraryGetKernel_cstr

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipLibraryGetGlobal_assumed_rank(dptr,bytes,library,name)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryGetGlobal_assumed_rank
      type(c_ptr) :: dptr
      integer(c_size_t),target,contiguous,dimension(..) :: bytes
      type(c_ptr) :: library
      type(c_ptr) :: name
      !
      hipLibraryGetGlobal_assumed_rank = hipLibraryGetGlobal_(dptr,c_loc(bytes),library,name)
    end function

#else
    function hipLibraryGetGlobal_rank_0(dptr,bytes,library,name)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryGetGlobal_rank_0
      type(c_ptr) :: dptr
      integer(c_size_t),target :: bytes
      type(c_ptr) :: library
      type(c_ptr) :: name
      !
      hipLibraryGetGlobal_rank_0 = hipLibraryGetGlobal_(dptr,c_loc(bytes),library,name)
    end function

    function hipLibraryGetGlobal_rank_1(dptr,bytes,library,name)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryGetGlobal_rank_1
      type(c_ptr) :: dptr
      integer(c_size_t),target,dimension(:) :: bytes
      type(c_ptr) :: library
      type(c_ptr) :: name
      !
      hipLibraryGetGlobal_rank_1 = hipLibraryGetGlobal_(dptr,c_loc(bytes),library,name)
    end function

#endif
    function hipLibraryGetGlobal_cstr(dptr, bytes, library, name) result(LibraryGetGlobal)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: dptr
      type(c_ptr), value :: bytes
      type(c_ptr), value :: library
      character(len=*), intent(in) :: name
      integer(kind(hipSuccess)) :: LibraryGetGlobal
      character(len=len_trim(name)+1, kind=c_char), target :: name__c
      name__c = trim(name)//c_null_char
      LibraryGetGlobal = hipLibraryGetGlobal_(dptr, bytes, library, c_loc(name__c))
    end function hipLibraryGetGlobal_cstr

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipLibraryGetManaged_assumed_rank(dptr,bytes,library,name)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryGetManaged_assumed_rank
      type(c_ptr) :: dptr
      integer(c_size_t),target,contiguous,dimension(..) :: bytes
      type(c_ptr) :: library
      type(c_ptr) :: name
      !
      hipLibraryGetManaged_assumed_rank = hipLibraryGetManaged_(dptr,c_loc(bytes),library,name)
    end function

#else
    function hipLibraryGetManaged_rank_0(dptr,bytes,library,name)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryGetManaged_rank_0
      type(c_ptr) :: dptr
      integer(c_size_t),target :: bytes
      type(c_ptr) :: library
      type(c_ptr) :: name
      !
      hipLibraryGetManaged_rank_0 = hipLibraryGetManaged_(dptr,c_loc(bytes),library,name)
    end function

    function hipLibraryGetManaged_rank_1(dptr,bytes,library,name)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLibraryGetManaged_rank_1
      type(c_ptr) :: dptr
      integer(c_size_t),target,dimension(:) :: bytes
      type(c_ptr) :: library
      type(c_ptr) :: name
      !
      hipLibraryGetManaged_rank_1 = hipLibraryGetManaged_(dptr,c_loc(bytes),library,name)
    end function

#endif
    function hipLibraryGetManaged_cstr(dptr, bytes, library, name) result(LibraryGetManaged)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: dptr
      type(c_ptr), value :: bytes
      type(c_ptr), value :: library
      character(len=*), intent(in) :: name
      integer(kind(hipSuccess)) :: LibraryGetManaged
      character(len=len_trim(name)+1, kind=c_char), target :: name__c
      name__c = trim(name)//c_null_char
      LibraryGetManaged = hipLibraryGetManaged_(dptr, bytes, library, c_loc(name__c))
    end function hipLibraryGetManaged_cstr

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipKernelGetParamInfo_assumed_rank(kernel,paramIndex,paramOffset,paramSize)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipKernelGetParamInfo_assumed_rank
      type(c_ptr) :: kernel
      integer(c_size_t) :: paramIndex
      integer(c_size_t),target,contiguous,dimension(..) :: paramOffset
      integer(c_size_t),target,contiguous,dimension(..) :: paramSize
      !
      hipKernelGetParamInfo_assumed_rank = hipKernelGetParamInfo_(kernel,paramIndex, &
        c_loc(paramOffset),c_loc(paramSize))
    end function

#else
    function hipKernelGetParamInfo_rank_0(kernel,paramIndex,paramOffset,paramSize)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipKernelGetParamInfo_rank_0
      type(c_ptr) :: kernel
      integer(c_size_t) :: paramIndex
      integer(c_size_t),target :: paramOffset
      integer(c_size_t),target :: paramSize
      !
      hipKernelGetParamInfo_rank_0 = hipKernelGetParamInfo_(kernel,paramIndex,c_loc(paramOffset), &
        c_loc(paramSize))
    end function

    function hipKernelGetParamInfo_rank_1(kernel,paramIndex,paramOffset,paramSize)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipKernelGetParamInfo_rank_1
      type(c_ptr) :: kernel
      integer(c_size_t) :: paramIndex
      integer(c_size_t),target,dimension(:) :: paramOffset
      integer(c_size_t),target,dimension(:) :: paramSize
      !
      hipKernelGetParamInfo_rank_1 = hipKernelGetParamInfo_(kernel,paramIndex,c_loc(paramOffset), &
        c_loc(paramSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipFuncGetAttribute_assumed_rank(myValue,attrib,hfunc)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipFuncGetAttribute_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: myValue
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)) :: attrib
      type(hipFunction_t) :: hfunc
      !
      hipFuncGetAttribute_assumed_rank = hipFuncGetAttribute_(c_loc(myValue),attrib,hfunc%ptr)
    end function

    function hipFuncGetAttribute_assumed_rank_cptr(myValue,attrib,hfunc)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipFuncGetAttribute_assumed_rank_cptr
      integer(c_int),target,contiguous,dimension(..) :: myValue
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)) :: attrib
      type(c_ptr) :: hfunc
      !
      hipFuncGetAttribute_assumed_rank_cptr = hipFuncGetAttribute_(c_loc(myValue),attrib,hfunc)
    end function

#else
    function hipFuncGetAttribute_rank_0(myValue,attrib,hfunc)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipFuncGetAttribute_rank_0
      integer(c_int),target :: myValue
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)) :: attrib
      type(hipFunction_t) :: hfunc
      !
      hipFuncGetAttribute_rank_0 = hipFuncGetAttribute_(c_loc(myValue),attrib,hfunc%ptr)
    end function

    function hipFuncGetAttribute_rank_0_cptr(myValue,attrib,hfunc)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipFuncGetAttribute_rank_0_cptr
      integer(c_int),target :: myValue
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)) :: attrib
      type(c_ptr) :: hfunc
      !
      hipFuncGetAttribute_rank_0_cptr = hipFuncGetAttribute_(c_loc(myValue),attrib,hfunc)
    end function

    function hipFuncGetAttribute_rank_1(myValue,attrib,hfunc)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipFuncGetAttribute_rank_1
      integer(c_int),target,dimension(:) :: myValue
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)) :: attrib
      type(hipFunction_t) :: hfunc
      !
      hipFuncGetAttribute_rank_1 = hipFuncGetAttribute_(c_loc(myValue),attrib,hfunc%ptr)
    end function

    function hipFuncGetAttribute_rank_1_cptr(myValue,attrib,hfunc)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipFuncGetAttribute_rank_1_cptr
      integer(c_int),target,dimension(:) :: myValue
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)) :: attrib
      type(c_ptr) :: hfunc
      !
      hipFuncGetAttribute_rank_1_cptr = hipFuncGetAttribute_(c_loc(myValue),attrib,hfunc)
    end function

#endif
    function hipFuncGetAttribute_typed(myValue, attrib, hfunc) result(FuncGetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: myValue
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)), value :: attrib
      type(hipFunction_t), value :: hfunc
      integer(kind(hipSuccess)) :: FuncGetAttribute
      FuncGetAttribute = hipFuncGetAttribute_(myValue, attrib, hfunc%ptr)
    end function hipFuncGetAttribute_typed

    function hipGetFuncBySymbol_typed(functionPtr, symbolPtr) result(GetFuncBySymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipFunction_t) :: functionPtr
      type(c_ptr), value :: symbolPtr
      integer(kind(hipSuccess)) :: GetFuncBySymbol
      GetFuncBySymbol = hipGetFuncBySymbol_(functionPtr%ptr, symbolPtr)
    end function hipGetFuncBySymbol_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGetDriverEntryPoint_assumed_rank(symbol,funcPtr,flags,driverStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetDriverEntryPoint_assumed_rank
      type(c_ptr) :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t) :: flags
      integer(c_int),target,contiguous,dimension(..) :: driverStatus
      !
      hipGetDriverEntryPoint_assumed_rank = hipGetDriverEntryPoint_(symbol,funcPtr,flags, &
        c_loc(driverStatus))
    end function

#else
    function hipGetDriverEntryPoint_rank_0(symbol,funcPtr,flags,driverStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetDriverEntryPoint_rank_0
      type(c_ptr) :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t) :: flags
      integer(c_int),target :: driverStatus
      !
      hipGetDriverEntryPoint_rank_0 = hipGetDriverEntryPoint_(symbol,funcPtr,flags, &
        c_loc(driverStatus))
    end function

    function hipGetDriverEntryPoint_rank_1(symbol,funcPtr,flags,driverStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetDriverEntryPoint_rank_1
      type(c_ptr) :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t) :: flags
      integer(c_int),target,dimension(:) :: driverStatus
      !
      hipGetDriverEntryPoint_rank_1 = hipGetDriverEntryPoint_(symbol,funcPtr,flags, &
        c_loc(driverStatus))
    end function

#endif
    function hipGetDriverEntryPoint_cstr(symbol, funcPtr, flags, &
        driverStatus) result(GetDriverEntryPoint)
      use, intrinsic :: iso_c_binding
      implicit none
      character(len=*), intent(in) :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t), value :: flags
      type(c_ptr), value :: driverStatus
      integer(kind(hipSuccess)) :: GetDriverEntryPoint
      character(len=len_trim(symbol)+1, kind=c_char), target :: symbol__c
      symbol__c = trim(symbol)//c_null_char
      GetDriverEntryPoint = hipGetDriverEntryPoint_(c_loc(symbol__c), funcPtr, flags, driverStatus)
    end function hipGetDriverEntryPoint_cstr

    function hipModuleGetTexRef_typed(texRef, hmod, name) result(ModuleGetTexRef)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr) :: texRef
      type(hipModule_t), value :: hmod
      type(c_ptr), value :: name
      integer(kind(hipSuccess)) :: ModuleGetTexRef
      ModuleGetTexRef = hipModuleGetTexRef_(texRef, hmod%ptr, name)
    end function hipModuleGetTexRef_typed

    function hipModuleGetTexRef_cstr(texRef, hmod, name) result(ModuleGetTexRef)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: texRef
      type(c_ptr), value :: hmod
      character(len=*), intent(in) :: name
      integer(kind(hipSuccess)) :: ModuleGetTexRef
      character(len=len_trim(name)+1, kind=c_char), target :: name__c
      name__c = trim(name)//c_null_char
      ModuleGetTexRef = hipModuleGetTexRef_(texRef, hmod, c_loc(name__c))
    end function hipModuleGetTexRef_cstr

    function hipModuleLoadData_typed(myModule, image) result(ModuleLoadData)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipModule_t) :: myModule
      type(c_ptr), value :: image
      integer(kind(hipSuccess)) :: ModuleLoadData
      ModuleLoadData = hipModuleLoadData_(myModule%ptr, image)
    end function hipModuleLoadData_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipModuleLoadDataEx_assumed_rank(myModule,image,numOptions,options,optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoadDataEx_assumed_rank
      type(hipModule_t) :: myModule
      type(c_ptr) :: image
      integer(c_int) :: numOptions
      integer(c_int),target,contiguous,dimension(..) :: options
      type(c_ptr) :: optionValues
      !
      hipModuleLoadDataEx_assumed_rank = hipModuleLoadDataEx_(myModule%ptr,image,numOptions, &
        c_loc(options),optionValues)
    end function

    function hipModuleLoadDataEx_assumed_rank_cptr(myModule,image,numOptions,options,optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoadDataEx_assumed_rank_cptr
      type(c_ptr) :: myModule
      type(c_ptr) :: image
      integer(c_int) :: numOptions
      integer(c_int),target,contiguous,dimension(..) :: options
      type(c_ptr) :: optionValues
      !
      hipModuleLoadDataEx_assumed_rank_cptr = hipModuleLoadDataEx_(myModule,image,numOptions, &
        c_loc(options),optionValues)
    end function

#else
    function hipModuleLoadDataEx_rank_0(myModule,image,numOptions,options,optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoadDataEx_rank_0
      type(hipModule_t) :: myModule
      type(c_ptr) :: image
      integer(c_int) :: numOptions
      integer(c_int),target :: options
      type(c_ptr) :: optionValues
      !
      hipModuleLoadDataEx_rank_0 = hipModuleLoadDataEx_(myModule%ptr,image,numOptions, &
        c_loc(options),optionValues)
    end function

    function hipModuleLoadDataEx_rank_0_cptr(myModule,image,numOptions,options,optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoadDataEx_rank_0_cptr
      type(c_ptr) :: myModule
      type(c_ptr) :: image
      integer(c_int) :: numOptions
      integer(c_int),target :: options
      type(c_ptr) :: optionValues
      !
      hipModuleLoadDataEx_rank_0_cptr = hipModuleLoadDataEx_(myModule,image,numOptions, &
        c_loc(options),optionValues)
    end function

    function hipModuleLoadDataEx_rank_1(myModule,image,numOptions,options,optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoadDataEx_rank_1
      type(hipModule_t) :: myModule
      type(c_ptr) :: image
      integer(c_int) :: numOptions
      integer(c_int),target,dimension(:) :: options
      type(c_ptr) :: optionValues
      !
      hipModuleLoadDataEx_rank_1 = hipModuleLoadDataEx_(myModule%ptr,image,numOptions, &
        c_loc(options),optionValues)
    end function

    function hipModuleLoadDataEx_rank_1_cptr(myModule,image,numOptions,options,optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipModuleLoadDataEx_rank_1_cptr
      type(c_ptr) :: myModule
      type(c_ptr) :: image
      integer(c_int) :: numOptions
      integer(c_int),target,dimension(:) :: options
      type(c_ptr) :: optionValues
      !
      hipModuleLoadDataEx_rank_1_cptr = hipModuleLoadDataEx_(myModule,image,numOptions, &
        c_loc(options),optionValues)
    end function

#endif
    function hipModuleLoadDataEx_typed(myModule, image, numOptions, options, &
        optionValues) result(ModuleLoadDataEx)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipModule_t) :: myModule
      type(c_ptr), value :: image
      integer(c_int), value :: numOptions
      type(c_ptr), value :: options
      type(c_ptr) :: optionValues
      integer(kind(hipSuccess)) :: ModuleLoadDataEx
      ModuleLoadDataEx = hipModuleLoadDataEx_(myModule%ptr, image, numOptions, options, &
        optionValues)
    end function hipModuleLoadDataEx_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipLinkAddData_assumed_rank(state,myType,myData,mySize,name,numOptions,options, &
        optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkAddData_assumed_rank
      type(c_ptr) :: state
      integer(kind(hipJitInputCubin)) :: myType
      type(c_ptr) :: myData
      integer(c_size_t) :: mySize
      type(c_ptr) :: name
      integer(c_int) :: numOptions
      integer(c_int),target,contiguous,dimension(..) :: options
      type(c_ptr) :: optionValues
      !
      hipLinkAddData_assumed_rank = hipLinkAddData_(state,myType,myData,mySize,name,numOptions, &
        c_loc(options),optionValues)
    end function

#else
    function hipLinkAddData_rank_0(state,myType,myData,mySize,name,numOptions,options,optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkAddData_rank_0
      type(c_ptr) :: state
      integer(kind(hipJitInputCubin)) :: myType
      type(c_ptr) :: myData
      integer(c_size_t) :: mySize
      type(c_ptr) :: name
      integer(c_int) :: numOptions
      integer(c_int),target :: options
      type(c_ptr) :: optionValues
      !
      hipLinkAddData_rank_0 = hipLinkAddData_(state,myType,myData,mySize,name,numOptions, &
        c_loc(options),optionValues)
    end function

    function hipLinkAddData_rank_1(state,myType,myData,mySize,name,numOptions,options,optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkAddData_rank_1
      type(c_ptr) :: state
      integer(kind(hipJitInputCubin)) :: myType
      type(c_ptr) :: myData
      integer(c_size_t) :: mySize
      type(c_ptr) :: name
      integer(c_int) :: numOptions
      integer(c_int),target,dimension(:) :: options
      type(c_ptr) :: optionValues
      !
      hipLinkAddData_rank_1 = hipLinkAddData_(state,myType,myData,mySize,name,numOptions, &
        c_loc(options),optionValues)
    end function

#endif
    function hipLinkAddData_cstr(state, myType, myData, mySize, name, numOptions, options, &
        optionValues) result(LinkAddData)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: state
      integer(kind(hipJitInputCubin)), value :: myType
      type(c_ptr), value :: myData
      integer(c_size_t), value :: mySize
      character(len=*), intent(in) :: name
      integer(c_int), value :: numOptions
      type(c_ptr), value :: options
      type(c_ptr) :: optionValues
      integer(kind(hipSuccess)) :: LinkAddData
      character(len=len_trim(name)+1, kind=c_char), target :: name__c
      name__c = trim(name)//c_null_char
      LinkAddData = hipLinkAddData_(state, myType, myData, mySize, c_loc(name__c), numOptions, &
        options, optionValues)
    end function hipLinkAddData_cstr

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipLinkAddFile_assumed_rank(state,myType,path,numOptions,options,optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkAddFile_assumed_rank
      type(c_ptr) :: state
      integer(kind(hipJitInputCubin)) :: myType
      type(c_ptr) :: path
      integer(c_int) :: numOptions
      integer(c_int),target,contiguous,dimension(..) :: options
      type(c_ptr) :: optionValues
      !
      hipLinkAddFile_assumed_rank = hipLinkAddFile_(state,myType,path,numOptions,c_loc(options), &
        optionValues)
    end function

#else
    function hipLinkAddFile_rank_0(state,myType,path,numOptions,options,optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkAddFile_rank_0
      type(c_ptr) :: state
      integer(kind(hipJitInputCubin)) :: myType
      type(c_ptr) :: path
      integer(c_int) :: numOptions
      integer(c_int),target :: options
      type(c_ptr) :: optionValues
      !
      hipLinkAddFile_rank_0 = hipLinkAddFile_(state,myType,path,numOptions,c_loc(options), &
        optionValues)
    end function

    function hipLinkAddFile_rank_1(state,myType,path,numOptions,options,optionValues)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkAddFile_rank_1
      type(c_ptr) :: state
      integer(kind(hipJitInputCubin)) :: myType
      type(c_ptr) :: path
      integer(c_int) :: numOptions
      integer(c_int),target,dimension(:) :: options
      type(c_ptr) :: optionValues
      !
      hipLinkAddFile_rank_1 = hipLinkAddFile_(state,myType,path,numOptions,c_loc(options), &
        optionValues)
    end function

#endif
    function hipLinkAddFile_cstr(state, myType, path, numOptions, options, &
        optionValues) result(LinkAddFile)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: state
      integer(kind(hipJitInputCubin)), value :: myType
      character(len=*), intent(in) :: path
      integer(c_int), value :: numOptions
      type(c_ptr), value :: options
      type(c_ptr) :: optionValues
      integer(kind(hipSuccess)) :: LinkAddFile
      character(len=len_trim(path)+1, kind=c_char), target :: path__c
      path__c = trim(path)//c_null_char
      LinkAddFile = hipLinkAddFile_(state, myType, c_loc(path__c), numOptions, options, &
        optionValues)
    end function hipLinkAddFile_cstr

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipLinkComplete_assumed_rank(state,hipBinOut,sizeOut)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkComplete_assumed_rank
      type(c_ptr) :: state
      type(c_ptr) :: hipBinOut
      integer(c_size_t),target,contiguous,dimension(..) :: sizeOut
      !
      hipLinkComplete_assumed_rank = hipLinkComplete_(state,hipBinOut,c_loc(sizeOut))
    end function

#else
    function hipLinkComplete_rank_0(state,hipBinOut,sizeOut)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkComplete_rank_0
      type(c_ptr) :: state
      type(c_ptr) :: hipBinOut
      integer(c_size_t),target :: sizeOut
      !
      hipLinkComplete_rank_0 = hipLinkComplete_(state,hipBinOut,c_loc(sizeOut))
    end function

    function hipLinkComplete_rank_1(state,hipBinOut,sizeOut)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkComplete_rank_1
      type(c_ptr) :: state
      type(c_ptr) :: hipBinOut
      integer(c_size_t),target,dimension(:) :: sizeOut
      !
      hipLinkComplete_rank_1 = hipLinkComplete_(state,hipBinOut,c_loc(sizeOut))
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipLinkCreate_assumed_rank(numOptions,options,optionValues,stateOut)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkCreate_assumed_rank
      integer(c_int) :: numOptions
      integer(c_int),target,contiguous,dimension(..) :: options
      type(c_ptr) :: optionValues
      type(c_ptr) :: stateOut
      !
      hipLinkCreate_assumed_rank = hipLinkCreate_(numOptions,c_loc(options),optionValues,stateOut)
    end function

#else
    function hipLinkCreate_rank_0(numOptions,options,optionValues,stateOut)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkCreate_rank_0
      integer(c_int) :: numOptions
      integer(c_int),target :: options
      type(c_ptr) :: optionValues
      type(c_ptr) :: stateOut
      !
      hipLinkCreate_rank_0 = hipLinkCreate_(numOptions,c_loc(options),optionValues,stateOut)
    end function

    function hipLinkCreate_rank_1(numOptions,options,optionValues,stateOut)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipLinkCreate_rank_1
      integer(c_int) :: numOptions
      integer(c_int),target,dimension(:) :: options
      type(c_ptr) :: optionValues
      type(c_ptr) :: stateOut
      !
      hipLinkCreate_rank_1 = hipLinkCreate_(numOptions,c_loc(options),optionValues,stateOut)
    end function

#endif
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
      type(c_ptr), value :: extra
      integer(kind(hipSuccess)) :: ModuleLaunchKernel
      ModuleLaunchKernel = hipModuleLaunchKernel_(f%ptr, gridDimX, gridDimY, gridDimZ, blockDimX, &
        blockDimY, blockDimZ, sharedMemBytes, stream%ptr, kernelParams, extra)
    end function hipModuleLaunchKernel_typed

    function hipModuleLaunchCooperativeKernel_typed(f, gridDimX, gridDimY, gridDimZ, blockDimX, &
        blockDimY, blockDimZ, sharedMemBytes, stream, &
        kernelParams) result(ModuleLaunchCooperativeKernel)
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
      integer(kind(hipSuccess)) :: ModuleLaunchCooperativeKernel
      ModuleLaunchCooperativeKernel = hipModuleLaunchCooperativeKernel_(f%ptr, gridDimX, gridDimY, &
        gridDimZ, blockDimX, blockDimY, blockDimZ, sharedMemBytes, stream%ptr, kernelParams)
    end function hipModuleLaunchCooperativeKernel_typed

    function hipLaunchCooperativeKernel_typed(f, gridDim, blockDimX, kernelParams, sharedMemBytes, &
        stream) result(LaunchCooperativeKernel)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: f
      type(dim3), value :: gridDim
      type(dim3), value :: blockDimX
      type(c_ptr) :: kernelParams
      integer(c_int), value :: sharedMemBytes
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: LaunchCooperativeKernel
      LaunchCooperativeKernel = hipLaunchCooperativeKernel_(f, gridDim, blockDimX, kernelParams, &
        sharedMemBytes, stream%ptr)
    end function hipLaunchCooperativeKernel_typed

    function hipDrvLaunchKernelEx_typed(config, f, params, extra) result(DrvLaunchKernelEx)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(HIP_LAUNCH_CONFIG) :: config
      type(hipFunction_t), value :: f
      type(c_ptr) :: params
      type(c_ptr), value :: extra
      integer(kind(hipSuccess)) :: DrvLaunchKernelEx
      DrvLaunchKernelEx = hipDrvLaunchKernelEx_(config, f%ptr, params, extra)
    end function hipDrvLaunchKernelEx_typed

    function hipModuleOccupancyMaxPotentialBlockSize_typed(gridSize, blockSize, f, &
        dynSharedMemPerBlk, blockSizeLimit) result(ModuleOccupancyMaxPotentialBlockSize)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int) :: gridSize
      integer(c_int) :: blockSize
      type(hipFunction_t), value :: f
      integer(c_size_t), value :: dynSharedMemPerBlk
      integer(c_int), value :: blockSizeLimit
      integer(kind(hipSuccess)) :: ModuleOccupancyMaxPotentialBlockSize
      ModuleOccupancyMaxPotentialBlockSize = hipModuleOccupancyMaxPotentialBlockSize_(gridSize, &
        blockSize, f%ptr, dynSharedMemPerBlk, blockSizeLimit)
    end function hipModuleOccupancyMaxPotentialBlockSize_typed

    function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_typed(gridSize, blockSize, f, &
        dynSharedMemPerBlk, blockSizeLimit, &
        flags) result(ModuleOccupancyMaxPotentialBlockSizeWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int) :: gridSize
      integer(c_int) :: blockSize
      type(hipFunction_t), value :: f
      integer(c_size_t), value :: dynSharedMemPerBlk
      integer(c_int), value :: blockSizeLimit
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: ModuleOccupancyMaxPotentialBlockSizeWithFlags
      ModuleOccupancyMaxPotentialBlockSizeWithFlags = &
        hipModuleOccupancyMaxPotentialBlockSizeWithFlags_(gridSize, blockSize, f%ptr, &
        dynSharedMemPerBlk, blockSizeLimit, flags)
    end function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_typed

    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_typed(numBlocks, f, blockSize, &
        dynSharedMemPerBlk) result(ModuleOccupancyMaxActiveBlocksPerMultiprocessor)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int) :: numBlocks
      type(hipFunction_t), value :: f
      integer(c_int), value :: blockSize
      integer(c_size_t), value :: dynSharedMemPerBlk
      integer(kind(hipSuccess)) :: ModuleOccupancyMaxActiveBlocksPerMultiprocessor
      ModuleOccupancyMaxActiveBlocksPerMultiprocessor = &
        hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_(numBlocks, f%ptr, blockSize, &
        dynSharedMemPerBlk)
    end function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_typed

    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFla_typed(numBlocks, f, &
        blockSize, dynSharedMemPerBlk, &
        flags) result(ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int) :: numBlocks
      type(hipFunction_t), value :: f
      integer(c_int), value :: blockSize
      integer(c_size_t), value :: dynSharedMemPerBlk
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
      ModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags = &
        hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_(numBlocks, f%ptr, blockSize, &
        dynSharedMemPerBlk, flags)
    end function hipModuleOccupancyMaxActiveBlocksPerMultiprocessorWithFla_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipOccupancyMaxActiveBlocksPerMultiprocessor_assumed_rank(numBlocks,f,blockSize, &
        dynSharedMemPerBlk)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessor_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: numBlocks
      type(c_funptr) :: f
      integer(c_int) :: blockSize
      integer(c_size_t) :: dynSharedMemPerBlk
      !
      hipOccupancyMaxActiveBlocksPerMultiprocessor_assumed_rank = &
        hipOccupancyMaxActiveBlocksPerMultiprocessor_(c_loc(numBlocks),f,blockSize, &
        dynSharedMemPerBlk)
    end function

#else
    function hipOccupancyMaxActiveBlocksPerMultiprocessor_rank_0(numBlocks,f,blockSize, &
        dynSharedMemPerBlk)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessor_rank_0
      integer(c_int),target :: numBlocks
      type(c_funptr) :: f
      integer(c_int) :: blockSize
      integer(c_size_t) :: dynSharedMemPerBlk
      !
      hipOccupancyMaxActiveBlocksPerMultiprocessor_rank_0 = &
        hipOccupancyMaxActiveBlocksPerMultiprocessor_(c_loc(numBlocks),f,blockSize, &
        dynSharedMemPerBlk)
    end function

    function hipOccupancyMaxActiveBlocksPerMultiprocessor_rank_1(numBlocks,f,blockSize, &
        dynSharedMemPerBlk)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessor_rank_1
      integer(c_int),target,dimension(:) :: numBlocks
      type(c_funptr) :: f
      integer(c_int) :: blockSize
      integer(c_size_t) :: dynSharedMemPerBlk
      !
      hipOccupancyMaxActiveBlocksPerMultiprocessor_rank_1 = &
        hipOccupancyMaxActiveBlocksPerMultiprocessor_(c_loc(numBlocks),f,blockSize, &
        dynSharedMemPerBlk)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipOccupancyMaxActiveBlocksPerMultiprocessorWithFl_assumed_rank(numBlocks,f, &
        blockSize,dynSharedMemPerBlk,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessorWithFl_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: numBlocks
      type(c_funptr) :: f
      integer(c_int) :: blockSize
      integer(c_size_t) :: dynSharedMemPerBlk
      integer(c_int) :: flags
      !
      hipOccupancyMaxActiveBlocksPerMultiprocessorWithFl_assumed_rank = &
        hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_(c_loc(numBlocks),f,blockSize, &
        dynSharedMemPerBlk,flags)
    end function

#else
    function hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_rank_0(numBlocks,f,blockSize, &
        dynSharedMemPerBlk,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_rank_0
      integer(c_int),target :: numBlocks
      type(c_funptr) :: f
      integer(c_int) :: blockSize
      integer(c_size_t) :: dynSharedMemPerBlk
      integer(c_int) :: flags
      !
      hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_rank_0 = &
        hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_(c_loc(numBlocks),f,blockSize, &
        dynSharedMemPerBlk,flags)
    end function

    function hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_rank_1(numBlocks,f,blockSize, &
        dynSharedMemPerBlk,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_rank_1
      integer(c_int),target,dimension(:) :: numBlocks
      type(c_funptr) :: f
      integer(c_int) :: blockSize
      integer(c_size_t) :: dynSharedMemPerBlk
      integer(c_int) :: flags
      !
      hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_rank_1 = &
        hipOccupancyMaxActiveBlocksPerMultiprocessorWithFlags_(c_loc(numBlocks),f,blockSize, &
        dynSharedMemPerBlk,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipOccupancyMaxPotentialBlockSize_assumed_rank(gridSize,blockSize,f, &
        dynSharedMemPerBlk,blockSizeLimit)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxPotentialBlockSize_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: gridSize
      integer(c_int),target,contiguous,dimension(..) :: blockSize
      type(c_funptr) :: f
      integer(c_size_t) :: dynSharedMemPerBlk
      integer(c_int) :: blockSizeLimit
      !
      hipOccupancyMaxPotentialBlockSize_assumed_rank = hipOccupancyMaxPotentialBlockSize_(c_loc( &
        gridSize),c_loc(blockSize),f,dynSharedMemPerBlk,blockSizeLimit)
    end function

#else
    function hipOccupancyMaxPotentialBlockSize_rank_0(gridSize,blockSize,f,dynSharedMemPerBlk, &
        blockSizeLimit)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxPotentialBlockSize_rank_0
      integer(c_int),target :: gridSize
      integer(c_int),target :: blockSize
      type(c_funptr) :: f
      integer(c_size_t) :: dynSharedMemPerBlk
      integer(c_int) :: blockSizeLimit
      !
      hipOccupancyMaxPotentialBlockSize_rank_0 = hipOccupancyMaxPotentialBlockSize_(c_loc( &
        gridSize),c_loc(blockSize),f,dynSharedMemPerBlk,blockSizeLimit)
    end function

    function hipOccupancyMaxPotentialBlockSize_rank_1(gridSize,blockSize,f,dynSharedMemPerBlk, &
        blockSizeLimit)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxPotentialBlockSize_rank_1
      integer(c_int),target,dimension(:) :: gridSize
      integer(c_int),target,dimension(:) :: blockSize
      type(c_funptr) :: f
      integer(c_size_t) :: dynSharedMemPerBlk
      integer(c_int) :: blockSizeLimit
      !
      hipOccupancyMaxPotentialBlockSize_rank_1 = hipOccupancyMaxPotentialBlockSize_(c_loc( &
        gridSize),c_loc(blockSize),f,dynSharedMemPerBlk,blockSizeLimit)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipOccupancyAvailableDynamicSMemPerBlock_assumed_rank(dynamicSmemSize,f,numBlocks, &
        blockSize)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyAvailableDynamicSMemPerBlock_assumed_rank
      integer(c_size_t),target,contiguous,dimension(..) :: dynamicSmemSize
      type(c_funptr) :: f
      integer(c_int) :: numBlocks
      integer(c_int) :: blockSize
      !
      hipOccupancyAvailableDynamicSMemPerBlock_assumed_rank = &
        hipOccupancyAvailableDynamicSMemPerBlock_(c_loc(dynamicSmemSize),f,numBlocks,blockSize)
    end function

#else
    function hipOccupancyAvailableDynamicSMemPerBlock_rank_0(dynamicSmemSize,f,numBlocks,blockSize)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyAvailableDynamicSMemPerBlock_rank_0
      integer(c_size_t),target :: dynamicSmemSize
      type(c_funptr) :: f
      integer(c_int) :: numBlocks
      integer(c_int) :: blockSize
      !
      hipOccupancyAvailableDynamicSMemPerBlock_rank_0 = hipOccupancyAvailableDynamicSMemPerBlock_( &
        c_loc(dynamicSmemSize),f,numBlocks,blockSize)
    end function

    function hipOccupancyAvailableDynamicSMemPerBlock_rank_1(dynamicSmemSize,f,numBlocks,blockSize)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyAvailableDynamicSMemPerBlock_rank_1
      integer(c_size_t),target,dimension(:) :: dynamicSmemSize
      type(c_funptr) :: f
      integer(c_int) :: numBlocks
      integer(c_int) :: blockSize
      !
      hipOccupancyAvailableDynamicSMemPerBlock_rank_1 = hipOccupancyAvailableDynamicSMemPerBlock_( &
        c_loc(dynamicSmemSize),f,numBlocks,blockSize)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipOccupancyMaxActiveClusters_assumed_rank(numClusters,f,config)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveClusters_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: numClusters
      type(c_funptr) :: f
      type(hipLaunchConfig_t) :: config
      !
      hipOccupancyMaxActiveClusters_assumed_rank = hipOccupancyMaxActiveClusters_(c_loc( &
        numClusters),f,config)
    end function

#else
    function hipOccupancyMaxActiveClusters_rank_0(numClusters,f,config)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveClusters_rank_0
      integer(c_int),target :: numClusters
      type(c_funptr) :: f
      type(hipLaunchConfig_t) :: config
      !
      hipOccupancyMaxActiveClusters_rank_0 = hipOccupancyMaxActiveClusters_(c_loc(numClusters),f, &
        config)
    end function

    function hipOccupancyMaxActiveClusters_rank_1(numClusters,f,config)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveClusters_rank_1
      integer(c_int),target,dimension(:) :: numClusters
      type(c_funptr) :: f
      type(hipLaunchConfig_t) :: config
      !
      hipOccupancyMaxActiveClusters_rank_1 = hipOccupancyMaxActiveClusters_(c_loc(numClusters),f, &
        config)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipOccupancyMaxPotentialClusterSize_assumed_rank(clusterSize,f,config)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxPotentialClusterSize_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: clusterSize
      type(c_funptr) :: f
      type(hipLaunchConfig_t) :: config
      !
      hipOccupancyMaxPotentialClusterSize_assumed_rank = hipOccupancyMaxPotentialClusterSize_( &
        c_loc(clusterSize),f,config)
    end function

#else
    function hipOccupancyMaxPotentialClusterSize_rank_0(clusterSize,f,config)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxPotentialClusterSize_rank_0
      integer(c_int),target :: clusterSize
      type(c_funptr) :: f
      type(hipLaunchConfig_t) :: config
      !
      hipOccupancyMaxPotentialClusterSize_rank_0 = hipOccupancyMaxPotentialClusterSize_(c_loc( &
        clusterSize),f,config)
    end function

    function hipOccupancyMaxPotentialClusterSize_rank_1(clusterSize,f,config)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipOccupancyMaxPotentialClusterSize_rank_1
      integer(c_int),target,dimension(:) :: clusterSize
      type(c_funptr) :: f
      type(hipLaunchConfig_t) :: config
      !
      hipOccupancyMaxPotentialClusterSize_rank_1 = hipOccupancyMaxPotentialClusterSize_(c_loc( &
        clusterSize),f,config)
    end function

#endif
    function hipConfigureCall_typed(gridDim, blockDim, sharedMem, stream) result(ConfigureCall)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(dim3), value :: gridDim
      type(dim3), value :: blockDim
      integer(c_size_t), value :: sharedMem
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: ConfigureCall
      ConfigureCall = hipConfigureCall_(gridDim, blockDim, sharedMem, stream%ptr)
    end function hipConfigureCall_typed

    function hipLaunchKernel_typed(function_address, numBlocks, dimBlocks, args, sharedMemBytes, &
        stream) result(LaunchKernel)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: function_address
      type(dim3), value :: numBlocks
      type(dim3), value :: dimBlocks
      type(c_ptr) :: args
      integer(c_size_t), value :: sharedMemBytes
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: LaunchKernel
      LaunchKernel = hipLaunchKernel_(function_address, numBlocks, dimBlocks, args, &
        sharedMemBytes, stream%ptr)
    end function hipLaunchKernel_typed

    function hipLaunchHostFunc_typed(stream, fn, userData) result(LaunchHostFunc)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_funptr), value :: fn
      type(c_ptr), value :: userData
      integer(kind(hipSuccess)) :: LaunchHostFunc
      LaunchHostFunc = hipLaunchHostFunc_(stream%ptr, fn, userData)
    end function hipLaunchHostFunc_typed

    function hipExtLaunchKernel_typed(function_address, numBlocks, dimBlocks, args, &
        sharedMemBytes, stream, startEvent, stopEvent, flags) result(ExtLaunchKernel)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: function_address
      type(dim3), value :: numBlocks
      type(dim3), value :: dimBlocks
      type(c_ptr) :: args
      integer(c_size_t), value :: sharedMemBytes
      type(hipStream_t), value :: stream
      type(hipEvent_t), value :: startEvent
      type(hipEvent_t), value :: stopEvent
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: ExtLaunchKernel
      ExtLaunchKernel = hipExtLaunchKernel_(function_address, numBlocks, dimBlocks, args, &
        sharedMemBytes, stream%ptr, startEvent%ptr, stopEvent%ptr, flags)
    end function hipExtLaunchKernel_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipTexRefGetBorderColor_assumed_rank(pBorderColor,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetBorderColor_assumed_rank
      real(c_float),target,contiguous,dimension(..) :: pBorderColor
      type(textureReference) :: texRef
      !
      hipTexRefGetBorderColor_assumed_rank = hipTexRefGetBorderColor_(c_loc(pBorderColor),texRef)
    end function

#else
    function hipTexRefGetBorderColor_rank_0(pBorderColor,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetBorderColor_rank_0
      real(c_float),target :: pBorderColor
      type(textureReference) :: texRef
      !
      hipTexRefGetBorderColor_rank_0 = hipTexRefGetBorderColor_(c_loc(pBorderColor),texRef)
    end function

    function hipTexRefGetBorderColor_rank_1(pBorderColor,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetBorderColor_rank_1
      real(c_float),target,dimension(:) :: pBorderColor
      type(textureReference) :: texRef
      !
      hipTexRefGetBorderColor_rank_1 = hipTexRefGetBorderColor_(c_loc(pBorderColor),texRef)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipTexRefGetAddressMode_assumed_rank(pam,texRef,dim)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetAddressMode_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: pam
      type(textureReference) :: texRef
      integer(c_int) :: dim
      !
      hipTexRefGetAddressMode_assumed_rank = hipTexRefGetAddressMode_(c_loc(pam),texRef,dim)
    end function

#else
    function hipTexRefGetAddressMode_rank_0(pam,texRef,dim)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetAddressMode_rank_0
      integer(c_int),target :: pam
      type(textureReference) :: texRef
      integer(c_int) :: dim
      !
      hipTexRefGetAddressMode_rank_0 = hipTexRefGetAddressMode_(c_loc(pam),texRef,dim)
    end function

    function hipTexRefGetAddressMode_rank_1(pam,texRef,dim)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetAddressMode_rank_1
      integer(c_int),target,dimension(:) :: pam
      type(textureReference) :: texRef
      integer(c_int) :: dim
      !
      hipTexRefGetAddressMode_rank_1 = hipTexRefGetAddressMode_(c_loc(pam),texRef,dim)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipTexRefGetFilterMode_assumed_rank(pfm,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFilterMode_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: pfm
      type(textureReference) :: texRef
      !
      hipTexRefGetFilterMode_assumed_rank = hipTexRefGetFilterMode_(c_loc(pfm),texRef)
    end function

#else
    function hipTexRefGetFilterMode_rank_0(pfm,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFilterMode_rank_0
      integer(c_int),target :: pfm
      type(textureReference) :: texRef
      !
      hipTexRefGetFilterMode_rank_0 = hipTexRefGetFilterMode_(c_loc(pfm),texRef)
    end function

    function hipTexRefGetFilterMode_rank_1(pfm,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFilterMode_rank_1
      integer(c_int),target,dimension(:) :: pfm
      type(textureReference) :: texRef
      !
      hipTexRefGetFilterMode_rank_1 = hipTexRefGetFilterMode_(c_loc(pfm),texRef)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipTexRefGetFlags_assumed_rank(pFlags,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFlags_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: pFlags
      type(textureReference) :: texRef
      !
      hipTexRefGetFlags_assumed_rank = hipTexRefGetFlags_(c_loc(pFlags),texRef)
    end function

#else
    function hipTexRefGetFlags_rank_0(pFlags,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFlags_rank_0
      integer(c_int),target :: pFlags
      type(textureReference) :: texRef
      !
      hipTexRefGetFlags_rank_0 = hipTexRefGetFlags_(c_loc(pFlags),texRef)
    end function

    function hipTexRefGetFlags_rank_1(pFlags,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFlags_rank_1
      integer(c_int),target,dimension(:) :: pFlags
      type(textureReference) :: texRef
      !
      hipTexRefGetFlags_rank_1 = hipTexRefGetFlags_(c_loc(pFlags),texRef)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipTexRefGetFormat_assumed_rank(pFormat,pNumChannels,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFormat_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: pFormat
      integer(c_int),target,contiguous,dimension(..) :: pNumChannels
      type(textureReference) :: texRef
      !
      hipTexRefGetFormat_assumed_rank = hipTexRefGetFormat_(c_loc(pFormat),c_loc(pNumChannels), &
        texRef)
    end function

#else
    function hipTexRefGetFormat_rank_0(pFormat,pNumChannels,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFormat_rank_0
      integer(c_int),target :: pFormat
      integer(c_int),target :: pNumChannels
      type(textureReference) :: texRef
      !
      hipTexRefGetFormat_rank_0 = hipTexRefGetFormat_(c_loc(pFormat),c_loc(pNumChannels),texRef)
    end function

    function hipTexRefGetFormat_rank_1(pFormat,pNumChannels,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetFormat_rank_1
      integer(c_int),target,dimension(:) :: pFormat
      integer(c_int),target,dimension(:) :: pNumChannels
      type(textureReference) :: texRef
      !
      hipTexRefGetFormat_rank_1 = hipTexRefGetFormat_(c_loc(pFormat),c_loc(pNumChannels),texRef)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipTexRefGetMaxAnisotropy_assumed_rank(pmaxAnsio,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMaxAnisotropy_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: pmaxAnsio
      type(textureReference) :: texRef
      !
      hipTexRefGetMaxAnisotropy_assumed_rank = hipTexRefGetMaxAnisotropy_(c_loc(pmaxAnsio),texRef)
    end function

#else
    function hipTexRefGetMaxAnisotropy_rank_0(pmaxAnsio,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMaxAnisotropy_rank_0
      integer(c_int),target :: pmaxAnsio
      type(textureReference) :: texRef
      !
      hipTexRefGetMaxAnisotropy_rank_0 = hipTexRefGetMaxAnisotropy_(c_loc(pmaxAnsio),texRef)
    end function

    function hipTexRefGetMaxAnisotropy_rank_1(pmaxAnsio,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMaxAnisotropy_rank_1
      integer(c_int),target,dimension(:) :: pmaxAnsio
      type(textureReference) :: texRef
      !
      hipTexRefGetMaxAnisotropy_rank_1 = hipTexRefGetMaxAnisotropy_(c_loc(pmaxAnsio),texRef)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipTexRefGetMipmapFilterMode_assumed_rank(pfm,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapFilterMode_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: pfm
      type(textureReference) :: texRef
      !
      hipTexRefGetMipmapFilterMode_assumed_rank = hipTexRefGetMipmapFilterMode_(c_loc(pfm),texRef)
    end function

#else
    function hipTexRefGetMipmapFilterMode_rank_0(pfm,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapFilterMode_rank_0
      integer(c_int),target :: pfm
      type(textureReference) :: texRef
      !
      hipTexRefGetMipmapFilterMode_rank_0 = hipTexRefGetMipmapFilterMode_(c_loc(pfm),texRef)
    end function

    function hipTexRefGetMipmapFilterMode_rank_1(pfm,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapFilterMode_rank_1
      integer(c_int),target,dimension(:) :: pfm
      type(textureReference) :: texRef
      !
      hipTexRefGetMipmapFilterMode_rank_1 = hipTexRefGetMipmapFilterMode_(c_loc(pfm),texRef)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipTexRefGetMipmapLevelBias_assumed_rank(pbias,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelBias_assumed_rank
      real(c_float),target,contiguous,dimension(..) :: pbias
      type(textureReference) :: texRef
      !
      hipTexRefGetMipmapLevelBias_assumed_rank = hipTexRefGetMipmapLevelBias_(c_loc(pbias),texRef)
    end function

#else
    function hipTexRefGetMipmapLevelBias_rank_0(pbias,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelBias_rank_0
      real(c_float),target :: pbias
      type(textureReference) :: texRef
      !
      hipTexRefGetMipmapLevelBias_rank_0 = hipTexRefGetMipmapLevelBias_(c_loc(pbias),texRef)
    end function

    function hipTexRefGetMipmapLevelBias_rank_1(pbias,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelBias_rank_1
      real(c_float),target,dimension(:) :: pbias
      type(textureReference) :: texRef
      !
      hipTexRefGetMipmapLevelBias_rank_1 = hipTexRefGetMipmapLevelBias_(c_loc(pbias),texRef)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipTexRefGetMipmapLevelClamp_assumed_rank(pminMipmapLevelClamp,pmaxMipmapLevelClamp, &
        texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelClamp_assumed_rank
      real(c_float),target,contiguous,dimension(..) :: pminMipmapLevelClamp
      real(c_float),target,contiguous,dimension(..) :: pmaxMipmapLevelClamp
      type(textureReference) :: texRef
      !
      hipTexRefGetMipmapLevelClamp_assumed_rank = hipTexRefGetMipmapLevelClamp_(c_loc( &
        pminMipmapLevelClamp),c_loc(pmaxMipmapLevelClamp),texRef)
    end function

#else
    function hipTexRefGetMipmapLevelClamp_rank_0(pminMipmapLevelClamp,pmaxMipmapLevelClamp,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelClamp_rank_0
      real(c_float),target :: pminMipmapLevelClamp
      real(c_float),target :: pmaxMipmapLevelClamp
      type(textureReference) :: texRef
      !
      hipTexRefGetMipmapLevelClamp_rank_0 = hipTexRefGetMipmapLevelClamp_(c_loc( &
        pminMipmapLevelClamp),c_loc(pmaxMipmapLevelClamp),texRef)
    end function

    function hipTexRefGetMipmapLevelClamp_rank_1(pminMipmapLevelClamp,pmaxMipmapLevelClamp,texRef)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelClamp_rank_1
      real(c_float),target,dimension(:) :: pminMipmapLevelClamp
      real(c_float),target,dimension(:) :: pmaxMipmapLevelClamp
      type(textureReference) :: texRef
      !
      hipTexRefGetMipmapLevelClamp_rank_1 = hipTexRefGetMipmapLevelClamp_(c_loc( &
        pminMipmapLevelClamp),c_loc(pmaxMipmapLevelClamp),texRef)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipTexRefSetBorderColor_assumed_rank(texRef,pBorderColor)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetBorderColor_assumed_rank
      type(textureReference) :: texRef
      real(c_float),target,contiguous,dimension(..) :: pBorderColor
      !
      hipTexRefSetBorderColor_assumed_rank = hipTexRefSetBorderColor_(texRef,c_loc(pBorderColor))
    end function

#else
    function hipTexRefSetBorderColor_rank_0(texRef,pBorderColor)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetBorderColor_rank_0
      type(textureReference) :: texRef
      real(c_float),target :: pBorderColor
      !
      hipTexRefSetBorderColor_rank_0 = hipTexRefSetBorderColor_(texRef,c_loc(pBorderColor))
    end function

    function hipTexRefSetBorderColor_rank_1(texRef,pBorderColor)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipTexRefSetBorderColor_rank_1
      type(textureReference) :: texRef
      real(c_float),target,dimension(:) :: pBorderColor
      !
      hipTexRefSetBorderColor_rank_1 = hipTexRefSetBorderColor_(texRef,c_loc(pBorderColor))
    end function

#endif
    function hipKernelNameRef_typed(f) result(KernelNameRef)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipFunction_t), value :: f
      type(c_ptr) :: KernelNameRef
      KernelNameRef = hipKernelNameRef_(f%ptr)
    end function hipKernelNameRef_typed

    function hipKernelNameRefByPtr_typed(hostFunction, stream) result(KernelNameRefByPtr)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: hostFunction
      type(hipStream_t), value :: stream
      type(c_ptr) :: KernelNameRefByPtr
      KernelNameRefByPtr = hipKernelNameRefByPtr_(hostFunction, stream%ptr)
    end function hipKernelNameRefByPtr_typed

    function hipGetStreamDeviceId_typed(stream) result(GetStreamDeviceId)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(c_int) :: GetStreamDeviceId
      GetStreamDeviceId = hipGetStreamDeviceId_(stream%ptr)
    end function hipGetStreamDeviceId_typed

    function hipStreamBeginCapture_typed(stream, mode) result(StreamBeginCapture)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(kind(hipStreamCaptureModeGlobal)), value :: mode
      integer(kind(hipSuccess)) :: StreamBeginCapture
      StreamBeginCapture = hipStreamBeginCapture_(stream%ptr, mode)
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
      integer(c_size_t), value :: numDependencies
      integer(kind(hipStreamCaptureModeGlobal)), value :: mode
      integer(kind(hipSuccess)) :: StreamBeginCaptureToGraph
      StreamBeginCaptureToGraph = hipStreamBeginCaptureToGraph_(stream%ptr, graph%ptr, &
        dependencies%ptr, dependencyData, numDependencies, mode)
    end function hipStreamBeginCaptureToGraph_typed

    function hipStreamEndCapture_typed(stream, pGraph) result(StreamEndCapture)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(hipGraph_t) :: pGraph
      integer(kind(hipSuccess)) :: StreamEndCapture
      StreamEndCapture = hipStreamEndCapture_(stream%ptr, pGraph%ptr)
    end function hipStreamEndCapture_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipStreamGetCaptureInfo_assumed_rank(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_assumed_rank
      type(hipStream_t) :: stream
      integer(c_int),target,contiguous,dimension(..) :: pCaptureStatus
      integer(c_int64_t),target,contiguous,dimension(..) :: pId
      !
      hipStreamGetCaptureInfo_assumed_rank = hipStreamGetCaptureInfo_(stream%ptr, &
        c_loc(pCaptureStatus),c_loc(pId))
    end function

    function hipStreamGetCaptureInfo_assumed_rank_cptr(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_assumed_rank_cptr
      type(c_ptr) :: stream
      integer(c_int),target,contiguous,dimension(..) :: pCaptureStatus
      integer(c_int64_t),target,contiguous,dimension(..) :: pId
      !
      hipStreamGetCaptureInfo_assumed_rank_cptr = hipStreamGetCaptureInfo_(stream, &
        c_loc(pCaptureStatus),c_loc(pId))
    end function

#else
    function hipStreamGetCaptureInfo_rank_0(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_rank_0
      type(hipStream_t) :: stream
      integer(c_int),target :: pCaptureStatus
      integer(c_int64_t),target :: pId
      !
      hipStreamGetCaptureInfo_rank_0 = hipStreamGetCaptureInfo_(stream%ptr,c_loc(pCaptureStatus), &
        c_loc(pId))
    end function

    function hipStreamGetCaptureInfo_rank_0_cptr(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_rank_0_cptr
      type(c_ptr) :: stream
      integer(c_int),target :: pCaptureStatus
      integer(c_int64_t),target :: pId
      !
      hipStreamGetCaptureInfo_rank_0_cptr = hipStreamGetCaptureInfo_(stream,c_loc(pCaptureStatus), &
        c_loc(pId))
    end function

    function hipStreamGetCaptureInfo_rank_1(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_rank_1
      type(hipStream_t) :: stream
      integer(c_int),target,dimension(:) :: pCaptureStatus
      integer(c_int64_t),target,dimension(:) :: pId
      !
      hipStreamGetCaptureInfo_rank_1 = hipStreamGetCaptureInfo_(stream%ptr,c_loc(pCaptureStatus), &
        c_loc(pId))
    end function

    function hipStreamGetCaptureInfo_rank_1_cptr(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_rank_1_cptr
      type(c_ptr) :: stream
      integer(c_int),target,dimension(:) :: pCaptureStatus
      integer(c_int64_t),target,dimension(:) :: pId
      !
      hipStreamGetCaptureInfo_rank_1_cptr = hipStreamGetCaptureInfo_(stream,c_loc(pCaptureStatus), &
        c_loc(pId))
    end function

#endif
    function hipStreamGetCaptureInfo_typed(stream, pCaptureStatus, pId) result(StreamGetCaptureInfo)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: pCaptureStatus
      type(c_ptr), value :: pId
      integer(kind(hipSuccess)) :: StreamGetCaptureInfo
      StreamGetCaptureInfo = hipStreamGetCaptureInfo_(stream%ptr, pCaptureStatus, pId)
    end function hipStreamGetCaptureInfo_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipStreamGetCaptureInfo_v2_assumed_rank(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_assumed_rank
      type(hipStream_t) :: stream
      integer(c_int),target,contiguous,dimension(..) :: captureStatus_out
      integer(c_int64_t),target,contiguous,dimension(..) :: id_out
      type(hipGraph_t) :: graph_out
      type(hipGraphNode_t) :: dependencies_out
      integer(c_size_t),target,contiguous,dimension(..) :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_assumed_rank = hipStreamGetCaptureInfo_v2_(stream%ptr, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out%ptr,dependencies_out%ptr, &
        c_loc(numDependencies_out))
    end function

    function hipStreamGetCaptureInfo_v2_assumed_rank_cptr(stream,captureStatus_out,id_out, &
        graph_out,dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_assumed_rank_cptr
      type(c_ptr) :: stream
      integer(c_int),target,contiguous,dimension(..) :: captureStatus_out
      integer(c_int64_t),target,contiguous,dimension(..) :: id_out
      type(c_ptr) :: graph_out
      type(c_ptr) :: dependencies_out
      integer(c_size_t),target,contiguous,dimension(..) :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_assumed_rank_cptr = hipStreamGetCaptureInfo_v2_(stream, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out,dependencies_out, &
        c_loc(numDependencies_out))
    end function

#else
    function hipStreamGetCaptureInfo_v2_rank_0(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_rank_0
      type(hipStream_t) :: stream
      integer(c_int),target :: captureStatus_out
      integer(c_int64_t),target :: id_out
      type(hipGraph_t) :: graph_out
      type(hipGraphNode_t) :: dependencies_out
      integer(c_size_t),target :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_rank_0 = hipStreamGetCaptureInfo_v2_(stream%ptr, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out%ptr,dependencies_out%ptr, &
        c_loc(numDependencies_out))
    end function

    function hipStreamGetCaptureInfo_v2_rank_0_cptr(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_rank_0_cptr
      type(c_ptr) :: stream
      integer(c_int),target :: captureStatus_out
      integer(c_int64_t),target :: id_out
      type(c_ptr) :: graph_out
      type(c_ptr) :: dependencies_out
      integer(c_size_t),target :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_rank_0_cptr = hipStreamGetCaptureInfo_v2_(stream, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out,dependencies_out, &
        c_loc(numDependencies_out))
    end function

    function hipStreamGetCaptureInfo_v2_rank_1(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_rank_1
      type(hipStream_t) :: stream
      integer(c_int),target,dimension(:) :: captureStatus_out
      integer(c_int64_t),target,dimension(:) :: id_out
      type(hipGraph_t) :: graph_out
      type(hipGraphNode_t) :: dependencies_out
      integer(c_size_t),target,dimension(:) :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_rank_1 = hipStreamGetCaptureInfo_v2_(stream%ptr, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out%ptr,dependencies_out%ptr, &
        c_loc(numDependencies_out))
    end function

    function hipStreamGetCaptureInfo_v2_rank_1_cptr(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_rank_1_cptr
      type(c_ptr) :: stream
      integer(c_int),target,dimension(:) :: captureStatus_out
      integer(c_int64_t),target,dimension(:) :: id_out
      type(c_ptr) :: graph_out
      type(c_ptr) :: dependencies_out
      integer(c_size_t),target,dimension(:) :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_rank_1_cptr = hipStreamGetCaptureInfo_v2_(stream, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out,dependencies_out, &
        c_loc(numDependencies_out))
    end function

#endif
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
      integer(kind(hipSuccess)) :: StreamGetCaptureInfo_v2
      StreamGetCaptureInfo_v2 = hipStreamGetCaptureInfo_v2_(stream%ptr, captureStatus_out, id_out, &
        graph_out%ptr, dependencies_out%ptr, numDependencies_out)
    end function hipStreamGetCaptureInfo_v2_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipStreamIsCapturing_assumed_rank(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_assumed_rank
      type(hipStream_t) :: stream
      integer(c_int),target,contiguous,dimension(..) :: pCaptureStatus
      !
      hipStreamIsCapturing_assumed_rank = hipStreamIsCapturing_(stream%ptr,c_loc(pCaptureStatus))
    end function

    function hipStreamIsCapturing_assumed_rank_cptr(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_assumed_rank_cptr
      type(c_ptr) :: stream
      integer(c_int),target,contiguous,dimension(..) :: pCaptureStatus
      !
      hipStreamIsCapturing_assumed_rank_cptr = hipStreamIsCapturing_(stream,c_loc(pCaptureStatus))
    end function

#else
    function hipStreamIsCapturing_rank_0(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_rank_0
      type(hipStream_t) :: stream
      integer(c_int),target :: pCaptureStatus
      !
      hipStreamIsCapturing_rank_0 = hipStreamIsCapturing_(stream%ptr,c_loc(pCaptureStatus))
    end function

    function hipStreamIsCapturing_rank_0_cptr(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_rank_0_cptr
      type(c_ptr) :: stream
      integer(c_int),target :: pCaptureStatus
      !
      hipStreamIsCapturing_rank_0_cptr = hipStreamIsCapturing_(stream,c_loc(pCaptureStatus))
    end function

    function hipStreamIsCapturing_rank_1(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_rank_1
      type(hipStream_t) :: stream
      integer(c_int),target,dimension(:) :: pCaptureStatus
      !
      hipStreamIsCapturing_rank_1 = hipStreamIsCapturing_(stream%ptr,c_loc(pCaptureStatus))
    end function

    function hipStreamIsCapturing_rank_1_cptr(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_rank_1_cptr
      type(c_ptr) :: stream
      integer(c_int),target,dimension(:) :: pCaptureStatus
      !
      hipStreamIsCapturing_rank_1_cptr = hipStreamIsCapturing_(stream,c_loc(pCaptureStatus))
    end function

#endif
    function hipStreamIsCapturing_typed(stream, pCaptureStatus) result(StreamIsCapturing)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: pCaptureStatus
      integer(kind(hipSuccess)) :: StreamIsCapturing
      StreamIsCapturing = hipStreamIsCapturing_(stream%ptr, pCaptureStatus)
    end function hipStreamIsCapturing_typed

    function hipStreamUpdateCaptureDependencies_typed(stream, dependencies, numDependencies, &
        flags) result(StreamUpdateCaptureDependencies)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(hipGraphNode_t) :: dependencies
      integer(c_size_t), value :: numDependencies
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: StreamUpdateCaptureDependencies
      StreamUpdateCaptureDependencies = hipStreamUpdateCaptureDependencies_(stream%ptr, &
        dependencies%ptr, numDependencies, flags)
    end function hipStreamUpdateCaptureDependencies_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipThreadExchangeStreamCaptureMode_assumed_rank(mode)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipThreadExchangeStreamCaptureMode_assumed_rank
      integer(c_int),target,contiguous,dimension(..) :: mode
      !
      hipThreadExchangeStreamCaptureMode_assumed_rank = hipThreadExchangeStreamCaptureMode_(c_loc( &
        mode))
    end function

#else
    function hipThreadExchangeStreamCaptureMode_rank_0(mode)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipThreadExchangeStreamCaptureMode_rank_0
      integer(c_int),target :: mode
      !
      hipThreadExchangeStreamCaptureMode_rank_0 = hipThreadExchangeStreamCaptureMode_(c_loc(mode))
    end function

    function hipThreadExchangeStreamCaptureMode_rank_1(mode)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipThreadExchangeStreamCaptureMode_rank_1
      integer(c_int),target,dimension(:) :: mode
      !
      hipThreadExchangeStreamCaptureMode_rank_1 = hipThreadExchangeStreamCaptureMode_(c_loc(mode))
    end function

#endif
    function hipGraphCreate_typed(pGraph, flags) result(GraphCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t) :: pGraph
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: GraphCreate
      GraphCreate = hipGraphCreate_(pGraph%ptr, flags)
    end function hipGraphCreate_typed

    function hipGraphDestroy_typed(graph) result(GraphDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      integer(kind(hipSuccess)) :: GraphDestroy
      GraphDestroy = hipGraphDestroy_(graph%ptr)
    end function hipGraphDestroy_typed

    function hipGraphAddDependencies_typed(graph, from, to, &
        numDependencies) result(GraphAddDependencies)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: from
      type(hipGraphNode_t) :: to
      integer(c_size_t), value :: numDependencies
      integer(kind(hipSuccess)) :: GraphAddDependencies
      GraphAddDependencies = hipGraphAddDependencies_(graph%ptr, from%ptr, to%ptr, numDependencies)
    end function hipGraphAddDependencies_typed

    function hipGraphRemoveDependencies_typed(graph, from, to, &
        numDependencies) result(GraphRemoveDependencies)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: from
      type(hipGraphNode_t) :: to
      integer(c_size_t), value :: numDependencies
      integer(kind(hipSuccess)) :: GraphRemoveDependencies
      GraphRemoveDependencies = hipGraphRemoveDependencies_(graph%ptr, from%ptr, to%ptr, &
        numDependencies)
    end function hipGraphRemoveDependencies_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGraphGetEdges_assumed_rank(graph,from,to,numEdges)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetEdges_assumed_rank
      type(hipGraph_t) :: graph
      type(hipGraphNode_t) :: from
      type(hipGraphNode_t) :: to
      integer(c_size_t),target,contiguous,dimension(..) :: numEdges
      !
      hipGraphGetEdges_assumed_rank = hipGraphGetEdges_(graph%ptr,from%ptr,to%ptr,c_loc(numEdges))
    end function

    function hipGraphGetEdges_assumed_rank_cptr(graph,from,to,numEdges)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetEdges_assumed_rank_cptr
      type(c_ptr) :: graph
      type(c_ptr) :: from
      type(c_ptr) :: to
      integer(c_size_t),target,contiguous,dimension(..) :: numEdges
      !
      hipGraphGetEdges_assumed_rank_cptr = hipGraphGetEdges_(graph,from,to,c_loc(numEdges))
    end function

#else
    function hipGraphGetEdges_rank_0(graph,from,to,numEdges)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetEdges_rank_0
      type(hipGraph_t) :: graph
      type(hipGraphNode_t) :: from
      type(hipGraphNode_t) :: to
      integer(c_size_t),target :: numEdges
      !
      hipGraphGetEdges_rank_0 = hipGraphGetEdges_(graph%ptr,from%ptr,to%ptr,c_loc(numEdges))
    end function

    function hipGraphGetEdges_rank_0_cptr(graph,from,to,numEdges)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetEdges_rank_0_cptr
      type(c_ptr) :: graph
      type(c_ptr) :: from
      type(c_ptr) :: to
      integer(c_size_t),target :: numEdges
      !
      hipGraphGetEdges_rank_0_cptr = hipGraphGetEdges_(graph,from,to,c_loc(numEdges))
    end function

    function hipGraphGetEdges_rank_1(graph,from,to,numEdges)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetEdges_rank_1
      type(hipGraph_t) :: graph
      type(hipGraphNode_t) :: from
      type(hipGraphNode_t) :: to
      integer(c_size_t),target,dimension(:) :: numEdges
      !
      hipGraphGetEdges_rank_1 = hipGraphGetEdges_(graph%ptr,from%ptr,to%ptr,c_loc(numEdges))
    end function

    function hipGraphGetEdges_rank_1_cptr(graph,from,to,numEdges)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetEdges_rank_1_cptr
      type(c_ptr) :: graph
      type(c_ptr) :: from
      type(c_ptr) :: to
      integer(c_size_t),target,dimension(:) :: numEdges
      !
      hipGraphGetEdges_rank_1_cptr = hipGraphGetEdges_(graph,from,to,c_loc(numEdges))
    end function

#endif
    function hipGraphGetEdges_typed(graph, from, to, numEdges) result(GraphGetEdges)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: from
      type(hipGraphNode_t) :: to
      type(c_ptr), value :: numEdges
      integer(kind(hipSuccess)) :: GraphGetEdges
      GraphGetEdges = hipGraphGetEdges_(graph%ptr, from%ptr, to%ptr, numEdges)
    end function hipGraphGetEdges_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGraphGetNodes_assumed_rank(graph,nodes,numNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetNodes_assumed_rank
      type(hipGraph_t) :: graph
      type(hipGraphNode_t) :: nodes
      integer(c_size_t),target,contiguous,dimension(..) :: numNodes
      !
      hipGraphGetNodes_assumed_rank = hipGraphGetNodes_(graph%ptr,nodes%ptr,c_loc(numNodes))
    end function

    function hipGraphGetNodes_assumed_rank_cptr(graph,nodes,numNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetNodes_assumed_rank_cptr
      type(c_ptr) :: graph
      type(c_ptr) :: nodes
      integer(c_size_t),target,contiguous,dimension(..) :: numNodes
      !
      hipGraphGetNodes_assumed_rank_cptr = hipGraphGetNodes_(graph,nodes,c_loc(numNodes))
    end function

#else
    function hipGraphGetNodes_rank_0(graph,nodes,numNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetNodes_rank_0
      type(hipGraph_t) :: graph
      type(hipGraphNode_t) :: nodes
      integer(c_size_t),target :: numNodes
      !
      hipGraphGetNodes_rank_0 = hipGraphGetNodes_(graph%ptr,nodes%ptr,c_loc(numNodes))
    end function

    function hipGraphGetNodes_rank_0_cptr(graph,nodes,numNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetNodes_rank_0_cptr
      type(c_ptr) :: graph
      type(c_ptr) :: nodes
      integer(c_size_t),target :: numNodes
      !
      hipGraphGetNodes_rank_0_cptr = hipGraphGetNodes_(graph,nodes,c_loc(numNodes))
    end function

    function hipGraphGetNodes_rank_1(graph,nodes,numNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetNodes_rank_1
      type(hipGraph_t) :: graph
      type(hipGraphNode_t) :: nodes
      integer(c_size_t),target,dimension(:) :: numNodes
      !
      hipGraphGetNodes_rank_1 = hipGraphGetNodes_(graph%ptr,nodes%ptr,c_loc(numNodes))
    end function

    function hipGraphGetNodes_rank_1_cptr(graph,nodes,numNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetNodes_rank_1_cptr
      type(c_ptr) :: graph
      type(c_ptr) :: nodes
      integer(c_size_t),target,dimension(:) :: numNodes
      !
      hipGraphGetNodes_rank_1_cptr = hipGraphGetNodes_(graph,nodes,c_loc(numNodes))
    end function

#endif
    function hipGraphGetNodes_typed(graph, nodes, numNodes) result(GraphGetNodes)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: nodes
      type(c_ptr), value :: numNodes
      integer(kind(hipSuccess)) :: GraphGetNodes
      GraphGetNodes = hipGraphGetNodes_(graph%ptr, nodes%ptr, numNodes)
    end function hipGraphGetNodes_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGraphGetRootNodes_assumed_rank(graph,pRootNodes,pNumRootNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetRootNodes_assumed_rank
      type(hipGraph_t) :: graph
      type(hipGraphNode_t) :: pRootNodes
      integer(c_size_t),target,contiguous,dimension(..) :: pNumRootNodes
      !
      hipGraphGetRootNodes_assumed_rank = hipGraphGetRootNodes_(graph%ptr,pRootNodes%ptr, &
        c_loc(pNumRootNodes))
    end function

    function hipGraphGetRootNodes_assumed_rank_cptr(graph,pRootNodes,pNumRootNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetRootNodes_assumed_rank_cptr
      type(c_ptr) :: graph
      type(c_ptr) :: pRootNodes
      integer(c_size_t),target,contiguous,dimension(..) :: pNumRootNodes
      !
      hipGraphGetRootNodes_assumed_rank_cptr = hipGraphGetRootNodes_(graph,pRootNodes, &
        c_loc(pNumRootNodes))
    end function

#else
    function hipGraphGetRootNodes_rank_0(graph,pRootNodes,pNumRootNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetRootNodes_rank_0
      type(hipGraph_t) :: graph
      type(hipGraphNode_t) :: pRootNodes
      integer(c_size_t),target :: pNumRootNodes
      !
      hipGraphGetRootNodes_rank_0 = hipGraphGetRootNodes_(graph%ptr,pRootNodes%ptr, &
        c_loc(pNumRootNodes))
    end function

    function hipGraphGetRootNodes_rank_0_cptr(graph,pRootNodes,pNumRootNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetRootNodes_rank_0_cptr
      type(c_ptr) :: graph
      type(c_ptr) :: pRootNodes
      integer(c_size_t),target :: pNumRootNodes
      !
      hipGraphGetRootNodes_rank_0_cptr = hipGraphGetRootNodes_(graph,pRootNodes, &
        c_loc(pNumRootNodes))
    end function

    function hipGraphGetRootNodes_rank_1(graph,pRootNodes,pNumRootNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetRootNodes_rank_1
      type(hipGraph_t) :: graph
      type(hipGraphNode_t) :: pRootNodes
      integer(c_size_t),target,dimension(:) :: pNumRootNodes
      !
      hipGraphGetRootNodes_rank_1 = hipGraphGetRootNodes_(graph%ptr,pRootNodes%ptr, &
        c_loc(pNumRootNodes))
    end function

    function hipGraphGetRootNodes_rank_1_cptr(graph,pRootNodes,pNumRootNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphGetRootNodes_rank_1_cptr
      type(c_ptr) :: graph
      type(c_ptr) :: pRootNodes
      integer(c_size_t),target,dimension(:) :: pNumRootNodes
      !
      hipGraphGetRootNodes_rank_1_cptr = hipGraphGetRootNodes_(graph,pRootNodes, &
        c_loc(pNumRootNodes))
    end function

#endif
    function hipGraphGetRootNodes_typed(graph, pRootNodes, pNumRootNodes) result(GraphGetRootNodes)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pRootNodes
      type(c_ptr), value :: pNumRootNodes
      integer(kind(hipSuccess)) :: GraphGetRootNodes
      GraphGetRootNodes = hipGraphGetRootNodes_(graph%ptr, pRootNodes%ptr, pNumRootNodes)
    end function hipGraphGetRootNodes_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGraphNodeGetDependencies_assumed_rank(node,pDependencies,pNumDependencies)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependencies_assumed_rank
      type(hipGraphNode_t) :: node
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t),target,contiguous,dimension(..) :: pNumDependencies
      !
      hipGraphNodeGetDependencies_assumed_rank = hipGraphNodeGetDependencies_(node%ptr, &
        pDependencies%ptr,c_loc(pNumDependencies))
    end function

    function hipGraphNodeGetDependencies_assumed_rank_cptr(node,pDependencies,pNumDependencies)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependencies_assumed_rank_cptr
      type(c_ptr) :: node
      type(c_ptr) :: pDependencies
      integer(c_size_t),target,contiguous,dimension(..) :: pNumDependencies
      !
      hipGraphNodeGetDependencies_assumed_rank_cptr = hipGraphNodeGetDependencies_(node, &
        pDependencies,c_loc(pNumDependencies))
    end function

#else
    function hipGraphNodeGetDependencies_rank_0(node,pDependencies,pNumDependencies)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependencies_rank_0
      type(hipGraphNode_t) :: node
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t),target :: pNumDependencies
      !
      hipGraphNodeGetDependencies_rank_0 = hipGraphNodeGetDependencies_(node%ptr, &
        pDependencies%ptr,c_loc(pNumDependencies))
    end function

    function hipGraphNodeGetDependencies_rank_0_cptr(node,pDependencies,pNumDependencies)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependencies_rank_0_cptr
      type(c_ptr) :: node
      type(c_ptr) :: pDependencies
      integer(c_size_t),target :: pNumDependencies
      !
      hipGraphNodeGetDependencies_rank_0_cptr = hipGraphNodeGetDependencies_(node,pDependencies, &
        c_loc(pNumDependencies))
    end function

    function hipGraphNodeGetDependencies_rank_1(node,pDependencies,pNumDependencies)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependencies_rank_1
      type(hipGraphNode_t) :: node
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t),target,dimension(:) :: pNumDependencies
      !
      hipGraphNodeGetDependencies_rank_1 = hipGraphNodeGetDependencies_(node%ptr, &
        pDependencies%ptr,c_loc(pNumDependencies))
    end function

    function hipGraphNodeGetDependencies_rank_1_cptr(node,pDependencies,pNumDependencies)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependencies_rank_1_cptr
      type(c_ptr) :: node
      type(c_ptr) :: pDependencies
      integer(c_size_t),target,dimension(:) :: pNumDependencies
      !
      hipGraphNodeGetDependencies_rank_1_cptr = hipGraphNodeGetDependencies_(node,pDependencies, &
        c_loc(pNumDependencies))
    end function

#endif
    function hipGraphNodeGetDependencies_typed(node, pDependencies, &
        pNumDependencies) result(GraphNodeGetDependencies)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipGraphNode_t) :: pDependencies
      type(c_ptr), value :: pNumDependencies
      integer(kind(hipSuccess)) :: GraphNodeGetDependencies
      GraphNodeGetDependencies = hipGraphNodeGetDependencies_(node%ptr, pDependencies%ptr, &
        pNumDependencies)
    end function hipGraphNodeGetDependencies_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGraphNodeGetDependentNodes_assumed_rank(node,pDependentNodes,pNumDependentNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependentNodes_assumed_rank
      type(hipGraphNode_t) :: node
      type(hipGraphNode_t) :: pDependentNodes
      integer(c_size_t),target,contiguous,dimension(..) :: pNumDependentNodes
      !
      hipGraphNodeGetDependentNodes_assumed_rank = hipGraphNodeGetDependentNodes_(node%ptr, &
        pDependentNodes%ptr,c_loc(pNumDependentNodes))
    end function

    function hipGraphNodeGetDependentNodes_assumed_rank_cptr(node,pDependentNodes, &
        pNumDependentNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependentNodes_assumed_rank_cptr
      type(c_ptr) :: node
      type(c_ptr) :: pDependentNodes
      integer(c_size_t),target,contiguous,dimension(..) :: pNumDependentNodes
      !
      hipGraphNodeGetDependentNodes_assumed_rank_cptr = hipGraphNodeGetDependentNodes_(node, &
        pDependentNodes,c_loc(pNumDependentNodes))
    end function

#else
    function hipGraphNodeGetDependentNodes_rank_0(node,pDependentNodes,pNumDependentNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependentNodes_rank_0
      type(hipGraphNode_t) :: node
      type(hipGraphNode_t) :: pDependentNodes
      integer(c_size_t),target :: pNumDependentNodes
      !
      hipGraphNodeGetDependentNodes_rank_0 = hipGraphNodeGetDependentNodes_(node%ptr, &
        pDependentNodes%ptr,c_loc(pNumDependentNodes))
    end function

    function hipGraphNodeGetDependentNodes_rank_0_cptr(node,pDependentNodes,pNumDependentNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependentNodes_rank_0_cptr
      type(c_ptr) :: node
      type(c_ptr) :: pDependentNodes
      integer(c_size_t),target :: pNumDependentNodes
      !
      hipGraphNodeGetDependentNodes_rank_0_cptr = hipGraphNodeGetDependentNodes_(node, &
        pDependentNodes,c_loc(pNumDependentNodes))
    end function

    function hipGraphNodeGetDependentNodes_rank_1(node,pDependentNodes,pNumDependentNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependentNodes_rank_1
      type(hipGraphNode_t) :: node
      type(hipGraphNode_t) :: pDependentNodes
      integer(c_size_t),target,dimension(:) :: pNumDependentNodes
      !
      hipGraphNodeGetDependentNodes_rank_1 = hipGraphNodeGetDependentNodes_(node%ptr, &
        pDependentNodes%ptr,c_loc(pNumDependentNodes))
    end function

    function hipGraphNodeGetDependentNodes_rank_1_cptr(node,pDependentNodes,pNumDependentNodes)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetDependentNodes_rank_1_cptr
      type(c_ptr) :: node
      type(c_ptr) :: pDependentNodes
      integer(c_size_t),target,dimension(:) :: pNumDependentNodes
      !
      hipGraphNodeGetDependentNodes_rank_1_cptr = hipGraphNodeGetDependentNodes_(node, &
        pDependentNodes,c_loc(pNumDependentNodes))
    end function

#endif
    function hipGraphNodeGetDependentNodes_typed(node, pDependentNodes, &
        pNumDependentNodes) result(GraphNodeGetDependentNodes)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipGraphNode_t) :: pDependentNodes
      type(c_ptr), value :: pNumDependentNodes
      integer(kind(hipSuccess)) :: GraphNodeGetDependentNodes
      GraphNodeGetDependentNodes = hipGraphNodeGetDependentNodes_(node%ptr, pDependentNodes%ptr, &
        pNumDependentNodes)
    end function hipGraphNodeGetDependentNodes_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGraphNodeGetType_assumed_rank(node,pType)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetType_assumed_rank
      type(hipGraphNode_t) :: node
      integer(c_int),target,contiguous,dimension(..) :: pType
      !
      hipGraphNodeGetType_assumed_rank = hipGraphNodeGetType_(node%ptr,c_loc(pType))
    end function

    function hipGraphNodeGetType_assumed_rank_cptr(node,pType)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetType_assumed_rank_cptr
      type(c_ptr) :: node
      integer(c_int),target,contiguous,dimension(..) :: pType
      !
      hipGraphNodeGetType_assumed_rank_cptr = hipGraphNodeGetType_(node,c_loc(pType))
    end function

#else
    function hipGraphNodeGetType_rank_0(node,pType)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetType_rank_0
      type(hipGraphNode_t) :: node
      integer(c_int),target :: pType
      !
      hipGraphNodeGetType_rank_0 = hipGraphNodeGetType_(node%ptr,c_loc(pType))
    end function

    function hipGraphNodeGetType_rank_0_cptr(node,pType)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetType_rank_0_cptr
      type(c_ptr) :: node
      integer(c_int),target :: pType
      !
      hipGraphNodeGetType_rank_0_cptr = hipGraphNodeGetType_(node,c_loc(pType))
    end function

    function hipGraphNodeGetType_rank_1(node,pType)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetType_rank_1
      type(hipGraphNode_t) :: node
      integer(c_int),target,dimension(:) :: pType
      !
      hipGraphNodeGetType_rank_1 = hipGraphNodeGetType_(node%ptr,c_loc(pType))
    end function

    function hipGraphNodeGetType_rank_1_cptr(node,pType)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphNodeGetType_rank_1_cptr
      type(c_ptr) :: node
      integer(c_int),target,dimension(:) :: pType
      !
      hipGraphNodeGetType_rank_1_cptr = hipGraphNodeGetType_(node,c_loc(pType))
    end function

#endif
    function hipGraphNodeGetType_typed(node, pType) result(GraphNodeGetType)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: pType
      integer(kind(hipSuccess)) :: GraphNodeGetType
      GraphNodeGetType = hipGraphNodeGetType_(node%ptr, pType)
    end function hipGraphNodeGetType_typed

    function hipGraphDestroyNode_typed(node) result(GraphDestroyNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      integer(kind(hipSuccess)) :: GraphDestroyNode
      GraphDestroyNode = hipGraphDestroyNode_(node%ptr)
    end function hipGraphDestroyNode_typed

    function hipGraphClone_typed(pGraphClone, originalGraph) result(GraphClone)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t) :: pGraphClone
      type(hipGraph_t), value :: originalGraph
      integer(kind(hipSuccess)) :: GraphClone
      GraphClone = hipGraphClone_(pGraphClone%ptr, originalGraph%ptr)
    end function hipGraphClone_typed

    function hipGraphNodeFindInClone_typed(pNode, originalNode, &
        clonedGraph) result(GraphNodeFindInClone)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pNode
      type(hipGraphNode_t), value :: originalNode
      type(hipGraph_t), value :: clonedGraph
      integer(kind(hipSuccess)) :: GraphNodeFindInClone
      GraphNodeFindInClone = hipGraphNodeFindInClone_(pNode%ptr, originalNode%ptr, clonedGraph%ptr)
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
      integer(c_size_t), value :: bufferSize
      integer(kind(hipSuccess)) :: GraphInstantiate
      GraphInstantiate = hipGraphInstantiate_(pGraphExec%ptr, graph%ptr, pErrorNode%ptr, &
        pLogBuffer, bufferSize)
    end function hipGraphInstantiate_typed

    function hipGraphInstantiate_cstr(pGraphExec, graph, pErrorNode, pLogBuffer, &
        bufferSize) result(GraphInstantiate)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: pGraphExec
      type(c_ptr), value :: graph
      type(c_ptr) :: pErrorNode
      character(len=*), intent(out) :: pLogBuffer
      integer(c_size_t), value :: bufferSize
      integer(kind(hipSuccess)) :: GraphInstantiate
      character(len=len(pLogBuffer)+1, kind=c_char), target :: pLogBuffer__c
      integer :: i__c
      pLogBuffer__c = repeat(c_null_char, len(pLogBuffer)+1)
      GraphInstantiate = hipGraphInstantiate_(pGraphExec, graph, pErrorNode, c_loc(pLogBuffer__c), &
        bufferSize)
      pLogBuffer = ""
      do i__c = 1, len(pLogBuffer)
        if (pLogBuffer__c(i__c:i__c) == c_null_char) exit
        pLogBuffer(i__c:i__c) = pLogBuffer__c(i__c:i__c)
      end do
    end function hipGraphInstantiate_cstr

    function hipGraphInstantiateWithFlags_typed(pGraphExec, graph, &
        flags) result(GraphInstantiateWithFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t) :: pGraphExec
      type(hipGraph_t), value :: graph
      integer(c_int64_t), value :: flags
      integer(kind(hipSuccess)) :: GraphInstantiateWithFlags
      GraphInstantiateWithFlags = hipGraphInstantiateWithFlags_(pGraphExec%ptr, graph%ptr, flags)
    end function hipGraphInstantiateWithFlags_typed

    function hipGraphInstantiateWithParams_typed(pGraphExec, graph, &
        instantiateParams) result(GraphInstantiateWithParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t) :: pGraphExec
      type(hipGraph_t), value :: graph
      type(hipGraphInstantiateParams) :: instantiateParams
      integer(kind(hipSuccess)) :: GraphInstantiateWithParams
      GraphInstantiateWithParams = hipGraphInstantiateWithParams_(pGraphExec%ptr, graph%ptr, &
        instantiateParams)
    end function hipGraphInstantiateWithParams_typed

    function hipGraphLaunch_typed(graphExec, stream) result(GraphLaunch)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: GraphLaunch
      GraphLaunch = hipGraphLaunch_(graphExec%ptr, stream%ptr)
    end function hipGraphLaunch_typed

    function hipGraphUpload_typed(graphExec, stream) result(GraphUpload)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: GraphUpload
      GraphUpload = hipGraphUpload_(graphExec%ptr, stream%ptr)
    end function hipGraphUpload_typed

    function hipGraphAddNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        nodeParams) result(GraphAddNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t), value :: numDependencies
      type(hipGraphNodeParams) :: nodeParams
      integer(kind(hipSuccess)) :: GraphAddNode
      GraphAddNode = hipGraphAddNode_(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies, nodeParams)
    end function hipGraphAddNode_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGraphExecGetFlags_assumed_rank(graphExec,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecGetFlags_assumed_rank
      type(hipGraphExec_t) :: graphExec
      integer(c_int64_t),target,contiguous,dimension(..) :: flags
      !
      hipGraphExecGetFlags_assumed_rank = hipGraphExecGetFlags_(graphExec%ptr,c_loc(flags))
    end function

    function hipGraphExecGetFlags_assumed_rank_cptr(graphExec,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecGetFlags_assumed_rank_cptr
      type(c_ptr) :: graphExec
      integer(c_int64_t),target,contiguous,dimension(..) :: flags
      !
      hipGraphExecGetFlags_assumed_rank_cptr = hipGraphExecGetFlags_(graphExec,c_loc(flags))
    end function

#else
    function hipGraphExecGetFlags_rank_0(graphExec,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecGetFlags_rank_0
      type(hipGraphExec_t) :: graphExec
      integer(c_int64_t),target :: flags
      !
      hipGraphExecGetFlags_rank_0 = hipGraphExecGetFlags_(graphExec%ptr,c_loc(flags))
    end function

    function hipGraphExecGetFlags_rank_0_cptr(graphExec,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecGetFlags_rank_0_cptr
      type(c_ptr) :: graphExec
      integer(c_int64_t),target :: flags
      !
      hipGraphExecGetFlags_rank_0_cptr = hipGraphExecGetFlags_(graphExec,c_loc(flags))
    end function

    function hipGraphExecGetFlags_rank_1(graphExec,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecGetFlags_rank_1
      type(hipGraphExec_t) :: graphExec
      integer(c_int64_t),target,dimension(:) :: flags
      !
      hipGraphExecGetFlags_rank_1 = hipGraphExecGetFlags_(graphExec%ptr,c_loc(flags))
    end function

    function hipGraphExecGetFlags_rank_1_cptr(graphExec,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecGetFlags_rank_1_cptr
      type(c_ptr) :: graphExec
      integer(c_int64_t),target,dimension(:) :: flags
      !
      hipGraphExecGetFlags_rank_1_cptr = hipGraphExecGetFlags_(graphExec,c_loc(flags))
    end function

#endif
    function hipGraphExecGetFlags_typed(graphExec, flags) result(GraphExecGetFlags)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      type(c_ptr), value :: flags
      integer(kind(hipSuccess)) :: GraphExecGetFlags
      GraphExecGetFlags = hipGraphExecGetFlags_(graphExec%ptr, flags)
    end function hipGraphExecGetFlags_typed

    function hipGraphNodeSetParams_typed(node, nodeParams) result(GraphNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipGraphNodeParams) :: nodeParams
      integer(kind(hipSuccess)) :: GraphNodeSetParams
      GraphNodeSetParams = hipGraphNodeSetParams_(node%ptr, nodeParams)
    end function hipGraphNodeSetParams_typed

    function hipGraphExecNodeSetParams_typed(graphExec, node, &
        nodeParams) result(GraphExecNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      type(hipGraphNode_t), value :: node
      type(hipGraphNodeParams) :: nodeParams
      integer(kind(hipSuccess)) :: GraphExecNodeSetParams
      GraphExecNodeSetParams = hipGraphExecNodeSetParams_(graphExec%ptr, node%ptr, nodeParams)
    end function hipGraphExecNodeSetParams_typed

    function hipGraphExecDestroy_typed(graphExec) result(GraphExecDestroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      integer(kind(hipSuccess)) :: GraphExecDestroy
      GraphExecDestroy = hipGraphExecDestroy_(graphExec%ptr)
    end function hipGraphExecDestroy_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGraphExecUpdate_assumed_rank(hGraphExec,hGraph,hErrorNode_out,updateResult_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecUpdate_assumed_rank
      type(hipGraphExec_t) :: hGraphExec
      type(hipGraph_t) :: hGraph
      type(hipGraphNode_t) :: hErrorNode_out
      integer(c_int),target,contiguous,dimension(..) :: updateResult_out
      !
      hipGraphExecUpdate_assumed_rank = hipGraphExecUpdate_(hGraphExec%ptr,hGraph%ptr, &
        hErrorNode_out%ptr,c_loc(updateResult_out))
    end function

    function hipGraphExecUpdate_assumed_rank_cptr(hGraphExec,hGraph,hErrorNode_out,updateResult_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecUpdate_assumed_rank_cptr
      type(c_ptr) :: hGraphExec
      type(c_ptr) :: hGraph
      type(c_ptr) :: hErrorNode_out
      integer(c_int),target,contiguous,dimension(..) :: updateResult_out
      !
      hipGraphExecUpdate_assumed_rank_cptr = hipGraphExecUpdate_(hGraphExec,hGraph,hErrorNode_out, &
        c_loc(updateResult_out))
    end function

#else
    function hipGraphExecUpdate_rank_0(hGraphExec,hGraph,hErrorNode_out,updateResult_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecUpdate_rank_0
      type(hipGraphExec_t) :: hGraphExec
      type(hipGraph_t) :: hGraph
      type(hipGraphNode_t) :: hErrorNode_out
      integer(c_int),target :: updateResult_out
      !
      hipGraphExecUpdate_rank_0 = hipGraphExecUpdate_(hGraphExec%ptr,hGraph%ptr, &
        hErrorNode_out%ptr,c_loc(updateResult_out))
    end function

    function hipGraphExecUpdate_rank_0_cptr(hGraphExec,hGraph,hErrorNode_out,updateResult_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecUpdate_rank_0_cptr
      type(c_ptr) :: hGraphExec
      type(c_ptr) :: hGraph
      type(c_ptr) :: hErrorNode_out
      integer(c_int),target :: updateResult_out
      !
      hipGraphExecUpdate_rank_0_cptr = hipGraphExecUpdate_(hGraphExec,hGraph,hErrorNode_out, &
        c_loc(updateResult_out))
    end function

    function hipGraphExecUpdate_rank_1(hGraphExec,hGraph,hErrorNode_out,updateResult_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecUpdate_rank_1
      type(hipGraphExec_t) :: hGraphExec
      type(hipGraph_t) :: hGraph
      type(hipGraphNode_t) :: hErrorNode_out
      integer(c_int),target,dimension(:) :: updateResult_out
      !
      hipGraphExecUpdate_rank_1 = hipGraphExecUpdate_(hGraphExec%ptr,hGraph%ptr, &
        hErrorNode_out%ptr,c_loc(updateResult_out))
    end function

    function hipGraphExecUpdate_rank_1_cptr(hGraphExec,hGraph,hErrorNode_out,updateResult_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphExecUpdate_rank_1_cptr
      type(c_ptr) :: hGraphExec
      type(c_ptr) :: hGraph
      type(c_ptr) :: hErrorNode_out
      integer(c_int),target,dimension(:) :: updateResult_out
      !
      hipGraphExecUpdate_rank_1_cptr = hipGraphExecUpdate_(hGraphExec,hGraph,hErrorNode_out, &
        c_loc(updateResult_out))
    end function

#endif
    function hipGraphExecUpdate_typed(hGraphExec, hGraph, hErrorNode_out, &
        updateResult_out) result(GraphExecUpdate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraph_t), value :: hGraph
      type(hipGraphNode_t) :: hErrorNode_out
      type(c_ptr), value :: updateResult_out
      integer(kind(hipSuccess)) :: GraphExecUpdate
      GraphExecUpdate = hipGraphExecUpdate_(hGraphExec%ptr, hGraph%ptr, hErrorNode_out%ptr, &
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
      integer(c_size_t), value :: numDependencies
      type(hipKernelNodeParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphAddKernelNode
      GraphAddKernelNode = hipGraphAddKernelNode_(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies, pNodeParams)
    end function hipGraphAddKernelNode_typed

    function hipGraphKernelNodeGetParams_typed(node, pNodeParams) result(GraphKernelNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipKernelNodeParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphKernelNodeGetParams
      GraphKernelNodeGetParams = hipGraphKernelNodeGetParams_(node%ptr, pNodeParams)
    end function hipGraphKernelNodeGetParams_typed

    function hipGraphKernelNodeSetParams_typed(node, pNodeParams) result(GraphKernelNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipKernelNodeParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphKernelNodeSetParams
      GraphKernelNodeSetParams = hipGraphKernelNodeSetParams_(node%ptr, pNodeParams)
    end function hipGraphKernelNodeSetParams_typed

    function hipGraphExecKernelNodeSetParams_typed(hGraphExec, node, &
        pNodeParams) result(GraphExecKernelNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(hipKernelNodeParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphExecKernelNodeSetParams
      GraphExecKernelNodeSetParams = hipGraphExecKernelNodeSetParams_(hGraphExec%ptr, node%ptr, &
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
      integer(c_size_t), value :: numDependencies
      type(HIP_MEMCPY3D) :: copyParams
      type(hipCtx_t), value :: ctx
      integer(kind(hipSuccess)) :: DrvGraphAddMemcpyNode
      DrvGraphAddMemcpyNode = hipDrvGraphAddMemcpyNode_(phGraphNode%ptr, hGraph%ptr, &
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
      integer(c_size_t), value :: numDependencies
      type(hipMemcpy3DParms) :: pCopyParams
      integer(kind(hipSuccess)) :: GraphAddMemcpyNode
      GraphAddMemcpyNode = hipGraphAddMemcpyNode_(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies, pCopyParams)
    end function hipGraphAddMemcpyNode_typed

    function hipGraphMemcpyNodeGetParams_typed(node, pNodeParams) result(GraphMemcpyNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipMemcpy3DParms) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphMemcpyNodeGetParams
      GraphMemcpyNodeGetParams = hipGraphMemcpyNodeGetParams_(node%ptr, pNodeParams)
    end function hipGraphMemcpyNodeGetParams_typed

    function hipGraphMemcpyNodeSetParams_typed(node, pNodeParams) result(GraphMemcpyNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipMemcpy3DParms) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphMemcpyNodeSetParams
      GraphMemcpyNodeSetParams = hipGraphMemcpyNodeSetParams_(node%ptr, pNodeParams)
    end function hipGraphMemcpyNodeSetParams_typed

    function hipGraphKernelNodeSetAttribute_typed(hNode, attr, &
        myValue) result(GraphKernelNodeSetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      integer(kind(hipLaunchAttributeIgnore)), value :: attr
      type(c_ptr), value :: myValue
      integer(kind(hipSuccess)) :: GraphKernelNodeSetAttribute
      GraphKernelNodeSetAttribute = hipGraphKernelNodeSetAttribute_(hNode%ptr, attr, myValue)
    end function hipGraphKernelNodeSetAttribute_typed

    function hipGraphKernelNodeGetAttribute_typed(hNode, attr, &
        myValue) result(GraphKernelNodeGetAttribute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      integer(kind(hipLaunchAttributeIgnore)), value :: attr
      type(c_ptr), value :: myValue
      integer(kind(hipSuccess)) :: GraphKernelNodeGetAttribute
      GraphKernelNodeGetAttribute = hipGraphKernelNodeGetAttribute_(hNode%ptr, attr, myValue)
    end function hipGraphKernelNodeGetAttribute_typed

    function hipGraphExecMemcpyNodeSetParams_typed(hGraphExec, node, &
        pNodeParams) result(GraphExecMemcpyNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(hipMemcpy3DParms) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphExecMemcpyNodeSetParams
      GraphExecMemcpyNodeSetParams = hipGraphExecMemcpyNodeSetParams_(hGraphExec%ptr, node%ptr, &
        pNodeParams)
    end function hipGraphExecMemcpyNodeSetParams_typed

    function hipGraphAddMemcpyNode1D_typed(pGraphNode, graph, pDependencies, numDependencies, dst, &
        src, count, myKind) result(GraphAddMemcpyNode1D)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t), value :: numDependencies
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_size_t), value :: count
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      integer(kind(hipSuccess)) :: GraphAddMemcpyNode1D
      GraphAddMemcpyNode1D = hipGraphAddMemcpyNode1D_(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, dst, src, count, myKind)
    end function hipGraphAddMemcpyNode1D_typed

    function hipGraphMemcpyNodeSetParams1D_typed(node, dst, src, count, &
        myKind) result(GraphMemcpyNodeSetParams1D)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_size_t), value :: count
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      integer(kind(hipSuccess)) :: GraphMemcpyNodeSetParams1D
      GraphMemcpyNodeSetParams1D = hipGraphMemcpyNodeSetParams1D_(node%ptr, dst, src, count, myKind)
    end function hipGraphMemcpyNodeSetParams1D_typed

    function hipGraphExecMemcpyNodeSetParams1D_typed(hGraphExec, node, dst, src, count, &
        myKind) result(GraphExecMemcpyNodeSetParams1D)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_size_t), value :: count
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      integer(kind(hipSuccess)) :: GraphExecMemcpyNodeSetParams1D
      GraphExecMemcpyNodeSetParams1D = hipGraphExecMemcpyNodeSetParams1D_(hGraphExec%ptr, &
        node%ptr, dst, src, count, myKind)
    end function hipGraphExecMemcpyNodeSetParams1D_typed

    function hipGraphAddMemcpyNodeFromSymbol_typed(pGraphNode, graph, pDependencies, &
        numDependencies, dst, symbol, count, offset, myKind) result(GraphAddMemcpyNodeFromSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t), value :: numDependencies
      type(c_ptr), value :: dst
      type(c_ptr), value :: symbol
      integer(c_size_t), value :: count
      integer(c_size_t), value :: offset
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      integer(kind(hipSuccess)) :: GraphAddMemcpyNodeFromSymbol
      GraphAddMemcpyNodeFromSymbol = hipGraphAddMemcpyNodeFromSymbol_(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, dst, symbol, count, offset, myKind)
    end function hipGraphAddMemcpyNodeFromSymbol_typed

    function hipGraphMemcpyNodeSetParamsFromSymbol_typed(node, dst, symbol, count, offset, &
        myKind) result(GraphMemcpyNodeSetParamsFromSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: dst
      type(c_ptr), value :: symbol
      integer(c_size_t), value :: count
      integer(c_size_t), value :: offset
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      integer(kind(hipSuccess)) :: GraphMemcpyNodeSetParamsFromSymbol
      GraphMemcpyNodeSetParamsFromSymbol = hipGraphMemcpyNodeSetParamsFromSymbol_(node%ptr, dst, &
        symbol, count, offset, myKind)
    end function hipGraphMemcpyNodeSetParamsFromSymbol_typed

    function hipGraphExecMemcpyNodeSetParamsFromSymbol_typed(hGraphExec, node, dst, symbol, count, &
        offset, myKind) result(GraphExecMemcpyNodeSetParamsFromSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: dst
      type(c_ptr), value :: symbol
      integer(c_size_t), value :: count
      integer(c_size_t), value :: offset
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      integer(kind(hipSuccess)) :: GraphExecMemcpyNodeSetParamsFromSymbol
      GraphExecMemcpyNodeSetParamsFromSymbol = hipGraphExecMemcpyNodeSetParamsFromSymbol_( &
        hGraphExec%ptr, node%ptr, dst, symbol, count, offset, myKind)
    end function hipGraphExecMemcpyNodeSetParamsFromSymbol_typed

    function hipGraphAddMemcpyNodeToSymbol_typed(pGraphNode, graph, pDependencies, &
        numDependencies, symbol, src, count, offset, myKind) result(GraphAddMemcpyNodeToSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t), value :: numDependencies
      type(c_ptr), value :: symbol
      type(c_ptr), value :: src
      integer(c_size_t), value :: count
      integer(c_size_t), value :: offset
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      integer(kind(hipSuccess)) :: GraphAddMemcpyNodeToSymbol
      GraphAddMemcpyNodeToSymbol = hipGraphAddMemcpyNodeToSymbol_(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, symbol, src, count, offset, myKind)
    end function hipGraphAddMemcpyNodeToSymbol_typed

    function hipGraphMemcpyNodeSetParamsToSymbol_typed(node, symbol, src, count, offset, &
        myKind) result(GraphMemcpyNodeSetParamsToSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: symbol
      type(c_ptr), value :: src
      integer(c_size_t), value :: count
      integer(c_size_t), value :: offset
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      integer(kind(hipSuccess)) :: GraphMemcpyNodeSetParamsToSymbol
      GraphMemcpyNodeSetParamsToSymbol = hipGraphMemcpyNodeSetParamsToSymbol_(node%ptr, symbol, &
        src, count, offset, myKind)
    end function hipGraphMemcpyNodeSetParamsToSymbol_typed

    function hipGraphExecMemcpyNodeSetParamsToSymbol_typed(hGraphExec, node, symbol, src, count, &
        offset, myKind) result(GraphExecMemcpyNodeSetParamsToSymbol)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: symbol
      type(c_ptr), value :: src
      integer(c_size_t), value :: count
      integer(c_size_t), value :: offset
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      integer(kind(hipSuccess)) :: GraphExecMemcpyNodeSetParamsToSymbol
      GraphExecMemcpyNodeSetParamsToSymbol = hipGraphExecMemcpyNodeSetParamsToSymbol_( &
        hGraphExec%ptr, node%ptr, symbol, src, count, offset, myKind)
    end function hipGraphExecMemcpyNodeSetParamsToSymbol_typed

    function hipGraphAddMemsetNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        pMemsetParams) result(GraphAddMemsetNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t), value :: numDependencies
      type(hipMemsetParams) :: pMemsetParams
      integer(kind(hipSuccess)) :: GraphAddMemsetNode
      GraphAddMemsetNode = hipGraphAddMemsetNode_(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies, pMemsetParams)
    end function hipGraphAddMemsetNode_typed

    function hipGraphMemsetNodeGetParams_typed(node, pNodeParams) result(GraphMemsetNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipMemsetParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphMemsetNodeGetParams
      GraphMemsetNodeGetParams = hipGraphMemsetNodeGetParams_(node%ptr, pNodeParams)
    end function hipGraphMemsetNodeGetParams_typed

    function hipGraphMemsetNodeSetParams_typed(node, pNodeParams) result(GraphMemsetNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipMemsetParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphMemsetNodeSetParams
      GraphMemsetNodeSetParams = hipGraphMemsetNodeSetParams_(node%ptr, pNodeParams)
    end function hipGraphMemsetNodeSetParams_typed

    function hipGraphExecMemsetNodeSetParams_typed(hGraphExec, node, &
        pNodeParams) result(GraphExecMemsetNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(hipMemsetParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphExecMemsetNodeSetParams
      GraphExecMemsetNodeSetParams = hipGraphExecMemsetNodeSetParams_(hGraphExec%ptr, node%ptr, &
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
      integer(c_size_t), value :: numDependencies
      type(hipHostNodeParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphAddHostNode
      GraphAddHostNode = hipGraphAddHostNode_(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies, pNodeParams)
    end function hipGraphAddHostNode_typed

    function hipGraphHostNodeGetParams_typed(node, pNodeParams) result(GraphHostNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipHostNodeParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphHostNodeGetParams
      GraphHostNodeGetParams = hipGraphHostNodeGetParams_(node%ptr, pNodeParams)
    end function hipGraphHostNodeGetParams_typed

    function hipGraphHostNodeSetParams_typed(node, pNodeParams) result(GraphHostNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipHostNodeParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphHostNodeSetParams
      GraphHostNodeSetParams = hipGraphHostNodeSetParams_(node%ptr, pNodeParams)
    end function hipGraphHostNodeSetParams_typed

    function hipGraphExecHostNodeSetParams_typed(hGraphExec, node, &
        pNodeParams) result(GraphExecHostNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(hipHostNodeParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphExecHostNodeSetParams
      GraphExecHostNodeSetParams = hipGraphExecHostNodeSetParams_(hGraphExec%ptr, node%ptr, &
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
      integer(c_size_t), value :: numDependencies
      type(hipGraph_t), value :: childGraph
      integer(kind(hipSuccess)) :: GraphAddChildGraphNode
      GraphAddChildGraphNode = hipGraphAddChildGraphNode_(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, childGraph%ptr)
    end function hipGraphAddChildGraphNode_typed

    function hipGraphChildGraphNodeGetGraph_typed(node, pGraph) result(GraphChildGraphNodeGetGraph)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipGraph_t) :: pGraph
      integer(kind(hipSuccess)) :: GraphChildGraphNodeGetGraph
      GraphChildGraphNodeGetGraph = hipGraphChildGraphNodeGetGraph_(node%ptr, pGraph%ptr)
    end function hipGraphChildGraphNodeGetGraph_typed

    function hipGraphExecChildGraphNodeSetParams_typed(hGraphExec, node, &
        childGraph) result(GraphExecChildGraphNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: node
      type(hipGraph_t), value :: childGraph
      integer(kind(hipSuccess)) :: GraphExecChildGraphNodeSetParams
      GraphExecChildGraphNodeSetParams = hipGraphExecChildGraphNodeSetParams_(hGraphExec%ptr, &
        node%ptr, childGraph%ptr)
    end function hipGraphExecChildGraphNodeSetParams_typed

    function hipGraphAddEmptyNode_typed(pGraphNode, graph, pDependencies, &
        numDependencies) result(GraphAddEmptyNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t), value :: numDependencies
      integer(kind(hipSuccess)) :: GraphAddEmptyNode
      GraphAddEmptyNode = hipGraphAddEmptyNode_(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
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
      integer(c_size_t), value :: numDependencies
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: GraphAddEventRecordNode
      GraphAddEventRecordNode = hipGraphAddEventRecordNode_(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, event%ptr)
    end function hipGraphAddEventRecordNode_typed

    function hipGraphEventRecordNodeGetEvent_typed(node, &
        event_out) result(GraphEventRecordNodeGetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipEvent_t) :: event_out
      integer(kind(hipSuccess)) :: GraphEventRecordNodeGetEvent
      GraphEventRecordNodeGetEvent = hipGraphEventRecordNodeGetEvent_(node%ptr, event_out%ptr)
    end function hipGraphEventRecordNodeGetEvent_typed

    function hipGraphEventRecordNodeSetEvent_typed(node, event) result(GraphEventRecordNodeSetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: GraphEventRecordNodeSetEvent
      GraphEventRecordNodeSetEvent = hipGraphEventRecordNodeSetEvent_(node%ptr, event%ptr)
    end function hipGraphEventRecordNodeSetEvent_typed

    function hipGraphExecEventRecordNodeSetEvent_typed(hGraphExec, hNode, &
        event) result(GraphExecEventRecordNodeSetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: GraphExecEventRecordNodeSetEvent
      GraphExecEventRecordNodeSetEvent = hipGraphExecEventRecordNodeSetEvent_(hGraphExec%ptr, &
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
      integer(c_size_t), value :: numDependencies
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: GraphAddEventWaitNode
      GraphAddEventWaitNode = hipGraphAddEventWaitNode_(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, event%ptr)
    end function hipGraphAddEventWaitNode_typed

    function hipGraphEventWaitNodeGetEvent_typed(node, event_out) result(GraphEventWaitNodeGetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipEvent_t) :: event_out
      integer(kind(hipSuccess)) :: GraphEventWaitNodeGetEvent
      GraphEventWaitNodeGetEvent = hipGraphEventWaitNodeGetEvent_(node%ptr, event_out%ptr)
    end function hipGraphEventWaitNodeGetEvent_typed

    function hipGraphEventWaitNodeSetEvent_typed(node, event) result(GraphEventWaitNodeSetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: GraphEventWaitNodeSetEvent
      GraphEventWaitNodeSetEvent = hipGraphEventWaitNodeSetEvent_(node%ptr, event%ptr)
    end function hipGraphEventWaitNodeSetEvent_typed

    function hipGraphExecEventWaitNodeSetEvent_typed(hGraphExec, hNode, &
        event) result(GraphExecEventWaitNodeSetEvent)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(hipEvent_t), value :: event
      integer(kind(hipSuccess)) :: GraphExecEventWaitNodeSetEvent
      GraphExecEventWaitNodeSetEvent = hipGraphExecEventWaitNodeSetEvent_(hGraphExec%ptr, &
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
      integer(c_size_t), value :: numDependencies
      type(hipMemAllocNodeParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphAddMemAllocNode
      GraphAddMemAllocNode = hipGraphAddMemAllocNode_(pGraphNode%ptr, graph%ptr, &
        pDependencies%ptr, numDependencies, pNodeParams)
    end function hipGraphAddMemAllocNode_typed

    function hipGraphMemAllocNodeGetParams_typed(node, &
        pNodeParams) result(GraphMemAllocNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(hipMemAllocNodeParams) :: pNodeParams
      integer(kind(hipSuccess)) :: GraphMemAllocNodeGetParams
      GraphMemAllocNodeGetParams = hipGraphMemAllocNodeGetParams_(node%ptr, pNodeParams)
    end function hipGraphMemAllocNodeGetParams_typed

    function hipGraphAddMemFreeNode_typed(pGraphNode, graph, pDependencies, numDependencies, &
        dev_ptr) result(GraphAddMemFreeNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t), value :: numDependencies
      type(c_ptr), value :: dev_ptr
      integer(kind(hipSuccess)) :: GraphAddMemFreeNode
      GraphAddMemFreeNode = hipGraphAddMemFreeNode_(pGraphNode%ptr, graph%ptr, pDependencies%ptr, &
        numDependencies, dev_ptr)
    end function hipGraphAddMemFreeNode_typed

    function hipGraphMemFreeNodeGetParams_typed(node, dev_ptr) result(GraphMemFreeNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: node
      type(c_ptr), value :: dev_ptr
      integer(kind(hipSuccess)) :: GraphMemFreeNodeGetParams
      GraphMemFreeNodeGetParams = hipGraphMemFreeNodeGetParams_(node%ptr, dev_ptr)
    end function hipGraphMemFreeNodeGetParams_typed

    function hipUserObjectCreate_typed(object_out, ptr, destroy, initialRefcount, &
        flags) result(UserObjectCreate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipUserObject_t) :: object_out
      type(c_ptr), value :: ptr
      type(c_funptr), value :: destroy
      integer(c_int), value :: initialRefcount
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: UserObjectCreate
      UserObjectCreate = hipUserObjectCreate_(object_out%ptr, ptr, destroy, initialRefcount, flags)
    end function hipUserObjectCreate_typed

    function hipUserObjectRelease_typed(object, count) result(UserObjectRelease)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipUserObject_t), value :: object
      integer(c_int), value :: count
      integer(kind(hipSuccess)) :: UserObjectRelease
      UserObjectRelease = hipUserObjectRelease_(object%ptr, count)
    end function hipUserObjectRelease_typed

    function hipUserObjectRetain_typed(object, count) result(UserObjectRetain)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipUserObject_t), value :: object
      integer(c_int), value :: count
      integer(kind(hipSuccess)) :: UserObjectRetain
      UserObjectRetain = hipUserObjectRetain_(object%ptr, count)
    end function hipUserObjectRetain_typed

    function hipGraphRetainUserObject_typed(graph, object, count, &
        flags) result(GraphRetainUserObject)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipUserObject_t), value :: object
      integer(c_int), value :: count
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: GraphRetainUserObject
      GraphRetainUserObject = hipGraphRetainUserObject_(graph%ptr, object%ptr, count, flags)
    end function hipGraphRetainUserObject_typed

    function hipGraphReleaseUserObject_typed(graph, object, count) result(GraphReleaseUserObject)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(hipUserObject_t), value :: object
      integer(c_int), value :: count
      integer(kind(hipSuccess)) :: GraphReleaseUserObject
      GraphReleaseUserObject = hipGraphReleaseUserObject_(graph%ptr, object%ptr, count)
    end function hipGraphReleaseUserObject_typed

    function hipGraphDebugDotPrint_typed(graph, path, flags) result(GraphDebugDotPrint)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraph_t), value :: graph
      type(c_ptr), value :: path
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: GraphDebugDotPrint
      GraphDebugDotPrint = hipGraphDebugDotPrint_(graph%ptr, path, flags)
    end function hipGraphDebugDotPrint_typed

    function hipGraphDebugDotPrint_cstr(graph, path, flags) result(GraphDebugDotPrint)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: graph
      character(len=*), intent(in) :: path
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: GraphDebugDotPrint
      character(len=len_trim(path)+1, kind=c_char), target :: path__c
      path__c = trim(path)//c_null_char
      GraphDebugDotPrint = hipGraphDebugDotPrint_(graph, c_loc(path__c), flags)
    end function hipGraphDebugDotPrint_cstr

    function hipGraphKernelNodeCopyAttributes_typed(hSrc, &
        hDst) result(GraphKernelNodeCopyAttributes)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hSrc
      type(hipGraphNode_t), value :: hDst
      integer(kind(hipSuccess)) :: GraphKernelNodeCopyAttributes
      GraphKernelNodeCopyAttributes = hipGraphKernelNodeCopyAttributes_(hSrc%ptr, hDst%ptr)
    end function hipGraphKernelNodeCopyAttributes_typed

    function hipGraphNodeSetEnabled_typed(hGraphExec, hNode, isEnabled) result(GraphNodeSetEnabled)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      integer(c_int), value :: isEnabled
      integer(kind(hipSuccess)) :: GraphNodeSetEnabled
      GraphNodeSetEnabled = hipGraphNodeSetEnabled_(hGraphExec%ptr, hNode%ptr, isEnabled)
    end function hipGraphNodeSetEnabled_typed

    function hipGraphNodeGetEnabled_typed(hGraphExec, hNode, isEnabled) result(GraphNodeGetEnabled)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      integer(c_int) :: isEnabled
      integer(kind(hipSuccess)) :: GraphNodeGetEnabled
      GraphNodeGetEnabled = hipGraphNodeGetEnabled_(hGraphExec%ptr, hNode%ptr, isEnabled)
    end function hipGraphNodeGetEnabled_typed

    function hipGraphAddExternalSemaphoresWaitNode_typed(pGraphNode, graph, pDependencies, &
        numDependencies, nodeParams) result(GraphAddExternalSemaphoresWaitNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t), value :: numDependencies
      type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
      integer(kind(hipSuccess)) :: GraphAddExternalSemaphoresWaitNode
      GraphAddExternalSemaphoresWaitNode = hipGraphAddExternalSemaphoresWaitNode_(pGraphNode%ptr, &
        graph%ptr, pDependencies%ptr, numDependencies, nodeParams)
    end function hipGraphAddExternalSemaphoresWaitNode_typed

    function hipGraphAddExternalSemaphoresSignalNode_typed(pGraphNode, graph, pDependencies, &
        numDependencies, nodeParams) result(GraphAddExternalSemaphoresSignalNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: pGraphNode
      type(hipGraph_t), value :: graph
      type(hipGraphNode_t) :: pDependencies
      integer(c_size_t), value :: numDependencies
      type(hipExternalSemaphoreSignalNodeParams) :: nodeParams
      integer(kind(hipSuccess)) :: GraphAddExternalSemaphoresSignalNode
      GraphAddExternalSemaphoresSignalNode = hipGraphAddExternalSemaphoresSignalNode_( &
        pGraphNode%ptr, graph%ptr, pDependencies%ptr, numDependencies, nodeParams)
    end function hipGraphAddExternalSemaphoresSignalNode_typed

    function hipGraphExternalSemaphoresSignalNodeSetParams_typed(hNode, &
        nodeParams) result(GraphExternalSemaphoresSignalNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipExternalSemaphoreSignalNodeParams) :: nodeParams
      integer(kind(hipSuccess)) :: GraphExternalSemaphoresSignalNodeSetParams
      GraphExternalSemaphoresSignalNodeSetParams = hipGraphExternalSemaphoresSignalNodeSetParams_( &
        hNode%ptr, nodeParams)
    end function hipGraphExternalSemaphoresSignalNodeSetParams_typed

    function hipGraphExternalSemaphoresWaitNodeSetParams_typed(hNode, &
        nodeParams) result(GraphExternalSemaphoresWaitNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
      integer(kind(hipSuccess)) :: GraphExternalSemaphoresWaitNodeSetParams
      GraphExternalSemaphoresWaitNodeSetParams = hipGraphExternalSemaphoresWaitNodeSetParams_( &
        hNode%ptr, nodeParams)
    end function hipGraphExternalSemaphoresWaitNodeSetParams_typed

    function hipGraphExternalSemaphoresSignalNodeGetParams_typed(hNode, &
        params_out) result(GraphExternalSemaphoresSignalNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipExternalSemaphoreSignalNodeParams) :: params_out
      integer(kind(hipSuccess)) :: GraphExternalSemaphoresSignalNodeGetParams
      GraphExternalSemaphoresSignalNodeGetParams = hipGraphExternalSemaphoresSignalNodeGetParams_( &
        hNode%ptr, params_out)
    end function hipGraphExternalSemaphoresSignalNodeGetParams_typed

    function hipGraphExternalSemaphoresWaitNodeGetParams_typed(hNode, &
        params_out) result(GraphExternalSemaphoresWaitNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(hipExternalSemaphoreWaitNodeParams) :: params_out
      integer(kind(hipSuccess)) :: GraphExternalSemaphoresWaitNodeGetParams
      GraphExternalSemaphoresWaitNodeGetParams = hipGraphExternalSemaphoresWaitNodeGetParams_( &
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
      integer(kind(hipSuccess)) :: GraphExecExternalSemaphoresSignalNodeSetParams
      GraphExecExternalSemaphoresSignalNodeSetParams = &
        hipGraphExecExternalSemaphoresSignalNodeSetParams_(hGraphExec%ptr, hNode%ptr, nodeParams)
    end function hipGraphExecExternalSemaphoresSignalNodeSetParams_typed

    function hipGraphExecExternalSemaphoresWaitNodeSetParams_typed(hGraphExec, hNode, &
        nodeParams) result(GraphExecExternalSemaphoresWaitNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(hipExternalSemaphoreWaitNodeParams) :: nodeParams
      integer(kind(hipSuccess)) :: GraphExecExternalSemaphoresWaitNodeSetParams
      GraphExecExternalSemaphoresWaitNodeSetParams = &
        hipGraphExecExternalSemaphoresWaitNodeSetParams_(hGraphExec%ptr, hNode%ptr, nodeParams)
    end function hipGraphExecExternalSemaphoresWaitNodeSetParams_typed

    function hipDrvGraphMemcpyNodeGetParams_typed(hNode, &
        nodeParams) result(DrvGraphMemcpyNodeGetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(HIP_MEMCPY3D) :: nodeParams
      integer(kind(hipSuccess)) :: DrvGraphMemcpyNodeGetParams
      DrvGraphMemcpyNodeGetParams = hipDrvGraphMemcpyNodeGetParams_(hNode%ptr, nodeParams)
    end function hipDrvGraphMemcpyNodeGetParams_typed

    function hipDrvGraphMemcpyNodeSetParams_typed(hNode, &
        nodeParams) result(DrvGraphMemcpyNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t), value :: hNode
      type(HIP_MEMCPY3D) :: nodeParams
      integer(kind(hipSuccess)) :: DrvGraphMemcpyNodeSetParams
      DrvGraphMemcpyNodeSetParams = hipDrvGraphMemcpyNodeSetParams_(hNode%ptr, nodeParams)
    end function hipDrvGraphMemcpyNodeSetParams_typed

    function hipDrvGraphAddMemsetNode_typed(phGraphNode, hGraph, dependencies, numDependencies, &
        memsetParams, ctx) result(DrvGraphAddMemsetNode)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphNode_t) :: phGraphNode
      type(hipGraph_t), value :: hGraph
      type(hipGraphNode_t) :: dependencies
      integer(c_size_t), value :: numDependencies
      type(hipMemsetParams) :: memsetParams
      type(hipCtx_t), value :: ctx
      integer(kind(hipSuccess)) :: DrvGraphAddMemsetNode
      DrvGraphAddMemsetNode = hipDrvGraphAddMemsetNode_(phGraphNode%ptr, hGraph%ptr, &
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
      integer(c_size_t), value :: numDependencies
      type(c_ptr), value :: dptr
      integer(kind(hipSuccess)) :: DrvGraphAddMemFreeNode
      DrvGraphAddMemFreeNode = hipDrvGraphAddMemFreeNode_(phGraphNode%ptr, hGraph%ptr, &
        dependencies%ptr, numDependencies, dptr)
    end function hipDrvGraphAddMemFreeNode_typed

    function hipDrvGraphExecMemcpyNodeSetParams_typed(hGraphExec, hNode, copyParams, &
        ctx) result(DrvGraphExecMemcpyNodeSetParams)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: hGraphExec
      type(hipGraphNode_t), value :: hNode
      type(HIP_MEMCPY3D) :: copyParams
      type(hipCtx_t), value :: ctx
      integer(kind(hipSuccess)) :: DrvGraphExecMemcpyNodeSetParams
      DrvGraphExecMemcpyNodeSetParams = hipDrvGraphExecMemcpyNodeSetParams_(hGraphExec%ptr, &
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
      integer(kind(hipSuccess)) :: DrvGraphExecMemsetNodeSetParams
      DrvGraphExecMemsetNodeSetParams = hipDrvGraphExecMemsetNodeSetParams_(hGraphExec%ptr, &
        hNode%ptr, memsetParams, ctx%ptr)
    end function hipDrvGraphExecMemsetNodeSetParams_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipMemGetAccess_assumed_rank(flags,location,ptr)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetAccess_assumed_rank
      integer(c_int64_t),target,contiguous,dimension(..) :: flags
      type(hipMemLocation) :: location
      type(c_ptr) :: ptr
      !
      hipMemGetAccess_assumed_rank = hipMemGetAccess_(c_loc(flags),location,ptr)
    end function

#else
    function hipMemGetAccess_rank_0(flags,location,ptr)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetAccess_rank_0
      integer(c_int64_t),target :: flags
      type(hipMemLocation) :: location
      type(c_ptr) :: ptr
      !
      hipMemGetAccess_rank_0 = hipMemGetAccess_(c_loc(flags),location,ptr)
    end function

    function hipMemGetAccess_rank_1(flags,location,ptr)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetAccess_rank_1
      integer(c_int64_t),target,dimension(:) :: flags
      type(hipMemLocation) :: location
      type(c_ptr) :: ptr
      !
      hipMemGetAccess_rank_1 = hipMemGetAccess_(c_loc(flags),location,ptr)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipMemGetAllocationGranularity_assumed_rank(granularity,prop,option)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetAllocationGranularity_assumed_rank
      integer(c_size_t),target,contiguous,dimension(..) :: granularity
      type(hipMemAllocationProp) :: prop
      integer(kind(hipMemAllocationGranularityMinimum)) :: option
      !
      hipMemGetAllocationGranularity_assumed_rank = hipMemGetAllocationGranularity_(c_loc( &
        granularity),prop,option)
    end function

#else
    function hipMemGetAllocationGranularity_rank_0(granularity,prop,option)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetAllocationGranularity_rank_0
      integer(c_size_t),target :: granularity
      type(hipMemAllocationProp) :: prop
      integer(kind(hipMemAllocationGranularityMinimum)) :: option
      !
      hipMemGetAllocationGranularity_rank_0 = hipMemGetAllocationGranularity_(c_loc(granularity), &
        prop,option)
    end function

    function hipMemGetAllocationGranularity_rank_1(granularity,prop,option)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipMemGetAllocationGranularity_rank_1
      integer(c_size_t),target,dimension(:) :: granularity
      type(hipMemAllocationProp) :: prop
      integer(kind(hipMemAllocationGranularityMinimum)) :: option
      !
      hipMemGetAllocationGranularity_rank_1 = hipMemGetAllocationGranularity_(c_loc(granularity), &
        prop,option)
    end function

#endif
    function hipMemMapArrayAsync_typed(mapInfoList, count, stream) result(MemMapArrayAsync)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipArrayMapInfo) :: mapInfoList
      integer(c_int), value :: count
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemMapArrayAsync
      MemMapArrayAsync = hipMemMapArrayAsync_(mapInfoList, count, stream%ptr)
    end function hipMemMapArrayAsync_typed

    function hipGraphicsMapResources_typed(count, resources, stream) result(GraphicsMapResources)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int), value :: count
      type(c_ptr) :: resources
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: GraphicsMapResources
      GraphicsMapResources = hipGraphicsMapResources_(count, resources, stream%ptr)
    end function hipGraphicsMapResources_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGraphicsResourceGetMappedPointer_assumed_rank(devPtr,mySize,resource)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphicsResourceGetMappedPointer_assumed_rank
      type(c_ptr) :: devPtr
      integer(c_size_t),target,contiguous,dimension(..) :: mySize
      type(c_ptr) :: resource
      !
      hipGraphicsResourceGetMappedPointer_assumed_rank = hipGraphicsResourceGetMappedPointer_( &
        devPtr,c_loc(mySize),resource)
    end function

#else
    function hipGraphicsResourceGetMappedPointer_rank_0(devPtr,mySize,resource)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphicsResourceGetMappedPointer_rank_0
      type(c_ptr) :: devPtr
      integer(c_size_t),target :: mySize
      type(c_ptr) :: resource
      !
      hipGraphicsResourceGetMappedPointer_rank_0 = hipGraphicsResourceGetMappedPointer_(devPtr, &
        c_loc(mySize),resource)
    end function

    function hipGraphicsResourceGetMappedPointer_rank_1(devPtr,mySize,resource)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGraphicsResourceGetMappedPointer_rank_1
      type(c_ptr) :: devPtr
      integer(c_size_t),target,dimension(:) :: mySize
      type(c_ptr) :: resource
      !
      hipGraphicsResourceGetMappedPointer_rank_1 = hipGraphicsResourceGetMappedPointer_(devPtr, &
        c_loc(mySize),resource)
    end function

#endif
    function hipGraphicsUnmapResources_typed(count, resources, &
        stream) result(GraphicsUnmapResources)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      integer(c_int), value :: count
      type(c_ptr) :: resources
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: GraphicsUnmapResources
      GraphicsUnmapResources = hipGraphicsUnmapResources_(count, resources, stream%ptr)
    end function hipGraphicsUnmapResources_typed

    function hipMemsetAsync_spt_typed(dst, myValue, sizeBytes, stream) result(MemsetAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_int), value :: myValue
      integer(c_size_t), value :: sizeBytes
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemsetAsync_spt
      MemsetAsync_spt = hipMemsetAsync_spt_(dst, myValue, sizeBytes, stream%ptr)
    end function hipMemsetAsync_spt_typed

    function hipMemset2DAsync_spt_typed(dst, pitch, myValue, width, height, &
        stream) result(Memset2DAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_size_t), value :: pitch
      integer(c_int), value :: myValue
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memset2DAsync_spt
      Memset2DAsync_spt = hipMemset2DAsync_spt_(dst, pitch, myValue, width, height, stream%ptr)
    end function hipMemset2DAsync_spt_typed

    function hipMemset3DAsync_spt_typed(pitchedDevPtr, myValue, extent, &
        stream) result(Memset3DAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipPitchedPtr), value :: pitchedDevPtr
      integer(c_int), value :: myValue
      type(hipExtent), value :: extent
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memset3DAsync_spt
      Memset3DAsync_spt = hipMemset3DAsync_spt_(pitchedDevPtr, myValue, extent, stream%ptr)
    end function hipMemset3DAsync_spt_typed

    function hipMemcpyAsync_spt_typed(dst, src, sizeBytes, myKind, stream) result(MemcpyAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: src
      integer(c_size_t), value :: sizeBytes
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyAsync_spt
      MemcpyAsync_spt = hipMemcpyAsync_spt_(dst, src, sizeBytes, myKind, stream%ptr)
    end function hipMemcpyAsync_spt_typed

    function hipMemcpy3DAsync_spt_typed(p, stream) result(Memcpy3DAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipMemcpy3DParms) :: p
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memcpy3DAsync_spt
      Memcpy3DAsync_spt = hipMemcpy3DAsync_spt_(p, stream%ptr)
    end function hipMemcpy3DAsync_spt_typed

    function hipMemcpy2DAsync_spt_typed(dst, dpitch, src, spitch, width, height, myKind, &
        stream) result(Memcpy2DAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_size_t), value :: dpitch
      type(c_ptr), value :: src
      integer(c_size_t), value :: spitch
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memcpy2DAsync_spt
      Memcpy2DAsync_spt = hipMemcpy2DAsync_spt_(dst, dpitch, src, spitch, width, height, myKind, &
        stream%ptr)
    end function hipMemcpy2DAsync_spt_typed

    function hipMemcpyFromSymbolAsync_spt_typed(dst, symbol, sizeBytes, offset, myKind, &
        stream) result(MemcpyFromSymbolAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      type(c_ptr), value :: symbol
      integer(c_size_t), value :: sizeBytes
      integer(c_size_t), value :: offset
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyFromSymbolAsync_spt
      MemcpyFromSymbolAsync_spt = hipMemcpyFromSymbolAsync_spt_(dst, symbol, sizeBytes, offset, &
        myKind, stream%ptr)
    end function hipMemcpyFromSymbolAsync_spt_typed

    function hipMemcpyToSymbolAsync_spt_typed(symbol, src, sizeBytes, offset, myKind, &
        stream) result(MemcpyToSymbolAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: symbol
      type(c_ptr), value :: src
      integer(c_size_t), value :: sizeBytes
      integer(c_size_t), value :: offset
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: MemcpyToSymbolAsync_spt
      MemcpyToSymbolAsync_spt = hipMemcpyToSymbolAsync_spt_(symbol, src, sizeBytes, offset, &
        myKind, stream%ptr)
    end function hipMemcpyToSymbolAsync_spt_typed

    function hipMemcpy2DFromArrayAsync_spt_typed(dst, dpitch, src, wOffsetSrc, hOffsetSrc, width, &
        height, myKind, stream) result(Memcpy2DFromArrayAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_size_t), value :: dpitch
      type(c_ptr), value :: src
      integer(c_size_t), value :: wOffsetSrc
      integer(c_size_t), value :: hOffsetSrc
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memcpy2DFromArrayAsync_spt
      Memcpy2DFromArrayAsync_spt = hipMemcpy2DFromArrayAsync_spt_(dst, dpitch, src, wOffsetSrc, &
        hOffsetSrc, width, height, myKind, stream%ptr)
    end function hipMemcpy2DFromArrayAsync_spt_typed

    function hipMemcpy2DToArrayAsync_spt_typed(dst, wOffset, hOffset, src, spitch, width, height, &
        myKind, stream) result(Memcpy2DToArrayAsync_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: dst
      integer(c_size_t), value :: wOffset
      integer(c_size_t), value :: hOffset
      type(c_ptr), value :: src
      integer(c_size_t), value :: spitch
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      integer(kind(hipMemcpyHostToHost)), value :: myKind
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: Memcpy2DToArrayAsync_spt
      Memcpy2DToArrayAsync_spt = hipMemcpy2DToArrayAsync_spt_(dst, wOffset, hOffset, src, spitch, &
        width, height, myKind, stream%ptr)
    end function hipMemcpy2DToArrayAsync_spt_typed

    function hipStreamQuery_spt_typed(stream) result(StreamQuery_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: StreamQuery_spt
      StreamQuery_spt = hipStreamQuery_spt_(stream%ptr)
    end function hipStreamQuery_spt_typed

    function hipStreamSynchronize_spt_typed(stream) result(StreamSynchronize_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: StreamSynchronize_spt
      StreamSynchronize_spt = hipStreamSynchronize_spt_(stream%ptr)
    end function hipStreamSynchronize_spt_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipStreamGetPriority_spt_assumed_rank(stream,priority)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetPriority_spt_assumed_rank
      type(hipStream_t) :: stream
      integer(c_int),target,contiguous,dimension(..) :: priority
      !
      hipStreamGetPriority_spt_assumed_rank = hipStreamGetPriority_spt_(stream%ptr,c_loc(priority))
    end function

    function hipStreamGetPriority_spt_assumed_rank_cptr(stream,priority)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetPriority_spt_assumed_rank_cptr
      type(c_ptr) :: stream
      integer(c_int),target,contiguous,dimension(..) :: priority
      !
      hipStreamGetPriority_spt_assumed_rank_cptr = hipStreamGetPriority_spt_(stream,c_loc(priority))
    end function

#else
    function hipStreamGetPriority_spt_rank_0(stream,priority)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetPriority_spt_rank_0
      type(hipStream_t) :: stream
      integer(c_int),target :: priority
      !
      hipStreamGetPriority_spt_rank_0 = hipStreamGetPriority_spt_(stream%ptr,c_loc(priority))
    end function

    function hipStreamGetPriority_spt_rank_0_cptr(stream,priority)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetPriority_spt_rank_0_cptr
      type(c_ptr) :: stream
      integer(c_int),target :: priority
      !
      hipStreamGetPriority_spt_rank_0_cptr = hipStreamGetPriority_spt_(stream,c_loc(priority))
    end function

    function hipStreamGetPriority_spt_rank_1(stream,priority)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetPriority_spt_rank_1
      type(hipStream_t) :: stream
      integer(c_int),target,dimension(:) :: priority
      !
      hipStreamGetPriority_spt_rank_1 = hipStreamGetPriority_spt_(stream%ptr,c_loc(priority))
    end function

    function hipStreamGetPriority_spt_rank_1_cptr(stream,priority)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetPriority_spt_rank_1_cptr
      type(c_ptr) :: stream
      integer(c_int),target,dimension(:) :: priority
      !
      hipStreamGetPriority_spt_rank_1_cptr = hipStreamGetPriority_spt_(stream,c_loc(priority))
    end function

#endif
    function hipStreamGetPriority_spt_typed(stream, priority) result(StreamGetPriority_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: priority
      integer(kind(hipSuccess)) :: StreamGetPriority_spt
      StreamGetPriority_spt = hipStreamGetPriority_spt_(stream%ptr, priority)
    end function hipStreamGetPriority_spt_typed

    function hipStreamWaitEvent_spt_typed(stream, event, flags) result(StreamWaitEvent_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(hipEvent_t), value :: event
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: StreamWaitEvent_spt
      StreamWaitEvent_spt = hipStreamWaitEvent_spt_(stream%ptr, event%ptr, flags)
    end function hipStreamWaitEvent_spt_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipStreamGetFlags_spt_assumed_rank(stream,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetFlags_spt_assumed_rank
      type(hipStream_t) :: stream
      integer(c_int),target,contiguous,dimension(..) :: flags
      !
      hipStreamGetFlags_spt_assumed_rank = hipStreamGetFlags_spt_(stream%ptr,c_loc(flags))
    end function

    function hipStreamGetFlags_spt_assumed_rank_cptr(stream,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetFlags_spt_assumed_rank_cptr
      type(c_ptr) :: stream
      integer(c_int),target,contiguous,dimension(..) :: flags
      !
      hipStreamGetFlags_spt_assumed_rank_cptr = hipStreamGetFlags_spt_(stream,c_loc(flags))
    end function

#else
    function hipStreamGetFlags_spt_rank_0(stream,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetFlags_spt_rank_0
      type(hipStream_t) :: stream
      integer(c_int),target :: flags
      !
      hipStreamGetFlags_spt_rank_0 = hipStreamGetFlags_spt_(stream%ptr,c_loc(flags))
    end function

    function hipStreamGetFlags_spt_rank_0_cptr(stream,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetFlags_spt_rank_0_cptr
      type(c_ptr) :: stream
      integer(c_int),target :: flags
      !
      hipStreamGetFlags_spt_rank_0_cptr = hipStreamGetFlags_spt_(stream,c_loc(flags))
    end function

    function hipStreamGetFlags_spt_rank_1(stream,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetFlags_spt_rank_1
      type(hipStream_t) :: stream
      integer(c_int),target,dimension(:) :: flags
      !
      hipStreamGetFlags_spt_rank_1 = hipStreamGetFlags_spt_(stream%ptr,c_loc(flags))
    end function

    function hipStreamGetFlags_spt_rank_1_cptr(stream,flags)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetFlags_spt_rank_1_cptr
      type(c_ptr) :: stream
      integer(c_int),target,dimension(:) :: flags
      !
      hipStreamGetFlags_spt_rank_1_cptr = hipStreamGetFlags_spt_(stream,c_loc(flags))
    end function

#endif
    function hipStreamGetFlags_spt_typed(stream, flags) result(StreamGetFlags_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: flags
      integer(kind(hipSuccess)) :: StreamGetFlags_spt
      StreamGetFlags_spt = hipStreamGetFlags_spt_(stream%ptr, flags)
    end function hipStreamGetFlags_spt_typed

    function hipStreamAddCallback_spt_typed(stream, callback, userData, &
        flags) result(StreamAddCallback_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_funptr), value :: callback
      type(c_ptr), value :: userData
      integer(c_int), value :: flags
      integer(kind(hipSuccess)) :: StreamAddCallback_spt
      StreamAddCallback_spt = hipStreamAddCallback_spt_(stream%ptr, callback, userData, flags)
    end function hipStreamAddCallback_spt_typed

    function hipEventRecord_spt_typed(event, stream) result(EventRecord_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipEvent_t), value :: event
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: EventRecord_spt
      EventRecord_spt = hipEventRecord_spt_(event%ptr, stream%ptr)
    end function hipEventRecord_spt_typed

    function hipLaunchCooperativeKernel_spt_typed(f, gridDim, blockDim, kernelParams, &
        sharedMemBytes, hStream) result(LaunchCooperativeKernel_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: f
      type(dim3), value :: gridDim
      type(dim3), value :: blockDim
      type(c_ptr) :: kernelParams
      integer(c_int32_t), value :: sharedMemBytes
      type(hipStream_t), value :: hStream
      integer(kind(hipSuccess)) :: LaunchCooperativeKernel_spt
      LaunchCooperativeKernel_spt = hipLaunchCooperativeKernel_spt_(f, gridDim, blockDim, &
        kernelParams, sharedMemBytes, hStream%ptr)
    end function hipLaunchCooperativeKernel_spt_typed

    function hipLaunchKernel_spt_typed(function_address, numBlocks, dimBlocks, args, &
        sharedMemBytes, stream) result(LaunchKernel_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(c_ptr), value :: function_address
      type(dim3), value :: numBlocks
      type(dim3), value :: dimBlocks
      type(c_ptr) :: args
      integer(c_size_t), value :: sharedMemBytes
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: LaunchKernel_spt
      LaunchKernel_spt = hipLaunchKernel_spt_(function_address, numBlocks, dimBlocks, args, &
        sharedMemBytes, stream%ptr)
    end function hipLaunchKernel_spt_typed

    function hipGraphLaunch_spt_typed(graphExec, stream) result(GraphLaunch_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipGraphExec_t), value :: graphExec
      type(hipStream_t), value :: stream
      integer(kind(hipSuccess)) :: GraphLaunch_spt
      GraphLaunch_spt = hipGraphLaunch_spt_(graphExec%ptr, stream%ptr)
    end function hipGraphLaunch_spt_typed

    function hipStreamBeginCapture_spt_typed(stream, mode) result(StreamBeginCapture_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      integer(kind(hipStreamCaptureModeGlobal)), value :: mode
      integer(kind(hipSuccess)) :: StreamBeginCapture_spt
      StreamBeginCapture_spt = hipStreamBeginCapture_spt_(stream%ptr, mode)
    end function hipStreamBeginCapture_spt_typed

    function hipStreamEndCapture_spt_typed(stream, pGraph) result(StreamEndCapture_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(hipGraph_t) :: pGraph
      integer(kind(hipSuccess)) :: StreamEndCapture_spt
      StreamEndCapture_spt = hipStreamEndCapture_spt_(stream%ptr, pGraph%ptr)
    end function hipStreamEndCapture_spt_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipStreamIsCapturing_spt_assumed_rank(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_spt_assumed_rank
      type(hipStream_t) :: stream
      integer(c_int),target,contiguous,dimension(..) :: pCaptureStatus
      !
      hipStreamIsCapturing_spt_assumed_rank = hipStreamIsCapturing_spt_(stream%ptr, &
        c_loc(pCaptureStatus))
    end function

    function hipStreamIsCapturing_spt_assumed_rank_cptr(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_spt_assumed_rank_cptr
      type(c_ptr) :: stream
      integer(c_int),target,contiguous,dimension(..) :: pCaptureStatus
      !
      hipStreamIsCapturing_spt_assumed_rank_cptr = hipStreamIsCapturing_spt_(stream, &
        c_loc(pCaptureStatus))
    end function

#else
    function hipStreamIsCapturing_spt_rank_0(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_spt_rank_0
      type(hipStream_t) :: stream
      integer(c_int),target :: pCaptureStatus
      !
      hipStreamIsCapturing_spt_rank_0 = hipStreamIsCapturing_spt_(stream%ptr,c_loc(pCaptureStatus))
    end function

    function hipStreamIsCapturing_spt_rank_0_cptr(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_spt_rank_0_cptr
      type(c_ptr) :: stream
      integer(c_int),target :: pCaptureStatus
      !
      hipStreamIsCapturing_spt_rank_0_cptr = hipStreamIsCapturing_spt_(stream,c_loc(pCaptureStatus))
    end function

    function hipStreamIsCapturing_spt_rank_1(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_spt_rank_1
      type(hipStream_t) :: stream
      integer(c_int),target,dimension(:) :: pCaptureStatus
      !
      hipStreamIsCapturing_spt_rank_1 = hipStreamIsCapturing_spt_(stream%ptr,c_loc(pCaptureStatus))
    end function

    function hipStreamIsCapturing_spt_rank_1_cptr(stream,pCaptureStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamIsCapturing_spt_rank_1_cptr
      type(c_ptr) :: stream
      integer(c_int),target,dimension(:) :: pCaptureStatus
      !
      hipStreamIsCapturing_spt_rank_1_cptr = hipStreamIsCapturing_spt_(stream,c_loc(pCaptureStatus))
    end function

#endif
    function hipStreamIsCapturing_spt_typed(stream, pCaptureStatus) result(StreamIsCapturing_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: pCaptureStatus
      integer(kind(hipSuccess)) :: StreamIsCapturing_spt
      StreamIsCapturing_spt = hipStreamIsCapturing_spt_(stream%ptr, pCaptureStatus)
    end function hipStreamIsCapturing_spt_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipStreamGetCaptureInfo_spt_assumed_rank(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_spt_assumed_rank
      type(hipStream_t) :: stream
      integer(c_int),target,contiguous,dimension(..) :: pCaptureStatus
      integer(c_int64_t),target,contiguous,dimension(..) :: pId
      !
      hipStreamGetCaptureInfo_spt_assumed_rank = hipStreamGetCaptureInfo_spt_(stream%ptr, &
        c_loc(pCaptureStatus),c_loc(pId))
    end function

    function hipStreamGetCaptureInfo_spt_assumed_rank_cptr(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_spt_assumed_rank_cptr
      type(c_ptr) :: stream
      integer(c_int),target,contiguous,dimension(..) :: pCaptureStatus
      integer(c_int64_t),target,contiguous,dimension(..) :: pId
      !
      hipStreamGetCaptureInfo_spt_assumed_rank_cptr = hipStreamGetCaptureInfo_spt_(stream, &
        c_loc(pCaptureStatus),c_loc(pId))
    end function

#else
    function hipStreamGetCaptureInfo_spt_rank_0(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_spt_rank_0
      type(hipStream_t) :: stream
      integer(c_int),target :: pCaptureStatus
      integer(c_int64_t),target :: pId
      !
      hipStreamGetCaptureInfo_spt_rank_0 = hipStreamGetCaptureInfo_spt_(stream%ptr, &
        c_loc(pCaptureStatus),c_loc(pId))
    end function

    function hipStreamGetCaptureInfo_spt_rank_0_cptr(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_spt_rank_0_cptr
      type(c_ptr) :: stream
      integer(c_int),target :: pCaptureStatus
      integer(c_int64_t),target :: pId
      !
      hipStreamGetCaptureInfo_spt_rank_0_cptr = hipStreamGetCaptureInfo_spt_(stream, &
        c_loc(pCaptureStatus),c_loc(pId))
    end function

    function hipStreamGetCaptureInfo_spt_rank_1(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_spt_rank_1
      type(hipStream_t) :: stream
      integer(c_int),target,dimension(:) :: pCaptureStatus
      integer(c_int64_t),target,dimension(:) :: pId
      !
      hipStreamGetCaptureInfo_spt_rank_1 = hipStreamGetCaptureInfo_spt_(stream%ptr, &
        c_loc(pCaptureStatus),c_loc(pId))
    end function

    function hipStreamGetCaptureInfo_spt_rank_1_cptr(stream,pCaptureStatus,pId)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_spt_rank_1_cptr
      type(c_ptr) :: stream
      integer(c_int),target,dimension(:) :: pCaptureStatus
      integer(c_int64_t),target,dimension(:) :: pId
      !
      hipStreamGetCaptureInfo_spt_rank_1_cptr = hipStreamGetCaptureInfo_spt_(stream, &
        c_loc(pCaptureStatus),c_loc(pId))
    end function

#endif
    function hipStreamGetCaptureInfo_spt_typed(stream, pCaptureStatus, &
        pId) result(StreamGetCaptureInfo_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_ptr), value :: pCaptureStatus
      type(c_ptr), value :: pId
      integer(kind(hipSuccess)) :: StreamGetCaptureInfo_spt
      StreamGetCaptureInfo_spt = hipStreamGetCaptureInfo_spt_(stream%ptr, pCaptureStatus, pId)
    end function hipStreamGetCaptureInfo_spt_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipStreamGetCaptureInfo_v2_spt_assumed_rank(stream,captureStatus_out,id_out, &
        graph_out,dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_spt_assumed_rank
      type(hipStream_t) :: stream
      integer(c_int),target,contiguous,dimension(..) :: captureStatus_out
      integer(c_int64_t),target,contiguous,dimension(..) :: id_out
      type(hipGraph_t) :: graph_out
      type(hipGraphNode_t) :: dependencies_out
      integer(c_size_t),target,contiguous,dimension(..) :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_spt_assumed_rank = hipStreamGetCaptureInfo_v2_spt_(stream%ptr, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out%ptr,dependencies_out%ptr, &
        c_loc(numDependencies_out))
    end function

    function hipStreamGetCaptureInfo_v2_spt_assumed_rank_cptr(stream,captureStatus_out,id_out, &
        graph_out,dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_spt_assumed_rank_cptr
      type(c_ptr) :: stream
      integer(c_int),target,contiguous,dimension(..) :: captureStatus_out
      integer(c_int64_t),target,contiguous,dimension(..) :: id_out
      type(c_ptr) :: graph_out
      type(c_ptr) :: dependencies_out
      integer(c_size_t),target,contiguous,dimension(..) :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_spt_assumed_rank_cptr = hipStreamGetCaptureInfo_v2_spt_(stream, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out,dependencies_out, &
        c_loc(numDependencies_out))
    end function

#else
    function hipStreamGetCaptureInfo_v2_spt_rank_0(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_spt_rank_0
      type(hipStream_t) :: stream
      integer(c_int),target :: captureStatus_out
      integer(c_int64_t),target :: id_out
      type(hipGraph_t) :: graph_out
      type(hipGraphNode_t) :: dependencies_out
      integer(c_size_t),target :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_spt_rank_0 = hipStreamGetCaptureInfo_v2_spt_(stream%ptr, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out%ptr,dependencies_out%ptr, &
        c_loc(numDependencies_out))
    end function

    function hipStreamGetCaptureInfo_v2_spt_rank_0_cptr(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_spt_rank_0_cptr
      type(c_ptr) :: stream
      integer(c_int),target :: captureStatus_out
      integer(c_int64_t),target :: id_out
      type(c_ptr) :: graph_out
      type(c_ptr) :: dependencies_out
      integer(c_size_t),target :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_spt_rank_0_cptr = hipStreamGetCaptureInfo_v2_spt_(stream, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out,dependencies_out, &
        c_loc(numDependencies_out))
    end function

    function hipStreamGetCaptureInfo_v2_spt_rank_1(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_spt_rank_1
      type(hipStream_t) :: stream
      integer(c_int),target,dimension(:) :: captureStatus_out
      integer(c_int64_t),target,dimension(:) :: id_out
      type(hipGraph_t) :: graph_out
      type(hipGraphNode_t) :: dependencies_out
      integer(c_size_t),target,dimension(:) :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_spt_rank_1 = hipStreamGetCaptureInfo_v2_spt_(stream%ptr, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out%ptr,dependencies_out%ptr, &
        c_loc(numDependencies_out))
    end function

    function hipStreamGetCaptureInfo_v2_spt_rank_1_cptr(stream,captureStatus_out,id_out,graph_out, &
        dependencies_out,numDependencies_out)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipStreamGetCaptureInfo_v2_spt_rank_1_cptr
      type(c_ptr) :: stream
      integer(c_int),target,dimension(:) :: captureStatus_out
      integer(c_int64_t),target,dimension(:) :: id_out
      type(c_ptr) :: graph_out
      type(c_ptr) :: dependencies_out
      integer(c_size_t),target,dimension(:) :: numDependencies_out
      !
      hipStreamGetCaptureInfo_v2_spt_rank_1_cptr = hipStreamGetCaptureInfo_v2_spt_(stream, &
        c_loc(captureStatus_out),c_loc(id_out),graph_out,dependencies_out, &
        c_loc(numDependencies_out))
    end function

#endif
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
      integer(kind(hipSuccess)) :: StreamGetCaptureInfo_v2_spt
      StreamGetCaptureInfo_v2_spt = hipStreamGetCaptureInfo_v2_spt_(stream%ptr, captureStatus_out, &
        id_out, graph_out%ptr, dependencies_out%ptr, numDependencies_out)
    end function hipStreamGetCaptureInfo_v2_spt_typed

    function hipLaunchHostFunc_spt_typed(stream, fn, userData) result(LaunchHostFunc_spt)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipStream_t), value :: stream
      type(c_funptr), value :: fn
      type(c_ptr), value :: userData
      integer(kind(hipSuccess)) :: LaunchHostFunc_spt
      LaunchHostFunc_spt = hipLaunchHostFunc_spt_(stream%ptr, fn, userData)
    end function hipLaunchHostFunc_spt_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGetDriverEntryPoint_spt_assumed_rank(symbol,funcPtr,flags,status)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetDriverEntryPoint_spt_assumed_rank
      type(c_ptr) :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t) :: flags
      integer(c_int),target,contiguous,dimension(..) :: status
      !
      hipGetDriverEntryPoint_spt_assumed_rank = hipGetDriverEntryPoint_spt_(symbol,funcPtr,flags, &
        c_loc(status))
    end function

#else
    function hipGetDriverEntryPoint_spt_rank_0(symbol,funcPtr,flags,status)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetDriverEntryPoint_spt_rank_0
      type(c_ptr) :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t) :: flags
      integer(c_int),target :: status
      !
      hipGetDriverEntryPoint_spt_rank_0 = hipGetDriverEntryPoint_spt_(symbol,funcPtr,flags, &
        c_loc(status))
    end function

    function hipGetDriverEntryPoint_spt_rank_1(symbol,funcPtr,flags,status)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetDriverEntryPoint_spt_rank_1
      type(c_ptr) :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t) :: flags
      integer(c_int),target,dimension(:) :: status
      !
      hipGetDriverEntryPoint_spt_rank_1 = hipGetDriverEntryPoint_spt_(symbol,funcPtr,flags, &
        c_loc(status))
    end function

#endif
    function hipGetDriverEntryPoint_spt_cstr(symbol, funcPtr, flags, &
        status) result(GetDriverEntryPoint_spt)
      use, intrinsic :: iso_c_binding
      implicit none
      character(len=*), intent(in) :: symbol
      type(c_ptr) :: funcPtr
      integer(c_int64_t), value :: flags
      type(c_ptr), value :: status
      integer(kind(hipSuccess)) :: GetDriverEntryPoint_spt
      character(len=len_trim(symbol)+1, kind=c_char), target :: symbol__c
      symbol__c = trim(symbol)//c_null_char
      GetDriverEntryPoint_spt = hipGetDriverEntryPoint_spt_(c_loc(symbol__c), funcPtr, flags, &
        status)
    end function hipGetDriverEntryPoint_spt_cstr

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipGetProcAddress_spt_assumed_rank(symbol,pfn,hipVersion,flags,symbolStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetProcAddress_spt_assumed_rank
      type(c_ptr) :: symbol
      type(c_ptr) :: pfn
      integer(c_int) :: hipVersion
      integer(c_int64_t) :: flags
      integer(c_int),target,contiguous,dimension(..) :: symbolStatus
      !
      hipGetProcAddress_spt_assumed_rank = hipGetProcAddress_spt_(symbol,pfn,hipVersion,flags, &
        c_loc(symbolStatus))
    end function

#else
    function hipGetProcAddress_spt_rank_0(symbol,pfn,hipVersion,flags,symbolStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetProcAddress_spt_rank_0
      type(c_ptr) :: symbol
      type(c_ptr) :: pfn
      integer(c_int) :: hipVersion
      integer(c_int64_t) :: flags
      integer(c_int),target :: symbolStatus
      !
      hipGetProcAddress_spt_rank_0 = hipGetProcAddress_spt_(symbol,pfn,hipVersion,flags, &
        c_loc(symbolStatus))
    end function

    function hipGetProcAddress_spt_rank_1(symbol,pfn,hipVersion,flags,symbolStatus)
      use iso_c_binding
      implicit none
      integer(kind(hipSuccess)) :: hipGetProcAddress_spt_rank_1
      type(c_ptr) :: symbol
      type(c_ptr) :: pfn
      integer(c_int) :: hipVersion
      integer(c_int64_t) :: flags
      integer(c_int),target,dimension(:) :: symbolStatus
      !
      hipGetProcAddress_spt_rank_1 = hipGetProcAddress_spt_(symbol,pfn,hipVersion,flags, &
        c_loc(symbolStatus))
    end function

#endif
    function hipGetProcAddress_spt_cstr(symbol, pfn, hipVersion, flags, &
        symbolStatus) result(GetProcAddress_spt)
      use, intrinsic :: iso_c_binding
      implicit none
      character(len=*), intent(in) :: symbol
      type(c_ptr) :: pfn
      integer(c_int), value :: hipVersion
      integer(c_int64_t), value :: flags
      type(c_ptr), value :: symbolStatus
      integer(kind(hipSuccess)) :: GetProcAddress_spt
      character(len=len_trim(symbol)+1, kind=c_char), target :: symbol__c
      symbol__c = trim(symbol)//c_null_char
      GetProcAddress_spt = hipGetProcAddress_spt_(c_loc(symbol__c), pfn, hipVersion, flags, &
        symbolStatus)
    end function hipGetProcAddress_spt_cstr

