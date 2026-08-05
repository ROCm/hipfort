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

module hipfort_hiphostregister
  use, intrinsic :: iso_c_binding
  implicit none

  interface hipHostRegister
  !>   @brief Register host memory so it can be accessed from the current device.
  !>
  !>   @param[out] hostPtr Pointer to host memory to be registered.
  !>   @param[in] sizeBytes Size of the host memory
  !>   @param[in] flags  See below.
  !>
  !>   Flags:
  !>   - `hipHostRegisterDefault`   Memory is Mapped and Portable
  !>   - `hipHostRegisterPortable` Memory is considered registered by all contexts. HIP only
  !>   supports
  !>  one context so this is always assumed true.
  !>   - `hipHostRegisterMapped` Map the allocation into the address space for the current device.
  !>  The device pointer can be obtained with `hipHostGetDevicePointer`.
  !>   - `hipExtHostRegisterUncached`  Map the host memory onto extended fine grained access system
  !>  memory pool.
  !>
  !>   After registering the memory, use `hipHostGetDevicePointer` to obtain the mapped device
  !>   pointer.
  !>   On many systems, the mapped device pointer will have a different value than the mapped host
  !>  pointer. Applications must use the device pointer in device code, and the host pointer in host
  !>  code.
  !>
  !>   On some systems, registered memory is pinned.  On some systems, registered memory may not be
  !>  actually be pinned but uses OS or hardware facilities to all GPU access to the host memory.
  !>
  !>   Developers are strongly encouraged to register memory blocks which are aligned to the host
  !>  cache-line size. (typically 64-bytes but can be obtains from the CPUID instruction).
  !>
  !>   If registering non-aligned pointers, the application must take care when register pointers
  !>   from
  !>  the same cache line on different devices.  HIP's coarse-grained synchronization model does not
  !>  guarantee correct results if different devices write to different parts of the same cache
  !>  block -
  !>  typically one of the writes will "win" and overwrite data from the other registered memory
  !>  region.
  !>
  !>   @returns `hipSuccess`, `hipErrorOutOfMemory`
  !>
  !>   @see hipHostUnregister, hipHostGetFlags, hipHostGetDevicePointer
#ifdef USE_CUDA_NAMES
    function hipHostRegister_(hostPtr, sizeBytes, flags) bind(c, name="cudaHostRegister")
