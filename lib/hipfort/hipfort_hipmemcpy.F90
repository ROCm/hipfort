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
  !>   @param[out]  dest Data being copy to
  !>   @param[in]  src Data being copy from
  !>   @param[in]  sizeBytes Data size in bytes
  !>   @param[in]  myKind Kind of transfer
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
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipMemcpy_i4_assumed_rank
    module procedure hipMemcpy_i4_assumed_rank_c_size_t
    module procedure hipMemcpy_i4_assumed_rank_c_int
    module procedure hipMemcpy_i8_assumed_rank
    module procedure hipMemcpy_i8_assumed_rank_c_size_t
    module procedure hipMemcpy_i8_assumed_rank_c_int
    module procedure hipMemcpy_r4_assumed_rank
    module procedure hipMemcpy_r4_assumed_rank_c_size_t
    module procedure hipMemcpy_r4_assumed_rank_c_int
    module procedure hipMemcpy_r8_assumed_rank
    module procedure hipMemcpy_r8_assumed_rank_c_size_t
    module procedure hipMemcpy_r8_assumed_rank_c_int
    module procedure hipMemcpy_c4_assumed_rank
    module procedure hipMemcpy_c4_assumed_rank_c_size_t
    module procedure hipMemcpy_c4_assumed_rank_c_int
    module procedure hipMemcpy_c8_assumed_rank
    module procedure hipMemcpy_c8_assumed_rank_c_size_t
    module procedure hipMemcpy_c8_assumed_rank_c_int
    module procedure hipMemcpy_l_assumed_rank
    module procedure hipMemcpy_l_assumed_rank_c_size_t
    module procedure hipMemcpy_l_assumed_rank_c_int
#else
    module procedure hipMemcpy_i4_0
    module procedure hipMemcpy_i4_0_c_size_t
    module procedure hipMemcpy_i4_0_c_int
    module procedure hipMemcpy_i4_1
    module procedure hipMemcpy_i4_1_c_size_t
    module procedure hipMemcpy_i4_1_c_int
    module procedure hipMemcpy_i4_2
    module procedure hipMemcpy_i4_2_c_size_t
    module procedure hipMemcpy_i4_2_c_int
    module procedure hipMemcpy_i4_3
    module procedure hipMemcpy_i4_3_c_size_t
    module procedure hipMemcpy_i4_3_c_int
    module procedure hipMemcpy_i4_4
    module procedure hipMemcpy_i4_4_c_size_t
    module procedure hipMemcpy_i4_4_c_int
    module procedure hipMemcpy_i4_5
    module procedure hipMemcpy_i4_5_c_size_t
    module procedure hipMemcpy_i4_5_c_int
    module procedure hipMemcpy_i4_6
    module procedure hipMemcpy_i4_6_c_size_t
    module procedure hipMemcpy_i4_6_c_int
    module procedure hipMemcpy_i4_7
    module procedure hipMemcpy_i4_7_c_size_t
    module procedure hipMemcpy_i4_7_c_int
    module procedure hipMemcpy_i8_0
    module procedure hipMemcpy_i8_0_c_size_t
    module procedure hipMemcpy_i8_0_c_int
    module procedure hipMemcpy_i8_1
    module procedure hipMemcpy_i8_1_c_size_t
    module procedure hipMemcpy_i8_1_c_int
    module procedure hipMemcpy_i8_2
    module procedure hipMemcpy_i8_2_c_size_t
    module procedure hipMemcpy_i8_2_c_int
    module procedure hipMemcpy_i8_3
    module procedure hipMemcpy_i8_3_c_size_t
    module procedure hipMemcpy_i8_3_c_int
    module procedure hipMemcpy_i8_4
    module procedure hipMemcpy_i8_4_c_size_t
    module procedure hipMemcpy_i8_4_c_int
    module procedure hipMemcpy_i8_5
    module procedure hipMemcpy_i8_5_c_size_t
    module procedure hipMemcpy_i8_5_c_int
    module procedure hipMemcpy_i8_6
    module procedure hipMemcpy_i8_6_c_size_t
    module procedure hipMemcpy_i8_6_c_int
    module procedure hipMemcpy_i8_7
    module procedure hipMemcpy_i8_7_c_size_t
    module procedure hipMemcpy_i8_7_c_int
    module procedure hipMemcpy_r4_0
    module procedure hipMemcpy_r4_0_c_size_t
    module procedure hipMemcpy_r4_0_c_int
    module procedure hipMemcpy_r4_1
    module procedure hipMemcpy_r4_1_c_size_t
    module procedure hipMemcpy_r4_1_c_int
    module procedure hipMemcpy_r4_2
    module procedure hipMemcpy_r4_2_c_size_t
    module procedure hipMemcpy_r4_2_c_int
    module procedure hipMemcpy_r4_3
    module procedure hipMemcpy_r4_3_c_size_t
    module procedure hipMemcpy_r4_3_c_int
    module procedure hipMemcpy_r4_4
    module procedure hipMemcpy_r4_4_c_size_t
    module procedure hipMemcpy_r4_4_c_int
    module procedure hipMemcpy_r4_5
    module procedure hipMemcpy_r4_5_c_size_t
    module procedure hipMemcpy_r4_5_c_int
    module procedure hipMemcpy_r4_6
    module procedure hipMemcpy_r4_6_c_size_t
    module procedure hipMemcpy_r4_6_c_int
    module procedure hipMemcpy_r4_7
    module procedure hipMemcpy_r4_7_c_size_t
    module procedure hipMemcpy_r4_7_c_int
    module procedure hipMemcpy_r8_0
    module procedure hipMemcpy_r8_0_c_size_t
    module procedure hipMemcpy_r8_0_c_int
    module procedure hipMemcpy_r8_1
    module procedure hipMemcpy_r8_1_c_size_t
    module procedure hipMemcpy_r8_1_c_int
    module procedure hipMemcpy_r8_2
    module procedure hipMemcpy_r8_2_c_size_t
    module procedure hipMemcpy_r8_2_c_int
    module procedure hipMemcpy_r8_3
    module procedure hipMemcpy_r8_3_c_size_t
    module procedure hipMemcpy_r8_3_c_int
    module procedure hipMemcpy_r8_4
    module procedure hipMemcpy_r8_4_c_size_t
    module procedure hipMemcpy_r8_4_c_int
    module procedure hipMemcpy_r8_5
    module procedure hipMemcpy_r8_5_c_size_t
    module procedure hipMemcpy_r8_5_c_int
    module procedure hipMemcpy_r8_6
    module procedure hipMemcpy_r8_6_c_size_t
    module procedure hipMemcpy_r8_6_c_int
    module procedure hipMemcpy_r8_7
    module procedure hipMemcpy_r8_7_c_size_t
    module procedure hipMemcpy_r8_7_c_int
    module procedure hipMemcpy_c4_0
    module procedure hipMemcpy_c4_0_c_size_t
    module procedure hipMemcpy_c4_0_c_int
    module procedure hipMemcpy_c4_1
    module procedure hipMemcpy_c4_1_c_size_t
    module procedure hipMemcpy_c4_1_c_int
    module procedure hipMemcpy_c4_2
    module procedure hipMemcpy_c4_2_c_size_t
    module procedure hipMemcpy_c4_2_c_int
    module procedure hipMemcpy_c4_3
    module procedure hipMemcpy_c4_3_c_size_t
    module procedure hipMemcpy_c4_3_c_int
    module procedure hipMemcpy_c4_4
    module procedure hipMemcpy_c4_4_c_size_t
    module procedure hipMemcpy_c4_4_c_int
    module procedure hipMemcpy_c4_5
    module procedure hipMemcpy_c4_5_c_size_t
    module procedure hipMemcpy_c4_5_c_int
    module procedure hipMemcpy_c4_6
    module procedure hipMemcpy_c4_6_c_size_t
    module procedure hipMemcpy_c4_6_c_int
    module procedure hipMemcpy_c4_7
    module procedure hipMemcpy_c4_7_c_size_t
    module procedure hipMemcpy_c4_7_c_int
    module procedure hipMemcpy_c8_0
    module procedure hipMemcpy_c8_0_c_size_t
    module procedure hipMemcpy_c8_0_c_int
    module procedure hipMemcpy_c8_1
    module procedure hipMemcpy_c8_1_c_size_t
    module procedure hipMemcpy_c8_1_c_int
    module procedure hipMemcpy_c8_2
    module procedure hipMemcpy_c8_2_c_size_t
    module procedure hipMemcpy_c8_2_c_int
    module procedure hipMemcpy_c8_3
    module procedure hipMemcpy_c8_3_c_size_t
    module procedure hipMemcpy_c8_3_c_int
    module procedure hipMemcpy_c8_4
    module procedure hipMemcpy_c8_4_c_size_t
    module procedure hipMemcpy_c8_4_c_int
    module procedure hipMemcpy_c8_5
    module procedure hipMemcpy_c8_5_c_size_t
    module procedure hipMemcpy_c8_5_c_int
    module procedure hipMemcpy_c8_6
    module procedure hipMemcpy_c8_6_c_size_t
    module procedure hipMemcpy_c8_6_c_int
    module procedure hipMemcpy_c8_7
    module procedure hipMemcpy_c8_7_c_size_t
    module procedure hipMemcpy_c8_7_c_int
    module procedure hipMemcpy_l_0
    module procedure hipMemcpy_l_0_c_size_t
    module procedure hipMemcpy_l_0_c_int
    module procedure hipMemcpy_l_1
    module procedure hipMemcpy_l_1_c_size_t
    module procedure hipMemcpy_l_1_c_int
    module procedure hipMemcpy_l_2
    module procedure hipMemcpy_l_2_c_size_t
    module procedure hipMemcpy_l_2_c_int
    module procedure hipMemcpy_l_3
    module procedure hipMemcpy_l_3_c_size_t
    module procedure hipMemcpy_l_3_c_int
    module procedure hipMemcpy_l_4
    module procedure hipMemcpy_l_4_c_size_t
    module procedure hipMemcpy_l_4_c_int
    module procedure hipMemcpy_l_5
    module procedure hipMemcpy_l_5_c_size_t
    module procedure hipMemcpy_l_5_c_int
    module procedure hipMemcpy_l_6
    module procedure hipMemcpy_l_6_c_size_t
    module procedure hipMemcpy_l_6_c_int
    module procedure hipMemcpy_l_7
    module procedure hipMemcpy_l_7_c_size_t
    module procedure hipMemcpy_l_7_c_int
