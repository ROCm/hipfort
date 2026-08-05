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

module hipfort_hipmalloc
  use, intrinsic :: iso_c_binding
  use hipfort_hipmemcpy   ! hipMemcpy_ for the source=/dsource= hipMalloc forms
  implicit none

  interface hipMalloc
  !>   @brief Allocate memory on the default accelerator
  !>
  !>   @param[out] ptr Pointer to the allocated memory
  !>   @param[in]  size Requested memory size
  !>
  !>   If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
  !>
  !>   @returns `hipSuccess`, `hipErrorOutOfMemory`, `hipErrorInvalidValue` (bad context, null *ptr)
  !>
  !>   @see hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D, hipMalloc3DArray,
  !>  hipHostFree, hipHostMalloc
#ifdef USE_CUDA_NAMES
    function hipMalloc_(ptr, sizeBytes) bind(c, name="cudaMalloc")
#else
    function hipMalloc_(ptr, sizeBytes) bind(c, name="hipMalloc")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipMalloc_
      type(c_ptr) :: ptr
      integer(c_size_t), value :: sizeBytes
    end function hipMalloc_
    module procedure hipMalloc_i4_0_source
    module procedure hipMalloc_i4_1
    module procedure hipMalloc_i4_1_c_size_t
    module procedure hipMalloc_i4_1_source
    module procedure hipMalloc_i4_2
    module procedure hipMalloc_i4_2_c_size_t
    module procedure hipMalloc_i4_2_source
    module procedure hipMalloc_i4_3
    module procedure hipMalloc_i4_3_c_size_t
    module procedure hipMalloc_i4_3_source
    module procedure hipMalloc_i4_4
    module procedure hipMalloc_i4_4_c_size_t
    module procedure hipMalloc_i4_4_source
    module procedure hipMalloc_i4_5
    module procedure hipMalloc_i4_5_c_size_t
    module procedure hipMalloc_i4_5_source
    module procedure hipMalloc_i4_6
    module procedure hipMalloc_i4_6_c_size_t
    module procedure hipMalloc_i4_6_source
    module procedure hipMalloc_i4_7
    module procedure hipMalloc_i4_7_c_size_t
    module procedure hipMalloc_i4_7_source
    module procedure hipMalloc_i8_0_source
    module procedure hipMalloc_i8_1
    module procedure hipMalloc_i8_1_c_size_t
    module procedure hipMalloc_i8_1_source
    module procedure hipMalloc_i8_2
    module procedure hipMalloc_i8_2_c_size_t
    module procedure hipMalloc_i8_2_source
    module procedure hipMalloc_i8_3
    module procedure hipMalloc_i8_3_c_size_t
    module procedure hipMalloc_i8_3_source
    module procedure hipMalloc_i8_4
    module procedure hipMalloc_i8_4_c_size_t
    module procedure hipMalloc_i8_4_source
    module procedure hipMalloc_i8_5
    module procedure hipMalloc_i8_5_c_size_t
    module procedure hipMalloc_i8_5_source
    module procedure hipMalloc_i8_6
    module procedure hipMalloc_i8_6_c_size_t
    module procedure hipMalloc_i8_6_source
    module procedure hipMalloc_i8_7
    module procedure hipMalloc_i8_7_c_size_t
    module procedure hipMalloc_i8_7_source
    module procedure hipMalloc_r4_0_source
    module procedure hipMalloc_r4_1
    module procedure hipMalloc_r4_1_c_size_t
    module procedure hipMalloc_r4_1_source
    module procedure hipMalloc_r4_2
    module procedure hipMalloc_r4_2_c_size_t
    module procedure hipMalloc_r4_2_source
    module procedure hipMalloc_r4_3
    module procedure hipMalloc_r4_3_c_size_t
    module procedure hipMalloc_r4_3_source
    module procedure hipMalloc_r4_4
    module procedure hipMalloc_r4_4_c_size_t
    module procedure hipMalloc_r4_4_source
    module procedure hipMalloc_r4_5
    module procedure hipMalloc_r4_5_c_size_t
    module procedure hipMalloc_r4_5_source
    module procedure hipMalloc_r4_6
    module procedure hipMalloc_r4_6_c_size_t
    module procedure hipMalloc_r4_6_source
    module procedure hipMalloc_r4_7
    module procedure hipMalloc_r4_7_c_size_t
    module procedure hipMalloc_r4_7_source
    module procedure hipMalloc_r8_0_source
    module procedure hipMalloc_r8_1
    module procedure hipMalloc_r8_1_c_size_t
    module procedure hipMalloc_r8_1_source
    module procedure hipMalloc_r8_2
    module procedure hipMalloc_r8_2_c_size_t
    module procedure hipMalloc_r8_2_source
    module procedure hipMalloc_r8_3
    module procedure hipMalloc_r8_3_c_size_t
    module procedure hipMalloc_r8_3_source
    module procedure hipMalloc_r8_4
    module procedure hipMalloc_r8_4_c_size_t
    module procedure hipMalloc_r8_4_source
    module procedure hipMalloc_r8_5
    module procedure hipMalloc_r8_5_c_size_t
    module procedure hipMalloc_r8_5_source
    module procedure hipMalloc_r8_6
    module procedure hipMalloc_r8_6_c_size_t
    module procedure hipMalloc_r8_6_source
    module procedure hipMalloc_r8_7
    module procedure hipMalloc_r8_7_c_size_t
    module procedure hipMalloc_r8_7_source
    module procedure hipMalloc_c4_0_source
    module procedure hipMalloc_c4_1
    module procedure hipMalloc_c4_1_c_size_t
    module procedure hipMalloc_c4_1_source
    module procedure hipMalloc_c4_2
    module procedure hipMalloc_c4_2_c_size_t
    module procedure hipMalloc_c4_2_source
    module procedure hipMalloc_c4_3
    module procedure hipMalloc_c4_3_c_size_t
    module procedure hipMalloc_c4_3_source
    module procedure hipMalloc_c4_4
    module procedure hipMalloc_c4_4_c_size_t
    module procedure hipMalloc_c4_4_source
    module procedure hipMalloc_c4_5
    module procedure hipMalloc_c4_5_c_size_t
    module procedure hipMalloc_c4_5_source
    module procedure hipMalloc_c4_6
    module procedure hipMalloc_c4_6_c_size_t
    module procedure hipMalloc_c4_6_source
    module procedure hipMalloc_c4_7
    module procedure hipMalloc_c4_7_c_size_t
    module procedure hipMalloc_c4_7_source
    module procedure hipMalloc_c8_0_source
    module procedure hipMalloc_c8_1
    module procedure hipMalloc_c8_1_c_size_t
    module procedure hipMalloc_c8_1_source
    module procedure hipMalloc_c8_2
    module procedure hipMalloc_c8_2_c_size_t
    module procedure hipMalloc_c8_2_source
    module procedure hipMalloc_c8_3
    module procedure hipMalloc_c8_3_c_size_t
    module procedure hipMalloc_c8_3_source
    module procedure hipMalloc_c8_4
    module procedure hipMalloc_c8_4_c_size_t
    module procedure hipMalloc_c8_4_source
    module procedure hipMalloc_c8_5
    module procedure hipMalloc_c8_5_c_size_t
    module procedure hipMalloc_c8_5_source
    module procedure hipMalloc_c8_6
    module procedure hipMalloc_c8_6_c_size_t
    module procedure hipMalloc_c8_6_source
    module procedure hipMalloc_c8_7
    module procedure hipMalloc_c8_7_c_size_t
    module procedure hipMalloc_c8_7_source
    module procedure hipMalloc_l_0_source
    module procedure hipMalloc_l_1
    module procedure hipMalloc_l_1_c_size_t
    module procedure hipMalloc_l_1_source
    module procedure hipMalloc_l_2
    module procedure hipMalloc_l_2_c_size_t
    module procedure hipMalloc_l_2_source
    module procedure hipMalloc_l_3
    module procedure hipMalloc_l_3_c_size_t
    module procedure hipMalloc_l_3_source
    module procedure hipMalloc_l_4
    module procedure hipMalloc_l_4_c_size_t
    module procedure hipMalloc_l_4_source
    module procedure hipMalloc_l_5
    module procedure hipMalloc_l_5_c_size_t
    module procedure hipMalloc_l_5_source
    module procedure hipMalloc_l_6
    module procedure hipMalloc_l_6_c_size_t
    module procedure hipMalloc_l_6_source
    module procedure hipMalloc_l_7
    module procedure hipMalloc_l_7_c_size_t
    module procedure hipMalloc_l_7_source
  end interface hipMalloc

  interface hipMallocManaged
  !> -------------------------------------------------------------------------------------------------
  !> -------------------------------------------------------------------------------------------------
  !>   @defgroup MemoryM Managed Memory
  !>
  !>   @ingroup Memory
  !>
  !>   This section describes the managed memory management functions of HIP runtime API.
  !>
  !>   @note  The managed memory management APIs are implemented on Linux, under developement
  !>   on Windows.
  !>
  !>
  !>
  !>  @brief Allocates memory that will be automatically managed by HIP.
  !>
  !>  This API is used for managed memory, allows data be shared and accessible to both CPU and
  !>  GPU using a single pointer.
  !>
  !>  The API returns the allocation pointer, managed by HMM, can be used further to execute kernels
  !>  on device and fetch data between the host and device as needed.
  !>
  !>  If HMM is not supported, the function behaves the same as @p hipMallocHost .
  !>
  !>  @note   It is recommend to do the capability check before call this API.
  !>
  !>  @param [out] dev_ptr - pointer to allocated device memory
  !>  @param [in]  size    - requested allocation size in bytes, it should be granularity of 4KB
  !>  @param [in]  flags   - must be either hipMemAttachGlobal or hipMemAttachHost
  !>                         (defaults to hipMemAttachGlobal)
  !>
  !>  @returns `hipSuccess`, `hipErrorMemoryAllocation`, `hipErrorNotSupported`,
  !>  `hipErrorInvalidValue`
