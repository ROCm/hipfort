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

module hipfort_hipmemcpy
  use, intrinsic :: iso_c_binding
  implicit none

  interface hipMemcpy
  !>   @brief Copy data from src to dst.
  !>
  !>   It supports memory from host to device,
  !>   device to host, device to device and host to host
  !>   The src and dst must not overlap.
  !>
  !>   For hipMemcpy, the copy is always performed by the current device (set by hipSetDevice).
  !>   For multi-gpu or peer-to-peer configurations, it is recommended to set the current device to
  !>   the
  !>   device where the src data is physically located. For optimal peer-to-peer copies, the copy
  !>  device must be able to access the src and dst pointers (by calling hipDeviceEnablePeerAccess
  !>  with
  !>  copy agent as the current device and src/dst as the peerDevice argument.  if this is not done,
  !>  the hipMemcpy will still work, but will perform the copy using a staging buffer on the host.
  !>   Calling hipMemcpy with dst and src pointers that do not match the hipMemcpyKind results in
  !>   undefined behavior.
  !>
  !>   @param[out]  dst Data being copy to
  !>   @param[in]  src Data being copy from
  !>   @param[in]  sizeBytes Data size in bytes
  !>   @param[in]  kind Kind of transfer
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorUnknown`
  !>
  !>   @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>  hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>  hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>  hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>  hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>  hipMemHostAlloc, hipMemHostGetDevicePointer
#ifdef USE_CUDA_NAMES
    function hipMemcpy_(dest, src, sizeBytes, myKind) bind(c, name="cudaMemcpy")
#else
    function hipMemcpy_(dest, src, sizeBytes, myKind) bind(c, name="hipMemcpy")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipMemcpy_
      type(c_ptr), value :: dest
      type(c_ptr), value :: src
      integer(c_size_t), value :: sizeBytes
      integer(c_int), value :: myKind
    end function hipMemcpy_
    module procedure hipMemcpy_i4_0
    module procedure hipMemcpy_i4_0_ci
    module procedure hipMemcpy_i4_0_auto
    module procedure hipMemcpy_i4_1
    module procedure hipMemcpy_i4_1_ci
    module procedure hipMemcpy_i4_1_auto
    module procedure hipMemcpy_i4_2
    module procedure hipMemcpy_i4_2_ci
    module procedure hipMemcpy_i4_2_auto
    module procedure hipMemcpy_i4_3
    module procedure hipMemcpy_i4_3_ci
    module procedure hipMemcpy_i4_3_auto
    module procedure hipMemcpy_i4_4
    module procedure hipMemcpy_i4_4_ci
    module procedure hipMemcpy_i4_4_auto
    module procedure hipMemcpy_i4_5
    module procedure hipMemcpy_i4_5_ci
    module procedure hipMemcpy_i4_5_auto
    module procedure hipMemcpy_i4_6
    module procedure hipMemcpy_i4_6_ci
    module procedure hipMemcpy_i4_6_auto
    module procedure hipMemcpy_i4_7
    module procedure hipMemcpy_i4_7_ci
    module procedure hipMemcpy_i4_7_auto
    module procedure hipMemcpy_i8_0
    module procedure hipMemcpy_i8_0_ci
    module procedure hipMemcpy_i8_0_auto
    module procedure hipMemcpy_i8_1
    module procedure hipMemcpy_i8_1_ci
    module procedure hipMemcpy_i8_1_auto
    module procedure hipMemcpy_i8_2
    module procedure hipMemcpy_i8_2_ci
    module procedure hipMemcpy_i8_2_auto
    module procedure hipMemcpy_i8_3
    module procedure hipMemcpy_i8_3_ci
    module procedure hipMemcpy_i8_3_auto
    module procedure hipMemcpy_i8_4
    module procedure hipMemcpy_i8_4_ci
    module procedure hipMemcpy_i8_4_auto
    module procedure hipMemcpy_i8_5
    module procedure hipMemcpy_i8_5_ci
    module procedure hipMemcpy_i8_5_auto
    module procedure hipMemcpy_i8_6
    module procedure hipMemcpy_i8_6_ci
    module procedure hipMemcpy_i8_6_auto
    module procedure hipMemcpy_i8_7
    module procedure hipMemcpy_i8_7_ci
    module procedure hipMemcpy_i8_7_auto
    module procedure hipMemcpy_r4_0
    module procedure hipMemcpy_r4_0_ci
    module procedure hipMemcpy_r4_0_auto
    module procedure hipMemcpy_r4_1
    module procedure hipMemcpy_r4_1_ci
    module procedure hipMemcpy_r4_1_auto
    module procedure hipMemcpy_r4_2
    module procedure hipMemcpy_r4_2_ci
    module procedure hipMemcpy_r4_2_auto
    module procedure hipMemcpy_r4_3
    module procedure hipMemcpy_r4_3_ci
    module procedure hipMemcpy_r4_3_auto
    module procedure hipMemcpy_r4_4
    module procedure hipMemcpy_r4_4_ci
    module procedure hipMemcpy_r4_4_auto
    module procedure hipMemcpy_r4_5
    module procedure hipMemcpy_r4_5_ci
    module procedure hipMemcpy_r4_5_auto
    module procedure hipMemcpy_r4_6
    module procedure hipMemcpy_r4_6_ci
    module procedure hipMemcpy_r4_6_auto
    module procedure hipMemcpy_r4_7
    module procedure hipMemcpy_r4_7_ci
    module procedure hipMemcpy_r4_7_auto
    module procedure hipMemcpy_r8_0
    module procedure hipMemcpy_r8_0_ci
    module procedure hipMemcpy_r8_0_auto
    module procedure hipMemcpy_r8_1
    module procedure hipMemcpy_r8_1_ci
    module procedure hipMemcpy_r8_1_auto
    module procedure hipMemcpy_r8_2
    module procedure hipMemcpy_r8_2_ci
    module procedure hipMemcpy_r8_2_auto
    module procedure hipMemcpy_r8_3
    module procedure hipMemcpy_r8_3_ci
    module procedure hipMemcpy_r8_3_auto
    module procedure hipMemcpy_r8_4
    module procedure hipMemcpy_r8_4_ci
    module procedure hipMemcpy_r8_4_auto
    module procedure hipMemcpy_r8_5
    module procedure hipMemcpy_r8_5_ci
    module procedure hipMemcpy_r8_5_auto
    module procedure hipMemcpy_r8_6
    module procedure hipMemcpy_r8_6_ci
    module procedure hipMemcpy_r8_6_auto
    module procedure hipMemcpy_r8_7
    module procedure hipMemcpy_r8_7_ci
    module procedure hipMemcpy_r8_7_auto
    module procedure hipMemcpy_c4_0
    module procedure hipMemcpy_c4_0_ci
    module procedure hipMemcpy_c4_0_auto
    module procedure hipMemcpy_c4_1
    module procedure hipMemcpy_c4_1_ci
    module procedure hipMemcpy_c4_1_auto
    module procedure hipMemcpy_c4_2
    module procedure hipMemcpy_c4_2_ci
    module procedure hipMemcpy_c4_2_auto
    module procedure hipMemcpy_c4_3
    module procedure hipMemcpy_c4_3_ci
    module procedure hipMemcpy_c4_3_auto
    module procedure hipMemcpy_c4_4
    module procedure hipMemcpy_c4_4_ci
    module procedure hipMemcpy_c4_4_auto
    module procedure hipMemcpy_c4_5
    module procedure hipMemcpy_c4_5_ci
    module procedure hipMemcpy_c4_5_auto
    module procedure hipMemcpy_c4_6
    module procedure hipMemcpy_c4_6_ci
    module procedure hipMemcpy_c4_6_auto
    module procedure hipMemcpy_c4_7
    module procedure hipMemcpy_c4_7_ci
    module procedure hipMemcpy_c4_7_auto
    module procedure hipMemcpy_c8_0
    module procedure hipMemcpy_c8_0_ci
    module procedure hipMemcpy_c8_0_auto
    module procedure hipMemcpy_c8_1
    module procedure hipMemcpy_c8_1_ci
    module procedure hipMemcpy_c8_1_auto
    module procedure hipMemcpy_c8_2
    module procedure hipMemcpy_c8_2_ci
    module procedure hipMemcpy_c8_2_auto
    module procedure hipMemcpy_c8_3
    module procedure hipMemcpy_c8_3_ci
    module procedure hipMemcpy_c8_3_auto
    module procedure hipMemcpy_c8_4
    module procedure hipMemcpy_c8_4_ci
    module procedure hipMemcpy_c8_4_auto
    module procedure hipMemcpy_c8_5
    module procedure hipMemcpy_c8_5_ci
    module procedure hipMemcpy_c8_5_auto
    module procedure hipMemcpy_c8_6
    module procedure hipMemcpy_c8_6_ci
    module procedure hipMemcpy_c8_6_auto
    module procedure hipMemcpy_c8_7
    module procedure hipMemcpy_c8_7_ci
    module procedure hipMemcpy_c8_7_auto
    module procedure hipMemcpy_l_0
    module procedure hipMemcpy_l_0_ci
    module procedure hipMemcpy_l_0_auto
    module procedure hipMemcpy_l_1
    module procedure hipMemcpy_l_1_ci
    module procedure hipMemcpy_l_1_auto
    module procedure hipMemcpy_l_2
    module procedure hipMemcpy_l_2_ci
    module procedure hipMemcpy_l_2_auto
    module procedure hipMemcpy_l_3
    module procedure hipMemcpy_l_3_ci
    module procedure hipMemcpy_l_3_auto
    module procedure hipMemcpy_l_4
    module procedure hipMemcpy_l_4_ci
    module procedure hipMemcpy_l_4_auto
    module procedure hipMemcpy_l_5
    module procedure hipMemcpy_l_5_ci
    module procedure hipMemcpy_l_5_auto
    module procedure hipMemcpy_l_6
    module procedure hipMemcpy_l_6_ci
    module procedure hipMemcpy_l_6_auto
    module procedure hipMemcpy_l_7
    module procedure hipMemcpy_l_7_ci
    module procedure hipMemcpy_l_7_auto
  end interface hipMemcpy

  interface hipMemcpyAsync
  !>   @brief Copies data from src to dst asynchronously.
  !>
  !>   The copy is always performed by the device associated with the specified stream.
  !>
  !>   For multi-gpu or peer-to-peer configurations, it is recommended to use a stream which is
  !>  attached to the device where the src data is physically located.
  !>   For optimal peer-to-peer copies, the copy device must be able to access the src and dst
  !>  pointers (by calling hipDeviceEnablePeerAccess) with copy agent as the current device and
  !>  src/dest as the peerDevice argument. If enabling device peer access is not done, the memory
  !>  copy
  !>  will still work, but will perform the copy using a staging buffer on the host.
  !>
  !>   @note If host or dst are not pinned, the memory copy will be performed synchronously. For
  !>  best performance, use hipHostMalloc to allocate host memory that is transferred
  !>  asynchronously.
  !>
  !>   @param[out] dst Data being copy to
  !>   @param[in]  src Data being copy from
  !>   @param[in]  sizeBytes Data size in bytes
  !>   @param[in]  kind  Type of memory transfer
  !>   @param[in]  stream  Stream identifier
  !>   @returns `hipSuccess`, `hipErrorInvalidValue`, `hipErrorUnknown`
  !>
  !>   @see hipMemcpy, hipMemcpy2D, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray,
  !>  hipMemcpy2DFromArray, hipMemcpyArrayToArray, hipMemcpy2DArrayToArray, hipMemcpyToSymbol,
  !>  hipMemcpyFromSymbol, hipMemcpy2DAsync, hipMemcpyToArrayAsync, hipMemcpy2DToArrayAsync,
  !>  hipMemcpyFromArrayAsync, hipMemcpy2DFromArrayAsync, hipMemcpyToSymbolAsync,
  !>  hipMemcpyFromSymbolAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyAsync_(dest, src, sizeBytes, myKind, stream) bind(c, name="cudaMemcpyAsync")
#else
    function hipMemcpyAsync_(dest, src, sizeBytes, myKind, stream) bind(c, name="hipMemcpyAsync")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipMemcpyAsync_
      type(c_ptr), value :: dest
      type(c_ptr), value :: src
      integer(c_size_t), value :: sizeBytes
      integer(c_int), value :: myKind
      type(c_ptr), value :: stream
    end function hipMemcpyAsync_
    module procedure hipMemcpyAsync_i4_0
    module procedure hipMemcpyAsync_i4_0_auto
    module procedure hipMemcpyAsync_i4_1
    module procedure hipMemcpyAsync_i4_1_auto
    module procedure hipMemcpyAsync_i4_2
    module procedure hipMemcpyAsync_i4_2_auto
    module procedure hipMemcpyAsync_i4_3
    module procedure hipMemcpyAsync_i4_3_auto
    module procedure hipMemcpyAsync_i4_4
    module procedure hipMemcpyAsync_i4_4_auto
    module procedure hipMemcpyAsync_i4_5
    module procedure hipMemcpyAsync_i4_5_auto
    module procedure hipMemcpyAsync_i4_6
    module procedure hipMemcpyAsync_i4_6_auto
    module procedure hipMemcpyAsync_i4_7
    module procedure hipMemcpyAsync_i4_7_auto
    module procedure hipMemcpyAsync_i8_0
    module procedure hipMemcpyAsync_i8_0_auto
    module procedure hipMemcpyAsync_i8_1
    module procedure hipMemcpyAsync_i8_1_auto
    module procedure hipMemcpyAsync_i8_2
    module procedure hipMemcpyAsync_i8_2_auto
    module procedure hipMemcpyAsync_i8_3
    module procedure hipMemcpyAsync_i8_3_auto
    module procedure hipMemcpyAsync_i8_4
    module procedure hipMemcpyAsync_i8_4_auto
    module procedure hipMemcpyAsync_i8_5
    module procedure hipMemcpyAsync_i8_5_auto
    module procedure hipMemcpyAsync_i8_6
    module procedure hipMemcpyAsync_i8_6_auto
    module procedure hipMemcpyAsync_i8_7
    module procedure hipMemcpyAsync_i8_7_auto
    module procedure hipMemcpyAsync_r4_0
    module procedure hipMemcpyAsync_r4_0_auto
    module procedure hipMemcpyAsync_r4_1
    module procedure hipMemcpyAsync_r4_1_auto
    module procedure hipMemcpyAsync_r4_2
    module procedure hipMemcpyAsync_r4_2_auto
    module procedure hipMemcpyAsync_r4_3
    module procedure hipMemcpyAsync_r4_3_auto
    module procedure hipMemcpyAsync_r4_4
    module procedure hipMemcpyAsync_r4_4_auto
    module procedure hipMemcpyAsync_r4_5
    module procedure hipMemcpyAsync_r4_5_auto
    module procedure hipMemcpyAsync_r4_6
    module procedure hipMemcpyAsync_r4_6_auto
    module procedure hipMemcpyAsync_r4_7
    module procedure hipMemcpyAsync_r4_7_auto
    module procedure hipMemcpyAsync_r8_0
    module procedure hipMemcpyAsync_r8_0_auto
    module procedure hipMemcpyAsync_r8_1
    module procedure hipMemcpyAsync_r8_1_auto
    module procedure hipMemcpyAsync_r8_2
    module procedure hipMemcpyAsync_r8_2_auto
    module procedure hipMemcpyAsync_r8_3
    module procedure hipMemcpyAsync_r8_3_auto
    module procedure hipMemcpyAsync_r8_4
    module procedure hipMemcpyAsync_r8_4_auto
    module procedure hipMemcpyAsync_r8_5
    module procedure hipMemcpyAsync_r8_5_auto
    module procedure hipMemcpyAsync_r8_6
    module procedure hipMemcpyAsync_r8_6_auto
    module procedure hipMemcpyAsync_r8_7
    module procedure hipMemcpyAsync_r8_7_auto
    module procedure hipMemcpyAsync_c4_0
    module procedure hipMemcpyAsync_c4_0_auto
    module procedure hipMemcpyAsync_c4_1
    module procedure hipMemcpyAsync_c4_1_auto
    module procedure hipMemcpyAsync_c4_2
    module procedure hipMemcpyAsync_c4_2_auto
    module procedure hipMemcpyAsync_c4_3
    module procedure hipMemcpyAsync_c4_3_auto
    module procedure hipMemcpyAsync_c4_4
    module procedure hipMemcpyAsync_c4_4_auto
    module procedure hipMemcpyAsync_c4_5
    module procedure hipMemcpyAsync_c4_5_auto
    module procedure hipMemcpyAsync_c4_6
    module procedure hipMemcpyAsync_c4_6_auto
    module procedure hipMemcpyAsync_c4_7
    module procedure hipMemcpyAsync_c4_7_auto
    module procedure hipMemcpyAsync_c8_0
    module procedure hipMemcpyAsync_c8_0_auto
    module procedure hipMemcpyAsync_c8_1
    module procedure hipMemcpyAsync_c8_1_auto
    module procedure hipMemcpyAsync_c8_2
    module procedure hipMemcpyAsync_c8_2_auto
    module procedure hipMemcpyAsync_c8_3
    module procedure hipMemcpyAsync_c8_3_auto
    module procedure hipMemcpyAsync_c8_4
    module procedure hipMemcpyAsync_c8_4_auto
    module procedure hipMemcpyAsync_c8_5
    module procedure hipMemcpyAsync_c8_5_auto
    module procedure hipMemcpyAsync_c8_6
    module procedure hipMemcpyAsync_c8_6_auto
    module procedure hipMemcpyAsync_c8_7
    module procedure hipMemcpyAsync_c8_7_auto
    module procedure hipMemcpyAsync_l_0
    module procedure hipMemcpyAsync_l_0_auto
    module procedure hipMemcpyAsync_l_1
    module procedure hipMemcpyAsync_l_1_auto
    module procedure hipMemcpyAsync_l_2
    module procedure hipMemcpyAsync_l_2_auto
    module procedure hipMemcpyAsync_l_3
    module procedure hipMemcpyAsync_l_3_auto
    module procedure hipMemcpyAsync_l_4
    module procedure hipMemcpyAsync_l_4_auto
    module procedure hipMemcpyAsync_l_5
    module procedure hipMemcpyAsync_l_5_auto
    module procedure hipMemcpyAsync_l_6
    module procedure hipMemcpyAsync_l_6_auto
    module procedure hipMemcpyAsync_l_7
    module procedure hipMemcpyAsync_l_7_auto
  end interface hipMemcpyAsync

contains

  function hipMemcpy_i4_0(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i4_0

  function hipMemcpy_i4_0_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), target, intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i4_0_ci

  function hipMemcpy_i4_0_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i4_0_auto

  function hipMemcpy_i4_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i4_1

  function hipMemcpy_i4_1_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i4_1_ci

  function hipMemcpy_i4_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i4_1_auto

  function hipMemcpy_i4_2(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i4_2

  function hipMemcpy_i4_2_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i4_2_ci

  function hipMemcpy_i4_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i4_2_auto

  function hipMemcpy_i4_3(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_3

  function hipMemcpy_i4_3_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_3_ci

  function hipMemcpy_i4_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_3_auto

  function hipMemcpy_i4_4(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_4

  function hipMemcpy_i4_4_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_4_ci

  function hipMemcpy_i4_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_4_auto

  function hipMemcpy_i4_5(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_5

  function hipMemcpy_i4_5_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_5_ci

  function hipMemcpy_i4_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_5_auto

  function hipMemcpy_i4_6(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_6

  function hipMemcpy_i4_6_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_6_ci

  function hipMemcpy_i4_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_6_auto

  function hipMemcpy_i4_7(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_7

  function hipMemcpy_i4_7_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_7_ci

  function hipMemcpy_i4_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_7_auto

  function hipMemcpy_i8_0(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i8_0

  function hipMemcpy_i8_0_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i8_0_ci

  function hipMemcpy_i8_0_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i8_0_auto

  function hipMemcpy_i8_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i8_1

  function hipMemcpy_i8_1_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i8_1_ci

  function hipMemcpy_i8_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i8_1_auto

  function hipMemcpy_i8_2(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i8_2

  function hipMemcpy_i8_2_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i8_2_ci

  function hipMemcpy_i8_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i8_2_auto

  function hipMemcpy_i8_3(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_3

  function hipMemcpy_i8_3_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_3_ci

  function hipMemcpy_i8_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_3_auto

  function hipMemcpy_i8_4(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_4

  function hipMemcpy_i8_4_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_4_ci

  function hipMemcpy_i8_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_4_auto

  function hipMemcpy_i8_5(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_5

  function hipMemcpy_i8_5_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_5_ci

  function hipMemcpy_i8_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_5_auto

  function hipMemcpy_i8_6(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_6

  function hipMemcpy_i8_6_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_6_ci

  function hipMemcpy_i8_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_6_auto

  function hipMemcpy_i8_7(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_7

  function hipMemcpy_i8_7_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_7_ci

  function hipMemcpy_i8_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_7_auto

  function hipMemcpy_r4_0(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    real(c_float), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r4_0

  function hipMemcpy_r4_0_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    real(c_float), target, intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r4_0_ci

  function hipMemcpy_r4_0_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    real(c_float), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r4_0_auto

  function hipMemcpy_r4_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r4_1

  function hipMemcpy_r4_1_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r4_1_ci

  function hipMemcpy_r4_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r4_1_auto

  function hipMemcpy_r4_2(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r4_2

  function hipMemcpy_r4_2_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r4_2_ci

  function hipMemcpy_r4_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r4_2_auto

  function hipMemcpy_r4_3(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_3

  function hipMemcpy_r4_3_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_3_ci

  function hipMemcpy_r4_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_3_auto

  function hipMemcpy_r4_4(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_4

  function hipMemcpy_r4_4_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_4_ci

  function hipMemcpy_r4_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_4_auto

  function hipMemcpy_r4_5(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_5

  function hipMemcpy_r4_5_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_5_ci

  function hipMemcpy_r4_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_5_auto

  function hipMemcpy_r4_6(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_6

  function hipMemcpy_r4_6_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_6_ci

  function hipMemcpy_r4_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_6_auto

  function hipMemcpy_r4_7(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_7

  function hipMemcpy_r4_7_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_7_ci

  function hipMemcpy_r4_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_7_auto

  function hipMemcpy_r8_0(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    real(c_double), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r8_0

  function hipMemcpy_r8_0_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    real(c_double), target, intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r8_0_ci

  function hipMemcpy_r8_0_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    real(c_double), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r8_0_auto

  function hipMemcpy_r8_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r8_1

  function hipMemcpy_r8_1_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r8_1_ci

  function hipMemcpy_r8_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r8_1_auto

  function hipMemcpy_r8_2(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r8_2

  function hipMemcpy_r8_2_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r8_2_ci

  function hipMemcpy_r8_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r8_2_auto

  function hipMemcpy_r8_3(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_3

  function hipMemcpy_r8_3_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_3_ci

  function hipMemcpy_r8_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_3_auto

  function hipMemcpy_r8_4(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_4

  function hipMemcpy_r8_4_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_4_ci

  function hipMemcpy_r8_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_4_auto

  function hipMemcpy_r8_5(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_5

  function hipMemcpy_r8_5_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_5_ci

  function hipMemcpy_r8_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_5_auto

  function hipMemcpy_r8_6(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_6

  function hipMemcpy_r8_6_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_6_ci

  function hipMemcpy_r8_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_6_auto

  function hipMemcpy_r8_7(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_7

  function hipMemcpy_r8_7_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_7_ci

  function hipMemcpy_r8_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_7_auto

  function hipMemcpy_c4_0(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c4_0

  function hipMemcpy_c4_0_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c4_0_ci

  function hipMemcpy_c4_0_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c4_0_auto

  function hipMemcpy_c4_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c4_1

  function hipMemcpy_c4_1_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c4_1_ci

  function hipMemcpy_c4_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c4_1_auto

  function hipMemcpy_c4_2(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c4_2

  function hipMemcpy_c4_2_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c4_2_ci

  function hipMemcpy_c4_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c4_2_auto

  function hipMemcpy_c4_3(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_3

  function hipMemcpy_c4_3_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_3_ci

  function hipMemcpy_c4_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_3_auto

  function hipMemcpy_c4_4(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_4

  function hipMemcpy_c4_4_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_4_ci

  function hipMemcpy_c4_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_4_auto

  function hipMemcpy_c4_5(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_5

  function hipMemcpy_c4_5_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_5_ci

  function hipMemcpy_c4_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_5_auto

  function hipMemcpy_c4_6(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_6

  function hipMemcpy_c4_6_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_6_ci

  function hipMemcpy_c4_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_6_auto

  function hipMemcpy_c4_7(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_7

  function hipMemcpy_c4_7_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_7_ci

  function hipMemcpy_c4_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_7_auto

  function hipMemcpy_c8_0(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c8_0

  function hipMemcpy_c8_0_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c8_0_ci

  function hipMemcpy_c8_0_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c8_0_auto

  function hipMemcpy_c8_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c8_1

  function hipMemcpy_c8_1_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c8_1_ci

  function hipMemcpy_c8_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c8_1_auto

  function hipMemcpy_c8_2(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c8_2

  function hipMemcpy_c8_2_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c8_2_ci

  function hipMemcpy_c8_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c8_2_auto

  function hipMemcpy_c8_3(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_3

  function hipMemcpy_c8_3_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_3_ci

  function hipMemcpy_c8_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_3_auto

  function hipMemcpy_c8_4(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_4

  function hipMemcpy_c8_4_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_4_ci

  function hipMemcpy_c8_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_4_auto

  function hipMemcpy_c8_5(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_5

  function hipMemcpy_c8_5_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_5_ci

  function hipMemcpy_c8_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_5_auto

  function hipMemcpy_c8_6(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_6

  function hipMemcpy_c8_6_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_6_ci

  function hipMemcpy_c8_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_6_auto

  function hipMemcpy_c8_7(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_7

  function hipMemcpy_c8_7_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_7_ci

  function hipMemcpy_c8_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_7_auto

  function hipMemcpy_l_0(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    logical(c_bool), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_l_0

  function hipMemcpy_l_0_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    logical(c_bool), target, intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_l_0_ci

  function hipMemcpy_l_0_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    logical(c_bool), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_l_0_auto

  function hipMemcpy_l_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_l_1

  function hipMemcpy_l_1_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_l_1_ci

  function hipMemcpy_l_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_l_1_auto

  function hipMemcpy_l_2(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_l_2

  function hipMemcpy_l_2_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_l_2_ci

  function hipMemcpy_l_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_l_2_auto

  function hipMemcpy_l_3(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_3

  function hipMemcpy_l_3_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_3_ci

  function hipMemcpy_l_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_3_auto

  function hipMemcpy_l_4(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_4

  function hipMemcpy_l_4_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_4_ci

  function hipMemcpy_l_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_4_auto

  function hipMemcpy_l_5(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_5

  function hipMemcpy_l_5_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_5_ci

  function hipMemcpy_l_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_5_auto

  function hipMemcpy_l_6(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_6

  function hipMemcpy_l_6_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_6_ci

  function hipMemcpy_l_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_6_auto

  function hipMemcpy_l_7(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_7

  function hipMemcpy_l_7_ci(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(count, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_7_ci

  function hipMemcpy_l_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_7_auto

  function hipMemcpyAsync_i4_0(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_0

  function hipMemcpyAsync_i4_0_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_0_auto

  function hipMemcpyAsync_i4_1(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_1

  function hipMemcpyAsync_i4_1_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_1_auto

  function hipMemcpyAsync_i4_2(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_2

  function hipMemcpyAsync_i4_2_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_2_auto

  function hipMemcpyAsync_i4_3(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_3

  function hipMemcpyAsync_i4_3_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_3_auto

  function hipMemcpyAsync_i4_4(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_4

  function hipMemcpyAsync_i4_4_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_4_auto

  function hipMemcpyAsync_i4_5(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_5

  function hipMemcpyAsync_i4_5_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_5_auto

  function hipMemcpyAsync_i4_6(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_6

  function hipMemcpyAsync_i4_6_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_6_auto

  function hipMemcpyAsync_i4_7(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_7

  function hipMemcpyAsync_i4_7_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_7_auto

  function hipMemcpyAsync_i8_0(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_0

  function hipMemcpyAsync_i8_0_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_0_auto

  function hipMemcpyAsync_i8_1(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_1

  function hipMemcpyAsync_i8_1_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_1_auto

  function hipMemcpyAsync_i8_2(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_2

  function hipMemcpyAsync_i8_2_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_2_auto

  function hipMemcpyAsync_i8_3(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_3

  function hipMemcpyAsync_i8_3_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_3_auto

  function hipMemcpyAsync_i8_4(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_4

  function hipMemcpyAsync_i8_4_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_4_auto

  function hipMemcpyAsync_i8_5(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_5

  function hipMemcpyAsync_i8_5_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_5_auto

  function hipMemcpyAsync_i8_6(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_6

  function hipMemcpyAsync_i8_6_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_6_auto

  function hipMemcpyAsync_i8_7(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_7

  function hipMemcpyAsync_i8_7_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_7_auto

  function hipMemcpyAsync_r4_0(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    real(c_float), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_0

  function hipMemcpyAsync_r4_0_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    real(c_float), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_0_auto

  function hipMemcpyAsync_r4_1(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_1

  function hipMemcpyAsync_r4_1_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_1_auto

  function hipMemcpyAsync_r4_2(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_2

  function hipMemcpyAsync_r4_2_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_2_auto

  function hipMemcpyAsync_r4_3(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_3

  function hipMemcpyAsync_r4_3_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_3_auto

  function hipMemcpyAsync_r4_4(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_4

  function hipMemcpyAsync_r4_4_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_4_auto

  function hipMemcpyAsync_r4_5(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_5

  function hipMemcpyAsync_r4_5_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_5_auto

  function hipMemcpyAsync_r4_6(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_6

  function hipMemcpyAsync_r4_6_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_6_auto

  function hipMemcpyAsync_r4_7(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_7

  function hipMemcpyAsync_r4_7_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_7_auto

  function hipMemcpyAsync_r8_0(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    real(c_double), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_0

  function hipMemcpyAsync_r8_0_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    real(c_double), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_0_auto

  function hipMemcpyAsync_r8_1(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_1

  function hipMemcpyAsync_r8_1_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_1_auto

  function hipMemcpyAsync_r8_2(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_2

  function hipMemcpyAsync_r8_2_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_2_auto

  function hipMemcpyAsync_r8_3(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_3

  function hipMemcpyAsync_r8_3_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_3_auto

  function hipMemcpyAsync_r8_4(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_4

  function hipMemcpyAsync_r8_4_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_4_auto

  function hipMemcpyAsync_r8_5(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_5

  function hipMemcpyAsync_r8_5_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_5_auto

  function hipMemcpyAsync_r8_6(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_6

  function hipMemcpyAsync_r8_6_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_6_auto

  function hipMemcpyAsync_r8_7(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_7

  function hipMemcpyAsync_r8_7_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_7_auto

  function hipMemcpyAsync_c4_0(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_0

  function hipMemcpyAsync_c4_0_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_0_auto

  function hipMemcpyAsync_c4_1(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_1

  function hipMemcpyAsync_c4_1_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_1_auto

  function hipMemcpyAsync_c4_2(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_2

  function hipMemcpyAsync_c4_2_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_2_auto

  function hipMemcpyAsync_c4_3(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_3

  function hipMemcpyAsync_c4_3_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_3_auto

  function hipMemcpyAsync_c4_4(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_4

  function hipMemcpyAsync_c4_4_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_4_auto

  function hipMemcpyAsync_c4_5(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_5

  function hipMemcpyAsync_c4_5_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_5_auto

  function hipMemcpyAsync_c4_6(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_6

  function hipMemcpyAsync_c4_6_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_6_auto

  function hipMemcpyAsync_c4_7(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_7

  function hipMemcpyAsync_c4_7_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_7_auto

  function hipMemcpyAsync_c8_0(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_0

  function hipMemcpyAsync_c8_0_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_0_auto

  function hipMemcpyAsync_c8_1(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_1

  function hipMemcpyAsync_c8_1_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_1_auto

  function hipMemcpyAsync_c8_2(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_2

  function hipMemcpyAsync_c8_2_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_2_auto

  function hipMemcpyAsync_c8_3(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_3

  function hipMemcpyAsync_c8_3_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_3_auto

  function hipMemcpyAsync_c8_4(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_4

  function hipMemcpyAsync_c8_4_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_4_auto

  function hipMemcpyAsync_c8_5(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_5

  function hipMemcpyAsync_c8_5_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_5_auto

  function hipMemcpyAsync_c8_6(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_6

  function hipMemcpyAsync_c8_6_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_6_auto

  function hipMemcpyAsync_c8_7(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_7

  function hipMemcpyAsync_c8_7_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_7_auto

  function hipMemcpyAsync_l_0(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    logical(c_bool), target, intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_0

  function hipMemcpyAsync_l_0_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    logical(c_bool), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_0_auto

  function hipMemcpyAsync_l_1(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_1

  function hipMemcpyAsync_l_1_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_1_auto

  function hipMemcpyAsync_l_2(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_2

  function hipMemcpyAsync_l_2_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_2_auto

  function hipMemcpyAsync_l_3(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_3

  function hipMemcpyAsync_l_3_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_3_auto

  function hipMemcpyAsync_l_4(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_4

  function hipMemcpyAsync_l_4_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_4_auto

  function hipMemcpyAsync_l_5(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_5

  function hipMemcpyAsync_l_5_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_5_auto

  function hipMemcpyAsync_l_6(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_6

  function hipMemcpyAsync_l_6_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_6_auto

  function hipMemcpyAsync_l_7(dest, src, count, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_7

  function hipMemcpyAsync_l_7_auto(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_7_auto

end module hipfort_hipmemcpy
