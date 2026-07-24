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
    module procedure hipHostRegister_i4_0
    module procedure hipHostRegister_i4_1
    module procedure hipHostRegister_i4_2
    module procedure hipHostRegister_i4_3
    module procedure hipHostRegister_i4_4
    module procedure hipHostRegister_i4_5
    module procedure hipHostRegister_i4_6
    module procedure hipHostRegister_i4_7
    module procedure hipHostRegister_i8_0
    module procedure hipHostRegister_i8_1
    module procedure hipHostRegister_i8_2
    module procedure hipHostRegister_i8_3
    module procedure hipHostRegister_i8_4
    module procedure hipHostRegister_i8_5
    module procedure hipHostRegister_i8_6
    module procedure hipHostRegister_i8_7
    module procedure hipHostRegister_r4_0
    module procedure hipHostRegister_r4_1
    module procedure hipHostRegister_r4_2
    module procedure hipHostRegister_r4_3
    module procedure hipHostRegister_r4_4
    module procedure hipHostRegister_r4_5
    module procedure hipHostRegister_r4_6
    module procedure hipHostRegister_r4_7
    module procedure hipHostRegister_r8_0
    module procedure hipHostRegister_r8_1
    module procedure hipHostRegister_r8_2
    module procedure hipHostRegister_r8_3
    module procedure hipHostRegister_r8_4
    module procedure hipHostRegister_r8_5
    module procedure hipHostRegister_r8_6
    module procedure hipHostRegister_r8_7
    module procedure hipHostRegister_c4_0
    module procedure hipHostRegister_c4_1
    module procedure hipHostRegister_c4_2
    module procedure hipHostRegister_c4_3
    module procedure hipHostRegister_c4_4
    module procedure hipHostRegister_c4_5
    module procedure hipHostRegister_c4_6
    module procedure hipHostRegister_c4_7
    module procedure hipHostRegister_c8_0
    module procedure hipHostRegister_c8_1
    module procedure hipHostRegister_c8_2
    module procedure hipHostRegister_c8_3
    module procedure hipHostRegister_c8_4
    module procedure hipHostRegister_c8_5
    module procedure hipHostRegister_c8_6
    module procedure hipHostRegister_c8_7
    module procedure hipHostRegister_l_0
    module procedure hipHostRegister_l_1
    module procedure hipHostRegister_l_2
    module procedure hipHostRegister_l_3
    module procedure hipHostRegister_l_4
    module procedure hipHostRegister_l_5
    module procedure hipHostRegister_l_6
    module procedure hipHostRegister_l_7
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

  function hipHostRegister_i4_0(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), sizeBytes, flags)
  end function hipHostRegister_i4_0

  function hipHostRegister_i4_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_i4_1

  function hipHostRegister_i4_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_2

  function hipHostRegister_i4_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_3

  function hipHostRegister_i4_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_4

  function hipHostRegister_i4_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_5

  function hipHostRegister_i4_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_6

  function hipHostRegister_i4_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_7

  function hipHostRegister_i8_0(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), sizeBytes, flags)
  end function hipHostRegister_i8_0

  function hipHostRegister_i8_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_i8_1

  function hipHostRegister_i8_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_2

  function hipHostRegister_i8_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_3

  function hipHostRegister_i8_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_4

  function hipHostRegister_i8_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_5

  function hipHostRegister_i8_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_6

  function hipHostRegister_i8_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_7

  function hipHostRegister_r4_0(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), sizeBytes, flags)
  end function hipHostRegister_r4_0

  function hipHostRegister_r4_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_r4_1

  function hipHostRegister_r4_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_2

  function hipHostRegister_r4_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_3

  function hipHostRegister_r4_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_4

  function hipHostRegister_r4_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_5

  function hipHostRegister_r4_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_6

  function hipHostRegister_r4_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_7

  function hipHostRegister_r8_0(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), sizeBytes, flags)
  end function hipHostRegister_r8_0

  function hipHostRegister_r8_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_r8_1

  function hipHostRegister_r8_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_2

  function hipHostRegister_r8_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_3

  function hipHostRegister_r8_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_4

  function hipHostRegister_r8_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_5

  function hipHostRegister_r8_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_6

  function hipHostRegister_r8_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_7

  function hipHostRegister_c4_0(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), sizeBytes, flags)
  end function hipHostRegister_c4_0

  function hipHostRegister_c4_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_c4_1

  function hipHostRegister_c4_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_2

  function hipHostRegister_c4_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_3

  function hipHostRegister_c4_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_4

  function hipHostRegister_c4_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_5

  function hipHostRegister_c4_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_6

  function hipHostRegister_c4_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_7

  function hipHostRegister_c8_0(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), sizeBytes, flags)
  end function hipHostRegister_c8_0

  function hipHostRegister_c8_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_c8_1

  function hipHostRegister_c8_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_2

  function hipHostRegister_c8_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_3

  function hipHostRegister_c8_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_4

  function hipHostRegister_c8_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_5

  function hipHostRegister_c8_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_6

  function hipHostRegister_c8_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_7

  function hipHostRegister_l_0(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr), sizeBytes, flags)
  end function hipHostRegister_l_0

  function hipHostRegister_l_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_l_1

  function hipHostRegister_l_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_l_2

  function hipHostRegister_l_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_l_3

  function hipHostRegister_l_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_l_4

  function hipHostRegister_l_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_l_5

  function hipHostRegister_l_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_l_6

  function hipHostRegister_l_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_l_7

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

  function hipHostGetFlags_i4_0(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr))
  end function hipHostGetFlags_i4_0

  function hipHostGetFlags_i4_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_i4_1

  function hipHostGetFlags_i4_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_i4_2

  function hipHostGetFlags_i4_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_i4_3

  function hipHostGetFlags_i4_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_i4_4

  function hipHostGetFlags_i4_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_i4_5

  function hipHostGetFlags_i4_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_i4_6

  function hipHostGetFlags_i4_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_i4_7

  function hipHostGetFlags_i8_0(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr))
  end function hipHostGetFlags_i8_0

  function hipHostGetFlags_i8_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_i8_1

  function hipHostGetFlags_i8_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_i8_2

  function hipHostGetFlags_i8_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_i8_3

  function hipHostGetFlags_i8_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_i8_4

  function hipHostGetFlags_i8_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_i8_5

  function hipHostGetFlags_i8_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_i8_6

  function hipHostGetFlags_i8_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_i8_7

  function hipHostGetFlags_r4_0(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr))
  end function hipHostGetFlags_r4_0

  function hipHostGetFlags_r4_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_r4_1

  function hipHostGetFlags_r4_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_r4_2

  function hipHostGetFlags_r4_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_r4_3

  function hipHostGetFlags_r4_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_r4_4

  function hipHostGetFlags_r4_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_r4_5

  function hipHostGetFlags_r4_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_r4_6

  function hipHostGetFlags_r4_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_r4_7

  function hipHostGetFlags_r8_0(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr))
  end function hipHostGetFlags_r8_0

  function hipHostGetFlags_r8_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_r8_1

  function hipHostGetFlags_r8_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_r8_2

  function hipHostGetFlags_r8_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_r8_3

  function hipHostGetFlags_r8_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_r8_4

  function hipHostGetFlags_r8_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_r8_5

  function hipHostGetFlags_r8_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_r8_6

  function hipHostGetFlags_r8_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_r8_7

  function hipHostGetFlags_c4_0(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr))
  end function hipHostGetFlags_c4_0

  function hipHostGetFlags_c4_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_c4_1

  function hipHostGetFlags_c4_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_c4_2

  function hipHostGetFlags_c4_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_c4_3

  function hipHostGetFlags_c4_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_c4_4

  function hipHostGetFlags_c4_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_c4_5

  function hipHostGetFlags_c4_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_c4_6

  function hipHostGetFlags_c4_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_c4_7

  function hipHostGetFlags_c8_0(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr))
  end function hipHostGetFlags_c8_0

  function hipHostGetFlags_c8_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_c8_1

  function hipHostGetFlags_c8_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_c8_2

  function hipHostGetFlags_c8_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_c8_3

  function hipHostGetFlags_c8_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_c8_4

  function hipHostGetFlags_c8_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_c8_5

  function hipHostGetFlags_c8_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_c8_6

  function hipHostGetFlags_c8_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_c8_7

  function hipHostGetFlags_l_0(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    logical(c_bool), target, intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr))
  end function hipHostGetFlags_l_0

  function hipHostGetFlags_l_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    logical(c_bool), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_l_1

  function hipHostGetFlags_l_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    logical(c_bool), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_l_2

  function hipHostGetFlags_l_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_l_3

  function hipHostGetFlags_l_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_l_4

  function hipHostGetFlags_l_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_l_5

  function hipHostGetFlags_l_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_l_6

  function hipHostGetFlags_l_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_l_7

end module hipfort_hiphostregister