#ifdef USE_CUDA_NAMES
    function hipMallocManaged_(ptr, sizeBytes, flags) bind(c, name="cudaMallocManaged")
#else
    function hipMallocManaged_(ptr, sizeBytes, flags) bind(c, name="hipMallocManaged")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipMallocManaged_
      type(c_ptr) :: ptr
      integer(c_size_t), value :: sizeBytes
      integer(c_int), value :: flags
    end function hipMallocManaged_
    module procedure hipMallocManaged_i4_0_source
    module procedure hipMallocManaged_i4_1
    module procedure hipMallocManaged_i4_1_c_size_t
    module procedure hipMallocManaged_i4_1_source
    module procedure hipMallocManaged_i4_2
    module procedure hipMallocManaged_i4_2_c_size_t
    module procedure hipMallocManaged_i4_2_source
    module procedure hipMallocManaged_i4_3
    module procedure hipMallocManaged_i4_3_c_size_t
    module procedure hipMallocManaged_i4_3_source
    module procedure hipMallocManaged_i4_4
    module procedure hipMallocManaged_i4_4_c_size_t
    module procedure hipMallocManaged_i4_4_source
    module procedure hipMallocManaged_i4_5
    module procedure hipMallocManaged_i4_5_c_size_t
    module procedure hipMallocManaged_i4_5_source
    module procedure hipMallocManaged_i4_6
    module procedure hipMallocManaged_i4_6_c_size_t
    module procedure hipMallocManaged_i4_6_source
    module procedure hipMallocManaged_i4_7
    module procedure hipMallocManaged_i4_7_c_size_t
    module procedure hipMallocManaged_i4_7_source
    module procedure hipMallocManaged_i8_0_source
    module procedure hipMallocManaged_i8_1
    module procedure hipMallocManaged_i8_1_c_size_t
    module procedure hipMallocManaged_i8_1_source
    module procedure hipMallocManaged_i8_2
    module procedure hipMallocManaged_i8_2_c_size_t
    module procedure hipMallocManaged_i8_2_source
    module procedure hipMallocManaged_i8_3
    module procedure hipMallocManaged_i8_3_c_size_t
    module procedure hipMallocManaged_i8_3_source
    module procedure hipMallocManaged_i8_4
    module procedure hipMallocManaged_i8_4_c_size_t
    module procedure hipMallocManaged_i8_4_source
    module procedure hipMallocManaged_i8_5
    module procedure hipMallocManaged_i8_5_c_size_t
    module procedure hipMallocManaged_i8_5_source
    module procedure hipMallocManaged_i8_6
    module procedure hipMallocManaged_i8_6_c_size_t
    module procedure hipMallocManaged_i8_6_source
    module procedure hipMallocManaged_i8_7
    module procedure hipMallocManaged_i8_7_c_size_t
    module procedure hipMallocManaged_i8_7_source
    module procedure hipMallocManaged_r4_0_source
    module procedure hipMallocManaged_r4_1
    module procedure hipMallocManaged_r4_1_c_size_t
    module procedure hipMallocManaged_r4_1_source
    module procedure hipMallocManaged_r4_2
    module procedure hipMallocManaged_r4_2_c_size_t
    module procedure hipMallocManaged_r4_2_source
    module procedure hipMallocManaged_r4_3
    module procedure hipMallocManaged_r4_3_c_size_t
    module procedure hipMallocManaged_r4_3_source
    module procedure hipMallocManaged_r4_4
    module procedure hipMallocManaged_r4_4_c_size_t
    module procedure hipMallocManaged_r4_4_source
    module procedure hipMallocManaged_r4_5
    module procedure hipMallocManaged_r4_5_c_size_t
    module procedure hipMallocManaged_r4_5_source
    module procedure hipMallocManaged_r4_6
    module procedure hipMallocManaged_r4_6_c_size_t
    module procedure hipMallocManaged_r4_6_source
    module procedure hipMallocManaged_r4_7
    module procedure hipMallocManaged_r4_7_c_size_t
    module procedure hipMallocManaged_r4_7_source
    module procedure hipMallocManaged_r8_0_source
    module procedure hipMallocManaged_r8_1
    module procedure hipMallocManaged_r8_1_c_size_t
    module procedure hipMallocManaged_r8_1_source
    module procedure hipMallocManaged_r8_2
    module procedure hipMallocManaged_r8_2_c_size_t
    module procedure hipMallocManaged_r8_2_source
    module procedure hipMallocManaged_r8_3
    module procedure hipMallocManaged_r8_3_c_size_t
    module procedure hipMallocManaged_r8_3_source
    module procedure hipMallocManaged_r8_4
    module procedure hipMallocManaged_r8_4_c_size_t
    module procedure hipMallocManaged_r8_4_source
    module procedure hipMallocManaged_r8_5
    module procedure hipMallocManaged_r8_5_c_size_t
    module procedure hipMallocManaged_r8_5_source
    module procedure hipMallocManaged_r8_6
    module procedure hipMallocManaged_r8_6_c_size_t
    module procedure hipMallocManaged_r8_6_source
    module procedure hipMallocManaged_r8_7
    module procedure hipMallocManaged_r8_7_c_size_t
    module procedure hipMallocManaged_r8_7_source
    module procedure hipMallocManaged_c4_0_source
    module procedure hipMallocManaged_c4_1
    module procedure hipMallocManaged_c4_1_c_size_t
    module procedure hipMallocManaged_c4_1_source
    module procedure hipMallocManaged_c4_2
    module procedure hipMallocManaged_c4_2_c_size_t
    module procedure hipMallocManaged_c4_2_source
    module procedure hipMallocManaged_c4_3
    module procedure hipMallocManaged_c4_3_c_size_t
    module procedure hipMallocManaged_c4_3_source
    module procedure hipMallocManaged_c4_4
    module procedure hipMallocManaged_c4_4_c_size_t
    module procedure hipMallocManaged_c4_4_source
    module procedure hipMallocManaged_c4_5
    module procedure hipMallocManaged_c4_5_c_size_t
    module procedure hipMallocManaged_c4_5_source
    module procedure hipMallocManaged_c4_6
    module procedure hipMallocManaged_c4_6_c_size_t
    module procedure hipMallocManaged_c4_6_source
    module procedure hipMallocManaged_c4_7
    module procedure hipMallocManaged_c4_7_c_size_t
    module procedure hipMallocManaged_c4_7_source
    module procedure hipMallocManaged_c8_0_source
    module procedure hipMallocManaged_c8_1
    module procedure hipMallocManaged_c8_1_c_size_t
    module procedure hipMallocManaged_c8_1_source
    module procedure hipMallocManaged_c8_2
    module procedure hipMallocManaged_c8_2_c_size_t
    module procedure hipMallocManaged_c8_2_source
    module procedure hipMallocManaged_c8_3
    module procedure hipMallocManaged_c8_3_c_size_t
    module procedure hipMallocManaged_c8_3_source
    module procedure hipMallocManaged_c8_4
    module procedure hipMallocManaged_c8_4_c_size_t
    module procedure hipMallocManaged_c8_4_source
    module procedure hipMallocManaged_c8_5
    module procedure hipMallocManaged_c8_5_c_size_t
    module procedure hipMallocManaged_c8_5_source
    module procedure hipMallocManaged_c8_6
    module procedure hipMallocManaged_c8_6_c_size_t
    module procedure hipMallocManaged_c8_6_source
    module procedure hipMallocManaged_c8_7
    module procedure hipMallocManaged_c8_7_c_size_t
    module procedure hipMallocManaged_c8_7_source
    module procedure hipMallocManaged_l_0_source
    module procedure hipMallocManaged_l_1
    module procedure hipMallocManaged_l_1_c_size_t
    module procedure hipMallocManaged_l_1_source
    module procedure hipMallocManaged_l_2
    module procedure hipMallocManaged_l_2_c_size_t
    module procedure hipMallocManaged_l_2_source
    module procedure hipMallocManaged_l_3
    module procedure hipMallocManaged_l_3_c_size_t
    module procedure hipMallocManaged_l_3_source
    module procedure hipMallocManaged_l_4
    module procedure hipMallocManaged_l_4_c_size_t
    module procedure hipMallocManaged_l_4_source
    module procedure hipMallocManaged_l_5
    module procedure hipMallocManaged_l_5_c_size_t
    module procedure hipMallocManaged_l_5_source
    module procedure hipMallocManaged_l_6
    module procedure hipMallocManaged_l_6_c_size_t
    module procedure hipMallocManaged_l_6_source
    module procedure hipMallocManaged_l_7
    module procedure hipMallocManaged_l_7_c_size_t
    module procedure hipMallocManaged_l_7_source
  end interface hipMallocManaged

  interface hipHostMalloc
  !>   @brief Allocates device accessible page locked (pinned) host memory
  !>
  !>   This API allocates pinned host memory which is mapped into the address space of all GPUs
  !>   in the system, the memory can be accessed directly by the GPU device, and can be read or
  !>   written with much higher bandwidth than pageable memory obtained with functions such as
  !>   malloc().
  !>
  !>   Using the pinned host memory, applications can implement faster data transfers for
  !>   HostToDevice
  !>   and DeviceToHost. The runtime tracks the hipHostMalloc allocations and can avoid some of the
  !>   setup required for regular unpinned memory.
  !>
  !>   When the memory accesses are infrequent, zero-copy memory can be a good choice, for coherent
  !>   allocation. GPU can directly access the host memory over the CPU/GPU interconnect, without
  !>   need
  !>   to copy the data.
  !>
  !>   Currently the allocation granularity is 4KB for the API.
  !>
  !>   Developers need to choose proper allocation flag with consideration of synchronization.
  !>
  !>   @param[out] ptr Pointer to the allocated host pinned memory
  !>   @param[in]  size Requested memory size in bytes
  !>   If size is 0, no memory is allocated, *ptr returns nullptr, and hipSuccess is returned.
  !>   @param[in]  flags Type of host memory allocation. See the description of flags in
  !>   hipSetDeviceFlags.
  !>
  !>   If no input for flags, it will be the default pinned memory allocation on the host.
  !>
  !>   @returns `hipSuccess`, `hipErrorOutOfMemory`
  !>
  !>
  !>   @see hipSetDeviceFlags, hiptHostFree
    function hipHostMalloc_(ptr, sizeBytes, flags) bind(c, name="hipHostMalloc")
      use iso_c_binding
      implicit none
      integer(c_int) :: hipHostMalloc_
      type(c_ptr) :: ptr
      integer(c_size_t), value :: sizeBytes
      integer(c_int), value :: flags
    end function hipHostMalloc_
    module procedure hipHostMalloc_i4_0_source
    module procedure hipHostMalloc_i4_1
    module procedure hipHostMalloc_i4_1_c_size_t
    module procedure hipHostMalloc_i4_1_source
    module procedure hipHostMalloc_i4_2
    module procedure hipHostMalloc_i4_2_c_size_t
    module procedure hipHostMalloc_i4_2_source
    module procedure hipHostMalloc_i4_3
    module procedure hipHostMalloc_i4_3_c_size_t
    module procedure hipHostMalloc_i4_3_source
    module procedure hipHostMalloc_i4_4
    module procedure hipHostMalloc_i4_4_c_size_t
    module procedure hipHostMalloc_i4_4_source
    module procedure hipHostMalloc_i4_5
    module procedure hipHostMalloc_i4_5_c_size_t
    module procedure hipHostMalloc_i4_5_source
    module procedure hipHostMalloc_i4_6
    module procedure hipHostMalloc_i4_6_c_size_t
    module procedure hipHostMalloc_i4_6_source
    module procedure hipHostMalloc_i4_7
    module procedure hipHostMalloc_i4_7_c_size_t
    module procedure hipHostMalloc_i4_7_source
    module procedure hipHostMalloc_i8_0_source
    module procedure hipHostMalloc_i8_1
    module procedure hipHostMalloc_i8_1_c_size_t
    module procedure hipHostMalloc_i8_1_source
    module procedure hipHostMalloc_i8_2
    module procedure hipHostMalloc_i8_2_c_size_t
    module procedure hipHostMalloc_i8_2_source
    module procedure hipHostMalloc_i8_3
    module procedure hipHostMalloc_i8_3_c_size_t
    module procedure hipHostMalloc_i8_3_source
    module procedure hipHostMalloc_i8_4
    module procedure hipHostMalloc_i8_4_c_size_t
    module procedure hipHostMalloc_i8_4_source
    module procedure hipHostMalloc_i8_5
    module procedure hipHostMalloc_i8_5_c_size_t
    module procedure hipHostMalloc_i8_5_source
    module procedure hipHostMalloc_i8_6
    module procedure hipHostMalloc_i8_6_c_size_t
    module procedure hipHostMalloc_i8_6_source
    module procedure hipHostMalloc_i8_7
    module procedure hipHostMalloc_i8_7_c_size_t
    module procedure hipHostMalloc_i8_7_source
    module procedure hipHostMalloc_r4_0_source
    module procedure hipHostMalloc_r4_1
    module procedure hipHostMalloc_r4_1_c_size_t
    module procedure hipHostMalloc_r4_1_source
    module procedure hipHostMalloc_r4_2
    module procedure hipHostMalloc_r4_2_c_size_t
    module procedure hipHostMalloc_r4_2_source
    module procedure hipHostMalloc_r4_3
    module procedure hipHostMalloc_r4_3_c_size_t
    module procedure hipHostMalloc_r4_3_source
    module procedure hipHostMalloc_r4_4
    module procedure hipHostMalloc_r4_4_c_size_t
    module procedure hipHostMalloc_r4_4_source
    module procedure hipHostMalloc_r4_5
    module procedure hipHostMalloc_r4_5_c_size_t
    module procedure hipHostMalloc_r4_5_source
    module procedure hipHostMalloc_r4_6
    module procedure hipHostMalloc_r4_6_c_size_t
    module procedure hipHostMalloc_r4_6_source
    module procedure hipHostMalloc_r4_7
    module procedure hipHostMalloc_r4_7_c_size_t
    module procedure hipHostMalloc_r4_7_source
    module procedure hipHostMalloc_r8_0_source
    module procedure hipHostMalloc_r8_1
    module procedure hipHostMalloc_r8_1_c_size_t
    module procedure hipHostMalloc_r8_1_source
    module procedure hipHostMalloc_r8_2
    module procedure hipHostMalloc_r8_2_c_size_t
    module procedure hipHostMalloc_r8_2_source
    module procedure hipHostMalloc_r8_3
    module procedure hipHostMalloc_r8_3_c_size_t
    module procedure hipHostMalloc_r8_3_source
    module procedure hipHostMalloc_r8_4
    module procedure hipHostMalloc_r8_4_c_size_t
    module procedure hipHostMalloc_r8_4_source
    module procedure hipHostMalloc_r8_5
    module procedure hipHostMalloc_r8_5_c_size_t
    module procedure hipHostMalloc_r8_5_source
    module procedure hipHostMalloc_r8_6
    module procedure hipHostMalloc_r8_6_c_size_t
    module procedure hipHostMalloc_r8_6_source
    module procedure hipHostMalloc_r8_7
    module procedure hipHostMalloc_r8_7_c_size_t
    module procedure hipHostMalloc_r8_7_source
    module procedure hipHostMalloc_c4_0_source
    module procedure hipHostMalloc_c4_1
    module procedure hipHostMalloc_c4_1_c_size_t
    module procedure hipHostMalloc_c4_1_source
    module procedure hipHostMalloc_c4_2
    module procedure hipHostMalloc_c4_2_c_size_t
    module procedure hipHostMalloc_c4_2_source
    module procedure hipHostMalloc_c4_3
    module procedure hipHostMalloc_c4_3_c_size_t
    module procedure hipHostMalloc_c4_3_source
    module procedure hipHostMalloc_c4_4
    module procedure hipHostMalloc_c4_4_c_size_t
    module procedure hipHostMalloc_c4_4_source
    module procedure hipHostMalloc_c4_5
    module procedure hipHostMalloc_c4_5_c_size_t
    module procedure hipHostMalloc_c4_5_source
    module procedure hipHostMalloc_c4_6
    module procedure hipHostMalloc_c4_6_c_size_t
    module procedure hipHostMalloc_c4_6_source
    module procedure hipHostMalloc_c4_7
    module procedure hipHostMalloc_c4_7_c_size_t
    module procedure hipHostMalloc_c4_7_source
    module procedure hipHostMalloc_c8_0_source
    module procedure hipHostMalloc_c8_1
    module procedure hipHostMalloc_c8_1_c_size_t
    module procedure hipHostMalloc_c8_1_source
    module procedure hipHostMalloc_c8_2
    module procedure hipHostMalloc_c8_2_c_size_t
    module procedure hipHostMalloc_c8_2_source
    module procedure hipHostMalloc_c8_3
    module procedure hipHostMalloc_c8_3_c_size_t
    module procedure hipHostMalloc_c8_3_source
    module procedure hipHostMalloc_c8_4
    module procedure hipHostMalloc_c8_4_c_size_t
    module procedure hipHostMalloc_c8_4_source
    module procedure hipHostMalloc_c8_5
    module procedure hipHostMalloc_c8_5_c_size_t
    module procedure hipHostMalloc_c8_5_source
    module procedure hipHostMalloc_c8_6
    module procedure hipHostMalloc_c8_6_c_size_t
    module procedure hipHostMalloc_c8_6_source
    module procedure hipHostMalloc_c8_7
    module procedure hipHostMalloc_c8_7_c_size_t
    module procedure hipHostMalloc_c8_7_source
    module procedure hipHostMalloc_l_0_source
    module procedure hipHostMalloc_l_1
    module procedure hipHostMalloc_l_1_c_size_t
    module procedure hipHostMalloc_l_1_source
    module procedure hipHostMalloc_l_2
    module procedure hipHostMalloc_l_2_c_size_t
    module procedure hipHostMalloc_l_2_source
    module procedure hipHostMalloc_l_3
    module procedure hipHostMalloc_l_3_c_size_t
    module procedure hipHostMalloc_l_3_source
    module procedure hipHostMalloc_l_4
    module procedure hipHostMalloc_l_4_c_size_t
    module procedure hipHostMalloc_l_4_source
    module procedure hipHostMalloc_l_5
    module procedure hipHostMalloc_l_5_c_size_t
    module procedure hipHostMalloc_l_5_source
    module procedure hipHostMalloc_l_6
    module procedure hipHostMalloc_l_6_c_size_t
    module procedure hipHostMalloc_l_6_source
    module procedure hipHostMalloc_l_7
    module procedure hipHostMalloc_l_7_c_size_t
    module procedure hipHostMalloc_l_7_source
  end interface hipHostMalloc

  interface hipFree
  !>   @brief Free memory allocated by the HIP-Clang hip memory allocation API.
  !>   This API performs an implicit hipDeviceSynchronize() call.
  !>   If pointer is NULL, the hip runtime is initialized and hipSuccess is returned.
  !>
  !>   @param[in] ptr Pointer to memory to be freed
  !>   @returns `hipSuccess`
  !>   @returns `hipErrorInvalidDevicePointer` (if pointer is invalid, including host pointers
  !>   allocated
  !>  with hipHostMalloc)
  !>
  !>   @see hipMalloc, hipMallocPitch, hipMallocArray, hipFreeArray, hipHostFree, hipMalloc3D,
  !>  hipMalloc3DArray, hipHostMalloc