#else
    function hipHostRegister_(hostPtr, sizeBytes, flags) bind(c, name="hipHostRegister")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipHostRegister_
      type(c_ptr), value :: hostPtr
      integer(c_size_t), value :: sizeBytes
      integer(c_int), value :: flags
    end function hipHostRegister_
    module procedure hipHostRegister_i4_0_nosize
    module procedure hipHostRegister_i4_1_nosize
    module procedure hipHostRegister_i4_1
    module procedure hipHostRegister_i4_1_c_size_t
    module procedure hipHostRegister_i4_2_nosize
    module procedure hipHostRegister_i4_2
    module procedure hipHostRegister_i4_2_c_size_t
    module procedure hipHostRegister_i4_3_nosize
    module procedure hipHostRegister_i4_3
    module procedure hipHostRegister_i4_3_c_size_t
    module procedure hipHostRegister_i4_4_nosize
    module procedure hipHostRegister_i4_4
    module procedure hipHostRegister_i4_4_c_size_t
    module procedure hipHostRegister_i4_5_nosize
    module procedure hipHostRegister_i4_5
    module procedure hipHostRegister_i4_5_c_size_t
    module procedure hipHostRegister_i4_6_nosize
    module procedure hipHostRegister_i4_6
    module procedure hipHostRegister_i4_6_c_size_t
    module procedure hipHostRegister_i4_7_nosize
    module procedure hipHostRegister_i4_7
    module procedure hipHostRegister_i4_7_c_size_t
    module procedure hipHostRegister_i8_0_nosize
    module procedure hipHostRegister_i8_1_nosize
    module procedure hipHostRegister_i8_1
    module procedure hipHostRegister_i8_1_c_size_t
    module procedure hipHostRegister_i8_2_nosize
    module procedure hipHostRegister_i8_2
    module procedure hipHostRegister_i8_2_c_size_t
    module procedure hipHostRegister_i8_3_nosize
    module procedure hipHostRegister_i8_3
    module procedure hipHostRegister_i8_3_c_size_t
    module procedure hipHostRegister_i8_4_nosize
    module procedure hipHostRegister_i8_4
    module procedure hipHostRegister_i8_4_c_size_t
    module procedure hipHostRegister_i8_5_nosize
    module procedure hipHostRegister_i8_5
    module procedure hipHostRegister_i8_5_c_size_t
    module procedure hipHostRegister_i8_6_nosize
    module procedure hipHostRegister_i8_6
    module procedure hipHostRegister_i8_6_c_size_t
    module procedure hipHostRegister_i8_7_nosize
    module procedure hipHostRegister_i8_7
    module procedure hipHostRegister_i8_7_c_size_t
    module procedure hipHostRegister_r4_0_nosize
    module procedure hipHostRegister_r4_1_nosize
    module procedure hipHostRegister_r4_1
    module procedure hipHostRegister_r4_1_c_size_t
    module procedure hipHostRegister_r4_2_nosize
    module procedure hipHostRegister_r4_2
    module procedure hipHostRegister_r4_2_c_size_t
    module procedure hipHostRegister_r4_3_nosize
    module procedure hipHostRegister_r4_3
    module procedure hipHostRegister_r4_3_c_size_t
    module procedure hipHostRegister_r4_4_nosize
    module procedure hipHostRegister_r4_4
    module procedure hipHostRegister_r4_4_c_size_t
    module procedure hipHostRegister_r4_5_nosize
    module procedure hipHostRegister_r4_5
    module procedure hipHostRegister_r4_5_c_size_t
    module procedure hipHostRegister_r4_6_nosize
    module procedure hipHostRegister_r4_6
    module procedure hipHostRegister_r4_6_c_size_t
    module procedure hipHostRegister_r4_7_nosize
    module procedure hipHostRegister_r4_7
    module procedure hipHostRegister_r4_7_c_size_t
    module procedure hipHostRegister_r8_0_nosize
    module procedure hipHostRegister_r8_1_nosize
    module procedure hipHostRegister_r8_1
    module procedure hipHostRegister_r8_1_c_size_t
    module procedure hipHostRegister_r8_2_nosize
    module procedure hipHostRegister_r8_2
    module procedure hipHostRegister_r8_2_c_size_t
    module procedure hipHostRegister_r8_3_nosize
    module procedure hipHostRegister_r8_3
    module procedure hipHostRegister_r8_3_c_size_t
    module procedure hipHostRegister_r8_4_nosize
    module procedure hipHostRegister_r8_4
    module procedure hipHostRegister_r8_4_c_size_t
    module procedure hipHostRegister_r8_5_nosize
    module procedure hipHostRegister_r8_5
    module procedure hipHostRegister_r8_5_c_size_t
    module procedure hipHostRegister_r8_6_nosize
    module procedure hipHostRegister_r8_6
    module procedure hipHostRegister_r8_6_c_size_t
    module procedure hipHostRegister_r8_7_nosize
    module procedure hipHostRegister_r8_7
    module procedure hipHostRegister_r8_7_c_size_t
    module procedure hipHostRegister_c4_0_nosize
    module procedure hipHostRegister_c4_1_nosize
    module procedure hipHostRegister_c4_1
    module procedure hipHostRegister_c4_1_c_size_t
    module procedure hipHostRegister_c4_2_nosize
    module procedure hipHostRegister_c4_2
    module procedure hipHostRegister_c4_2_c_size_t
    module procedure hipHostRegister_c4_3_nosize
    module procedure hipHostRegister_c4_3
    module procedure hipHostRegister_c4_3_c_size_t
    module procedure hipHostRegister_c4_4_nosize
    module procedure hipHostRegister_c4_4
    module procedure hipHostRegister_c4_4_c_size_t
    module procedure hipHostRegister_c4_5_nosize
    module procedure hipHostRegister_c4_5
    module procedure hipHostRegister_c4_5_c_size_t
    module procedure hipHostRegister_c4_6_nosize
    module procedure hipHostRegister_c4_6
    module procedure hipHostRegister_c4_6_c_size_t
    module procedure hipHostRegister_c4_7_nosize
    module procedure hipHostRegister_c4_7
    module procedure hipHostRegister_c4_7_c_size_t
    module procedure hipHostRegister_c8_0_nosize
    module procedure hipHostRegister_c8_1_nosize
    module procedure hipHostRegister_c8_1
    module procedure hipHostRegister_c8_1_c_size_t
    module procedure hipHostRegister_c8_2_nosize
    module procedure hipHostRegister_c8_2
    module procedure hipHostRegister_c8_2_c_size_t
    module procedure hipHostRegister_c8_3_nosize
    module procedure hipHostRegister_c8_3
    module procedure hipHostRegister_c8_3_c_size_t
    module procedure hipHostRegister_c8_4_nosize
    module procedure hipHostRegister_c8_4
    module procedure hipHostRegister_c8_4_c_size_t
    module procedure hipHostRegister_c8_5_nosize
    module procedure hipHostRegister_c8_5
    module procedure hipHostRegister_c8_5_c_size_t
    module procedure hipHostRegister_c8_6_nosize
    module procedure hipHostRegister_c8_6
    module procedure hipHostRegister_c8_6_c_size_t
    module procedure hipHostRegister_c8_7_nosize
    module procedure hipHostRegister_c8_7
    module procedure hipHostRegister_c8_7_c_size_t
    module procedure hipHostRegister_l_0_nosize
    module procedure hipHostRegister_l_1_nosize
    module procedure hipHostRegister_l_1
    module procedure hipHostRegister_l_1_c_size_t
    module procedure hipHostRegister_l_2_nosize
    module procedure hipHostRegister_l_2
    module procedure hipHostRegister_l_2_c_size_t
    module procedure hipHostRegister_l_3_nosize
    module procedure hipHostRegister_l_3
    module procedure hipHostRegister_l_3_c_size_t
    module procedure hipHostRegister_l_4_nosize
    module procedure hipHostRegister_l_4
    module procedure hipHostRegister_l_4_c_size_t
    module procedure hipHostRegister_l_5_nosize
    module procedure hipHostRegister_l_5
    module procedure hipHostRegister_l_5_c_size_t
    module procedure hipHostRegister_l_6_nosize
    module procedure hipHostRegister_l_6
    module procedure hipHostRegister_l_6_c_size_t
    module procedure hipHostRegister_l_7_nosize
    module procedure hipHostRegister_l_7
    module procedure hipHostRegister_l_7_c_size_t
  end interface hipHostRegister

  interface hipHostUnregister
  !>   @brief Un-register host pointer
  !>
  !>   @param[in] hostPtr Host pointer previously registered with `hipHostRegister`
  !>   @returns Error code
  !>
  !>   @see hipHostRegister
#ifdef USE_CUDA_NAMES
    function hipHostUnregister_(hostPtr) bind(c, name="cudaHostUnregister")