#endif
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
  !>   @param[out] dest Data being copy to
  !>   @param[in]  src Data being copy from
  !>   @param[in]  sizeBytes Data size in bytes
  !>   @param[in]  myKind  Type of memory transfer
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
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipMemcpyAsync_i4_assumed_rank
    module procedure hipMemcpyAsync_i4_assumed_rank_c_size_t
    module procedure hipMemcpyAsync_i4_assumed_rank_c_int
    module procedure hipMemcpyAsync_i8_assumed_rank
    module procedure hipMemcpyAsync_i8_assumed_rank_c_size_t
    module procedure hipMemcpyAsync_i8_assumed_rank_c_int
    module procedure hipMemcpyAsync_r4_assumed_rank
    module procedure hipMemcpyAsync_r4_assumed_rank_c_size_t
    module procedure hipMemcpyAsync_r4_assumed_rank_c_int
    module procedure hipMemcpyAsync_r8_assumed_rank
    module procedure hipMemcpyAsync_r8_assumed_rank_c_size_t
    module procedure hipMemcpyAsync_r8_assumed_rank_c_int
    module procedure hipMemcpyAsync_c4_assumed_rank
    module procedure hipMemcpyAsync_c4_assumed_rank_c_size_t
    module procedure hipMemcpyAsync_c4_assumed_rank_c_int
    module procedure hipMemcpyAsync_c8_assumed_rank
    module procedure hipMemcpyAsync_c8_assumed_rank_c_size_t
    module procedure hipMemcpyAsync_c8_assumed_rank_c_int
    module procedure hipMemcpyAsync_l_assumed_rank
    module procedure hipMemcpyAsync_l_assumed_rank_c_size_t
    module procedure hipMemcpyAsync_l_assumed_rank_c_int
#else
    module procedure hipMemcpyAsync_i4_0
    module procedure hipMemcpyAsync_i4_0_c_size_t
    module procedure hipMemcpyAsync_i4_0_c_int
    module procedure hipMemcpyAsync_i4_1
    module procedure hipMemcpyAsync_i4_1_c_size_t
    module procedure hipMemcpyAsync_i4_1_c_int
    module procedure hipMemcpyAsync_i4_2
    module procedure hipMemcpyAsync_i4_2_c_size_t
    module procedure hipMemcpyAsync_i4_2_c_int
    module procedure hipMemcpyAsync_i4_3
    module procedure hipMemcpyAsync_i4_3_c_size_t
    module procedure hipMemcpyAsync_i4_3_c_int
    module procedure hipMemcpyAsync_i4_4
    module procedure hipMemcpyAsync_i4_4_c_size_t
    module procedure hipMemcpyAsync_i4_4_c_int
    module procedure hipMemcpyAsync_i4_5
    module procedure hipMemcpyAsync_i4_5_c_size_t
    module procedure hipMemcpyAsync_i4_5_c_int
    module procedure hipMemcpyAsync_i4_6
    module procedure hipMemcpyAsync_i4_6_c_size_t
    module procedure hipMemcpyAsync_i4_6_c_int
    module procedure hipMemcpyAsync_i4_7
    module procedure hipMemcpyAsync_i4_7_c_size_t
    module procedure hipMemcpyAsync_i4_7_c_int
    module procedure hipMemcpyAsync_i8_0
    module procedure hipMemcpyAsync_i8_0_c_size_t
    module procedure hipMemcpyAsync_i8_0_c_int
    module procedure hipMemcpyAsync_i8_1
    module procedure hipMemcpyAsync_i8_1_c_size_t
    module procedure hipMemcpyAsync_i8_1_c_int
    module procedure hipMemcpyAsync_i8_2
    module procedure hipMemcpyAsync_i8_2_c_size_t
    module procedure hipMemcpyAsync_i8_2_c_int
    module procedure hipMemcpyAsync_i8_3
    module procedure hipMemcpyAsync_i8_3_c_size_t
    module procedure hipMemcpyAsync_i8_3_c_int
    module procedure hipMemcpyAsync_i8_4
    module procedure hipMemcpyAsync_i8_4_c_size_t
    module procedure hipMemcpyAsync_i8_4_c_int
    module procedure hipMemcpyAsync_i8_5
    module procedure hipMemcpyAsync_i8_5_c_size_t
    module procedure hipMemcpyAsync_i8_5_c_int
    module procedure hipMemcpyAsync_i8_6
    module procedure hipMemcpyAsync_i8_6_c_size_t
    module procedure hipMemcpyAsync_i8_6_c_int
    module procedure hipMemcpyAsync_i8_7
    module procedure hipMemcpyAsync_i8_7_c_size_t
    module procedure hipMemcpyAsync_i8_7_c_int
    module procedure hipMemcpyAsync_r4_0
    module procedure hipMemcpyAsync_r4_0_c_size_t
    module procedure hipMemcpyAsync_r4_0_c_int
    module procedure hipMemcpyAsync_r4_1
    module procedure hipMemcpyAsync_r4_1_c_size_t
    module procedure hipMemcpyAsync_r4_1_c_int
    module procedure hipMemcpyAsync_r4_2
    module procedure hipMemcpyAsync_r4_2_c_size_t
    module procedure hipMemcpyAsync_r4_2_c_int
    module procedure hipMemcpyAsync_r4_3
    module procedure hipMemcpyAsync_r4_3_c_size_t
    module procedure hipMemcpyAsync_r4_3_c_int
    module procedure hipMemcpyAsync_r4_4
    module procedure hipMemcpyAsync_r4_4_c_size_t
    module procedure hipMemcpyAsync_r4_4_c_int
    module procedure hipMemcpyAsync_r4_5
    module procedure hipMemcpyAsync_r4_5_c_size_t
    module procedure hipMemcpyAsync_r4_5_c_int
    module procedure hipMemcpyAsync_r4_6
    module procedure hipMemcpyAsync_r4_6_c_size_t
    module procedure hipMemcpyAsync_r4_6_c_int
    module procedure hipMemcpyAsync_r4_7
    module procedure hipMemcpyAsync_r4_7_c_size_t
    module procedure hipMemcpyAsync_r4_7_c_int
    module procedure hipMemcpyAsync_r8_0
    module procedure hipMemcpyAsync_r8_0_c_size_t
    module procedure hipMemcpyAsync_r8_0_c_int
    module procedure hipMemcpyAsync_r8_1
    module procedure hipMemcpyAsync_r8_1_c_size_t
    module procedure hipMemcpyAsync_r8_1_c_int
    module procedure hipMemcpyAsync_r8_2
    module procedure hipMemcpyAsync_r8_2_c_size_t
    module procedure hipMemcpyAsync_r8_2_c_int
    module procedure hipMemcpyAsync_r8_3
    module procedure hipMemcpyAsync_r8_3_c_size_t
    module procedure hipMemcpyAsync_r8_3_c_int
    module procedure hipMemcpyAsync_r8_4
    module procedure hipMemcpyAsync_r8_4_c_size_t
    module procedure hipMemcpyAsync_r8_4_c_int
    module procedure hipMemcpyAsync_r8_5
    module procedure hipMemcpyAsync_r8_5_c_size_t
    module procedure hipMemcpyAsync_r8_5_c_int
    module procedure hipMemcpyAsync_r8_6
    module procedure hipMemcpyAsync_r8_6_c_size_t
    module procedure hipMemcpyAsync_r8_6_c_int
    module procedure hipMemcpyAsync_r8_7
    module procedure hipMemcpyAsync_r8_7_c_size_t
    module procedure hipMemcpyAsync_r8_7_c_int
    module procedure hipMemcpyAsync_c4_0
    module procedure hipMemcpyAsync_c4_0_c_size_t
    module procedure hipMemcpyAsync_c4_0_c_int
    module procedure hipMemcpyAsync_c4_1
    module procedure hipMemcpyAsync_c4_1_c_size_t
    module procedure hipMemcpyAsync_c4_1_c_int
    module procedure hipMemcpyAsync_c4_2
    module procedure hipMemcpyAsync_c4_2_c_size_t
    module procedure hipMemcpyAsync_c4_2_c_int
    module procedure hipMemcpyAsync_c4_3
    module procedure hipMemcpyAsync_c4_3_c_size_t
    module procedure hipMemcpyAsync_c4_3_c_int
    module procedure hipMemcpyAsync_c4_4
    module procedure hipMemcpyAsync_c4_4_c_size_t
    module procedure hipMemcpyAsync_c4_4_c_int
    module procedure hipMemcpyAsync_c4_5
    module procedure hipMemcpyAsync_c4_5_c_size_t
    module procedure hipMemcpyAsync_c4_5_c_int
    module procedure hipMemcpyAsync_c4_6
    module procedure hipMemcpyAsync_c4_6_c_size_t
    module procedure hipMemcpyAsync_c4_6_c_int
    module procedure hipMemcpyAsync_c4_7
    module procedure hipMemcpyAsync_c4_7_c_size_t
    module procedure hipMemcpyAsync_c4_7_c_int
    module procedure hipMemcpyAsync_c8_0
    module procedure hipMemcpyAsync_c8_0_c_size_t
    module procedure hipMemcpyAsync_c8_0_c_int
    module procedure hipMemcpyAsync_c8_1
    module procedure hipMemcpyAsync_c8_1_c_size_t
    module procedure hipMemcpyAsync_c8_1_c_int
    module procedure hipMemcpyAsync_c8_2
    module procedure hipMemcpyAsync_c8_2_c_size_t
    module procedure hipMemcpyAsync_c8_2_c_int
    module procedure hipMemcpyAsync_c8_3
    module procedure hipMemcpyAsync_c8_3_c_size_t
    module procedure hipMemcpyAsync_c8_3_c_int
    module procedure hipMemcpyAsync_c8_4
    module procedure hipMemcpyAsync_c8_4_c_size_t
    module procedure hipMemcpyAsync_c8_4_c_int
    module procedure hipMemcpyAsync_c8_5
    module procedure hipMemcpyAsync_c8_5_c_size_t
    module procedure hipMemcpyAsync_c8_5_c_int
    module procedure hipMemcpyAsync_c8_6
    module procedure hipMemcpyAsync_c8_6_c_size_t
    module procedure hipMemcpyAsync_c8_6_c_int
    module procedure hipMemcpyAsync_c8_7
    module procedure hipMemcpyAsync_c8_7_c_size_t
    module procedure hipMemcpyAsync_c8_7_c_int
    module procedure hipMemcpyAsync_l_0
    module procedure hipMemcpyAsync_l_0_c_size_t
    module procedure hipMemcpyAsync_l_0_c_int
    module procedure hipMemcpyAsync_l_1
    module procedure hipMemcpyAsync_l_1_c_size_t
    module procedure hipMemcpyAsync_l_1_c_int
    module procedure hipMemcpyAsync_l_2
    module procedure hipMemcpyAsync_l_2_c_size_t
    module procedure hipMemcpyAsync_l_2_c_int
    module procedure hipMemcpyAsync_l_3
    module procedure hipMemcpyAsync_l_3_c_size_t
    module procedure hipMemcpyAsync_l_3_c_int
    module procedure hipMemcpyAsync_l_4
    module procedure hipMemcpyAsync_l_4_c_size_t
    module procedure hipMemcpyAsync_l_4_c_int
    module procedure hipMemcpyAsync_l_5
    module procedure hipMemcpyAsync_l_5_c_size_t
    module procedure hipMemcpyAsync_l_5_c_int
    module procedure hipMemcpyAsync_l_6
    module procedure hipMemcpyAsync_l_6_c_size_t
    module procedure hipMemcpyAsync_l_6_c_int
    module procedure hipMemcpyAsync_l_7
    module procedure hipMemcpyAsync_l_7_c_size_t
    module procedure hipMemcpyAsync_l_7_c_int