#ifdef USE_CUDA_NAMES
    function hipFree_(ptr) bind(c, name="cudaFree")
#else
    function hipFree_(ptr) bind(c, name="hipFree")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipFree_
      type(c_ptr), value :: ptr
    end function hipFree_
    module procedure hipFree_i4_0
    module procedure hipFree_i4_1
    module procedure hipFree_i4_2
    module procedure hipFree_i4_3
    module procedure hipFree_i4_4
    module procedure hipFree_i4_5
    module procedure hipFree_i4_6
    module procedure hipFree_i4_7
    module procedure hipFree_i8_0
    module procedure hipFree_i8_1
    module procedure hipFree_i8_2
    module procedure hipFree_i8_3
    module procedure hipFree_i8_4
    module procedure hipFree_i8_5
    module procedure hipFree_i8_6
    module procedure hipFree_i8_7
    module procedure hipFree_r4_0
    module procedure hipFree_r4_1
    module procedure hipFree_r4_2
    module procedure hipFree_r4_3
    module procedure hipFree_r4_4
    module procedure hipFree_r4_5
    module procedure hipFree_r4_6
    module procedure hipFree_r4_7
    module procedure hipFree_r8_0
    module procedure hipFree_r8_1
    module procedure hipFree_r8_2
    module procedure hipFree_r8_3
    module procedure hipFree_r8_4
    module procedure hipFree_r8_5
    module procedure hipFree_r8_6
    module procedure hipFree_r8_7
    module procedure hipFree_c4_0
    module procedure hipFree_c4_1
    module procedure hipFree_c4_2
    module procedure hipFree_c4_3
    module procedure hipFree_c4_4
    module procedure hipFree_c4_5
    module procedure hipFree_c4_6
    module procedure hipFree_c4_7
    module procedure hipFree_c8_0
    module procedure hipFree_c8_1
    module procedure hipFree_c8_2
    module procedure hipFree_c8_3
    module procedure hipFree_c8_4
    module procedure hipFree_c8_5
    module procedure hipFree_c8_6
    module procedure hipFree_c8_7
    module procedure hipFree_l_0
    module procedure hipFree_l_1
    module procedure hipFree_l_2
    module procedure hipFree_l_3
    module procedure hipFree_l_4
    module procedure hipFree_l_5
    module procedure hipFree_l_6
    module procedure hipFree_l_7
  end interface hipFree

  interface hipHostFree
  !>   @brief Free memory allocated by the HIP-Clang hip host memory allocation API
  !>   This API performs an implicit hipDeviceSynchronize() call.
  !>   If pointer is NULL, the hip runtime is initialized and hipSuccess is returned.
  !>
  !>   @ingroup MemoryD
  !>
  !>   @param[in] ptr Pointer to memory to be freed
  !>   @returns `hipSuccess`,
  !>           `hipErrorInvalidValue` (if pointer is invalid, including device pointers allocated
  !>           with
  !>  hipMalloc)
  !>
  !>   @see hipMalloc, hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D,
  !>  hipMalloc3DArray, hipHostMalloc
    function hipHostFree_(ptr) bind(c, name="hipHostFree")
      use iso_c_binding
      implicit none
      integer(c_int) :: hipHostFree_
      type(c_ptr), value :: ptr
    end function hipHostFree_
    module procedure hipHostFree_i4_0
    module procedure hipHostFree_i4_1
    module procedure hipHostFree_i4_2
    module procedure hipHostFree_i4_3
    module procedure hipHostFree_i4_4
    module procedure hipHostFree_i4_5
    module procedure hipHostFree_i4_6
    module procedure hipHostFree_i4_7
    module procedure hipHostFree_i8_0
    module procedure hipHostFree_i8_1
    module procedure hipHostFree_i8_2
    module procedure hipHostFree_i8_3
    module procedure hipHostFree_i8_4
    module procedure hipHostFree_i8_5
    module procedure hipHostFree_i8_6
    module procedure hipHostFree_i8_7
    module procedure hipHostFree_r4_0
    module procedure hipHostFree_r4_1
    module procedure hipHostFree_r4_2
    module procedure hipHostFree_r4_3
    module procedure hipHostFree_r4_4
    module procedure hipHostFree_r4_5
    module procedure hipHostFree_r4_6
    module procedure hipHostFree_r4_7
    module procedure hipHostFree_r8_0
    module procedure hipHostFree_r8_1
    module procedure hipHostFree_r8_2
    module procedure hipHostFree_r8_3
    module procedure hipHostFree_r8_4
    module procedure hipHostFree_r8_5
    module procedure hipHostFree_r8_6
    module procedure hipHostFree_r8_7
    module procedure hipHostFree_c4_0
    module procedure hipHostFree_c4_1
    module procedure hipHostFree_c4_2
    module procedure hipHostFree_c4_3
    module procedure hipHostFree_c4_4
    module procedure hipHostFree_c4_5
    module procedure hipHostFree_c4_6
    module procedure hipHostFree_c4_7
    module procedure hipHostFree_c8_0
    module procedure hipHostFree_c8_1
    module procedure hipHostFree_c8_2
    module procedure hipHostFree_c8_3
    module procedure hipHostFree_c8_4
    module procedure hipHostFree_c8_5
    module procedure hipHostFree_c8_6
    module procedure hipHostFree_c8_7
    module procedure hipHostFree_l_0
    module procedure hipHostFree_l_1
    module procedure hipHostFree_l_2
    module procedure hipHostFree_l_3
    module procedure hipHostFree_l_4
    module procedure hipHostFree_l_5
    module procedure hipHostFree_l_6
    module procedure hipHostFree_l_7
  end interface hipHostFree