#else
    function hipHostUnregister_(hostPtr) bind(c, name="hipHostUnregister")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipHostUnregister_
      type(c_ptr), value :: hostPtr
    end function hipHostUnregister_
    module procedure hipHostUnregister_i4_0
    module procedure hipHostUnregister_i4_1
    module procedure hipHostUnregister_i4_2
    module procedure hipHostUnregister_i4_3
    module procedure hipHostUnregister_i4_4
    module procedure hipHostUnregister_i4_5
    module procedure hipHostUnregister_i4_6
    module procedure hipHostUnregister_i4_7
    module procedure hipHostUnregister_i8_0
    module procedure hipHostUnregister_i8_1
    module procedure hipHostUnregister_i8_2
    module procedure hipHostUnregister_i8_3
    module procedure hipHostUnregister_i8_4
    module procedure hipHostUnregister_i8_5
    module procedure hipHostUnregister_i8_6
    module procedure hipHostUnregister_i8_7
    module procedure hipHostUnregister_r4_0
    module procedure hipHostUnregister_r4_1
    module procedure hipHostUnregister_r4_2
    module procedure hipHostUnregister_r4_3
    module procedure hipHostUnregister_r4_4
    module procedure hipHostUnregister_r4_5
    module procedure hipHostUnregister_r4_6
    module procedure hipHostUnregister_r4_7
    module procedure hipHostUnregister_r8_0
    module procedure hipHostUnregister_r8_1
    module procedure hipHostUnregister_r8_2
    module procedure hipHostUnregister_r8_3
    module procedure hipHostUnregister_r8_4
    module procedure hipHostUnregister_r8_5
    module procedure hipHostUnregister_r8_6
    module procedure hipHostUnregister_r8_7
    module procedure hipHostUnregister_c4_0
    module procedure hipHostUnregister_c4_1
    module procedure hipHostUnregister_c4_2
    module procedure hipHostUnregister_c4_3
    module procedure hipHostUnregister_c4_4
    module procedure hipHostUnregister_c4_5
    module procedure hipHostUnregister_c4_6
    module procedure hipHostUnregister_c4_7
    module procedure hipHostUnregister_c8_0
    module procedure hipHostUnregister_c8_1
    module procedure hipHostUnregister_c8_2
    module procedure hipHostUnregister_c8_3
    module procedure hipHostUnregister_c8_4
    module procedure hipHostUnregister_c8_5
    module procedure hipHostUnregister_c8_6
    module procedure hipHostUnregister_c8_7
    module procedure hipHostUnregister_l_0
    module procedure hipHostUnregister_l_1
    module procedure hipHostUnregister_l_2
    module procedure hipHostUnregister_l_3
    module procedure hipHostUnregister_l_4
    module procedure hipHostUnregister_l_5
    module procedure hipHostUnregister_l_6
    module procedure hipHostUnregister_l_7
  end interface hipHostUnregister

  interface hipHostGetDevicePointer
  !>   @brief Get Device pointer from Host Pointer allocated through hipHostMalloc
  !>
  !>   @param[out] devPtr Device Pointer mapped to passed host pointer
  !>   @param[in]  hstPtr Host Pointer allocated through hipHostMalloc
  !>   @param[in]  flags Flags to be passed for extension
  !>
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorOutOfMemory`
  !>
  !>   @see hipSetDeviceFlags, hipHostMalloc
#ifdef USE_CUDA_NAMES
    function hipHostGetDevicePointer_(devPtr, hstPtr, flags) &
        bind(c, name="cudaHostGetDevicePointer")
#else
    function hipHostGetDevicePointer_(devPtr, hstPtr, flags) bind(c, name="hipHostGetDevicePointer")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipHostGetDevicePointer_
      type(c_ptr) :: devPtr
      type(c_ptr), value :: hstPtr
      integer(c_int), value :: flags
    end function hipHostGetDevicePointer_
    module procedure hipHostGetDevicePointer_i4_0
    module procedure hipHostGetDevicePointer_i4_1
    module procedure hipHostGetDevicePointer_i4_2
    module procedure hipHostGetDevicePointer_i4_3
    module procedure hipHostGetDevicePointer_i4_4
    module procedure hipHostGetDevicePointer_i4_5
    module procedure hipHostGetDevicePointer_i4_6
    module procedure hipHostGetDevicePointer_i4_7
    module procedure hipHostGetDevicePointer_i8_0
    module procedure hipHostGetDevicePointer_i8_1
    module procedure hipHostGetDevicePointer_i8_2
    module procedure hipHostGetDevicePointer_i8_3
    module procedure hipHostGetDevicePointer_i8_4
    module procedure hipHostGetDevicePointer_i8_5
    module procedure hipHostGetDevicePointer_i8_6
    module procedure hipHostGetDevicePointer_i8_7
    module procedure hipHostGetDevicePointer_r4_0
    module procedure hipHostGetDevicePointer_r4_1
    module procedure hipHostGetDevicePointer_r4_2
    module procedure hipHostGetDevicePointer_r4_3
    module procedure hipHostGetDevicePointer_r4_4
    module procedure hipHostGetDevicePointer_r4_5
    module procedure hipHostGetDevicePointer_r4_6
    module procedure hipHostGetDevicePointer_r4_7
    module procedure hipHostGetDevicePointer_r8_0
    module procedure hipHostGetDevicePointer_r8_1
    module procedure hipHostGetDevicePointer_r8_2
    module procedure hipHostGetDevicePointer_r8_3
    module procedure hipHostGetDevicePointer_r8_4
    module procedure hipHostGetDevicePointer_r8_5
    module procedure hipHostGetDevicePointer_r8_6
    module procedure hipHostGetDevicePointer_r8_7
    module procedure hipHostGetDevicePointer_c4_0
    module procedure hipHostGetDevicePointer_c4_1
    module procedure hipHostGetDevicePointer_c4_2
    module procedure hipHostGetDevicePointer_c4_3
    module procedure hipHostGetDevicePointer_c4_4
    module procedure hipHostGetDevicePointer_c4_5
    module procedure hipHostGetDevicePointer_c4_6
    module procedure hipHostGetDevicePointer_c4_7
    module procedure hipHostGetDevicePointer_c8_0
    module procedure hipHostGetDevicePointer_c8_1
    module procedure hipHostGetDevicePointer_c8_2
    module procedure hipHostGetDevicePointer_c8_3
    module procedure hipHostGetDevicePointer_c8_4
    module procedure hipHostGetDevicePointer_c8_5
    module procedure hipHostGetDevicePointer_c8_6
    module procedure hipHostGetDevicePointer_c8_7
    module procedure hipHostGetDevicePointer_l_0
    module procedure hipHostGetDevicePointer_l_1
    module procedure hipHostGetDevicePointer_l_2
    module procedure hipHostGetDevicePointer_l_3
    module procedure hipHostGetDevicePointer_l_4
    module procedure hipHostGetDevicePointer_l_5
    module procedure hipHostGetDevicePointer_l_6
    module procedure hipHostGetDevicePointer_l_7
  end interface hipHostGetDevicePointer

  interface hipHostGetFlags
  !>   @brief Return flags associated with host pointer
  !>
  !>   @param[out] flagsPtr Memory location to store flags
  !>   @param[in]  hostPtr Host Pointer allocated through hipHostMalloc
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`
  !>
  !>   @see hipHostMalloc