#endif
  end interface hipMemcpyAsync

  interface hipMemcpy2D
  !>   @brief Copies data between host and device.
  !>
  !>  hipMemcpy2D supports memory matrix copy from the pointed area src to the pointed area dst.
  !>  The copy direction is defined by kind which must be one of `hipMemcpyHostToDevice`,
  !>  `hipMemcpyHostToDevice`, `hipMemcpyDeviceToHost` `hipMemcpyDeviceToDevice` or
  !>  `hipMemcpyDefault`.
  !>  Device to Device copies don't need to wait for host synchronization.
  !>  The copy is executed on the default null tream. The src and dst must not overlap.
  !>  dpitch and spitch are the widths in bytes in memory matrix, width cannot exceed dpitch or
  !>  spitch.
  !>
  !>  For hipMemcpy2D, the copy is always performed by the current device (set by hipSetDevice).
  !>  For multi-gpu or peer-to-peer configurations, it is recommended to set the current device to
  !>  the
  !>  device where the src data is physically located. For optimal peer-to-peer copies, the copy
  !>  device
  !>  must be able to access the src and dst pointers (by calling hipDeviceEnablePeerAccess with
  !>  copy
  !>  agent as the current device and src/dst as the peerDevice argument.  if this is not done, the
  !>  hipMemcpy2D will still work, but will perform the copy using a staging buffer on the host.
  !>
  !>   @warning  Calling hipMemcpy2D with dst and src pointers that do not match the hipMemcpyKind
  !>  results in undefined behavior.
  !>
  !>   @param[out]  dest Destination memory address
  !>   @param[in]   dpitch Pitch size in bytes of destination memory
  !>   @param[in]   src    Source memory address
  !>   @param[in]   spitch Pitch size in bytes of source memory
  !>   @param[in]   width  Width size in bytes of matrix transfer (columns)
  !>   @param[in]   height Height size in bytes of matrix transfer (rows)
  !>   @param[in]   myKind   Type of transfer
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpy2D_(dest, dpitch, src, spitch, width, height, myKind) &
        bind(c, name="cudaMemcpy2D")
#else
    function hipMemcpy2D_(dest, dpitch, src, spitch, width, height, myKind) &
        bind(c, name="hipMemcpy2D")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipMemcpy2D_
      type(c_ptr), value :: dest
      integer(c_size_t), value :: dpitch
      type(c_ptr), value :: src
      integer(c_size_t), value :: spitch
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      integer(c_int), value :: myKind
    end function hipMemcpy2D_
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipMemcpy2D_i4_assumed_rank_c_size_t
    module procedure hipMemcpy2D_i4_assumed_rank_c_int
    module procedure hipMemcpy2D_i8_assumed_rank_c_size_t
    module procedure hipMemcpy2D_i8_assumed_rank_c_int
    module procedure hipMemcpy2D_r4_assumed_rank_c_size_t
    module procedure hipMemcpy2D_r4_assumed_rank_c_int
    module procedure hipMemcpy2D_r8_assumed_rank_c_size_t
    module procedure hipMemcpy2D_r8_assumed_rank_c_int
    module procedure hipMemcpy2D_c4_assumed_rank_c_size_t
    module procedure hipMemcpy2D_c4_assumed_rank_c_int
    module procedure hipMemcpy2D_c8_assumed_rank_c_size_t
    module procedure hipMemcpy2D_c8_assumed_rank_c_int
    module procedure hipMemcpy2D_l_assumed_rank_c_size_t
    module procedure hipMemcpy2D_l_assumed_rank_c_int
#else
    module procedure hipMemcpy2D_i4_0_c_size_t
    module procedure hipMemcpy2D_i4_0_c_int
    module procedure hipMemcpy2D_i4_1_c_size_t
    module procedure hipMemcpy2D_i4_1_c_int
    module procedure hipMemcpy2D_i4_2_c_size_t
    module procedure hipMemcpy2D_i4_2_c_int
    module procedure hipMemcpy2D_i4_3_c_size_t
    module procedure hipMemcpy2D_i4_3_c_int
    module procedure hipMemcpy2D_i4_4_c_size_t
    module procedure hipMemcpy2D_i4_4_c_int
    module procedure hipMemcpy2D_i4_5_c_size_t
    module procedure hipMemcpy2D_i4_5_c_int
    module procedure hipMemcpy2D_i4_6_c_size_t
    module procedure hipMemcpy2D_i4_6_c_int
    module procedure hipMemcpy2D_i4_7_c_size_t
    module procedure hipMemcpy2D_i4_7_c_int
    module procedure hipMemcpy2D_i8_0_c_size_t
    module procedure hipMemcpy2D_i8_0_c_int
    module procedure hipMemcpy2D_i8_1_c_size_t
    module procedure hipMemcpy2D_i8_1_c_int
    module procedure hipMemcpy2D_i8_2_c_size_t
    module procedure hipMemcpy2D_i8_2_c_int
    module procedure hipMemcpy2D_i8_3_c_size_t
    module procedure hipMemcpy2D_i8_3_c_int
    module procedure hipMemcpy2D_i8_4_c_size_t
    module procedure hipMemcpy2D_i8_4_c_int
    module procedure hipMemcpy2D_i8_5_c_size_t
    module procedure hipMemcpy2D_i8_5_c_int
    module procedure hipMemcpy2D_i8_6_c_size_t
    module procedure hipMemcpy2D_i8_6_c_int
    module procedure hipMemcpy2D_i8_7_c_size_t
    module procedure hipMemcpy2D_i8_7_c_int
    module procedure hipMemcpy2D_r4_0_c_size_t
    module procedure hipMemcpy2D_r4_0_c_int
    module procedure hipMemcpy2D_r4_1_c_size_t
    module procedure hipMemcpy2D_r4_1_c_int
    module procedure hipMemcpy2D_r4_2_c_size_t
    module procedure hipMemcpy2D_r4_2_c_int
    module procedure hipMemcpy2D_r4_3_c_size_t
    module procedure hipMemcpy2D_r4_3_c_int
    module procedure hipMemcpy2D_r4_4_c_size_t
    module procedure hipMemcpy2D_r4_4_c_int
    module procedure hipMemcpy2D_r4_5_c_size_t
    module procedure hipMemcpy2D_r4_5_c_int
    module procedure hipMemcpy2D_r4_6_c_size_t
    module procedure hipMemcpy2D_r4_6_c_int
    module procedure hipMemcpy2D_r4_7_c_size_t
    module procedure hipMemcpy2D_r4_7_c_int
    module procedure hipMemcpy2D_r8_0_c_size_t
    module procedure hipMemcpy2D_r8_0_c_int
    module procedure hipMemcpy2D_r8_1_c_size_t
    module procedure hipMemcpy2D_r8_1_c_int
    module procedure hipMemcpy2D_r8_2_c_size_t
    module procedure hipMemcpy2D_r8_2_c_int
    module procedure hipMemcpy2D_r8_3_c_size_t
    module procedure hipMemcpy2D_r8_3_c_int
    module procedure hipMemcpy2D_r8_4_c_size_t
    module procedure hipMemcpy2D_r8_4_c_int
    module procedure hipMemcpy2D_r8_5_c_size_t
    module procedure hipMemcpy2D_r8_5_c_int
    module procedure hipMemcpy2D_r8_6_c_size_t
    module procedure hipMemcpy2D_r8_6_c_int
    module procedure hipMemcpy2D_r8_7_c_size_t
    module procedure hipMemcpy2D_r8_7_c_int
    module procedure hipMemcpy2D_c4_0_c_size_t
    module procedure hipMemcpy2D_c4_0_c_int
    module procedure hipMemcpy2D_c4_1_c_size_t
    module procedure hipMemcpy2D_c4_1_c_int
    module procedure hipMemcpy2D_c4_2_c_size_t
    module procedure hipMemcpy2D_c4_2_c_int
    module procedure hipMemcpy2D_c4_3_c_size_t
    module procedure hipMemcpy2D_c4_3_c_int
    module procedure hipMemcpy2D_c4_4_c_size_t
    module procedure hipMemcpy2D_c4_4_c_int
    module procedure hipMemcpy2D_c4_5_c_size_t
    module procedure hipMemcpy2D_c4_5_c_int
    module procedure hipMemcpy2D_c4_6_c_size_t
    module procedure hipMemcpy2D_c4_6_c_int
    module procedure hipMemcpy2D_c4_7_c_size_t
    module procedure hipMemcpy2D_c4_7_c_int
    module procedure hipMemcpy2D_c8_0_c_size_t
    module procedure hipMemcpy2D_c8_0_c_int
    module procedure hipMemcpy2D_c8_1_c_size_t
    module procedure hipMemcpy2D_c8_1_c_int
    module procedure hipMemcpy2D_c8_2_c_size_t
    module procedure hipMemcpy2D_c8_2_c_int
    module procedure hipMemcpy2D_c8_3_c_size_t
    module procedure hipMemcpy2D_c8_3_c_int
    module procedure hipMemcpy2D_c8_4_c_size_t
    module procedure hipMemcpy2D_c8_4_c_int
    module procedure hipMemcpy2D_c8_5_c_size_t
    module procedure hipMemcpy2D_c8_5_c_int
    module procedure hipMemcpy2D_c8_6_c_size_t
    module procedure hipMemcpy2D_c8_6_c_int
    module procedure hipMemcpy2D_c8_7_c_size_t
    module procedure hipMemcpy2D_c8_7_c_int
    module procedure hipMemcpy2D_l_0_c_size_t
    module procedure hipMemcpy2D_l_0_c_int
    module procedure hipMemcpy2D_l_1_c_size_t
    module procedure hipMemcpy2D_l_1_c_int
    module procedure hipMemcpy2D_l_2_c_size_t
    module procedure hipMemcpy2D_l_2_c_int
    module procedure hipMemcpy2D_l_3_c_size_t
    module procedure hipMemcpy2D_l_3_c_int
    module procedure hipMemcpy2D_l_4_c_size_t
    module procedure hipMemcpy2D_l_4_c_int
    module procedure hipMemcpy2D_l_5_c_size_t
    module procedure hipMemcpy2D_l_5_c_int
    module procedure hipMemcpy2D_l_6_c_size_t
    module procedure hipMemcpy2D_l_6_c_int
    module procedure hipMemcpy2D_l_7_c_size_t
    module procedure hipMemcpy2D_l_7_c_int
#endif
  end interface hipMemcpy2D

  interface hipMemcpy2DAsync
  !>   @brief Copies data between host and device asynchronously.
  !>
  !>   hipMemcpy2DAsync supports memory matrix copy from the pointed area src to the pointed area
  !>   dst.
  !>  The copy direction is defined by kind which must be one of `hipMemcpyHostToDevice`,
  !>  `hipMemcpyDeviceToHost`, `hipMemcpyDeviceToDevice` or `hipMemcpyDefault`.
  !>  dpitch and spitch are the widths in bytes for memory matrix corresponds to dst and src.
  !>  width cannot exceed dpitch or spitch.
  !>
  !>  The copy is always performed by the device associated with the specified stream.
  !>  The API is asynchronous with respect to the host, so the call may return before the copy is
  !>  complete. The copy can optionally be excuted in a specific stream by passing a non-zero stream
  !>  argument, for HostToDevice or DeviceToHost copies, the copy can overlap with operations
  !>  in other streams.
  !>
  !>  For multi-gpu or peer-to-peer configurations, it is recommended to use a stream which is
  !>  attached to the device where the src data is physically located.
  !>
  !>  For optimal peer-to-peer copies, the copy device must be able to access the src and dst
  !>  pointers
  !>  (by calling hipDeviceEnablePeerAccess) with copy agent as the current device and src/dst as
  !>  the
  !>  peerDevice argument. If enabling device peer access is not done, the API will still work, but
  !>  will perform the copy using a staging buffer on the host.
  !>
  !>   @note If host or dst are not pinned, the memory copy will be performed synchronously.  For
  !>  best performance, use hipHostMalloc to allocate host memory that is transferred
  !>  asynchronously.
  !>
  !>   @param[out]  dest Pointer to destination memory address
  !>   @param[in]   dpitch Pitch size in bytes of destination memory
  !>   @param[in]   src    Pointer to source memory address
  !>   @param[in]   spitch Pitch size in bytes of source memory
  !>   @param[in]   width  Width of matrix transfer (columns in bytes)
  !>   @param[in]   height Height of matrix transfer (rows)
  !>   @param[in]   myKind   Type of transfer
  !>   @param[in]   stream Stream to use
  !>   @returns     `hipSuccess`, `hipErrorInvalidValue`, `hipErrorInvalidPitchValue`,
  !>  `hipErrorInvalidDevicePointer`, `hipErrorInvalidMemcpyDirection`
  !>
  !>   @see hipMemcpy, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>  hipMemcpyAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DAsync_(dest, dpitch, src, spitch, width, height, myKind, stream) &
        bind(c, name="cudaMemcpy2DAsync")
#else
    function hipMemcpy2DAsync_(dest, dpitch, src, spitch, width, height, myKind, stream) &
        bind(c, name="hipMemcpy2DAsync")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipMemcpy2DAsync_
      type(c_ptr), value :: dest
      integer(c_size_t), value :: dpitch
      type(c_ptr), value :: src
      integer(c_size_t), value :: spitch
      integer(c_size_t), value :: width
      integer(c_size_t), value :: height
      integer(c_int), value :: myKind
      type(c_ptr), value :: stream
    end function hipMemcpy2DAsync_
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hipMemcpy2DAsync_i4_assumed_rank_c_size_t
    module procedure hipMemcpy2DAsync_i4_assumed_rank_c_int
    module procedure hipMemcpy2DAsync_i8_assumed_rank_c_size_t
    module procedure hipMemcpy2DAsync_i8_assumed_rank_c_int
    module procedure hipMemcpy2DAsync_r4_assumed_rank_c_size_t
    module procedure hipMemcpy2DAsync_r4_assumed_rank_c_int
    module procedure hipMemcpy2DAsync_r8_assumed_rank_c_size_t
    module procedure hipMemcpy2DAsync_r8_assumed_rank_c_int
    module procedure hipMemcpy2DAsync_c4_assumed_rank_c_size_t
    module procedure hipMemcpy2DAsync_c4_assumed_rank_c_int
    module procedure hipMemcpy2DAsync_c8_assumed_rank_c_size_t
    module procedure hipMemcpy2DAsync_c8_assumed_rank_c_int
    module procedure hipMemcpy2DAsync_l_assumed_rank_c_size_t
    module procedure hipMemcpy2DAsync_l_assumed_rank_c_int
#else
    module procedure hipMemcpy2DAsync_i4_0_c_size_t
    module procedure hipMemcpy2DAsync_i4_0_c_int
    module procedure hipMemcpy2DAsync_i4_1_c_size_t
    module procedure hipMemcpy2DAsync_i4_1_c_int
    module procedure hipMemcpy2DAsync_i4_2_c_size_t
    module procedure hipMemcpy2DAsync_i4_2_c_int
    module procedure hipMemcpy2DAsync_i4_3_c_size_t
    module procedure hipMemcpy2DAsync_i4_3_c_int
    module procedure hipMemcpy2DAsync_i4_4_c_size_t
    module procedure hipMemcpy2DAsync_i4_4_c_int
    module procedure hipMemcpy2DAsync_i4_5_c_size_t
    module procedure hipMemcpy2DAsync_i4_5_c_int
    module procedure hipMemcpy2DAsync_i4_6_c_size_t
    module procedure hipMemcpy2DAsync_i4_6_c_int
    module procedure hipMemcpy2DAsync_i4_7_c_size_t
    module procedure hipMemcpy2DAsync_i4_7_c_int
    module procedure hipMemcpy2DAsync_i8_0_c_size_t
    module procedure hipMemcpy2DAsync_i8_0_c_int
    module procedure hipMemcpy2DAsync_i8_1_c_size_t
    module procedure hipMemcpy2DAsync_i8_1_c_int
    module procedure hipMemcpy2DAsync_i8_2_c_size_t
    module procedure hipMemcpy2DAsync_i8_2_c_int
    module procedure hipMemcpy2DAsync_i8_3_c_size_t
    module procedure hipMemcpy2DAsync_i8_3_c_int
    module procedure hipMemcpy2DAsync_i8_4_c_size_t
    module procedure hipMemcpy2DAsync_i8_4_c_int
    module procedure hipMemcpy2DAsync_i8_5_c_size_t
    module procedure hipMemcpy2DAsync_i8_5_c_int
    module procedure hipMemcpy2DAsync_i8_6_c_size_t
    module procedure hipMemcpy2DAsync_i8_6_c_int
    module procedure hipMemcpy2DAsync_i8_7_c_size_t
    module procedure hipMemcpy2DAsync_i8_7_c_int
    module procedure hipMemcpy2DAsync_r4_0_c_size_t
    module procedure hipMemcpy2DAsync_r4_0_c_int
    module procedure hipMemcpy2DAsync_r4_1_c_size_t
    module procedure hipMemcpy2DAsync_r4_1_c_int
    module procedure hipMemcpy2DAsync_r4_2_c_size_t
    module procedure hipMemcpy2DAsync_r4_2_c_int
    module procedure hipMemcpy2DAsync_r4_3_c_size_t
    module procedure hipMemcpy2DAsync_r4_3_c_int
    module procedure hipMemcpy2DAsync_r4_4_c_size_t
    module procedure hipMemcpy2DAsync_r4_4_c_int
    module procedure hipMemcpy2DAsync_r4_5_c_size_t
    module procedure hipMemcpy2DAsync_r4_5_c_int
    module procedure hipMemcpy2DAsync_r4_6_c_size_t
    module procedure hipMemcpy2DAsync_r4_6_c_int
    module procedure hipMemcpy2DAsync_r4_7_c_size_t
    module procedure hipMemcpy2DAsync_r4_7_c_int
    module procedure hipMemcpy2DAsync_r8_0_c_size_t
    module procedure hipMemcpy2DAsync_r8_0_c_int
    module procedure hipMemcpy2DAsync_r8_1_c_size_t
    module procedure hipMemcpy2DAsync_r8_1_c_int
    module procedure hipMemcpy2DAsync_r8_2_c_size_t
    module procedure hipMemcpy2DAsync_r8_2_c_int
    module procedure hipMemcpy2DAsync_r8_3_c_size_t
    module procedure hipMemcpy2DAsync_r8_3_c_int
    module procedure hipMemcpy2DAsync_r8_4_c_size_t
    module procedure hipMemcpy2DAsync_r8_4_c_int
    module procedure hipMemcpy2DAsync_r8_5_c_size_t
    module procedure hipMemcpy2DAsync_r8_5_c_int
    module procedure hipMemcpy2DAsync_r8_6_c_size_t
    module procedure hipMemcpy2DAsync_r8_6_c_int
    module procedure hipMemcpy2DAsync_r8_7_c_size_t
    module procedure hipMemcpy2DAsync_r8_7_c_int
    module procedure hipMemcpy2DAsync_c4_0_c_size_t
    module procedure hipMemcpy2DAsync_c4_0_c_int
    module procedure hipMemcpy2DAsync_c4_1_c_size_t
    module procedure hipMemcpy2DAsync_c4_1_c_int
    module procedure hipMemcpy2DAsync_c4_2_c_size_t
    module procedure hipMemcpy2DAsync_c4_2_c_int
    module procedure hipMemcpy2DAsync_c4_3_c_size_t
    module procedure hipMemcpy2DAsync_c4_3_c_int
    module procedure hipMemcpy2DAsync_c4_4_c_size_t
    module procedure hipMemcpy2DAsync_c4_4_c_int
    module procedure hipMemcpy2DAsync_c4_5_c_size_t
    module procedure hipMemcpy2DAsync_c4_5_c_int
    module procedure hipMemcpy2DAsync_c4_6_c_size_t
    module procedure hipMemcpy2DAsync_c4_6_c_int
    module procedure hipMemcpy2DAsync_c4_7_c_size_t
    module procedure hipMemcpy2DAsync_c4_7_c_int
    module procedure hipMemcpy2DAsync_c8_0_c_size_t
    module procedure hipMemcpy2DAsync_c8_0_c_int
    module procedure hipMemcpy2DAsync_c8_1_c_size_t
    module procedure hipMemcpy2DAsync_c8_1_c_int
    module procedure hipMemcpy2DAsync_c8_2_c_size_t
    module procedure hipMemcpy2DAsync_c8_2_c_int
    module procedure hipMemcpy2DAsync_c8_3_c_size_t
    module procedure hipMemcpy2DAsync_c8_3_c_int
    module procedure hipMemcpy2DAsync_c8_4_c_size_t
    module procedure hipMemcpy2DAsync_c8_4_c_int
    module procedure hipMemcpy2DAsync_c8_5_c_size_t
    module procedure hipMemcpy2DAsync_c8_5_c_int
    module procedure hipMemcpy2DAsync_c8_6_c_size_t
    module procedure hipMemcpy2DAsync_c8_6_c_int
    module procedure hipMemcpy2DAsync_c8_7_c_size_t
    module procedure hipMemcpy2DAsync_c8_7_c_int
    module procedure hipMemcpy2DAsync_l_0_c_size_t
    module procedure hipMemcpy2DAsync_l_0_c_int
    module procedure hipMemcpy2DAsync_l_1_c_size_t
    module procedure hipMemcpy2DAsync_l_1_c_int
    module procedure hipMemcpy2DAsync_l_2_c_size_t
    module procedure hipMemcpy2DAsync_l_2_c_int
    module procedure hipMemcpy2DAsync_l_3_c_size_t
    module procedure hipMemcpy2DAsync_l_3_c_int
    module procedure hipMemcpy2DAsync_l_4_c_size_t
    module procedure hipMemcpy2DAsync_l_4_c_int
    module procedure hipMemcpy2DAsync_l_5_c_size_t
    module procedure hipMemcpy2DAsync_l_5_c_int
    module procedure hipMemcpy2DAsync_l_6_c_size_t
    module procedure hipMemcpy2DAsync_l_6_c_int
    module procedure hipMemcpy2DAsync_l_7_c_size_t
    module procedure hipMemcpy2DAsync_l_7_c_int
#endif
  end interface hipMemcpy2DAsync

contains

#ifdef USE_ASSUMED_RANK_INTERFACES
  function hipMemcpy_i4_assumed_rank_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i4_assumed_rank_c_size_t

  function hipMemcpy_i4_assumed_rank_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i4_assumed_rank_c_int

  function hipMemcpy_i4_assumed_rank(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i4_assumed_rank

  function hipMemcpy_i8_assumed_rank_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int64_t), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i8_assumed_rank_c_size_t

  function hipMemcpy_i8_assumed_rank_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int64_t), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i8_assumed_rank_c_int

  function hipMemcpy_i8_assumed_rank(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int64_t), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i8_assumed_rank

  function hipMemcpy_r4_assumed_rank_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_float), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r4_assumed_rank_c_size_t

  function hipMemcpy_r4_assumed_rank_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_float), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r4_assumed_rank_c_int

  function hipMemcpy_r4_assumed_rank(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_float), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r4_assumed_rank

  function hipMemcpy_r8_assumed_rank_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_double), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r8_assumed_rank_c_size_t

  function hipMemcpy_r8_assumed_rank_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_double), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r8_assumed_rank_c_int

  function hipMemcpy_r8_assumed_rank(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_double), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r8_assumed_rank

  function hipMemcpy_c4_assumed_rank_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_float_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c4_assumed_rank_c_size_t

  function hipMemcpy_c4_assumed_rank_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_float_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c4_assumed_rank_c_int

  function hipMemcpy_c4_assumed_rank(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_float_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c4_assumed_rank

  function hipMemcpy_c8_assumed_rank_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_double_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c8_assumed_rank_c_size_t

  function hipMemcpy_c8_assumed_rank_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_double_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c8_assumed_rank_c_int

  function hipMemcpy_c8_assumed_rank(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_double_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c8_assumed_rank

  function hipMemcpy_l_assumed_rank_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, contiguous, dimension(..), intent(inout) :: dest
    logical(c_bool), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_l_assumed_rank_c_size_t

  function hipMemcpy_l_assumed_rank_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, contiguous, dimension(..), intent(inout) :: dest
    logical(c_bool), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_l_assumed_rank_c_int

  function hipMemcpy_l_assumed_rank(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, contiguous, dimension(..), intent(inout) :: dest
    logical(c_bool), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_l_assumed_rank

  function hipMemcpyAsync_i4_assumed_rank_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_assumed_rank_c_size_t

  function hipMemcpyAsync_i4_assumed_rank_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_assumed_rank_c_int

  function hipMemcpyAsync_i4_assumed_rank(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_assumed_rank

  function hipMemcpyAsync_i8_assumed_rank_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int64_t), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_assumed_rank_c_size_t

  function hipMemcpyAsync_i8_assumed_rank_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int64_t), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_assumed_rank_c_int

  function hipMemcpyAsync_i8_assumed_rank(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int64_t), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_assumed_rank

  function hipMemcpyAsync_r4_assumed_rank_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_float), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_assumed_rank_c_size_t

  function hipMemcpyAsync_r4_assumed_rank_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_float), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_assumed_rank_c_int

  function hipMemcpyAsync_r4_assumed_rank(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_float), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_assumed_rank

  function hipMemcpyAsync_r8_assumed_rank_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_double), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_assumed_rank_c_size_t

  function hipMemcpyAsync_r8_assumed_rank_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_double), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_assumed_rank_c_int

  function hipMemcpyAsync_r8_assumed_rank(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, contiguous, dimension(..), intent(inout) :: dest
    real(c_double), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_assumed_rank

  function hipMemcpyAsync_c4_assumed_rank_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_float_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_assumed_rank_c_size_t

  function hipMemcpyAsync_c4_assumed_rank_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_float_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_assumed_rank_c_int

  function hipMemcpyAsync_c4_assumed_rank(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_float_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_assumed_rank

  function hipMemcpyAsync_c8_assumed_rank_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_double_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_assumed_rank_c_size_t

  function hipMemcpyAsync_c8_assumed_rank_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_double_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_assumed_rank_c_int

  function hipMemcpyAsync_c8_assumed_rank(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, contiguous, dimension(..), intent(inout) :: dest
    complex(c_double_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_assumed_rank

  function hipMemcpyAsync_l_assumed_rank_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, contiguous, dimension(..), intent(inout) :: dest
    logical(c_bool), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_assumed_rank_c_size_t

  function hipMemcpyAsync_l_assumed_rank_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, contiguous, dimension(..), intent(inout) :: dest
    logical(c_bool), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_assumed_rank_c_int

  function hipMemcpyAsync_l_assumed_rank(dest, src, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, contiguous, dimension(..), intent(inout) :: dest
    logical(c_bool), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_assumed_rank

  function hipMemcpy2D_i4_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_assumed_rank_c_size_t

  function hipMemcpy2D_i4_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_assumed_rank_c_int

  function hipMemcpy2D_i8_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_assumed_rank_c_size_t

  function hipMemcpy2D_i8_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_assumed_rank_c_int

  function hipMemcpy2D_r4_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_assumed_rank_c_size_t

  function hipMemcpy2D_r4_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_assumed_rank_c_int

  function hipMemcpy2D_r8_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_assumed_rank_c_size_t

  function hipMemcpy2D_r8_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_assumed_rank_c_int

  function hipMemcpy2D_c4_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_assumed_rank_c_size_t

  function hipMemcpy2D_c4_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_assumed_rank_c_int

  function hipMemcpy2D_c8_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_assumed_rank_c_size_t

  function hipMemcpy2D_c8_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_assumed_rank_c_int

  function hipMemcpy2D_l_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_assumed_rank_c_size_t

  function hipMemcpy2D_l_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_assumed_rank_c_int

  function hipMemcpy2DAsync_i4_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_assumed_rank_c_size_t

  function hipMemcpy2DAsync_i4_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_assumed_rank_c_int

  function hipMemcpy2DAsync_i8_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_assumed_rank_c_size_t

  function hipMemcpy2DAsync_i8_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_assumed_rank_c_int

  function hipMemcpy2DAsync_r4_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_assumed_rank_c_size_t

  function hipMemcpy2DAsync_r4_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_assumed_rank_c_int

  function hipMemcpy2DAsync_r8_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_assumed_rank_c_size_t

  function hipMemcpy2DAsync_r8_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_assumed_rank_c_int

  function hipMemcpy2DAsync_c4_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_assumed_rank_c_size_t

  function hipMemcpy2DAsync_c4_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_assumed_rank_c_int

  function hipMemcpy2DAsync_c8_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_assumed_rank_c_size_t

  function hipMemcpy2DAsync_c8_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_assumed_rank_c_int

  function hipMemcpy2DAsync_l_assumed_rank_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_assumed_rank_c_size_t

  function hipMemcpy2DAsync_l_assumed_rank_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, contiguous, dimension(..), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, contiguous, dimension(..), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_assumed_rank_c_int

#else
  function hipMemcpy_i4_0_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i4_0_c_size_t

  function hipMemcpy_i4_0_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i4_0_c_int

  function hipMemcpy_i4_0(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i4_0

  function hipMemcpy_i4_1_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i4_1_c_size_t

  function hipMemcpy_i4_1_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i4_1_c_int

  function hipMemcpy_i4_1(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i4_1

  function hipMemcpy_i4_2_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i4_2_c_size_t

  function hipMemcpy_i4_2_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i4_2_c_int

  function hipMemcpy_i4_2(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i4_2

  function hipMemcpy_i4_3_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_3_c_size_t

  function hipMemcpy_i4_3_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_3_c_int

  function hipMemcpy_i4_3(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_3

  function hipMemcpy_i4_4_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_4_c_size_t

  function hipMemcpy_i4_4_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_4_c_int

  function hipMemcpy_i4_4(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_4

  function hipMemcpy_i4_5_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_5_c_size_t

  function hipMemcpy_i4_5_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_5_c_int

  function hipMemcpy_i4_5(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_5

  function hipMemcpy_i4_6_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_6_c_size_t

  function hipMemcpy_i4_6_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_6_c_int

  function hipMemcpy_i4_6(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_6

  function hipMemcpy_i4_7_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_7_c_size_t

  function hipMemcpy_i4_7_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_7_c_int

  function hipMemcpy_i4_7(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_7

  function hipMemcpy_i8_0_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i8_0_c_size_t

  function hipMemcpy_i8_0_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i8_0_c_int

  function hipMemcpy_i8_0(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_i8_0

  function hipMemcpy_i8_1_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i8_1_c_size_t

  function hipMemcpy_i8_1_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i8_1_c_int

  function hipMemcpy_i8_1(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i8_1

  function hipMemcpy_i8_2_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i8_2_c_size_t

  function hipMemcpy_i8_2_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i8_2_c_int

  function hipMemcpy_i8_2(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i8_2

  function hipMemcpy_i8_3_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_3_c_size_t

  function hipMemcpy_i8_3_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_3_c_int

  function hipMemcpy_i8_3(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_3

  function hipMemcpy_i8_4_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_4_c_size_t

  function hipMemcpy_i8_4_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_4_c_int

  function hipMemcpy_i8_4(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_4

  function hipMemcpy_i8_5_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_5_c_size_t

  function hipMemcpy_i8_5_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_5_c_int

  function hipMemcpy_i8_5(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_5

  function hipMemcpy_i8_6_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_6_c_size_t

  function hipMemcpy_i8_6_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_6_c_int

  function hipMemcpy_i8_6(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_6

  function hipMemcpy_i8_7_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_7_c_size_t

  function hipMemcpy_i8_7_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_7_c_int

  function hipMemcpy_i8_7(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_7

  function hipMemcpy_r4_0_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    real(c_float), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r4_0_c_size_t

  function hipMemcpy_r4_0_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    real(c_float), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r4_0_c_int

  function hipMemcpy_r4_0(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    real(c_float), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r4_0

  function hipMemcpy_r4_1_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r4_1_c_size_t

  function hipMemcpy_r4_1_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r4_1_c_int

  function hipMemcpy_r4_1(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r4_1

  function hipMemcpy_r4_2_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r4_2_c_size_t

  function hipMemcpy_r4_2_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r4_2_c_int

  function hipMemcpy_r4_2(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r4_2

  function hipMemcpy_r4_3_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_3_c_size_t

  function hipMemcpy_r4_3_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_3_c_int

  function hipMemcpy_r4_3(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_3

  function hipMemcpy_r4_4_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_4_c_size_t

  function hipMemcpy_r4_4_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_4_c_int

  function hipMemcpy_r4_4(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_4

  function hipMemcpy_r4_5_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_5_c_size_t

  function hipMemcpy_r4_5_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_5_c_int

  function hipMemcpy_r4_5(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_5

  function hipMemcpy_r4_6_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_6_c_size_t

  function hipMemcpy_r4_6_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_6_c_int

  function hipMemcpy_r4_6(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_6

  function hipMemcpy_r4_7_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_7_c_size_t

  function hipMemcpy_r4_7_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_7_c_int

  function hipMemcpy_r4_7(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_7

  function hipMemcpy_r8_0_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    real(c_double), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r8_0_c_size_t

  function hipMemcpy_r8_0_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    real(c_double), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r8_0_c_int

  function hipMemcpy_r8_0(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    real(c_double), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_r8_0

  function hipMemcpy_r8_1_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r8_1_c_size_t

  function hipMemcpy_r8_1_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r8_1_c_int

  function hipMemcpy_r8_1(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r8_1

  function hipMemcpy_r8_2_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r8_2_c_size_t

  function hipMemcpy_r8_2_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r8_2_c_int

  function hipMemcpy_r8_2(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r8_2

  function hipMemcpy_r8_3_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_3_c_size_t

  function hipMemcpy_r8_3_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_3_c_int

  function hipMemcpy_r8_3(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_3

  function hipMemcpy_r8_4_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_4_c_size_t

  function hipMemcpy_r8_4_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_4_c_int

  function hipMemcpy_r8_4(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_4

  function hipMemcpy_r8_5_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_5_c_size_t

  function hipMemcpy_r8_5_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_5_c_int

  function hipMemcpy_r8_5(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_5

  function hipMemcpy_r8_6_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_6_c_size_t

  function hipMemcpy_r8_6_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_6_c_int

  function hipMemcpy_r8_6(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_6

  function hipMemcpy_r8_7_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_7_c_size_t

  function hipMemcpy_r8_7_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_7_c_int

  function hipMemcpy_r8_7(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_7

  function hipMemcpy_c4_0_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c4_0_c_size_t

  function hipMemcpy_c4_0_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c4_0_c_int

  function hipMemcpy_c4_0(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c4_0

  function hipMemcpy_c4_1_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c4_1_c_size_t

  function hipMemcpy_c4_1_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c4_1_c_int

  function hipMemcpy_c4_1(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c4_1

  function hipMemcpy_c4_2_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c4_2_c_size_t

  function hipMemcpy_c4_2_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c4_2_c_int

  function hipMemcpy_c4_2(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c4_2

  function hipMemcpy_c4_3_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_3_c_size_t

  function hipMemcpy_c4_3_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_3_c_int

  function hipMemcpy_c4_3(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_3

  function hipMemcpy_c4_4_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_4_c_size_t

  function hipMemcpy_c4_4_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_4_c_int

  function hipMemcpy_c4_4(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_4

  function hipMemcpy_c4_5_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_5_c_size_t

  function hipMemcpy_c4_5_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_5_c_int

  function hipMemcpy_c4_5(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_5

  function hipMemcpy_c4_6_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_6_c_size_t

  function hipMemcpy_c4_6_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_6_c_int

  function hipMemcpy_c4_6(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_6

  function hipMemcpy_c4_7_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_7_c_size_t

  function hipMemcpy_c4_7_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_7_c_int

  function hipMemcpy_c4_7(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_7

  function hipMemcpy_c8_0_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c8_0_c_size_t

  function hipMemcpy_c8_0_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c8_0_c_int

  function hipMemcpy_c8_0(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_c8_0

  function hipMemcpy_c8_1_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c8_1_c_size_t

  function hipMemcpy_c8_1_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c8_1_c_int

  function hipMemcpy_c8_1(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c8_1

  function hipMemcpy_c8_2_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c8_2_c_size_t

  function hipMemcpy_c8_2_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c8_2_c_int

  function hipMemcpy_c8_2(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c8_2

  function hipMemcpy_c8_3_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_3_c_size_t

  function hipMemcpy_c8_3_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_3_c_int

  function hipMemcpy_c8_3(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_3

  function hipMemcpy_c8_4_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_4_c_size_t

  function hipMemcpy_c8_4_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_4_c_int

  function hipMemcpy_c8_4(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_4

  function hipMemcpy_c8_5_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_5_c_size_t

  function hipMemcpy_c8_5_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_5_c_int

  function hipMemcpy_c8_5(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_5

  function hipMemcpy_c8_6_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_6_c_size_t

  function hipMemcpy_c8_6_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_6_c_int

  function hipMemcpy_c8_6(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_6

  function hipMemcpy_c8_7_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_7_c_size_t

  function hipMemcpy_c8_7_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_7_c_int

  function hipMemcpy_c8_7(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_7

  function hipMemcpy_l_0_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    logical(c_bool), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_l_0_c_size_t

  function hipMemcpy_l_0_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    logical(c_bool), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_l_0_c_int

  function hipMemcpy_l_0(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    logical(c_bool), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(1, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest), c_loc(src), nbytes, myKind)
  end function hipMemcpy_l_0

  function hipMemcpy_l_1_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_l_1_c_size_t

  function hipMemcpy_l_1_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_l_1_c_int

  function hipMemcpy_l_1(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_l_1

  function hipMemcpy_l_2_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_l_2_c_size_t

  function hipMemcpy_l_2_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_l_2_c_int

  function hipMemcpy_l_2(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_l_2

  function hipMemcpy_l_3_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_3_c_size_t

  function hipMemcpy_l_3_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_3_c_int

  function hipMemcpy_l_3(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_3

  function hipMemcpy_l_4_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_4_c_size_t

  function hipMemcpy_l_4_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_4_c_int

  function hipMemcpy_l_4(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_4

  function hipMemcpy_l_5_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_5_c_size_t

  function hipMemcpy_l_5_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_5_c_int

  function hipMemcpy_l_5(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_5

  function hipMemcpy_l_6_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_6_c_size_t

  function hipMemcpy_l_6_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_6_c_int

  function hipMemcpy_l_6(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_6

  function hipMemcpy_l_7_c_size_t(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_7_c_size_t

  function hipMemcpy_l_7_c_int(dest, src, length, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_7_c_int

  function hipMemcpy_l_7(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 1_c_size_t
    res = hipMemcpy_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_l_7

  function hipMemcpyAsync_i4_0_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_0_c_size_t

  function hipMemcpyAsync_i4_0_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_0_c_int

  function hipMemcpyAsync_i4_0(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i4_0

  function hipMemcpyAsync_i4_1_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_1_c_size_t

  function hipMemcpyAsync_i4_1_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_1_c_int

  function hipMemcpyAsync_i4_1(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i4_1

  function hipMemcpyAsync_i4_2_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_2_c_size_t

  function hipMemcpyAsync_i4_2_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_2_c_int

  function hipMemcpyAsync_i4_2(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i4_2

  function hipMemcpyAsync_i4_3_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_3_c_size_t

  function hipMemcpyAsync_i4_3_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_3_c_int

  function hipMemcpyAsync_i4_3(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i4_3

  function hipMemcpyAsync_i4_4_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_4_c_size_t

  function hipMemcpyAsync_i4_4_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_4_c_int

  function hipMemcpyAsync_i4_4(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i4_4

  function hipMemcpyAsync_i4_5_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_5_c_size_t

  function hipMemcpyAsync_i4_5_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_5_c_int

  function hipMemcpyAsync_i4_5(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i4_5

  function hipMemcpyAsync_i4_6_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_6_c_size_t

  function hipMemcpyAsync_i4_6_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_6_c_int

  function hipMemcpyAsync_i4_6(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i4_6

  function hipMemcpyAsync_i4_7_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_7_c_size_t

  function hipMemcpyAsync_i4_7_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_7_c_int

  function hipMemcpyAsync_i4_7(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i4_7

  function hipMemcpyAsync_i8_0_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_0_c_size_t

  function hipMemcpyAsync_i8_0_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_0_c_int

  function hipMemcpyAsync_i8_0(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i8_0

  function hipMemcpyAsync_i8_1_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_1_c_size_t

  function hipMemcpyAsync_i8_1_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_1_c_int

  function hipMemcpyAsync_i8_1(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i8_1

  function hipMemcpyAsync_i8_2_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_2_c_size_t

  function hipMemcpyAsync_i8_2_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_2_c_int

  function hipMemcpyAsync_i8_2(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i8_2

  function hipMemcpyAsync_i8_3_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_3_c_size_t

  function hipMemcpyAsync_i8_3_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_3_c_int

  function hipMemcpyAsync_i8_3(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i8_3

  function hipMemcpyAsync_i8_4_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_4_c_size_t

  function hipMemcpyAsync_i8_4_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_4_c_int

  function hipMemcpyAsync_i8_4(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i8_4

  function hipMemcpyAsync_i8_5_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_5_c_size_t

  function hipMemcpyAsync_i8_5_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_5_c_int

  function hipMemcpyAsync_i8_5(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i8_5

  function hipMemcpyAsync_i8_6_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_6_c_size_t

  function hipMemcpyAsync_i8_6_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_6_c_int

  function hipMemcpyAsync_i8_6(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i8_6

  function hipMemcpyAsync_i8_7_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_7_c_size_t

  function hipMemcpyAsync_i8_7_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_7_c_int

  function hipMemcpyAsync_i8_7(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_i8_7

  function hipMemcpyAsync_r4_0_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    real(c_float), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_0_c_size_t

  function hipMemcpyAsync_r4_0_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    real(c_float), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_0_c_int

  function hipMemcpyAsync_r4_0(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r4_0

  function hipMemcpyAsync_r4_1_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_1_c_size_t

  function hipMemcpyAsync_r4_1_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_1_c_int

  function hipMemcpyAsync_r4_1(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r4_1

  function hipMemcpyAsync_r4_2_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_2_c_size_t

  function hipMemcpyAsync_r4_2_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_2_c_int

  function hipMemcpyAsync_r4_2(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r4_2

  function hipMemcpyAsync_r4_3_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_3_c_size_t

  function hipMemcpyAsync_r4_3_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_3_c_int

  function hipMemcpyAsync_r4_3(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r4_3

  function hipMemcpyAsync_r4_4_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_4_c_size_t

  function hipMemcpyAsync_r4_4_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_4_c_int

  function hipMemcpyAsync_r4_4(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r4_4

  function hipMemcpyAsync_r4_5_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_5_c_size_t

  function hipMemcpyAsync_r4_5_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_5_c_int

  function hipMemcpyAsync_r4_5(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r4_5

  function hipMemcpyAsync_r4_6_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_6_c_size_t

  function hipMemcpyAsync_r4_6_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_6_c_int

  function hipMemcpyAsync_r4_6(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r4_6

  function hipMemcpyAsync_r4_7_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_7_c_size_t

  function hipMemcpyAsync_r4_7_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 4_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_7_c_int

  function hipMemcpyAsync_r4_7(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r4_7

  function hipMemcpyAsync_r8_0_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    real(c_double), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_0_c_size_t

  function hipMemcpyAsync_r8_0_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    real(c_double), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_0_c_int

  function hipMemcpyAsync_r8_0(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r8_0

  function hipMemcpyAsync_r8_1_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_1_c_size_t

  function hipMemcpyAsync_r8_1_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_1_c_int

  function hipMemcpyAsync_r8_1(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r8_1

  function hipMemcpyAsync_r8_2_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_2_c_size_t

  function hipMemcpyAsync_r8_2_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_2_c_int

  function hipMemcpyAsync_r8_2(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r8_2

  function hipMemcpyAsync_r8_3_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_3_c_size_t

  function hipMemcpyAsync_r8_3_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_3_c_int

  function hipMemcpyAsync_r8_3(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r8_3

  function hipMemcpyAsync_r8_4_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_4_c_size_t

  function hipMemcpyAsync_r8_4_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_4_c_int

  function hipMemcpyAsync_r8_4(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r8_4

  function hipMemcpyAsync_r8_5_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_5_c_size_t

  function hipMemcpyAsync_r8_5_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_5_c_int

  function hipMemcpyAsync_r8_5(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r8_5

  function hipMemcpyAsync_r8_6_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_6_c_size_t

  function hipMemcpyAsync_r8_6_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_6_c_int

  function hipMemcpyAsync_r8_6(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r8_6

  function hipMemcpyAsync_r8_7_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_7_c_size_t

  function hipMemcpyAsync_r8_7_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_7_c_int

  function hipMemcpyAsync_r8_7(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_r8_7

  function hipMemcpyAsync_c4_0_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_0_c_size_t

  function hipMemcpyAsync_c4_0_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_0_c_int

  function hipMemcpyAsync_c4_0(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c4_0

  function hipMemcpyAsync_c4_1_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_1_c_size_t

  function hipMemcpyAsync_c4_1_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_1_c_int

  function hipMemcpyAsync_c4_1(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c4_1

  function hipMemcpyAsync_c4_2_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_2_c_size_t

  function hipMemcpyAsync_c4_2_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_2_c_int

  function hipMemcpyAsync_c4_2(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c4_2

  function hipMemcpyAsync_c4_3_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_3_c_size_t

  function hipMemcpyAsync_c4_3_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_3_c_int

  function hipMemcpyAsync_c4_3(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c4_3

  function hipMemcpyAsync_c4_4_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_4_c_size_t

  function hipMemcpyAsync_c4_4_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_4_c_int

  function hipMemcpyAsync_c4_4(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c4_4

  function hipMemcpyAsync_c4_5_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_5_c_size_t

  function hipMemcpyAsync_c4_5_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_5_c_int

  function hipMemcpyAsync_c4_5(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c4_5

  function hipMemcpyAsync_c4_6_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_6_c_size_t

  function hipMemcpyAsync_c4_6_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_6_c_int

  function hipMemcpyAsync_c4_6(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c4_6

  function hipMemcpyAsync_c4_7_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_7_c_size_t

  function hipMemcpyAsync_c4_7_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 8_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_7_c_int

  function hipMemcpyAsync_c4_7(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c4_7

  function hipMemcpyAsync_c8_0_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_0_c_size_t

  function hipMemcpyAsync_c8_0_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_0_c_int

  function hipMemcpyAsync_c8_0(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c8_0

  function hipMemcpyAsync_c8_1_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_1_c_size_t

  function hipMemcpyAsync_c8_1_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_1_c_int

  function hipMemcpyAsync_c8_1(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c8_1

  function hipMemcpyAsync_c8_2_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_2_c_size_t

  function hipMemcpyAsync_c8_2_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_2_c_int

  function hipMemcpyAsync_c8_2(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c8_2

  function hipMemcpyAsync_c8_3_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_3_c_size_t

  function hipMemcpyAsync_c8_3_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_3_c_int

  function hipMemcpyAsync_c8_3(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c8_3

  function hipMemcpyAsync_c8_4_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_4_c_size_t

  function hipMemcpyAsync_c8_4_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_4_c_int

  function hipMemcpyAsync_c8_4(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c8_4

  function hipMemcpyAsync_c8_5_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_5_c_size_t

  function hipMemcpyAsync_c8_5_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_5_c_int

  function hipMemcpyAsync_c8_5(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c8_5

  function hipMemcpyAsync_c8_6_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_6_c_size_t

  function hipMemcpyAsync_c8_6_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_6_c_int

  function hipMemcpyAsync_c8_6(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c8_6

  function hipMemcpyAsync_c8_7_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_7_c_size_t

  function hipMemcpyAsync_c8_7_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 16_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_7_c_int

  function hipMemcpyAsync_c8_7(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_c8_7

  function hipMemcpyAsync_l_0_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    logical(c_bool), target, intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_0_c_size_t

  function hipMemcpyAsync_l_0_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    logical(c_bool), target, intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest), c_loc(src), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_0_c_int

  function hipMemcpyAsync_l_0(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_l_0

  function hipMemcpyAsync_l_1_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_1_c_size_t

  function hipMemcpyAsync_l_1_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_1_c_int

  function hipMemcpyAsync_l_1(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_l_1

  function hipMemcpyAsync_l_2_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_2_c_size_t

  function hipMemcpyAsync_l_2_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_2_c_int

  function hipMemcpyAsync_l_2(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_l_2

  function hipMemcpyAsync_l_3_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_3_c_size_t

  function hipMemcpyAsync_l_3_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_3_c_int

  function hipMemcpyAsync_l_3(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_l_3

  function hipMemcpyAsync_l_4_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_4_c_size_t

  function hipMemcpyAsync_l_4_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_4_c_int

  function hipMemcpyAsync_l_4(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_l_4

  function hipMemcpyAsync_l_5_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_5_c_size_t

  function hipMemcpyAsync_l_5_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_5_c_int

  function hipMemcpyAsync_l_5(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_l_5

  function hipMemcpyAsync_l_6_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_6_c_size_t

  function hipMemcpyAsync_l_6_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_6_c_int

  function hipMemcpyAsync_l_6(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_l_6

  function hipMemcpyAsync_l_7_c_size_t(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_size_t), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_7_c_size_t

  function hipMemcpyAsync_l_7_c_int(dest, src, length, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: length
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(length, c_size_t) * 1_c_size_t
    res = hipMemcpyAsync_(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_l_7_c_int

  function hipMemcpyAsync_l_7(dest, src, myKind, stream) result(res)
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
  end function hipMemcpyAsync_l_7

  function hipMemcpy2D_i4_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_0_c_size_t

  function hipMemcpy2D_i4_0_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_0_c_int

  function hipMemcpy2D_i4_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_1_c_size_t

  function hipMemcpy2D_i4_1_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_1_c_int

  function hipMemcpy2D_i4_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_2_c_size_t

  function hipMemcpy2D_i4_2_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_2_c_int

  function hipMemcpy2D_i4_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_3_c_size_t

  function hipMemcpy2D_i4_3_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_3_c_int

  function hipMemcpy2D_i4_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_4_c_size_t

  function hipMemcpy2D_i4_4_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_4_c_int

  function hipMemcpy2D_i4_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_5_c_size_t

  function hipMemcpy2D_i4_5_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_5_c_int

  function hipMemcpy2D_i4_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_6_c_size_t

  function hipMemcpy2D_i4_6_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_6_c_int

  function hipMemcpy2D_i4_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_7_c_size_t

  function hipMemcpy2D_i4_7_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i4_7_c_int

  function hipMemcpy2D_i8_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_0_c_size_t

  function hipMemcpy2D_i8_0_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_0_c_int

  function hipMemcpy2D_i8_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_1_c_size_t

  function hipMemcpy2D_i8_1_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_1_c_int

  function hipMemcpy2D_i8_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_2_c_size_t

  function hipMemcpy2D_i8_2_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_2_c_int

  function hipMemcpy2D_i8_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_3_c_size_t

  function hipMemcpy2D_i8_3_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_3_c_int

  function hipMemcpy2D_i8_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_4_c_size_t

  function hipMemcpy2D_i8_4_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_4_c_int

  function hipMemcpy2D_i8_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_5_c_size_t

  function hipMemcpy2D_i8_5_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_5_c_int

  function hipMemcpy2D_i8_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_6_c_size_t

  function hipMemcpy2D_i8_6_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_6_c_int

  function hipMemcpy2D_i8_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_7_c_size_t

  function hipMemcpy2D_i8_7_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_i8_7_c_int

  function hipMemcpy2D_r4_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_0_c_size_t

  function hipMemcpy2D_r4_0_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_0_c_int

  function hipMemcpy2D_r4_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_1_c_size_t

  function hipMemcpy2D_r4_1_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_1_c_int

  function hipMemcpy2D_r4_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_2_c_size_t

  function hipMemcpy2D_r4_2_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_2_c_int

  function hipMemcpy2D_r4_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_3_c_size_t

  function hipMemcpy2D_r4_3_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_3_c_int

  function hipMemcpy2D_r4_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_4_c_size_t

  function hipMemcpy2D_r4_4_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_4_c_int

  function hipMemcpy2D_r4_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_5_c_size_t

  function hipMemcpy2D_r4_5_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_5_c_int

  function hipMemcpy2D_r4_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_6_c_size_t

  function hipMemcpy2D_r4_6_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_6_c_int

  function hipMemcpy2D_r4_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_7_c_size_t

  function hipMemcpy2D_r4_7_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r4_7_c_int

  function hipMemcpy2D_r8_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_0_c_size_t

  function hipMemcpy2D_r8_0_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_0_c_int

  function hipMemcpy2D_r8_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_1_c_size_t

  function hipMemcpy2D_r8_1_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_1_c_int

  function hipMemcpy2D_r8_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_2_c_size_t

  function hipMemcpy2D_r8_2_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_2_c_int

  function hipMemcpy2D_r8_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_3_c_size_t

  function hipMemcpy2D_r8_3_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_3_c_int

  function hipMemcpy2D_r8_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_4_c_size_t

  function hipMemcpy2D_r8_4_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_4_c_int

  function hipMemcpy2D_r8_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_5_c_size_t

  function hipMemcpy2D_r8_5_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_5_c_int

  function hipMemcpy2D_r8_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_6_c_size_t

  function hipMemcpy2D_r8_6_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_6_c_int

  function hipMemcpy2D_r8_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_7_c_size_t

  function hipMemcpy2D_r8_7_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_r8_7_c_int

  function hipMemcpy2D_c4_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_0_c_size_t

  function hipMemcpy2D_c4_0_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_0_c_int

  function hipMemcpy2D_c4_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_1_c_size_t

  function hipMemcpy2D_c4_1_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_1_c_int

  function hipMemcpy2D_c4_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_2_c_size_t

  function hipMemcpy2D_c4_2_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_2_c_int

  function hipMemcpy2D_c4_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_3_c_size_t

  function hipMemcpy2D_c4_3_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_3_c_int

  function hipMemcpy2D_c4_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_4_c_size_t

  function hipMemcpy2D_c4_4_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_4_c_int

  function hipMemcpy2D_c4_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_5_c_size_t

  function hipMemcpy2D_c4_5_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_5_c_int

  function hipMemcpy2D_c4_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_6_c_size_t

  function hipMemcpy2D_c4_6_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_6_c_int

  function hipMemcpy2D_c4_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_7_c_size_t

  function hipMemcpy2D_c4_7_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c4_7_c_int

  function hipMemcpy2D_c8_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_0_c_size_t

  function hipMemcpy2D_c8_0_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_0_c_int

  function hipMemcpy2D_c8_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_1_c_size_t

  function hipMemcpy2D_c8_1_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_1_c_int

  function hipMemcpy2D_c8_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_2_c_size_t

  function hipMemcpy2D_c8_2_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_2_c_int

  function hipMemcpy2D_c8_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_3_c_size_t

  function hipMemcpy2D_c8_3_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_3_c_int

  function hipMemcpy2D_c8_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_4_c_size_t

  function hipMemcpy2D_c8_4_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_4_c_int

  function hipMemcpy2D_c8_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_5_c_size_t

  function hipMemcpy2D_c8_5_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_5_c_int

  function hipMemcpy2D_c8_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_6_c_size_t

  function hipMemcpy2D_c8_6_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_6_c_int

  function hipMemcpy2D_c8_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_7_c_size_t

  function hipMemcpy2D_c8_7_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_c8_7_c_int

  function hipMemcpy2D_l_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_0_c_size_t

  function hipMemcpy2D_l_0_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_0_c_int

  function hipMemcpy2D_l_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_1_c_size_t

  function hipMemcpy2D_l_1_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_1_c_int

  function hipMemcpy2D_l_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_2_c_size_t

  function hipMemcpy2D_l_2_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_2_c_int

  function hipMemcpy2D_l_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_3_c_size_t

  function hipMemcpy2D_l_3_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_3_c_int

  function hipMemcpy2D_l_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_4_c_size_t

  function hipMemcpy2D_l_4_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_4_c_int

  function hipMemcpy2D_l_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_5_c_size_t

  function hipMemcpy2D_l_5_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_5_c_int

  function hipMemcpy2D_l_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_6_c_size_t

  function hipMemcpy2D_l_6_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_6_c_int

  function hipMemcpy2D_l_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_7_c_size_t

  function hipMemcpy2D_l_7_c_int(dest, dpitch, src, spitch, width, height, myKind) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2D_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind)
  end function hipMemcpy2D_l_7_c_int

  function hipMemcpy2DAsync_i4_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_0_c_size_t

  function hipMemcpy2DAsync_i4_0_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_0_c_int

  function hipMemcpy2DAsync_i4_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_1_c_size_t

  function hipMemcpy2DAsync_i4_1_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_1_c_int

  function hipMemcpy2DAsync_i4_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_2_c_size_t

  function hipMemcpy2DAsync_i4_2_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_2_c_int

  function hipMemcpy2DAsync_i4_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_3_c_size_t

  function hipMemcpy2DAsync_i4_3_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_3_c_int

  function hipMemcpy2DAsync_i4_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_4_c_size_t

  function hipMemcpy2DAsync_i4_4_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_4_c_int

  function hipMemcpy2DAsync_i4_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_5_c_size_t

  function hipMemcpy2DAsync_i4_5_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_5_c_int

  function hipMemcpy2DAsync_i4_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_6_c_size_t

  function hipMemcpy2DAsync_i4_6_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_6_c_int

  function hipMemcpy2DAsync_i4_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_7_c_size_t

  function hipMemcpy2DAsync_i4_7_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i4_7_c_int

  function hipMemcpy2DAsync_i8_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_0_c_size_t

  function hipMemcpy2DAsync_i8_0_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_0_c_int

  function hipMemcpy2DAsync_i8_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_1_c_size_t

  function hipMemcpy2DAsync_i8_1_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_1_c_int

  function hipMemcpy2DAsync_i8_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_2_c_size_t

  function hipMemcpy2DAsync_i8_2_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_2_c_int

  function hipMemcpy2DAsync_i8_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_3_c_size_t

  function hipMemcpy2DAsync_i8_3_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_3_c_int

  function hipMemcpy2DAsync_i8_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_4_c_size_t

  function hipMemcpy2DAsync_i8_4_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_4_c_int

  function hipMemcpy2DAsync_i8_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_5_c_size_t

  function hipMemcpy2DAsync_i8_5_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_5_c_int

  function hipMemcpy2DAsync_i8_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_6_c_size_t

  function hipMemcpy2DAsync_i8_6_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_6_c_int

  function hipMemcpy2DAsync_i8_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_7_c_size_t

  function hipMemcpy2DAsync_i8_7_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_i8_7_c_int

  function hipMemcpy2DAsync_r4_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_0_c_size_t

  function hipMemcpy2DAsync_r4_0_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_0_c_int

  function hipMemcpy2DAsync_r4_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_1_c_size_t

  function hipMemcpy2DAsync_r4_1_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_1_c_int

  function hipMemcpy2DAsync_r4_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_2_c_size_t

  function hipMemcpy2DAsync_r4_2_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_2_c_int

  function hipMemcpy2DAsync_r4_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_3_c_size_t

  function hipMemcpy2DAsync_r4_3_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_3_c_int

  function hipMemcpy2DAsync_r4_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_4_c_size_t

  function hipMemcpy2DAsync_r4_4_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_4_c_int

  function hipMemcpy2DAsync_r4_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_5_c_size_t

  function hipMemcpy2DAsync_r4_5_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_5_c_int

  function hipMemcpy2DAsync_r4_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_6_c_size_t

  function hipMemcpy2DAsync_r4_6_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_6_c_int

  function hipMemcpy2DAsync_r4_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_7_c_size_t

  function hipMemcpy2DAsync_r4_7_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 4_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r4_7_c_int

  function hipMemcpy2DAsync_r8_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_0_c_size_t

  function hipMemcpy2DAsync_r8_0_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_0_c_int

  function hipMemcpy2DAsync_r8_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_1_c_size_t

  function hipMemcpy2DAsync_r8_1_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_1_c_int

  function hipMemcpy2DAsync_r8_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_2_c_size_t

  function hipMemcpy2DAsync_r8_2_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_2_c_int

  function hipMemcpy2DAsync_r8_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_3_c_size_t

  function hipMemcpy2DAsync_r8_3_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_3_c_int

  function hipMemcpy2DAsync_r8_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_4_c_size_t

  function hipMemcpy2DAsync_r8_4_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_4_c_int

  function hipMemcpy2DAsync_r8_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_5_c_size_t

  function hipMemcpy2DAsync_r8_5_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_5_c_int

  function hipMemcpy2DAsync_r8_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_6_c_size_t

  function hipMemcpy2DAsync_r8_6_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_6_c_int

  function hipMemcpy2DAsync_r8_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_7_c_size_t

  function hipMemcpy2DAsync_r8_7_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_r8_7_c_int

  function hipMemcpy2DAsync_c4_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_0_c_size_t

  function hipMemcpy2DAsync_c4_0_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_0_c_int

  function hipMemcpy2DAsync_c4_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_1_c_size_t

  function hipMemcpy2DAsync_c4_1_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_1_c_int

  function hipMemcpy2DAsync_c4_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_2_c_size_t

  function hipMemcpy2DAsync_c4_2_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_2_c_int

  function hipMemcpy2DAsync_c4_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_3_c_size_t

  function hipMemcpy2DAsync_c4_3_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_3_c_int

  function hipMemcpy2DAsync_c4_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_4_c_size_t

  function hipMemcpy2DAsync_c4_4_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_4_c_int

  function hipMemcpy2DAsync_c4_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_5_c_size_t

  function hipMemcpy2DAsync_c4_5_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_5_c_int

  function hipMemcpy2DAsync_c4_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_6_c_size_t

  function hipMemcpy2DAsync_c4_6_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_6_c_int

  function hipMemcpy2DAsync_c4_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_7_c_size_t

  function hipMemcpy2DAsync_c4_7_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 8_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c4_7_c_int

  function hipMemcpy2DAsync_c8_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_0_c_size_t

  function hipMemcpy2DAsync_c8_0_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_0_c_int

  function hipMemcpy2DAsync_c8_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_1_c_size_t

  function hipMemcpy2DAsync_c8_1_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_1_c_int

  function hipMemcpy2DAsync_c8_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_2_c_size_t

  function hipMemcpy2DAsync_c8_2_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_2_c_int

  function hipMemcpy2DAsync_c8_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_3_c_size_t

  function hipMemcpy2DAsync_c8_3_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_3_c_int

  function hipMemcpy2DAsync_c8_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_4_c_size_t

  function hipMemcpy2DAsync_c8_4_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_4_c_int

  function hipMemcpy2DAsync_c8_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_5_c_size_t

  function hipMemcpy2DAsync_c8_5_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_5_c_int

  function hipMemcpy2DAsync_c8_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_6_c_size_t

  function hipMemcpy2DAsync_c8_6_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_6_c_int

  function hipMemcpy2DAsync_c8_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_7_c_size_t

  function hipMemcpy2DAsync_c8_7_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 16_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_c8_7_c_int

  function hipMemcpy2DAsync_l_0_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_0_c_size_t

  function hipMemcpy2DAsync_l_0_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest), b*int(dpitch,c_size_t), &
      c_loc(src), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_0_c_int

  function hipMemcpy2DAsync_l_1_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_1_c_size_t

  function hipMemcpy2DAsync_l_1_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1)), b*int(dpitch,c_size_t), &
      c_loc(src(1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_1_c_int

  function hipMemcpy2DAsync_l_2_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_2_c_size_t

  function hipMemcpy2DAsync_l_2_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_2_c_int

  function hipMemcpy2DAsync_l_3_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_3_c_size_t

  function hipMemcpy2DAsync_l_3_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_3_c_int

  function hipMemcpy2DAsync_l_4_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_4_c_size_t

  function hipMemcpy2DAsync_l_4_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_4_c_int

  function hipMemcpy2DAsync_l_5_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_5_c_size_t

  function hipMemcpy2DAsync_l_5_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_5_c_int

  function hipMemcpy2DAsync_l_6_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_6_c_size_t

  function hipMemcpy2DAsync_l_6_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_6_c_int

  function hipMemcpy2DAsync_l_7_c_size_t(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_size_t), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_7_c_size_t

  function hipMemcpy2DAsync_l_7_c_int(dest, dpitch, src, spitch, width, height, myKind, stream) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), value :: dpitch, spitch, width, height
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    type(c_ptr), value :: stream
    integer(c_int) :: res
    integer(c_size_t) :: b
    b = 1_c_size_t
    res = hipMemcpy2DAsync_(c_loc(dest(1,1,1,1,1,1,1)), b*int(dpitch,c_size_t), &
      c_loc(src(1,1,1,1,1,1,1)), b*int(spitch,c_size_t), b*int(width,c_size_t), &
      int(height,c_size_t), myKind, stream)
  end function hipMemcpy2DAsync_l_7_c_int

#endif
end module hipfort_hipmemcpy