contains

  function hipMalloc_i4_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_i4_1

  function hipMalloc_i4_1_c_size_t(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_i4_1_c_size_t

  function hipMalloc_i4_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_i4_2

  function hipMalloc_i4_2_c_size_t(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_i4_2_c_size_t

  function hipMalloc_i4_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_i4_3

  function hipMalloc_i4_3_c_size_t(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_i4_3_c_size_t

  function hipMalloc_i4_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_i4_4

  function hipMalloc_i4_4_c_size_t(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_i4_4_c_size_t

  function hipMalloc_i4_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_i4_5

  function hipMalloc_i4_5_c_size_t(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_i4_5_c_size_t

  function hipMalloc_i4_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_i4_6

  function hipMalloc_i4_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_i4_6_c_size_t

  function hipMalloc_i4_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_i4_7

  function hipMalloc_i4_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_i4_7_c_size_t

  function hipMalloc_i8_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_i8_1

  function hipMalloc_i8_1_c_size_t(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_i8_1_c_size_t

  function hipMalloc_i8_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_i8_2

  function hipMalloc_i8_2_c_size_t(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_i8_2_c_size_t

  function hipMalloc_i8_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_i8_3

  function hipMalloc_i8_3_c_size_t(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_i8_3_c_size_t

  function hipMalloc_i8_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_i8_4

  function hipMalloc_i8_4_c_size_t(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_i8_4_c_size_t

  function hipMalloc_i8_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_i8_5

  function hipMalloc_i8_5_c_size_t(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_i8_5_c_size_t

  function hipMalloc_i8_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_i8_6

  function hipMalloc_i8_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_i8_6_c_size_t

  function hipMalloc_i8_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_i8_7

  function hipMalloc_i8_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_i8_7_c_size_t

  function hipMalloc_r4_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_r4_1

  function hipMalloc_r4_1_c_size_t(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_r4_1_c_size_t

  function hipMalloc_r4_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_r4_2

  function hipMalloc_r4_2_c_size_t(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_r4_2_c_size_t

  function hipMalloc_r4_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_r4_3

  function hipMalloc_r4_3_c_size_t(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_r4_3_c_size_t

  function hipMalloc_r4_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_r4_4

  function hipMalloc_r4_4_c_size_t(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_r4_4_c_size_t

  function hipMalloc_r4_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_r4_5

  function hipMalloc_r4_5_c_size_t(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_r4_5_c_size_t

  function hipMalloc_r4_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_r4_6

  function hipMalloc_r4_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_r4_6_c_size_t

  function hipMalloc_r4_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_r4_7

  function hipMalloc_r4_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_r4_7_c_size_t

  function hipMalloc_r8_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_r8_1

  function hipMalloc_r8_1_c_size_t(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_r8_1_c_size_t

  function hipMalloc_r8_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_r8_2

  function hipMalloc_r8_2_c_size_t(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_r8_2_c_size_t

  function hipMalloc_r8_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_r8_3

  function hipMalloc_r8_3_c_size_t(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_r8_3_c_size_t

  function hipMalloc_r8_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_r8_4

  function hipMalloc_r8_4_c_size_t(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_r8_4_c_size_t

  function hipMalloc_r8_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_r8_5

  function hipMalloc_r8_5_c_size_t(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_r8_5_c_size_t

  function hipMalloc_r8_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_r8_6

  function hipMalloc_r8_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_r8_6_c_size_t

  function hipMalloc_r8_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_r8_7

  function hipMalloc_r8_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_r8_7_c_size_t

  function hipMalloc_c4_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_c4_1

  function hipMalloc_c4_1_c_size_t(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_c4_1_c_size_t

  function hipMalloc_c4_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_c4_2

  function hipMalloc_c4_2_c_size_t(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_c4_2_c_size_t

  function hipMalloc_c4_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_c4_3

  function hipMalloc_c4_3_c_size_t(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_c4_3_c_size_t

  function hipMalloc_c4_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_c4_4

  function hipMalloc_c4_4_c_size_t(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_c4_4_c_size_t

  function hipMalloc_c4_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_c4_5

  function hipMalloc_c4_5_c_size_t(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_c4_5_c_size_t

  function hipMalloc_c4_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_c4_6

  function hipMalloc_c4_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_c4_6_c_size_t

  function hipMalloc_c4_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_c4_7

  function hipMalloc_c4_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_c4_7_c_size_t

  function hipMalloc_c8_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_c8_1

  function hipMalloc_c8_1_c_size_t(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_c8_1_c_size_t

  function hipMalloc_c8_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_c8_2

  function hipMalloc_c8_2_c_size_t(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_c8_2_c_size_t

  function hipMalloc_c8_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_c8_3

  function hipMalloc_c8_3_c_size_t(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_c8_3_c_size_t

  function hipMalloc_c8_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_c8_4

  function hipMalloc_c8_4_c_size_t(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_c8_4_c_size_t

  function hipMalloc_c8_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_c8_5

  function hipMalloc_c8_5_c_size_t(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_c8_5_c_size_t

  function hipMalloc_c8_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_c8_6

  function hipMalloc_c8_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_c8_6_c_size_t

  function hipMalloc_c8_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_c8_7

  function hipMalloc_c8_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_c8_7_c_size_t

  function hipMalloc_l_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_l_1

  function hipMalloc_l_1_c_size_t(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_l_1_c_size_t

  function hipMalloc_l_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_l_2

  function hipMalloc_l_2_c_size_t(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_l_2_c_size_t

  function hipMalloc_l_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_l_3

  function hipMalloc_l_3_c_size_t(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_l_3_c_size_t

  function hipMalloc_l_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_l_4

  function hipMalloc_l_4_c_size_t(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_l_4_c_size_t

  function hipMalloc_l_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_l_5

  function hipMalloc_l_5_c_size_t(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_l_5_c_size_t

  function hipMalloc_l_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_l_6

  function hipMalloc_l_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_l_6_c_size_t

  function hipMalloc_l_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_l_7

  function hipMalloc_l_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_l_7_c_size_t

  function hipMalloc_i4_0_source(ptr, dsource, source) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, intent(inout) :: ptr
    integer(c_int), target, intent(in), optional :: dsource, source
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMalloc_(cptr, 4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), 4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMalloc_(cptr, 4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), 4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_(cptr, 4_c_size_t)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMalloc_i4_0_source

  function hipMalloc_i4_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    integer(c_int), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i4_1_source

  function hipMalloc_i4_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    integer(c_int), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i4_2_source

  function hipMalloc_i4_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    integer(c_int), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i4_3_source

  function hipMalloc_i4_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    integer(c_int), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i4_4_source

  function hipMalloc_i4_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    integer(c_int), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i4_5_source

  function hipMalloc_i4_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i4_6_source

  function hipMalloc_i4_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i4_7_source

  function hipMalloc_i8_0_source(ptr, dsource, source) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, intent(inout) :: ptr
    integer(c_int64_t), target, intent(in), optional :: dsource, source
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMalloc_(cptr, 8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), 8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMalloc_(cptr, 8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), 8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_(cptr, 8_c_size_t)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMalloc_i8_0_source

  function hipMalloc_i8_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    integer(c_int64_t), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i8_1_source

  function hipMalloc_i8_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    integer(c_int64_t), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i8_2_source

  function hipMalloc_i8_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    integer(c_int64_t), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i8_3_source

  function hipMalloc_i8_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i8_4_source

  function hipMalloc_i8_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i8_5_source

  function hipMalloc_i8_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i8_6_source

  function hipMalloc_i8_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_i8_7_source

  function hipMalloc_r4_0_source(ptr, dsource, source) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, intent(inout) :: ptr
    real(c_float), target, intent(in), optional :: dsource, source
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMalloc_(cptr, 4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), 4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMalloc_(cptr, 4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), 4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_(cptr, 4_c_size_t)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMalloc_r4_0_source

  function hipMalloc_r4_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    real(c_float), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r4_1_source

  function hipMalloc_r4_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    real(c_float), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r4_2_source

  function hipMalloc_r4_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    real(c_float), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r4_3_source

  function hipMalloc_r4_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    real(c_float), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r4_4_source

  function hipMalloc_r4_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    real(c_float), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r4_5_source

  function hipMalloc_r4_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r4_6_source

  function hipMalloc_r4_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r4_7_source

  function hipMalloc_r8_0_source(ptr, dsource, source) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, intent(inout) :: ptr
    real(c_double), target, intent(in), optional :: dsource, source
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMalloc_(cptr, 8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), 8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMalloc_(cptr, 8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), 8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_(cptr, 8_c_size_t)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMalloc_r8_0_source

  function hipMalloc_r8_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    real(c_double), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r8_1_source

  function hipMalloc_r8_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    real(c_double), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r8_2_source

  function hipMalloc_r8_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    real(c_double), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r8_3_source

  function hipMalloc_r8_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    real(c_double), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r8_4_source

  function hipMalloc_r8_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    real(c_double), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r8_5_source

  function hipMalloc_r8_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r8_6_source

  function hipMalloc_r8_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_r8_7_source

  function hipMalloc_c4_0_source(ptr, dsource, source) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, intent(inout) :: ptr
    complex(c_float_complex), target, intent(in), optional :: dsource, source
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMalloc_(cptr, 8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), 8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMalloc_(cptr, 8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), 8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_(cptr, 8_c_size_t)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMalloc_c4_0_source

  function hipMalloc_c4_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    complex(c_float_complex), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c4_1_source

  function hipMalloc_c4_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    complex(c_float_complex), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c4_2_source

  function hipMalloc_c4_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    complex(c_float_complex), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c4_3_source

  function hipMalloc_c4_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c4_4_source

  function hipMalloc_c4_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c4_5_source

  function hipMalloc_c4_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c4_6_source

  function hipMalloc_c4_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c4_7_source

  function hipMalloc_c8_0_source(ptr, dsource, source) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, intent(inout) :: ptr
    complex(c_double_complex), target, intent(in), optional :: dsource, source
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMalloc_(cptr, 16_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), 16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMalloc_(cptr, 16_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), 16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_(cptr, 16_c_size_t)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMalloc_c8_0_source

  function hipMalloc_c8_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    complex(c_double_complex), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c8_1_source

  function hipMalloc_c8_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    complex(c_double_complex), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c8_2_source

  function hipMalloc_c8_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    complex(c_double_complex), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c8_3_source

  function hipMalloc_c8_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c8_4_source

  function hipMalloc_c8_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c8_5_source

  function hipMalloc_c8_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c8_6_source

  function hipMalloc_c8_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_c8_7_source

  function hipMalloc_l_0_source(ptr, dsource, source) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, intent(inout) :: ptr
    logical(c_bool), target, intent(in), optional :: dsource, source
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMalloc_(cptr, 1_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), 1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMalloc_(cptr, 1_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), 1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_(cptr, 1_c_size_t)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMalloc_l_0_source

  function hipMalloc_l_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    logical(c_bool), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_l_1_source

  function hipMalloc_l_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    logical(c_bool), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_l_2_source

  function hipMalloc_l_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    logical(c_bool), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_l_3_source

  function hipMalloc_l_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    logical(c_bool), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_l_4_source

  function hipMalloc_l_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_l_5_source

  function hipMalloc_l_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_l_6_source

  function hipMalloc_l_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMalloc_(cptr, product(dims8)*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMalloc_l_7_source

  function hipMallocManaged_i4_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_i4_1

  function hipMallocManaged_i4_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_i4_1_c_size_t

  function hipMallocManaged_i4_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_i4_2

  function hipMallocManaged_i4_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_i4_2_c_size_t

  function hipMallocManaged_i4_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_i4_3

  function hipMallocManaged_i4_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_i4_3_c_size_t

  function hipMallocManaged_i4_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_i4_4

  function hipMallocManaged_i4_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_i4_4_c_size_t

  function hipMallocManaged_i4_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_i4_5

  function hipMallocManaged_i4_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_i4_5_c_size_t

  function hipMallocManaged_i4_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_i4_6

  function hipMallocManaged_i4_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_i4_6_c_size_t

  function hipMallocManaged_i4_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_i4_7

  function hipMallocManaged_i4_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_i4_7_c_size_t

  function hipMallocManaged_i8_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_i8_1

  function hipMallocManaged_i8_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_i8_1_c_size_t

  function hipMallocManaged_i8_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_i8_2

  function hipMallocManaged_i8_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_i8_2_c_size_t

  function hipMallocManaged_i8_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_i8_3

  function hipMallocManaged_i8_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_i8_3_c_size_t

  function hipMallocManaged_i8_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_i8_4

  function hipMallocManaged_i8_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_i8_4_c_size_t

  function hipMallocManaged_i8_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_i8_5

  function hipMallocManaged_i8_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_i8_5_c_size_t

  function hipMallocManaged_i8_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_i8_6

  function hipMallocManaged_i8_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_i8_6_c_size_t

  function hipMallocManaged_i8_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_i8_7

  function hipMallocManaged_i8_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_i8_7_c_size_t

  function hipMallocManaged_r4_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_r4_1

  function hipMallocManaged_r4_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_r4_1_c_size_t

  function hipMallocManaged_r4_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_r4_2

  function hipMallocManaged_r4_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_r4_2_c_size_t

  function hipMallocManaged_r4_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_r4_3

  function hipMallocManaged_r4_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_r4_3_c_size_t

  function hipMallocManaged_r4_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_r4_4

  function hipMallocManaged_r4_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_r4_4_c_size_t

  function hipMallocManaged_r4_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_r4_5

  function hipMallocManaged_r4_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_r4_5_c_size_t

  function hipMallocManaged_r4_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_r4_6

  function hipMallocManaged_r4_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_r4_6_c_size_t

  function hipMallocManaged_r4_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_r4_7

  function hipMallocManaged_r4_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_r4_7_c_size_t

  function hipMallocManaged_r8_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_r8_1

  function hipMallocManaged_r8_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_r8_1_c_size_t

  function hipMallocManaged_r8_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_r8_2

  function hipMallocManaged_r8_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_r8_2_c_size_t

  function hipMallocManaged_r8_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_r8_3

  function hipMallocManaged_r8_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_r8_3_c_size_t

  function hipMallocManaged_r8_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_r8_4

  function hipMallocManaged_r8_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_r8_4_c_size_t

  function hipMallocManaged_r8_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_r8_5

  function hipMallocManaged_r8_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_r8_5_c_size_t

  function hipMallocManaged_r8_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_r8_6

  function hipMallocManaged_r8_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_r8_6_c_size_t

  function hipMallocManaged_r8_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_r8_7

  function hipMallocManaged_r8_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_r8_7_c_size_t

  function hipMallocManaged_c4_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_c4_1

  function hipMallocManaged_c4_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_c4_1_c_size_t

  function hipMallocManaged_c4_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_c4_2

  function hipMallocManaged_c4_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_c4_2_c_size_t

  function hipMallocManaged_c4_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_c4_3

  function hipMallocManaged_c4_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_c4_3_c_size_t

  function hipMallocManaged_c4_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_c4_4

  function hipMallocManaged_c4_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_c4_4_c_size_t

  function hipMallocManaged_c4_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_c4_5

  function hipMallocManaged_c4_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_c4_5_c_size_t

  function hipMallocManaged_c4_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_c4_6

  function hipMallocManaged_c4_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_c4_6_c_size_t

  function hipMallocManaged_c4_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_c4_7

  function hipMallocManaged_c4_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_c4_7_c_size_t

  function hipMallocManaged_c8_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_c8_1

  function hipMallocManaged_c8_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_c8_1_c_size_t

  function hipMallocManaged_c8_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_c8_2

  function hipMallocManaged_c8_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_c8_2_c_size_t

  function hipMallocManaged_c8_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_c8_3

  function hipMallocManaged_c8_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_c8_3_c_size_t

  function hipMallocManaged_c8_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_c8_4

  function hipMallocManaged_c8_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_c8_4_c_size_t

  function hipMallocManaged_c8_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_c8_5

  function hipMallocManaged_c8_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_c8_5_c_size_t

  function hipMallocManaged_c8_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_c8_6

  function hipMallocManaged_c8_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_c8_6_c_size_t

  function hipMallocManaged_c8_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_c8_7

  function hipMallocManaged_c8_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_c8_7_c_size_t

  function hipMallocManaged_l_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_l_1

  function hipMallocManaged_l_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMallocManaged_l_1_c_size_t

  function hipMallocManaged_l_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_l_2

  function hipMallocManaged_l_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMallocManaged_l_2_c_size_t

  function hipMallocManaged_l_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_l_3

  function hipMallocManaged_l_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMallocManaged_l_3_c_size_t

  function hipMallocManaged_l_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_l_4

  function hipMallocManaged_l_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMallocManaged_l_4_c_size_t

  function hipMallocManaged_l_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_l_5

  function hipMallocManaged_l_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMallocManaged_l_5_c_size_t

  function hipMallocManaged_l_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_l_6

  function hipMallocManaged_l_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMallocManaged_l_6_c_size_t

  function hipMallocManaged_l_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_l_7

  function hipMallocManaged_l_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemAttachGlobal
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipMemAttachGlobal
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMallocManaged_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMallocManaged_l_7_c_size_t

  function hipMallocManaged_i4_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, intent(inout) :: ptr
    integer(c_int), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMallocManaged: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, 4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMallocManaged_(cptr, 4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMallocManaged_(cptr, 4_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMallocManaged_i4_0_source

  function hipMallocManaged_i4_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    integer(c_int), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i4_1_source

  function hipMallocManaged_i4_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    integer(c_int), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i4_2_source

  function hipMallocManaged_i4_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    integer(c_int), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i4_3_source

  function hipMallocManaged_i4_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    integer(c_int), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i4_4_source

  function hipMallocManaged_i4_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    integer(c_int), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i4_5_source

  function hipMallocManaged_i4_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i4_6_source

  function hipMallocManaged_i4_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i4_7_source

  function hipMallocManaged_i8_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, intent(inout) :: ptr
    integer(c_int64_t), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMallocManaged: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMallocManaged_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMallocManaged_(cptr, 8_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMallocManaged_i8_0_source

  function hipMallocManaged_i8_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    integer(c_int64_t), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i8_1_source

  function hipMallocManaged_i8_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    integer(c_int64_t), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i8_2_source

  function hipMallocManaged_i8_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    integer(c_int64_t), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i8_3_source

  function hipMallocManaged_i8_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i8_4_source

  function hipMallocManaged_i8_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i8_5_source

  function hipMallocManaged_i8_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i8_6_source

  function hipMallocManaged_i8_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_i8_7_source

  function hipMallocManaged_r4_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, intent(inout) :: ptr
    real(c_float), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMallocManaged: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, 4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMallocManaged_(cptr, 4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMallocManaged_(cptr, 4_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMallocManaged_r4_0_source

  function hipMallocManaged_r4_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    real(c_float), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r4_1_source

  function hipMallocManaged_r4_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    real(c_float), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r4_2_source

  function hipMallocManaged_r4_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    real(c_float), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r4_3_source

  function hipMallocManaged_r4_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    real(c_float), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r4_4_source

  function hipMallocManaged_r4_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    real(c_float), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r4_5_source

  function hipMallocManaged_r4_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r4_6_source

  function hipMallocManaged_r4_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r4_7_source

  function hipMallocManaged_r8_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, intent(inout) :: ptr
    real(c_double), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMallocManaged: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMallocManaged_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMallocManaged_(cptr, 8_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMallocManaged_r8_0_source

  function hipMallocManaged_r8_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    real(c_double), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r8_1_source

  function hipMallocManaged_r8_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    real(c_double), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r8_2_source

  function hipMallocManaged_r8_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    real(c_double), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r8_3_source

  function hipMallocManaged_r8_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    real(c_double), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r8_4_source

  function hipMallocManaged_r8_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    real(c_double), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r8_5_source

  function hipMallocManaged_r8_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r8_6_source

  function hipMallocManaged_r8_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_r8_7_source

  function hipMallocManaged_c4_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, intent(inout) :: ptr
    complex(c_float_complex), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMallocManaged: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMallocManaged_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMallocManaged_(cptr, 8_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMallocManaged_c4_0_source

  function hipMallocManaged_c4_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    complex(c_float_complex), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c4_1_source

  function hipMallocManaged_c4_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    complex(c_float_complex), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c4_2_source

  function hipMallocManaged_c4_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    complex(c_float_complex), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c4_3_source

  function hipMallocManaged_c4_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c4_4_source

  function hipMallocManaged_c4_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c4_5_source

  function hipMallocManaged_c4_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c4_6_source

  function hipMallocManaged_c4_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c4_7_source

  function hipMallocManaged_c8_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, intent(inout) :: ptr
    complex(c_double_complex), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMallocManaged: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, 16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMallocManaged_(cptr, 16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMallocManaged_(cptr, 16_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMallocManaged_c8_0_source

  function hipMallocManaged_c8_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    complex(c_double_complex), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c8_1_source

  function hipMallocManaged_c8_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    complex(c_double_complex), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c8_2_source

  function hipMallocManaged_c8_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    complex(c_double_complex), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c8_3_source

  function hipMallocManaged_c8_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c8_4_source

  function hipMallocManaged_c8_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c8_5_source

  function hipMallocManaged_c8_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c8_6_source

  function hipMallocManaged_c8_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_c8_7_source

  function hipMallocManaged_l_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, intent(inout) :: ptr
    logical(c_bool), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipMallocManaged: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, 1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipMallocManaged_(cptr, 1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, ptr)
    else
      res = hipMallocManaged_(cptr, 1_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipMallocManaged_l_0_source

  function hipMallocManaged_l_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    logical(c_bool), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_l_1_source

  function hipMallocManaged_l_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    logical(c_bool), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_l_2_source

  function hipMallocManaged_l_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    logical(c_bool), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_l_3_source

  function hipMallocManaged_l_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    logical(c_bool), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_l_4_source

  function hipMallocManaged_l_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_l_5_source

  function hipMallocManaged_l_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_l_6_source

  function hipMallocManaged_l_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipMallocManaged: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipMallocManaged: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipMallocManaged: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipMallocManaged: lbounds requires dims"
    if (present(dsource)) then
      res = hipMallocManaged_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipMallocManaged_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToDevice)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipMallocManaged_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipMallocManaged_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipMallocManaged_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipMallocManaged_l_7_source

  function hipHostMalloc_i4_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_i4_1

  function hipHostMalloc_i4_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_i4_1_c_size_t

  function hipHostMalloc_i4_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_i4_2

  function hipHostMalloc_i4_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_i4_2_c_size_t

  function hipHostMalloc_i4_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_i4_3

  function hipHostMalloc_i4_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_i4_3_c_size_t

  function hipHostMalloc_i4_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_i4_4

  function hipHostMalloc_i4_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_i4_4_c_size_t

  function hipHostMalloc_i4_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_i4_5

  function hipHostMalloc_i4_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_i4_5_c_size_t

  function hipHostMalloc_i4_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_i4_6

  function hipHostMalloc_i4_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_i4_6_c_size_t

  function hipHostMalloc_i4_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_i4_7

  function hipHostMalloc_i4_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_i4_7_c_size_t

  function hipHostMalloc_i8_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_i8_1

  function hipHostMalloc_i8_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_i8_1_c_size_t

  function hipHostMalloc_i8_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_i8_2

  function hipHostMalloc_i8_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_i8_2_c_size_t

  function hipHostMalloc_i8_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_i8_3

  function hipHostMalloc_i8_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_i8_3_c_size_t

  function hipHostMalloc_i8_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_i8_4

  function hipHostMalloc_i8_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_i8_4_c_size_t

  function hipHostMalloc_i8_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_i8_5

  function hipHostMalloc_i8_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_i8_5_c_size_t

  function hipHostMalloc_i8_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_i8_6

  function hipHostMalloc_i8_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_i8_6_c_size_t

  function hipHostMalloc_i8_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_i8_7

  function hipHostMalloc_i8_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_i8_7_c_size_t

  function hipHostMalloc_r4_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_r4_1

  function hipHostMalloc_r4_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_r4_1_c_size_t

  function hipHostMalloc_r4_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_r4_2

  function hipHostMalloc_r4_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_r4_2_c_size_t

  function hipHostMalloc_r4_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_r4_3

  function hipHostMalloc_r4_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_r4_3_c_size_t

  function hipHostMalloc_r4_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_r4_4

  function hipHostMalloc_r4_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_r4_4_c_size_t

  function hipHostMalloc_r4_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_r4_5

  function hipHostMalloc_r4_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_r4_5_c_size_t

  function hipHostMalloc_r4_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_r4_6

  function hipHostMalloc_r4_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_r4_6_c_size_t

  function hipHostMalloc_r4_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_r4_7

  function hipHostMalloc_r4_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_r4_7_c_size_t

  function hipHostMalloc_r8_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_r8_1

  function hipHostMalloc_r8_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_r8_1_c_size_t

  function hipHostMalloc_r8_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_r8_2

  function hipHostMalloc_r8_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_r8_2_c_size_t

  function hipHostMalloc_r8_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_r8_3

  function hipHostMalloc_r8_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_r8_3_c_size_t

  function hipHostMalloc_r8_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_r8_4

  function hipHostMalloc_r8_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_r8_4_c_size_t

  function hipHostMalloc_r8_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_r8_5

  function hipHostMalloc_r8_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_r8_5_c_size_t

  function hipHostMalloc_r8_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_r8_6

  function hipHostMalloc_r8_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_r8_6_c_size_t

  function hipHostMalloc_r8_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_r8_7

  function hipHostMalloc_r8_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_r8_7_c_size_t

  function hipHostMalloc_c4_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_c4_1

  function hipHostMalloc_c4_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_c4_1_c_size_t

  function hipHostMalloc_c4_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_c4_2

  function hipHostMalloc_c4_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_c4_2_c_size_t

  function hipHostMalloc_c4_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_c4_3

  function hipHostMalloc_c4_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_c4_3_c_size_t

  function hipHostMalloc_c4_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_c4_4

  function hipHostMalloc_c4_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_c4_4_c_size_t

  function hipHostMalloc_c4_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_c4_5

  function hipHostMalloc_c4_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_c4_5_c_size_t

  function hipHostMalloc_c4_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_c4_6

  function hipHostMalloc_c4_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_c4_6_c_size_t

  function hipHostMalloc_c4_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_c4_7

  function hipHostMalloc_c4_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_c4_7_c_size_t

  function hipHostMalloc_c8_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_c8_1

  function hipHostMalloc_c8_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_c8_1_c_size_t

  function hipHostMalloc_c8_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_c8_2

  function hipHostMalloc_c8_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_c8_2_c_size_t

  function hipHostMalloc_c8_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_c8_3

  function hipHostMalloc_c8_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_c8_3_c_size_t

  function hipHostMalloc_c8_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_c8_4

  function hipHostMalloc_c8_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_c8_4_c_size_t

  function hipHostMalloc_c8_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_c8_5

  function hipHostMalloc_c8_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_c8_5_c_size_t

  function hipHostMalloc_c8_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_c8_6

  function hipHostMalloc_c8_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_c8_6_c_size_t

  function hipHostMalloc_c8_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_c8_7

  function hipHostMalloc_c8_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_c8_7_c_size_t

  function hipHostMalloc_l_1(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_l_1

  function hipHostMalloc_l_1_c_size_t(ptr, length1, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipHostMalloc_l_1_c_size_t

  function hipHostMalloc_l_2(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_l_2

  function hipHostMalloc_l_2_c_size_t(ptr, length1, length2, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipHostMalloc_l_2_c_size_t

  function hipHostMalloc_l_3(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_l_3

  function hipHostMalloc_l_3_c_size_t(ptr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipHostMalloc_l_3_c_size_t

  function hipHostMalloc_l_4(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_l_4

  function hipHostMalloc_l_4_c_size_t(ptr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipHostMalloc_l_4_c_size_t

  function hipHostMalloc_l_5(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_l_5

  function hipHostMalloc_l_5_c_size_t(ptr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipHostMalloc_l_5_c_size_t

  function hipHostMalloc_l_6(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_l_6

  function hipHostMalloc_l_6_c_size_t(ptr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipHostMalloc_l_6_c_size_t

  function hipHostMalloc_l_7(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_l_7

  function hipHostMalloc_l_7_c_size_t(ptr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipHostMallocDefault
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in), optional :: flags
    integer(c_int) :: res
    integer(c_int) :: fl
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    fl = hipHostMallocDefault
    if (present(flags)) fl = flags
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostMalloc_(cptr, nbytes, fl)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipHostMalloc_l_7_c_size_t

  function hipHostMalloc_i4_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, intent(inout) :: ptr
    integer(c_int), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipHostMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, 4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipHostMalloc_(cptr, 4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, ptr)
    else
      res = hipHostMalloc_(cptr, 4_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipHostMalloc_i4_0_source

  function hipHostMalloc_i4_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    integer(c_int), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i4_1_source

  function hipHostMalloc_i4_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    integer(c_int), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i4_2_source

  function hipHostMalloc_i4_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    integer(c_int), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i4_3_source

  function hipHostMalloc_i4_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    integer(c_int), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i4_4_source

  function hipHostMalloc_i4_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    integer(c_int), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i4_5_source

  function hipHostMalloc_i4_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i4_6_source

  function hipHostMalloc_i4_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i4_7_source

  function hipHostMalloc_i8_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, intent(inout) :: ptr
    integer(c_int64_t), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipHostMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipHostMalloc_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, ptr)
    else
      res = hipHostMalloc_(cptr, 8_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipHostMalloc_i8_0_source

  function hipHostMalloc_i8_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    integer(c_int64_t), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i8_1_source

  function hipHostMalloc_i8_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    integer(c_int64_t), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i8_2_source

  function hipHostMalloc_i8_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    integer(c_int64_t), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i8_3_source

  function hipHostMalloc_i8_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i8_4_source

  function hipHostMalloc_i8_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i8_5_source

  function hipHostMalloc_i8_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i8_6_source

  function hipHostMalloc_i8_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_i8_7_source

  function hipHostMalloc_r4_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, intent(inout) :: ptr
    real(c_float), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipHostMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, 4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipHostMalloc_(cptr, 4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, ptr)
    else
      res = hipHostMalloc_(cptr, 4_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipHostMalloc_r4_0_source

  function hipHostMalloc_r4_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    real(c_float), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r4_1_source

  function hipHostMalloc_r4_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    real(c_float), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r4_2_source

  function hipHostMalloc_r4_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    real(c_float), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r4_3_source

  function hipHostMalloc_r4_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    real(c_float), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r4_4_source

  function hipHostMalloc_r4_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    real(c_float), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r4_5_source

  function hipHostMalloc_r4_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r4_6_source

  function hipHostMalloc_r4_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_float), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*4_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*4_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*4_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*4_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r4_7_source

  function hipHostMalloc_r8_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, intent(inout) :: ptr
    real(c_double), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipHostMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipHostMalloc_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, ptr)
    else
      res = hipHostMalloc_(cptr, 8_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipHostMalloc_r8_0_source

  function hipHostMalloc_r8_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    real(c_double), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r8_1_source

  function hipHostMalloc_r8_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    real(c_double), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r8_2_source

  function hipHostMalloc_r8_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    real(c_double), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r8_3_source

  function hipHostMalloc_r8_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    real(c_double), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r8_4_source

  function hipHostMalloc_r8_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    real(c_double), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r8_5_source

  function hipHostMalloc_r8_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r8_6_source

  function hipHostMalloc_r8_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    real(c_double), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_r8_7_source

  function hipHostMalloc_c4_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, intent(inout) :: ptr
    complex(c_float_complex), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipHostMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipHostMalloc_(cptr, 8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, ptr)
    else
      res = hipHostMalloc_(cptr, 8_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipHostMalloc_c4_0_source

  function hipHostMalloc_c4_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    complex(c_float_complex), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c4_1_source

  function hipHostMalloc_c4_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    complex(c_float_complex), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c4_2_source

  function hipHostMalloc_c4_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    complex(c_float_complex), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c4_3_source

  function hipHostMalloc_c4_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c4_4_source

  function hipHostMalloc_c4_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c4_5_source

  function hipHostMalloc_c4_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c4_6_source

  function hipHostMalloc_c4_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*8_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*8_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*8_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*8_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c4_7_source

  function hipHostMalloc_c8_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, intent(inout) :: ptr
    complex(c_double_complex), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipHostMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, 16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 16_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipHostMalloc_(cptr, 16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 16_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, ptr)
    else
      res = hipHostMalloc_(cptr, 16_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipHostMalloc_c8_0_source

  function hipHostMalloc_c8_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    complex(c_double_complex), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c8_1_source

  function hipHostMalloc_c8_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    complex(c_double_complex), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c8_2_source

  function hipHostMalloc_c8_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    complex(c_double_complex), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c8_3_source

  function hipHostMalloc_c8_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c8_4_source

  function hipHostMalloc_c8_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c8_5_source

  function hipHostMalloc_c8_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c8_6_source

  function hipHostMalloc_c8_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*16_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*16_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*16_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*16_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_c8_7_source

  function hipHostMalloc_l_0_source(ptr, dsource, source, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, intent(inout) :: ptr
    logical(c_bool), target, intent(in), optional :: dsource, source
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    nOptArgs = 0
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source))  nOptArgs = nOptArgs + 1
    if (nOptArgs > 1) ERROR STOP "hipHostMalloc: specify only one of dsource/source"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, 1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), 1_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      res = hipHostMalloc_(cptr, 1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), 1_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, ptr)
    else
      res = hipHostMalloc_(cptr, 1_c_size_t, flags)
      call c_f_pointer(cptr, ptr)
    end if
  end function hipHostMalloc_l_0_source

  function hipHostMalloc_l_1_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(1), lbounds(1)
    integer(c_int64_t), intent(in), optional :: dims8(1), lbounds8(1)
    logical(c_bool), target, dimension(:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_l_1_source

  function hipHostMalloc_l_2_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(2), lbounds(2)
    integer(c_int64_t), intent(in), optional :: dims8(2), lbounds8(2)
    logical(c_bool), target, dimension(:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_l_2_source

  function hipHostMalloc_l_3_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(3), lbounds(3)
    integer(c_int64_t), intent(in), optional :: dims8(3), lbounds8(3)
    logical(c_bool), target, dimension(:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_l_3_source

  function hipHostMalloc_l_4_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(4), lbounds(4)
    integer(c_int64_t), intent(in), optional :: dims8(4), lbounds8(4)
    logical(c_bool), target, dimension(:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_l_4_source

  function hipHostMalloc_l_5_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(5), lbounds(5)
    integer(c_int64_t), intent(in), optional :: dims8(5), lbounds8(5)
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,LBOUND(dsource,2):,LBOUND(dsource,3):,LBOUND(dsource,4):,LBOUND(dsource,5):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_l_5_source

  function hipHostMalloc_l_6_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(6), lbounds(6)
    integer(c_int64_t), intent(in), optional :: dims8(6), lbounds8(6)
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,LBOUND(source,2):,LBOUND(source,3):,LBOUND(source,4):,LBOUND(source,5):,LBOUND(source,6):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,LBOUND(mold,2):,LBOUND(mold,3):,LBOUND(mold,4):,LBOUND(mold,5):,LBOUND(mold,6):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_l_6_source

  function hipHostMalloc_l_7_source(ptr, dims, dims8, lbounds, lbounds8, dsource, source, mold, flags) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToHost, hipMemcpyDeviceToHost
    use hipfort_hipmemcpy, only: hipMemcpy
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in), optional :: dims(7), lbounds(7)
    integer(c_int64_t), intent(in), optional :: dims8(7), lbounds8(7)
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: dsource, source, mold
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer :: nOptArgs
    type(c_ptr) :: cptr
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:) :: tmp
    nOptArgs = 0
    if (present(dims)) nOptArgs = nOptArgs + 1
    if (present(dims8)) nOptArgs = nOptArgs + 1
    if (present(dsource)) nOptArgs = nOptArgs + 1
    if (present(source)) nOptArgs = nOptArgs + 1
    if (present(mold)) nOptArgs = nOptArgs + 1
    if (nOptArgs == 0) ERROR STOP "hipHostMalloc: specify one of dims/dims8/dsource/source/mold"
    if (nOptArgs > 1)  ERROR STOP "hipHostMalloc: specify only one of dims/dims8/dsource/source/mold"
    if (present(lbounds8) .and. .not. present(dims8)) ERROR STOP "hipHostMalloc: lbounds8 requires dims8"
    if (present(lbounds)  .and. .not. present(dims))  ERROR STOP "hipHostMalloc: lbounds requires dims"
    if (present(dsource)) then
      res = hipHostMalloc_(cptr, int(size(dsource), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(dsource), int(size(dsource), c_size_t)*1_c_size_t, hipMemcpyDeviceToHost)
      call c_f_pointer(cptr, tmp, shape=shape(dsource))
      ptr(LBOUND(dsource,1):,&
        LBOUND(dsource,2):,&
        LBOUND(dsource,3):,&
        LBOUND(dsource,4):,&
        LBOUND(dsource,5):,&
        LBOUND(dsource,6):,&
        LBOUND(dsource,7):) => tmp
    else if (present(source)) then
      res = hipHostMalloc_(cptr, int(size(source), c_size_t)*1_c_size_t, flags)
      res = hipMemcpy(cptr, c_loc(source), int(size(source), c_size_t)*1_c_size_t, hipMemcpyHostToHost)
      call c_f_pointer(cptr, tmp, shape=shape(source))
      ptr(LBOUND(source,1):,&
        LBOUND(source,2):,&
        LBOUND(source,3):,&
        LBOUND(source,4):,&
        LBOUND(source,5):,&
        LBOUND(source,6):,&
        LBOUND(source,7):) => tmp
    else if (present(mold)) then
      res = hipHostMalloc_(cptr, int(size(mold), c_size_t)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=shape(mold))
      ptr(LBOUND(mold,1):,&
        LBOUND(mold,2):,&
        LBOUND(mold,3):,&
        LBOUND(mold,4):,&
        LBOUND(mold,5):,&
        LBOUND(mold,6):,&
        LBOUND(mold,7):) => tmp
    else if (present(dims8)) then
      res = hipHostMalloc_(cptr, product(dims8)*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims8)
      if (present(lbounds8)) then
      ptr(lbounds8(1):,lbounds8(2):,lbounds8(3):,lbounds8(4):,lbounds8(5):,lbounds8(6):,lbounds8(7):) => tmp
      else
        ptr => tmp
      end if
    else if (present(dims)) then
      res = hipHostMalloc_(cptr, product(int(dims, c_size_t))*1_c_size_t, flags)
      call c_f_pointer(cptr, tmp, shape=dims)
      if (present(lbounds)) then
      ptr(lbounds(1):,lbounds(2):,lbounds(3):,lbounds(4):,lbounds(5):,lbounds(6):,lbounds(7):) => tmp
      else
        ptr => tmp
      end if
    end if
  end function hipHostMalloc_l_7_source

  function hipFree_i4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_i4_0

  function hipFree_i4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_i4_1

  function hipFree_i4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_i4_2

  function hipFree_i4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_i4_3

  function hipFree_i4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i4_4

  function hipFree_i4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i4_5

  function hipFree_i4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i4_6

  function hipFree_i4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i4_7

  function hipFree_i8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_i8_0

  function hipFree_i8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_i8_1

  function hipFree_i8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_i8_2

  function hipFree_i8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_i8_3

  function hipFree_i8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i8_4

  function hipFree_i8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i8_5

  function hipFree_i8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i8_6

  function hipFree_i8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i8_7

  function hipFree_r4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_r4_0

  function hipFree_r4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_r4_1

  function hipFree_r4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_r4_2

  function hipFree_r4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_r4_3

  function hipFree_r4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r4_4

  function hipFree_r4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r4_5

  function hipFree_r4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r4_6

  function hipFree_r4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r4_7

  function hipFree_r8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_r8_0

  function hipFree_r8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_r8_1

  function hipFree_r8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_r8_2

  function hipFree_r8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_r8_3

  function hipFree_r8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r8_4

  function hipFree_r8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r8_5

  function hipFree_r8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r8_6

  function hipFree_r8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r8_7

  function hipFree_c4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_c4_0

  function hipFree_c4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_c4_1

  function hipFree_c4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_c4_2

  function hipFree_c4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_c4_3

  function hipFree_c4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c4_4

  function hipFree_c4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c4_5

  function hipFree_c4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c4_6

  function hipFree_c4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c4_7

  function hipFree_c8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_c8_0

  function hipFree_c8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_c8_1

  function hipFree_c8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_c8_2

  function hipFree_c8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_c8_3

  function hipFree_c8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c8_4

  function hipFree_c8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c8_5

  function hipFree_c8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c8_6

  function hipFree_c8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c8_7

  function hipFree_l_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_l_0

  function hipFree_l_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_l_1

  function hipFree_l_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_l_2

  function hipFree_l_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_l_3

  function hipFree_l_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_l_4

  function hipFree_l_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_l_5

  function hipFree_l_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_l_6

  function hipFree_l_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_l_7

  function hipHostFree_i4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_i4_0

  function hipHostFree_i4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_i4_1

  function hipHostFree_i4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_2

  function hipHostFree_i4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_3

  function hipHostFree_i4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_4

  function hipHostFree_i4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_5

  function hipHostFree_i4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_6

  function hipHostFree_i4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_7

  function hipHostFree_i8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_i8_0

  function hipHostFree_i8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_i8_1

  function hipHostFree_i8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_2

  function hipHostFree_i8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_3

  function hipHostFree_i8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_4

  function hipHostFree_i8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_5

  function hipHostFree_i8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_6

  function hipHostFree_i8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_7

  function hipHostFree_r4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_r4_0

  function hipHostFree_r4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_r4_1

  function hipHostFree_r4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_2

  function hipHostFree_r4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_3

  function hipHostFree_r4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_4

  function hipHostFree_r4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_5

  function hipHostFree_r4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_6

  function hipHostFree_r4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_7

  function hipHostFree_r8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_r8_0

  function hipHostFree_r8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_r8_1

  function hipHostFree_r8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_2

  function hipHostFree_r8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_3

  function hipHostFree_r8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_4

  function hipHostFree_r8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_5

  function hipHostFree_r8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_6

  function hipHostFree_r8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_7

  function hipHostFree_c4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_c4_0

  function hipHostFree_c4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_c4_1

  function hipHostFree_c4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_2

  function hipHostFree_c4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_3

  function hipHostFree_c4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_4

  function hipHostFree_c4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_5

  function hipHostFree_c4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_6

  function hipHostFree_c4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_7

  function hipHostFree_c8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_c8_0

  function hipHostFree_c8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_c8_1

  function hipHostFree_c8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_2

  function hipHostFree_c8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_3

  function hipHostFree_c8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_4

  function hipHostFree_c8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_5

  function hipHostFree_c8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_6

  function hipHostFree_c8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_7

  function hipHostFree_l_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_l_0

  function hipHostFree_l_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_l_1

  function hipHostFree_l_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_2

  function hipHostFree_l_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_3

  function hipHostFree_l_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_4

  function hipHostFree_l_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_5

  function hipHostFree_l_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_6

  function hipHostFree_l_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_7

end module hipfort_hipmalloc