#ifdef USE_CUDA_NAMES
    function hipHostGetFlags_(flags, hostPtr) bind(c, name="cudaHostGetFlags")
#else
    function hipHostGetFlags_(flags, hostPtr) bind(c, name="hipHostGetFlags")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipHostGetFlags_
      integer(c_int) :: flags
      type(c_ptr), value :: hostPtr
    end function hipHostGetFlags_
    module procedure hipHostGetFlags_i4_0
    module procedure hipHostGetFlags_i4_1
    module procedure hipHostGetFlags_i4_2
    module procedure hipHostGetFlags_i4_3
    module procedure hipHostGetFlags_i4_4
    module procedure hipHostGetFlags_i4_5
    module procedure hipHostGetFlags_i4_6
    module procedure hipHostGetFlags_i4_7
    module procedure hipHostGetFlags_i8_0
    module procedure hipHostGetFlags_i8_1
    module procedure hipHostGetFlags_i8_2
    module procedure hipHostGetFlags_i8_3
    module procedure hipHostGetFlags_i8_4
    module procedure hipHostGetFlags_i8_5
    module procedure hipHostGetFlags_i8_6
    module procedure hipHostGetFlags_i8_7
    module procedure hipHostGetFlags_r4_0
    module procedure hipHostGetFlags_r4_1
    module procedure hipHostGetFlags_r4_2
    module procedure hipHostGetFlags_r4_3
    module procedure hipHostGetFlags_r4_4
    module procedure hipHostGetFlags_r4_5
    module procedure hipHostGetFlags_r4_6
    module procedure hipHostGetFlags_r4_7
    module procedure hipHostGetFlags_r8_0
    module procedure hipHostGetFlags_r8_1
    module procedure hipHostGetFlags_r8_2
    module procedure hipHostGetFlags_r8_3
    module procedure hipHostGetFlags_r8_4
    module procedure hipHostGetFlags_r8_5
    module procedure hipHostGetFlags_r8_6
    module procedure hipHostGetFlags_r8_7
    module procedure hipHostGetFlags_c4_0
    module procedure hipHostGetFlags_c4_1
    module procedure hipHostGetFlags_c4_2
    module procedure hipHostGetFlags_c4_3
    module procedure hipHostGetFlags_c4_4
    module procedure hipHostGetFlags_c4_5
    module procedure hipHostGetFlags_c4_6
    module procedure hipHostGetFlags_c4_7
    module procedure hipHostGetFlags_c8_0
    module procedure hipHostGetFlags_c8_1
    module procedure hipHostGetFlags_c8_2
    module procedure hipHostGetFlags_c8_3
    module procedure hipHostGetFlags_c8_4
    module procedure hipHostGetFlags_c8_5
    module procedure hipHostGetFlags_c8_6
    module procedure hipHostGetFlags_c8_7
    module procedure hipHostGetFlags_l_0
    module procedure hipHostGetFlags_l_1
    module procedure hipHostGetFlags_l_2
    module procedure hipHostGetFlags_l_3
    module procedure hipHostGetFlags_l_4
    module procedure hipHostGetFlags_l_5
    module procedure hipHostGetFlags_l_6
    module procedure hipHostGetFlags_l_7
  end interface hipHostGetFlags

contains

  function hipHostRegister_i4_0_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), int(1, c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_i4_0_nosize

  function hipHostRegister_i4_1_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_i4_1_nosize

  function hipHostRegister_i4_1(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_i4_1

  function hipHostRegister_i4_1_c_size_t(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_i4_1_c_size_t

  function hipHostRegister_i4_2_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_i4_2_nosize

  function hipHostRegister_i4_2(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_i4_2

  function hipHostRegister_i4_2_c_size_t(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_i4_2_c_size_t

  function hipHostRegister_i4_3_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_i4_3_nosize

  function hipHostRegister_i4_3(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_i4_3

  function hipHostRegister_i4_3_c_size_t(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_i4_3_c_size_t

  function hipHostRegister_i4_4_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_i4_4_nosize

  function hipHostRegister_i4_4(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i4_4

  function hipHostRegister_i4_4_c_size_t(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i4_4_c_size_t

  function hipHostRegister_i4_5_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_i4_5_nosize

  function hipHostRegister_i4_5(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i4_5

  function hipHostRegister_i4_5_c_size_t(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i4_5_c_size_t

  function hipHostRegister_i4_6_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_i4_6_nosize

  function hipHostRegister_i4_6(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i4_6

  function hipHostRegister_i4_6_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i4_6_c_size_t

  function hipHostRegister_i4_7_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_i4_7_nosize

  function hipHostRegister_i4_7(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i4_7

  function hipHostRegister_i4_7_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i4_7_c_size_t

  function hipHostRegister_i8_0_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), int(1, c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_i8_0_nosize

  function hipHostRegister_i8_1_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_i8_1_nosize

  function hipHostRegister_i8_1(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_i8_1

  function hipHostRegister_i8_1_c_size_t(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_i8_1_c_size_t

  function hipHostRegister_i8_2_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_i8_2_nosize

  function hipHostRegister_i8_2(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_i8_2

  function hipHostRegister_i8_2_c_size_t(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_i8_2_c_size_t

  function hipHostRegister_i8_3_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_i8_3_nosize

  function hipHostRegister_i8_3(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_i8_3

  function hipHostRegister_i8_3_c_size_t(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_i8_3_c_size_t

  function hipHostRegister_i8_4_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_i8_4_nosize

  function hipHostRegister_i8_4(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i8_4

  function hipHostRegister_i8_4_c_size_t(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i8_4_c_size_t

  function hipHostRegister_i8_5_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_i8_5_nosize

  function hipHostRegister_i8_5(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i8_5

  function hipHostRegister_i8_5_c_size_t(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i8_5_c_size_t

  function hipHostRegister_i8_6_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_i8_6_nosize

  function hipHostRegister_i8_6(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i8_6

  function hipHostRegister_i8_6_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i8_6_c_size_t

  function hipHostRegister_i8_7_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_i8_7_nosize

  function hipHostRegister_i8_7(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i8_7

  function hipHostRegister_i8_7_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_i8_7_c_size_t

  function hipHostRegister_r4_0_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), int(1, c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_r4_0_nosize

  function hipHostRegister_r4_1_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_r4_1_nosize

  function hipHostRegister_r4_1(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_r4_1

  function hipHostRegister_r4_1_c_size_t(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_r4_1_c_size_t

  function hipHostRegister_r4_2_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_r4_2_nosize

  function hipHostRegister_r4_2(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_r4_2

  function hipHostRegister_r4_2_c_size_t(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_r4_2_c_size_t

  function hipHostRegister_r4_3_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_r4_3_nosize

  function hipHostRegister_r4_3(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_r4_3

  function hipHostRegister_r4_3_c_size_t(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_r4_3_c_size_t

  function hipHostRegister_r4_4_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_r4_4_nosize

  function hipHostRegister_r4_4(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r4_4

  function hipHostRegister_r4_4_c_size_t(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r4_4_c_size_t

  function hipHostRegister_r4_5_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_r4_5_nosize

  function hipHostRegister_r4_5(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r4_5

  function hipHostRegister_r4_5_c_size_t(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r4_5_c_size_t

  function hipHostRegister_r4_6_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_r4_6_nosize

  function hipHostRegister_r4_6(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r4_6

  function hipHostRegister_r4_6_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r4_6_c_size_t

  function hipHostRegister_r4_7_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*4_c_size_t, flags)
  end function hipHostRegister_r4_7_nosize

  function hipHostRegister_r4_7(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r4_7

  function hipHostRegister_r4_7_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r4_7_c_size_t

  function hipHostRegister_r8_0_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), int(1, c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_r8_0_nosize

  function hipHostRegister_r8_1_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_r8_1_nosize

  function hipHostRegister_r8_1(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_r8_1

  function hipHostRegister_r8_1_c_size_t(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_r8_1_c_size_t

  function hipHostRegister_r8_2_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_r8_2_nosize

  function hipHostRegister_r8_2(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_r8_2

  function hipHostRegister_r8_2_c_size_t(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_r8_2_c_size_t

  function hipHostRegister_r8_3_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_r8_3_nosize

  function hipHostRegister_r8_3(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_r8_3

  function hipHostRegister_r8_3_c_size_t(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_r8_3_c_size_t

  function hipHostRegister_r8_4_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_r8_4_nosize

  function hipHostRegister_r8_4(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r8_4

  function hipHostRegister_r8_4_c_size_t(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r8_4_c_size_t

  function hipHostRegister_r8_5_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_r8_5_nosize

  function hipHostRegister_r8_5(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r8_5

  function hipHostRegister_r8_5_c_size_t(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r8_5_c_size_t

  function hipHostRegister_r8_6_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_r8_6_nosize

  function hipHostRegister_r8_6(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r8_6

  function hipHostRegister_r8_6_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r8_6_c_size_t

  function hipHostRegister_r8_7_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_r8_7_nosize

  function hipHostRegister_r8_7(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r8_7

  function hipHostRegister_r8_7_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_r8_7_c_size_t

  function hipHostRegister_c4_0_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), int(1, c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_c4_0_nosize

  function hipHostRegister_c4_1_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_c4_1_nosize

  function hipHostRegister_c4_1(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_c4_1

  function hipHostRegister_c4_1_c_size_t(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_c4_1_c_size_t

  function hipHostRegister_c4_2_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_c4_2_nosize

  function hipHostRegister_c4_2(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_c4_2

  function hipHostRegister_c4_2_c_size_t(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_c4_2_c_size_t

  function hipHostRegister_c4_3_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_c4_3_nosize

  function hipHostRegister_c4_3(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_c4_3

  function hipHostRegister_c4_3_c_size_t(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_c4_3_c_size_t

  function hipHostRegister_c4_4_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_c4_4_nosize

  function hipHostRegister_c4_4(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c4_4

  function hipHostRegister_c4_4_c_size_t(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c4_4_c_size_t

  function hipHostRegister_c4_5_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_c4_5_nosize

  function hipHostRegister_c4_5(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c4_5

  function hipHostRegister_c4_5_c_size_t(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c4_5_c_size_t

  function hipHostRegister_c4_6_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_c4_6_nosize

  function hipHostRegister_c4_6(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c4_6

  function hipHostRegister_c4_6_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c4_6_c_size_t

  function hipHostRegister_c4_7_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*8_c_size_t, flags)
  end function hipHostRegister_c4_7_nosize

  function hipHostRegister_c4_7(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c4_7

  function hipHostRegister_c4_7_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c4_7_c_size_t

  function hipHostRegister_c8_0_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), int(1, c_size_t)*16_c_size_t, flags)
  end function hipHostRegister_c8_0_nosize

  function hipHostRegister_c8_1_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), int(size(hostPtr), c_size_t)*16_c_size_t, flags)
  end function hipHostRegister_c8_1_nosize

  function hipHostRegister_c8_1(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_c8_1

  function hipHostRegister_c8_1_c_size_t(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_c8_1_c_size_t

  function hipHostRegister_c8_2_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), int(size(hostPtr), c_size_t)*16_c_size_t, flags)
  end function hipHostRegister_c8_2_nosize

  function hipHostRegister_c8_2(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_c8_2

  function hipHostRegister_c8_2_c_size_t(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_c8_2_c_size_t

  function hipHostRegister_c8_3_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), int(size(hostPtr), c_size_t)*16_c_size_t, flags)
  end function hipHostRegister_c8_3_nosize

  function hipHostRegister_c8_3(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_c8_3

  function hipHostRegister_c8_3_c_size_t(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_c8_3_c_size_t

  function hipHostRegister_c8_4_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), int(size(hostPtr), c_size_t)*16_c_size_t, flags)
  end function hipHostRegister_c8_4_nosize

  function hipHostRegister_c8_4(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c8_4

  function hipHostRegister_c8_4_c_size_t(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c8_4_c_size_t

  function hipHostRegister_c8_5_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), int(size(hostPtr), c_size_t)*16_c_size_t, flags)
  end function hipHostRegister_c8_5_nosize

  function hipHostRegister_c8_5(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c8_5

  function hipHostRegister_c8_5_c_size_t(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c8_5_c_size_t

  function hipHostRegister_c8_6_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*16_c_size_t, flags)
  end function hipHostRegister_c8_6_nosize

  function hipHostRegister_c8_6(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c8_6

  function hipHostRegister_c8_6_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c8_6_c_size_t

  function hipHostRegister_c8_7_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*16_c_size_t, flags)
  end function hipHostRegister_c8_7_nosize

  function hipHostRegister_c8_7(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c8_7

  function hipHostRegister_c8_7_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_c8_7_c_size_t

  function hipHostRegister_l_0_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), int(1, c_size_t)*1_c_size_t, flags)
  end function hipHostRegister_l_0_nosize

  function hipHostRegister_l_1_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), int(size(hostPtr), c_size_t)*1_c_size_t, flags)
  end function hipHostRegister_l_1_nosize

  function hipHostRegister_l_1(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_l_1

  function hipHostRegister_l_1_c_size_t(hostPtr, length1, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1)), nbytes, flags)
  end function hipHostRegister_l_1_c_size_t

  function hipHostRegister_l_2_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), int(size(hostPtr), c_size_t)*1_c_size_t, flags)
  end function hipHostRegister_l_2_nosize

  function hipHostRegister_l_2(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_l_2

  function hipHostRegister_l_2_c_size_t(hostPtr, length1, length2, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1)), nbytes, flags)
  end function hipHostRegister_l_2_c_size_t

  function hipHostRegister_l_3_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), int(size(hostPtr), c_size_t)*1_c_size_t, flags)
  end function hipHostRegister_l_3_nosize

  function hipHostRegister_l_3(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_l_3

  function hipHostRegister_l_3_c_size_t(hostPtr, length1, length2, length3, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), nbytes, flags)
  end function hipHostRegister_l_3_c_size_t

  function hipHostRegister_l_4_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), int(size(hostPtr), c_size_t)*1_c_size_t, flags)
  end function hipHostRegister_l_4_nosize

  function hipHostRegister_l_4(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_l_4

  function hipHostRegister_l_4_c_size_t(hostPtr, length1, length2, length3, length4, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), nbytes, flags)
  end function hipHostRegister_l_4_c_size_t

  function hipHostRegister_l_5_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), int(size(hostPtr), c_size_t)*1_c_size_t, flags)
  end function hipHostRegister_l_5_nosize

  function hipHostRegister_l_5(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_l_5

  function hipHostRegister_l_5_c_size_t(hostPtr, length1, length2, length3, length4, length5, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_l_5_c_size_t

  function hipHostRegister_l_6_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*1_c_size_t, flags)
  end function hipHostRegister_l_6_nosize

  function hipHostRegister_l_6(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_l_6

  function hipHostRegister_l_6_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_l_6_c_size_t

  function hipHostRegister_l_7_nosize(hostPtr, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), int(size(hostPtr), c_size_t)*1_c_size_t, flags)
  end function hipHostRegister_l_7_nosize

  function hipHostRegister_l_7(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_l_7

  function hipHostRegister_l_7_c_size_t(hostPtr, length1, length2, length3, length4, length5, length6, length7, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in) :: hostPtr
    integer(c_size_t), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int), intent(in) :: flags
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), nbytes, flags)
  end function hipHostRegister_l_7_c_size_t

  function hipHostUnregister_i4_0(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr))
  end function hipHostUnregister_i4_0

  function hipHostUnregister_i4_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1)))
  end function hipHostUnregister_i4_1

  function hipHostUnregister_i4_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_i4_2

  function hipHostUnregister_i4_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_i4_3

  function hipHostUnregister_i4_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_i4_4

  function hipHostUnregister_i4_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_i4_5

  function hipHostUnregister_i4_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_i4_6

  function hipHostUnregister_i4_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_i4_7

  function hipHostUnregister_i8_0(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr))
  end function hipHostUnregister_i8_0

  function hipHostUnregister_i8_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1)))
  end function hipHostUnregister_i8_1

  function hipHostUnregister_i8_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_i8_2

  function hipHostUnregister_i8_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_i8_3

  function hipHostUnregister_i8_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_i8_4

  function hipHostUnregister_i8_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_i8_5

  function hipHostUnregister_i8_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_i8_6

  function hipHostUnregister_i8_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_i8_7

  function hipHostUnregister_r4_0(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr))
  end function hipHostUnregister_r4_0

  function hipHostUnregister_r4_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1)))
  end function hipHostUnregister_r4_1

  function hipHostUnregister_r4_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_r4_2

  function hipHostUnregister_r4_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_r4_3

  function hipHostUnregister_r4_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_r4_4

  function hipHostUnregister_r4_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_r4_5

  function hipHostUnregister_r4_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_r4_6

  function hipHostUnregister_r4_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_r4_7

  function hipHostUnregister_r8_0(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr))
  end function hipHostUnregister_r8_0

  function hipHostUnregister_r8_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1)))
  end function hipHostUnregister_r8_1

  function hipHostUnregister_r8_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_r8_2

  function hipHostUnregister_r8_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_r8_3

  function hipHostUnregister_r8_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_r8_4

  function hipHostUnregister_r8_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_r8_5

  function hipHostUnregister_r8_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_r8_6

  function hipHostUnregister_r8_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_r8_7

  function hipHostUnregister_c4_0(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr))
  end function hipHostUnregister_c4_0

  function hipHostUnregister_c4_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1)))
  end function hipHostUnregister_c4_1

  function hipHostUnregister_c4_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_c4_2

  function hipHostUnregister_c4_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_c4_3

  function hipHostUnregister_c4_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_c4_4

  function hipHostUnregister_c4_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_c4_5

  function hipHostUnregister_c4_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_c4_6

  function hipHostUnregister_c4_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_c4_7

  function hipHostUnregister_c8_0(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr))
  end function hipHostUnregister_c8_0

  function hipHostUnregister_c8_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1)))
  end function hipHostUnregister_c8_1

  function hipHostUnregister_c8_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_c8_2

  function hipHostUnregister_c8_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_c8_3

  function hipHostUnregister_c8_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_c8_4

  function hipHostUnregister_c8_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_c8_5

  function hipHostUnregister_c8_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_c8_6

  function hipHostUnregister_c8_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_c8_7

  function hipHostUnregister_l_0(hostPtr) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr))
  end function hipHostUnregister_l_0

  function hipHostUnregister_l_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1)))
  end function hipHostUnregister_l_1

  function hipHostUnregister_l_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_l_2

  function hipHostUnregister_l_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_l_3

  function hipHostUnregister_l_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_l_4

  function hipHostUnregister_l_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_l_5

  function hipHostUnregister_l_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_l_6

  function hipHostUnregister_l_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_l_7

  function hipHostGetDevicePointer_i4_0(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr), flags)
  end function hipHostGetDevicePointer_i4_0

  function hipHostGetDevicePointer_i4_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_i4_1

  function hipHostGetDevicePointer_i4_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_i4_2

  function hipHostGetDevicePointer_i4_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_i4_3

  function hipHostGetDevicePointer_i4_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i4_4

  function hipHostGetDevicePointer_i4_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i4_5

  function hipHostGetDevicePointer_i4_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i4_6

  function hipHostGetDevicePointer_i4_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i4_7

  function hipHostGetDevicePointer_i8_0(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr), flags)
  end function hipHostGetDevicePointer_i8_0

  function hipHostGetDevicePointer_i8_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_i8_1

  function hipHostGetDevicePointer_i8_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_i8_2

  function hipHostGetDevicePointer_i8_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_i8_3

  function hipHostGetDevicePointer_i8_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i8_4

  function hipHostGetDevicePointer_i8_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i8_5

  function hipHostGetDevicePointer_i8_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i8_6

  function hipHostGetDevicePointer_i8_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i8_7

  function hipHostGetDevicePointer_r4_0(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr), flags)
  end function hipHostGetDevicePointer_r4_0

  function hipHostGetDevicePointer_r4_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_r4_1

  function hipHostGetDevicePointer_r4_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_r4_2

  function hipHostGetDevicePointer_r4_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_r4_3

  function hipHostGetDevicePointer_r4_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r4_4

  function hipHostGetDevicePointer_r4_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r4_5

  function hipHostGetDevicePointer_r4_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r4_6

  function hipHostGetDevicePointer_r4_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r4_7

  function hipHostGetDevicePointer_r8_0(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr), flags)
  end function hipHostGetDevicePointer_r8_0

  function hipHostGetDevicePointer_r8_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_r8_1

  function hipHostGetDevicePointer_r8_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_r8_2

  function hipHostGetDevicePointer_r8_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_r8_3

  function hipHostGetDevicePointer_r8_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r8_4

  function hipHostGetDevicePointer_r8_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r8_5

  function hipHostGetDevicePointer_r8_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r8_6

  function hipHostGetDevicePointer_r8_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r8_7

  function hipHostGetDevicePointer_c4_0(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr), flags)
  end function hipHostGetDevicePointer_c4_0

  function hipHostGetDevicePointer_c4_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_c4_1

  function hipHostGetDevicePointer_c4_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_c4_2

  function hipHostGetDevicePointer_c4_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_c4_3

  function hipHostGetDevicePointer_c4_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c4_4

  function hipHostGetDevicePointer_c4_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c4_5

  function hipHostGetDevicePointer_c4_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c4_6

  function hipHostGetDevicePointer_c4_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c4_7

  function hipHostGetDevicePointer_c8_0(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr), flags)
  end function hipHostGetDevicePointer_c8_0

  function hipHostGetDevicePointer_c8_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_c8_1

  function hipHostGetDevicePointer_c8_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_c8_2

  function hipHostGetDevicePointer_c8_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_c8_3

  function hipHostGetDevicePointer_c8_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c8_4

  function hipHostGetDevicePointer_c8_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c8_5

  function hipHostGetDevicePointer_c8_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c8_6

  function hipHostGetDevicePointer_c8_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c8_7

  function hipHostGetDevicePointer_l_0(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    logical(c_bool), target, intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr), flags)
  end function hipHostGetDevicePointer_l_0

  function hipHostGetDevicePointer_l_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    logical(c_bool), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_l_1

  function hipHostGetDevicePointer_l_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    logical(c_bool), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_l_2

  function hipHostGetDevicePointer_l_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_l_3

  function hipHostGetDevicePointer_l_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_l_4

  function hipHostGetDevicePointer_l_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_l_5

  function hipHostGetDevicePointer_l_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_l_6

  function hipHostGetDevicePointer_l_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_l_7

  function hipHostGetFlags_i4_0(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr))
  end function hipHostGetFlags_i4_0

  function hipHostGetFlags_i4_1(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1)))
  end function hipHostGetFlags_i4_1

  function hipHostGetFlags_i4_2(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_i4_2

  function hipHostGetFlags_i4_3(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_i4_3

  function hipHostGetFlags_i4_4(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_i4_4

  function hipHostGetFlags_i4_5(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_i4_5

  function hipHostGetFlags_i4_6(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_i4_6

  function hipHostGetFlags_i4_7(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_i4_7

  function hipHostGetFlags_i8_0(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int64_t), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr))
  end function hipHostGetFlags_i8_0

  function hipHostGetFlags_i8_1(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int64_t), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1)))
  end function hipHostGetFlags_i8_1

  function hipHostGetFlags_i8_2(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_i8_2

  function hipHostGetFlags_i8_3(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_i8_3

  function hipHostGetFlags_i8_4(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_i8_4

  function hipHostGetFlags_i8_5(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_i8_5

  function hipHostGetFlags_i8_6(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_i8_6

  function hipHostGetFlags_i8_7(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_i8_7

  function hipHostGetFlags_r4_0(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_float), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr))
  end function hipHostGetFlags_r4_0

  function hipHostGetFlags_r4_1(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_float), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1)))
  end function hipHostGetFlags_r4_1

  function hipHostGetFlags_r4_2(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_float), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_r4_2

  function hipHostGetFlags_r4_3(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_float), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_r4_3

  function hipHostGetFlags_r4_4(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_r4_4

  function hipHostGetFlags_r4_5(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_r4_5

  function hipHostGetFlags_r4_6(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_r4_6

  function hipHostGetFlags_r4_7(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_r4_7

  function hipHostGetFlags_r8_0(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_double), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr))
  end function hipHostGetFlags_r8_0

  function hipHostGetFlags_r8_1(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_double), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1)))
  end function hipHostGetFlags_r8_1

  function hipHostGetFlags_r8_2(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_double), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_r8_2

  function hipHostGetFlags_r8_3(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_double), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_r8_3

  function hipHostGetFlags_r8_4(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_r8_4

  function hipHostGetFlags_r8_5(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_r8_5

  function hipHostGetFlags_r8_6(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_r8_6

  function hipHostGetFlags_r8_7(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_r8_7

  function hipHostGetFlags_c4_0(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_float_complex), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr))
  end function hipHostGetFlags_c4_0

  function hipHostGetFlags_c4_1(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_float_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1)))
  end function hipHostGetFlags_c4_1

  function hipHostGetFlags_c4_2(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_c4_2

  function hipHostGetFlags_c4_3(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_c4_3

  function hipHostGetFlags_c4_4(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_c4_4

  function hipHostGetFlags_c4_5(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_c4_5

  function hipHostGetFlags_c4_6(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_c4_6

  function hipHostGetFlags_c4_7(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_c4_7

  function hipHostGetFlags_c8_0(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_double_complex), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr))
  end function hipHostGetFlags_c8_0

  function hipHostGetFlags_c8_1(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_double_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1)))
  end function hipHostGetFlags_c8_1

  function hipHostGetFlags_c8_2(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_c8_2

  function hipHostGetFlags_c8_3(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_c8_3

  function hipHostGetFlags_c8_4(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_c8_4

  function hipHostGetFlags_c8_5(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_c8_5

  function hipHostGetFlags_c8_6(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_c8_6

  function hipHostGetFlags_c8_7(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_c8_7

  function hipHostGetFlags_l_0(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    logical(c_bool), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr))
  end function hipHostGetFlags_l_0

  function hipHostGetFlags_l_1(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    logical(c_bool), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1)))
  end function hipHostGetFlags_l_1

  function hipHostGetFlags_l_2(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    logical(c_bool), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_l_2

  function hipHostGetFlags_l_3(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_l_3

  function hipHostGetFlags_l_4(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_l_4

  function hipHostGetFlags_l_5(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_l_5

  function hipHostGetFlags_l_6(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_l_6

  function hipHostGetFlags_l_7(flagsPtr, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flagsPtr
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flagsPtr, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_l_7

end module hipfort_hiphostregister
