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

module hipfort_auxiliary
  use, intrinsic :: iso_c_binding
  implicit none

  interface hipMalloc
#ifdef USE_CUDA_NAMES
    function hipMalloc_b(ptr, sizeBytes) bind(c, name="cudaMalloc")
#else
    function hipMalloc_b(ptr, sizeBytes) bind(c, name="hipMalloc")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipMalloc_b
      type(c_ptr) :: ptr
      integer(c_size_t), value :: sizeBytes
    end function hipMalloc_b
    module procedure hipMalloc_i4_1
    module procedure hipMalloc_i4_1_opt
    module procedure hipMalloc_i4_2
    module procedure hipMalloc_i4_2_opt
    module procedure hipMalloc_i4_3
    module procedure hipMalloc_i4_3_opt
    module procedure hipMalloc_i4_4
    module procedure hipMalloc_i4_4_opt
    module procedure hipMalloc_i4_5
    module procedure hipMalloc_i4_5_opt
    module procedure hipMalloc_i4_6
    module procedure hipMalloc_i4_6_opt
    module procedure hipMalloc_i4_7
    module procedure hipMalloc_i4_7_opt
    module procedure hipMalloc_i8_1
    module procedure hipMalloc_i8_1_opt
    module procedure hipMalloc_i8_2
    module procedure hipMalloc_i8_2_opt
    module procedure hipMalloc_i8_3
    module procedure hipMalloc_i8_3_opt
    module procedure hipMalloc_i8_4
    module procedure hipMalloc_i8_4_opt
    module procedure hipMalloc_i8_5
    module procedure hipMalloc_i8_5_opt
    module procedure hipMalloc_i8_6
    module procedure hipMalloc_i8_6_opt
    module procedure hipMalloc_i8_7
    module procedure hipMalloc_i8_7_opt
    module procedure hipMalloc_r4_1
    module procedure hipMalloc_r4_1_opt
    module procedure hipMalloc_r4_2
    module procedure hipMalloc_r4_2_opt
    module procedure hipMalloc_r4_3
    module procedure hipMalloc_r4_3_opt
    module procedure hipMalloc_r4_4
    module procedure hipMalloc_r4_4_opt
    module procedure hipMalloc_r4_5
    module procedure hipMalloc_r4_5_opt
    module procedure hipMalloc_r4_6
    module procedure hipMalloc_r4_6_opt
    module procedure hipMalloc_r4_7
    module procedure hipMalloc_r4_7_opt
    module procedure hipMalloc_r8_1
    module procedure hipMalloc_r8_1_opt
    module procedure hipMalloc_r8_2
    module procedure hipMalloc_r8_2_opt
    module procedure hipMalloc_r8_3
    module procedure hipMalloc_r8_3_opt
    module procedure hipMalloc_r8_4
    module procedure hipMalloc_r8_4_opt
    module procedure hipMalloc_r8_5
    module procedure hipMalloc_r8_5_opt
    module procedure hipMalloc_r8_6
    module procedure hipMalloc_r8_6_opt
    module procedure hipMalloc_r8_7
    module procedure hipMalloc_r8_7_opt
    module procedure hipMalloc_c4_1
    module procedure hipMalloc_c4_1_opt
    module procedure hipMalloc_c4_2
    module procedure hipMalloc_c4_2_opt
    module procedure hipMalloc_c4_3
    module procedure hipMalloc_c4_3_opt
    module procedure hipMalloc_c4_4
    module procedure hipMalloc_c4_4_opt
    module procedure hipMalloc_c4_5
    module procedure hipMalloc_c4_5_opt
    module procedure hipMalloc_c4_6
    module procedure hipMalloc_c4_6_opt
    module procedure hipMalloc_c4_7
    module procedure hipMalloc_c4_7_opt
    module procedure hipMalloc_c8_1
    module procedure hipMalloc_c8_1_opt
    module procedure hipMalloc_c8_2
    module procedure hipMalloc_c8_2_opt
    module procedure hipMalloc_c8_3
    module procedure hipMalloc_c8_3_opt
    module procedure hipMalloc_c8_4
    module procedure hipMalloc_c8_4_opt
    module procedure hipMalloc_c8_5
    module procedure hipMalloc_c8_5_opt
    module procedure hipMalloc_c8_6
    module procedure hipMalloc_c8_6_opt
    module procedure hipMalloc_c8_7
    module procedure hipMalloc_c8_7_opt
  end interface hipMalloc

  interface hipFree
#ifdef USE_CUDA_NAMES
    function hipFree_b(ptr) bind(c, name="cudaFree")
#else
    function hipFree_b(ptr) bind(c, name="hipFree")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipFree_b
      type(c_ptr), value :: ptr
    end function hipFree_b
    module procedure hipFree_i4_1
    module procedure hipFree_i4_2
    module procedure hipFree_i4_3
    module procedure hipFree_i4_4
    module procedure hipFree_i4_5
    module procedure hipFree_i4_6
    module procedure hipFree_i4_7
    module procedure hipFree_i8_1
    module procedure hipFree_i8_2
    module procedure hipFree_i8_3
    module procedure hipFree_i8_4
    module procedure hipFree_i8_5
    module procedure hipFree_i8_6
    module procedure hipFree_i8_7
    module procedure hipFree_r4_1
    module procedure hipFree_r4_2
    module procedure hipFree_r4_3
    module procedure hipFree_r4_4
    module procedure hipFree_r4_5
    module procedure hipFree_r4_6
    module procedure hipFree_r4_7
    module procedure hipFree_r8_1
    module procedure hipFree_r8_2
    module procedure hipFree_r8_3
    module procedure hipFree_r8_4
    module procedure hipFree_r8_5
    module procedure hipFree_r8_6
    module procedure hipFree_r8_7
    module procedure hipFree_c4_1
    module procedure hipFree_c4_2
    module procedure hipFree_c4_3
    module procedure hipFree_c4_4
    module procedure hipFree_c4_5
    module procedure hipFree_c4_6
    module procedure hipFree_c4_7
    module procedure hipFree_c8_1
    module procedure hipFree_c8_2
    module procedure hipFree_c8_3
    module procedure hipFree_c8_4
    module procedure hipFree_c8_5
    module procedure hipFree_c8_6
    module procedure hipFree_c8_7
  end interface hipFree

  interface hipMemcpy
#ifdef USE_CUDA_NAMES
    function hipMemcpy_b(dest, src, sizeBytes, myKind) bind(c, name="cudaMemcpy")
#else
    function hipMemcpy_b(dest, src, sizeBytes, myKind) bind(c, name="hipMemcpy")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipMemcpy_b
      type(c_ptr), value :: dest
      type(c_ptr), value :: src
      integer(c_size_t), value :: sizeBytes
      integer(c_int), value :: myKind
    end function hipMemcpy_b
    module procedure hipMemcpy_i4_1
    module procedure hipMemcpy_i4_1_auto
    module procedure hipMemcpy_i4_2
    module procedure hipMemcpy_i4_2_auto
    module procedure hipMemcpy_i4_3
    module procedure hipMemcpy_i4_3_auto
    module procedure hipMemcpy_i4_4
    module procedure hipMemcpy_i4_4_auto
    module procedure hipMemcpy_i4_5
    module procedure hipMemcpy_i4_5_auto
    module procedure hipMemcpy_i4_6
    module procedure hipMemcpy_i4_6_auto
    module procedure hipMemcpy_i4_7
    module procedure hipMemcpy_i4_7_auto
    module procedure hipMemcpy_i8_1
    module procedure hipMemcpy_i8_1_auto
    module procedure hipMemcpy_i8_2
    module procedure hipMemcpy_i8_2_auto
    module procedure hipMemcpy_i8_3
    module procedure hipMemcpy_i8_3_auto
    module procedure hipMemcpy_i8_4
    module procedure hipMemcpy_i8_4_auto
    module procedure hipMemcpy_i8_5
    module procedure hipMemcpy_i8_5_auto
    module procedure hipMemcpy_i8_6
    module procedure hipMemcpy_i8_6_auto
    module procedure hipMemcpy_i8_7
    module procedure hipMemcpy_i8_7_auto
    module procedure hipMemcpy_r4_1
    module procedure hipMemcpy_r4_1_auto
    module procedure hipMemcpy_r4_2
    module procedure hipMemcpy_r4_2_auto
    module procedure hipMemcpy_r4_3
    module procedure hipMemcpy_r4_3_auto
    module procedure hipMemcpy_r4_4
    module procedure hipMemcpy_r4_4_auto
    module procedure hipMemcpy_r4_5
    module procedure hipMemcpy_r4_5_auto
    module procedure hipMemcpy_r4_6
    module procedure hipMemcpy_r4_6_auto
    module procedure hipMemcpy_r4_7
    module procedure hipMemcpy_r4_7_auto
    module procedure hipMemcpy_r8_1
    module procedure hipMemcpy_r8_1_auto
    module procedure hipMemcpy_r8_2
    module procedure hipMemcpy_r8_2_auto
    module procedure hipMemcpy_r8_3
    module procedure hipMemcpy_r8_3_auto
    module procedure hipMemcpy_r8_4
    module procedure hipMemcpy_r8_4_auto
    module procedure hipMemcpy_r8_5
    module procedure hipMemcpy_r8_5_auto
    module procedure hipMemcpy_r8_6
    module procedure hipMemcpy_r8_6_auto
    module procedure hipMemcpy_r8_7
    module procedure hipMemcpy_r8_7_auto
    module procedure hipMemcpy_c4_1
    module procedure hipMemcpy_c4_1_auto
    module procedure hipMemcpy_c4_2
    module procedure hipMemcpy_c4_2_auto
    module procedure hipMemcpy_c4_3
    module procedure hipMemcpy_c4_3_auto
    module procedure hipMemcpy_c4_4
    module procedure hipMemcpy_c4_4_auto
    module procedure hipMemcpy_c4_5
    module procedure hipMemcpy_c4_5_auto
    module procedure hipMemcpy_c4_6
    module procedure hipMemcpy_c4_6_auto
    module procedure hipMemcpy_c4_7
    module procedure hipMemcpy_c4_7_auto
    module procedure hipMemcpy_c8_1
    module procedure hipMemcpy_c8_1_auto
    module procedure hipMemcpy_c8_2
    module procedure hipMemcpy_c8_2_auto
    module procedure hipMemcpy_c8_3
    module procedure hipMemcpy_c8_3_auto
    module procedure hipMemcpy_c8_4
    module procedure hipMemcpy_c8_4_auto
    module procedure hipMemcpy_c8_5
    module procedure hipMemcpy_c8_5_auto
    module procedure hipMemcpy_c8_6
    module procedure hipMemcpy_c8_6_auto
    module procedure hipMemcpy_c8_7
    module procedure hipMemcpy_c8_7_auto
  end interface hipMemcpy

  interface hipMemcpyAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyAsync_b(dest, src, sizeBytes, myKind, stream) bind(c, name="cudaMemcpyAsync")
#else
    function hipMemcpyAsync_b(dest, src, sizeBytes, myKind, stream) bind(c, name="hipMemcpyAsync")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipMemcpyAsync_b
      type(c_ptr), value :: dest
      type(c_ptr), value :: src
      integer(c_size_t), value :: sizeBytes
      integer(c_int), value :: myKind
      type(c_ptr), value :: stream
    end function hipMemcpyAsync_b
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
  end interface hipMemcpyAsync

  interface hipHostRegister
#ifdef USE_CUDA_NAMES
    function hipHostRegister_b(hostPtr, sizeBytes, flags) bind(c, name="cudaHostRegister")
#else
    function hipHostRegister_b(hostPtr, sizeBytes, flags) bind(c, name="hipHostRegister")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipHostRegister_b
      type(c_ptr), value :: hostPtr
      integer(c_size_t), value :: sizeBytes
      integer(c_int), value :: flags
    end function hipHostRegister_b
    module procedure hipHostRegister_i4_1
    module procedure hipHostRegister_i4_2
    module procedure hipHostRegister_i4_3
    module procedure hipHostRegister_i4_4
    module procedure hipHostRegister_i4_5
    module procedure hipHostRegister_i4_6
    module procedure hipHostRegister_i4_7
    module procedure hipHostRegister_i8_1
    module procedure hipHostRegister_i8_2
    module procedure hipHostRegister_i8_3
    module procedure hipHostRegister_i8_4
    module procedure hipHostRegister_i8_5
    module procedure hipHostRegister_i8_6
    module procedure hipHostRegister_i8_7
    module procedure hipHostRegister_r4_1
    module procedure hipHostRegister_r4_2
    module procedure hipHostRegister_r4_3
    module procedure hipHostRegister_r4_4
    module procedure hipHostRegister_r4_5
    module procedure hipHostRegister_r4_6
    module procedure hipHostRegister_r4_7
    module procedure hipHostRegister_r8_1
    module procedure hipHostRegister_r8_2
    module procedure hipHostRegister_r8_3
    module procedure hipHostRegister_r8_4
    module procedure hipHostRegister_r8_5
    module procedure hipHostRegister_r8_6
    module procedure hipHostRegister_r8_7
    module procedure hipHostRegister_c4_1
    module procedure hipHostRegister_c4_2
    module procedure hipHostRegister_c4_3
    module procedure hipHostRegister_c4_4
    module procedure hipHostRegister_c4_5
    module procedure hipHostRegister_c4_6
    module procedure hipHostRegister_c4_7
    module procedure hipHostRegister_c8_1
    module procedure hipHostRegister_c8_2
    module procedure hipHostRegister_c8_3
    module procedure hipHostRegister_c8_4
    module procedure hipHostRegister_c8_5
    module procedure hipHostRegister_c8_6
    module procedure hipHostRegister_c8_7
  end interface hipHostRegister

  interface hipHostUnregister
#ifdef USE_CUDA_NAMES
    function hipHostUnregister_b(hostPtr) bind(c, name="cudaHostUnregister")
#else
    function hipHostUnregister_b(hostPtr) bind(c, name="hipHostUnregister")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipHostUnregister_b
      type(c_ptr), value :: hostPtr
    end function hipHostUnregister_b
    module procedure hipHostUnregister_i4_1
    module procedure hipHostUnregister_i4_2
    module procedure hipHostUnregister_i4_3
    module procedure hipHostUnregister_i4_4
    module procedure hipHostUnregister_i4_5
    module procedure hipHostUnregister_i4_6
    module procedure hipHostUnregister_i4_7
    module procedure hipHostUnregister_i8_1
    module procedure hipHostUnregister_i8_2
    module procedure hipHostUnregister_i8_3
    module procedure hipHostUnregister_i8_4
    module procedure hipHostUnregister_i8_5
    module procedure hipHostUnregister_i8_6
    module procedure hipHostUnregister_i8_7
    module procedure hipHostUnregister_r4_1
    module procedure hipHostUnregister_r4_2
    module procedure hipHostUnregister_r4_3
    module procedure hipHostUnregister_r4_4
    module procedure hipHostUnregister_r4_5
    module procedure hipHostUnregister_r4_6
    module procedure hipHostUnregister_r4_7
    module procedure hipHostUnregister_r8_1
    module procedure hipHostUnregister_r8_2
    module procedure hipHostUnregister_r8_3
    module procedure hipHostUnregister_r8_4
    module procedure hipHostUnregister_r8_5
    module procedure hipHostUnregister_r8_6
    module procedure hipHostUnregister_r8_7
    module procedure hipHostUnregister_c4_1
    module procedure hipHostUnregister_c4_2
    module procedure hipHostUnregister_c4_3
    module procedure hipHostUnregister_c4_4
    module procedure hipHostUnregister_c4_5
    module procedure hipHostUnregister_c4_6
    module procedure hipHostUnregister_c4_7
    module procedure hipHostUnregister_c8_1
    module procedure hipHostUnregister_c8_2
    module procedure hipHostUnregister_c8_3
    module procedure hipHostUnregister_c8_4
    module procedure hipHostUnregister_c8_5
    module procedure hipHostUnregister_c8_6
    module procedure hipHostUnregister_c8_7
  end interface hipHostUnregister

  interface hipHostGetDevicePointer
#ifdef USE_CUDA_NAMES
    function hipHostGetDevicePointer_b(devPtr, hstPtr, flags) bind(c, name="cudaHostGetDevicePointer")
#else
    function hipHostGetDevicePointer_b(devPtr, hstPtr, flags) bind(c, name="hipHostGetDevicePointer")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipHostGetDevicePointer_b
      type(c_ptr) :: devPtr
      type(c_ptr), value :: hstPtr
      integer(c_int), value :: flags
    end function hipHostGetDevicePointer_b
    module procedure hipHostGetDevicePointer_i4_1
    module procedure hipHostGetDevicePointer_i4_2
    module procedure hipHostGetDevicePointer_i4_3
    module procedure hipHostGetDevicePointer_i4_4
    module procedure hipHostGetDevicePointer_i4_5
    module procedure hipHostGetDevicePointer_i4_6
    module procedure hipHostGetDevicePointer_i4_7
    module procedure hipHostGetDevicePointer_i8_1
    module procedure hipHostGetDevicePointer_i8_2
    module procedure hipHostGetDevicePointer_i8_3
    module procedure hipHostGetDevicePointer_i8_4
    module procedure hipHostGetDevicePointer_i8_5
    module procedure hipHostGetDevicePointer_i8_6
    module procedure hipHostGetDevicePointer_i8_7
    module procedure hipHostGetDevicePointer_r4_1
    module procedure hipHostGetDevicePointer_r4_2
    module procedure hipHostGetDevicePointer_r4_3
    module procedure hipHostGetDevicePointer_r4_4
    module procedure hipHostGetDevicePointer_r4_5
    module procedure hipHostGetDevicePointer_r4_6
    module procedure hipHostGetDevicePointer_r4_7
    module procedure hipHostGetDevicePointer_r8_1
    module procedure hipHostGetDevicePointer_r8_2
    module procedure hipHostGetDevicePointer_r8_3
    module procedure hipHostGetDevicePointer_r8_4
    module procedure hipHostGetDevicePointer_r8_5
    module procedure hipHostGetDevicePointer_r8_6
    module procedure hipHostGetDevicePointer_r8_7
    module procedure hipHostGetDevicePointer_c4_1
    module procedure hipHostGetDevicePointer_c4_2
    module procedure hipHostGetDevicePointer_c4_3
    module procedure hipHostGetDevicePointer_c4_4
    module procedure hipHostGetDevicePointer_c4_5
    module procedure hipHostGetDevicePointer_c4_6
    module procedure hipHostGetDevicePointer_c4_7
    module procedure hipHostGetDevicePointer_c8_1
    module procedure hipHostGetDevicePointer_c8_2
    module procedure hipHostGetDevicePointer_c8_3
    module procedure hipHostGetDevicePointer_c8_4
    module procedure hipHostGetDevicePointer_c8_5
    module procedure hipHostGetDevicePointer_c8_6
    module procedure hipHostGetDevicePointer_c8_7
  end interface hipHostGetDevicePointer

  interface hipHostGetFlags
#ifdef USE_CUDA_NAMES
    function hipHostGetFlags_b(flags, hostPtr) bind(c, name="cudaHostGetFlags")
#else
    function hipHostGetFlags_b(flags, hostPtr) bind(c, name="hipHostGetFlags")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipHostGetFlags_b
      integer(c_int) :: flags
      type(c_ptr), value :: hostPtr
    end function hipHostGetFlags_b
    module procedure hipHostGetFlags_i4_1
    module procedure hipHostGetFlags_i4_2
    module procedure hipHostGetFlags_i4_3
    module procedure hipHostGetFlags_i4_4
    module procedure hipHostGetFlags_i4_5
    module procedure hipHostGetFlags_i4_6
    module procedure hipHostGetFlags_i4_7
    module procedure hipHostGetFlags_i8_1
    module procedure hipHostGetFlags_i8_2
    module procedure hipHostGetFlags_i8_3
    module procedure hipHostGetFlags_i8_4
    module procedure hipHostGetFlags_i8_5
    module procedure hipHostGetFlags_i8_6
    module procedure hipHostGetFlags_i8_7
    module procedure hipHostGetFlags_r4_1
    module procedure hipHostGetFlags_r4_2
    module procedure hipHostGetFlags_r4_3
    module procedure hipHostGetFlags_r4_4
    module procedure hipHostGetFlags_r4_5
    module procedure hipHostGetFlags_r4_6
    module procedure hipHostGetFlags_r4_7
    module procedure hipHostGetFlags_r8_1
    module procedure hipHostGetFlags_r8_2
    module procedure hipHostGetFlags_r8_3
    module procedure hipHostGetFlags_r8_4
    module procedure hipHostGetFlags_r8_5
    module procedure hipHostGetFlags_r8_6
    module procedure hipHostGetFlags_r8_7
    module procedure hipHostGetFlags_c4_1
    module procedure hipHostGetFlags_c4_2
    module procedure hipHostGetFlags_c4_3
    module procedure hipHostGetFlags_c4_4
    module procedure hipHostGetFlags_c4_5
    module procedure hipHostGetFlags_c4_6
    module procedure hipHostGetFlags_c4_7
    module procedure hipHostGetFlags_c8_1
    module procedure hipHostGetFlags_c8_2
    module procedure hipHostGetFlags_c8_3
    module procedure hipHostGetFlags_c8_4
    module procedure hipHostGetFlags_c8_5
    module procedure hipHostGetFlags_c8_6
    module procedure hipHostGetFlags_c8_7
  end interface hipHostGetFlags

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_i4_1

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_i4_2

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_i4_3

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_i4_4

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_i4_5

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_i4_6

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_i4_7

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_i8_1

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_i8_2

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_i8_3

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_i8_4

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_i8_5

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_i8_6

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_i8_7

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_r4_1

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_r4_2

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_r4_3

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_r4_4

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_r4_5

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_r4_6

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_r4_7

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_r8_1

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_r8_2

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_r8_3

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_r8_4

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_r8_5

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_r8_6

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_r8_7

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_c4_1

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_c4_2

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_c4_3

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_c4_4

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_c4_5

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_c4_6

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_c4_7

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_c8_1

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_c8_2

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_c8_3

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_c8_4

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_c8_5

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_c8_6

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
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_c8_7

  function hipMalloc_i4_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_1_opt

  function hipMalloc_i4_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_2_opt

  function hipMalloc_i4_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_3_opt

  function hipMalloc_i4_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_4_opt

  function hipMalloc_i4_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_5_opt

  function hipMalloc_i4_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_6_opt

  function hipMalloc_i4_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_7_opt

  function hipMalloc_i8_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_1_opt

  function hipMalloc_i8_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_2_opt

  function hipMalloc_i8_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_3_opt

  function hipMalloc_i8_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_4_opt

  function hipMalloc_i8_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_5_opt

  function hipMalloc_i8_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_6_opt

  function hipMalloc_i8_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_7_opt

  function hipMalloc_r4_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_1_opt

  function hipMalloc_r4_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_2_opt

  function hipMalloc_r4_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_3_opt

  function hipMalloc_r4_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_4_opt

  function hipMalloc_r4_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_5_opt

  function hipMalloc_r4_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_6_opt

  function hipMalloc_r4_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_7_opt

  function hipMalloc_r8_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_1_opt

  function hipMalloc_r8_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_2_opt

  function hipMalloc_r8_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_3_opt

  function hipMalloc_r8_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_4_opt

  function hipMalloc_r8_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_5_opt

  function hipMalloc_r8_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_6_opt

  function hipMalloc_r8_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_7_opt

  function hipMalloc_c4_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_1_opt

  function hipMalloc_c4_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_2_opt

  function hipMalloc_c4_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_3_opt

  function hipMalloc_c4_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_4_opt

  function hipMalloc_c4_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_5_opt

  function hipMalloc_c4_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_6_opt

  function hipMalloc_c4_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_7_opt

  function hipMalloc_c8_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_1_opt

  function hipMalloc_c8_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_2_opt

  function hipMalloc_c8_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_3_opt

  function hipMalloc_c8_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_4_opt

  function hipMalloc_c8_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_5_opt

  function hipMalloc_c8_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_6_opt

  function hipMalloc_c8_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_7_opt

  function hipFree_i4_1(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1)))
    ptr => null()
  end function hipFree_i4_1

  function hipFree_i4_2(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1)))
    ptr => null()
  end function hipFree_i4_2

  function hipFree_i4_3(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1)))
    ptr => null()
  end function hipFree_i4_3

  function hipFree_i4_4(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1)))
    ptr => null()
  end function hipFree_i4_4

  function hipFree_i4_5(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
    ptr => null()
  end function hipFree_i4_5

  function hipFree_i4_6(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_i4_6

  function hipFree_i4_7(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_i4_7

  function hipFree_i8_1(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1)))
    ptr => null()
  end function hipFree_i8_1

  function hipFree_i8_2(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1)))
    ptr => null()
  end function hipFree_i8_2

  function hipFree_i8_3(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1)))
    ptr => null()
  end function hipFree_i8_3

  function hipFree_i8_4(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1)))
    ptr => null()
  end function hipFree_i8_4

  function hipFree_i8_5(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
    ptr => null()
  end function hipFree_i8_5

  function hipFree_i8_6(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_i8_6

  function hipFree_i8_7(ptr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_i8_7

  function hipFree_r4_1(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1)))
    ptr => null()
  end function hipFree_r4_1

  function hipFree_r4_2(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1)))
    ptr => null()
  end function hipFree_r4_2

  function hipFree_r4_3(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1)))
    ptr => null()
  end function hipFree_r4_3

  function hipFree_r4_4(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1)))
    ptr => null()
  end function hipFree_r4_4

  function hipFree_r4_5(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
    ptr => null()
  end function hipFree_r4_5

  function hipFree_r4_6(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_r4_6

  function hipFree_r4_7(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_r4_7

  function hipFree_r8_1(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1)))
    ptr => null()
  end function hipFree_r8_1

  function hipFree_r8_2(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1)))
    ptr => null()
  end function hipFree_r8_2

  function hipFree_r8_3(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1)))
    ptr => null()
  end function hipFree_r8_3

  function hipFree_r8_4(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1)))
    ptr => null()
  end function hipFree_r8_4

  function hipFree_r8_5(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
    ptr => null()
  end function hipFree_r8_5

  function hipFree_r8_6(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_r8_6

  function hipFree_r8_7(ptr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_r8_7

  function hipFree_c4_1(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1)))
    ptr => null()
  end function hipFree_c4_1

  function hipFree_c4_2(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1)))
    ptr => null()
  end function hipFree_c4_2

  function hipFree_c4_3(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1)))
    ptr => null()
  end function hipFree_c4_3

  function hipFree_c4_4(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1)))
    ptr => null()
  end function hipFree_c4_4

  function hipFree_c4_5(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
    ptr => null()
  end function hipFree_c4_5

  function hipFree_c4_6(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_c4_6

  function hipFree_c4_7(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_c4_7

  function hipFree_c8_1(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1)))
    ptr => null()
  end function hipFree_c8_1

  function hipFree_c8_2(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1)))
    ptr => null()
  end function hipFree_c8_2

  function hipFree_c8_3(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1)))
    ptr => null()
  end function hipFree_c8_3

  function hipFree_c8_4(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1)))
    ptr => null()
  end function hipFree_c8_4

  function hipFree_c8_5(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
    ptr => null()
  end function hipFree_c8_5

  function hipFree_c8_6(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_c8_6

  function hipFree_c8_7(ptr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int) :: res
    res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
    ptr => null()
  end function hipFree_c8_7

  function hipMemcpy_i4_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i4_1

  function hipMemcpy_i4_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: dest
    integer(c_int), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i4_2

  function hipMemcpy_i4_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_3

  function hipMemcpy_i4_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_4

  function hipMemcpy_i4_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_5

  function hipMemcpy_i4_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_6

  function hipMemcpy_i4_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_7

  function hipMemcpy_i4_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i4_7_auto

  function hipMemcpy_i8_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_i8_1

  function hipMemcpy_i8_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_i8_2

  function hipMemcpy_i8_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_3

  function hipMemcpy_i8_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_4

  function hipMemcpy_i8_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_5

  function hipMemcpy_i8_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_6

  function hipMemcpy_i8_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_7

  function hipMemcpy_i8_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_i8_7_auto

  function hipMemcpy_r4_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r4_1

  function hipMemcpy_r4_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: dest
    real(c_float), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r4_2

  function hipMemcpy_r4_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_3

  function hipMemcpy_r4_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_4

  function hipMemcpy_r4_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_5

  function hipMemcpy_r4_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_6

  function hipMemcpy_r4_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_7

  function hipMemcpy_r4_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 4_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r4_7_auto

  function hipMemcpy_r8_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_r8_1

  function hipMemcpy_r8_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: dest
    real(c_double), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_r8_2

  function hipMemcpy_r8_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_3

  function hipMemcpy_r8_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_4

  function hipMemcpy_r8_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_5

  function hipMemcpy_r8_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_6

  function hipMemcpy_r8_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_7

  function hipMemcpy_r8_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_r8_7_auto

  function hipMemcpy_c4_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c4_1

  function hipMemcpy_c4_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c4_2

  function hipMemcpy_c4_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_3

  function hipMemcpy_c4_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_4

  function hipMemcpy_c4_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_5

  function hipMemcpy_c4_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_6

  function hipMemcpy_c4_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_7

  function hipMemcpy_c4_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 8_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c4_7_auto

  function hipMemcpy_c8_1(dest, src, count, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_size_t), value :: count
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = count * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
  end function hipMemcpy_c8_1

  function hipMemcpy_c8_1_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind)
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
    nbytes = count * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
  end function hipMemcpy_c8_2

  function hipMemcpy_c8_2_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind)
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
    nbytes = count * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_3

  function hipMemcpy_c8_3_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind)
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
    nbytes = count * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_4

  function hipMemcpy_c8_4_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_5

  function hipMemcpy_c8_5_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_6

  function hipMemcpy_c8_6_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind)
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
    nbytes = count * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_7

  function hipMemcpy_c8_7_auto(dest, src, myKind) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: dest
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in)    :: src
    integer(c_int), value :: myKind
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    nbytes = int(size(dest), c_size_t) * 16_c_size_t
    res = hipMemcpy_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind)
  end function hipMemcpy_c8_7_auto

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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i4_7_auto

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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_i8_7_auto

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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r4_7_auto

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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_r8_7_auto

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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c4_7_auto

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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1)), c_loc(src(1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1)), c_loc(src(1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1)), c_loc(src(1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1)), c_loc(src(1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1)), c_loc(src(1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
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
    res = hipMemcpyAsync_b(c_loc(dest(1,1,1,1,1,1,1)), c_loc(src(1,1,1,1,1,1,1)), nbytes, myKind, stream)
  end function hipMemcpyAsync_c8_7_auto

  function hipHostRegister_i4_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_i4_1

  function hipHostRegister_i4_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_2

  function hipHostRegister_i4_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_3

  function hipHostRegister_i4_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_4

  function hipHostRegister_i4_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_5

  function hipHostRegister_i4_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_6

  function hipHostRegister_i4_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i4_7

  function hipHostRegister_i8_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_i8_1

  function hipHostRegister_i8_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_2

  function hipHostRegister_i8_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_3

  function hipHostRegister_i8_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_4

  function hipHostRegister_i8_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_5

  function hipHostRegister_i8_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_6

  function hipHostRegister_i8_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_i8_7

  function hipHostRegister_r4_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_r4_1

  function hipHostRegister_r4_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_2

  function hipHostRegister_r4_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_3

  function hipHostRegister_r4_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_4

  function hipHostRegister_r4_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_5

  function hipHostRegister_r4_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_6

  function hipHostRegister_r4_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r4_7

  function hipHostRegister_r8_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_r8_1

  function hipHostRegister_r8_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_2

  function hipHostRegister_r8_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_3

  function hipHostRegister_r8_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_4

  function hipHostRegister_r8_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_5

  function hipHostRegister_r8_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_6

  function hipHostRegister_r8_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_r8_7

  function hipHostRegister_c4_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_c4_1

  function hipHostRegister_c4_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_2

  function hipHostRegister_c4_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_3

  function hipHostRegister_c4_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_4

  function hipHostRegister_c4_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_5

  function hipHostRegister_c4_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_6

  function hipHostRegister_c4_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c4_7

  function hipHostRegister_c8_1(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1)), sizeBytes, flags)
  end function hipHostRegister_c8_1

  function hipHostRegister_c8_2(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_2

  function hipHostRegister_c8_3(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_3

  function hipHostRegister_c8_4(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_4

  function hipHostRegister_c8_5(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_5

  function hipHostRegister_c8_6(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_6

  function hipHostRegister_c8_7(hostPtr, sizeBytes, flags) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_size_t), value :: sizeBytes
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostRegister_b(c_loc(hostPtr(1,1,1,1,1,1,1)), sizeBytes, flags)
  end function hipHostRegister_c8_7

  function hipHostUnregister_i4_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1)))
  end function hipHostUnregister_i4_1

  function hipHostUnregister_i4_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_i4_2

  function hipHostUnregister_i4_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_i4_3

  function hipHostUnregister_i4_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_i4_4

  function hipHostUnregister_i4_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_i4_5

  function hipHostUnregister_i4_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_i4_6

  function hipHostUnregister_i4_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_i4_7

  function hipHostUnregister_i8_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1)))
  end function hipHostUnregister_i8_1

  function hipHostUnregister_i8_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_i8_2

  function hipHostUnregister_i8_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_i8_3

  function hipHostUnregister_i8_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_i8_4

  function hipHostUnregister_i8_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_i8_5

  function hipHostUnregister_i8_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_i8_6

  function hipHostUnregister_i8_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_i8_7

  function hipHostUnregister_r4_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1)))
  end function hipHostUnregister_r4_1

  function hipHostUnregister_r4_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_r4_2

  function hipHostUnregister_r4_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_r4_3

  function hipHostUnregister_r4_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_r4_4

  function hipHostUnregister_r4_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_r4_5

  function hipHostUnregister_r4_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_r4_6

  function hipHostUnregister_r4_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_r4_7

  function hipHostUnregister_r8_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1)))
  end function hipHostUnregister_r8_1

  function hipHostUnregister_r8_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_r8_2

  function hipHostUnregister_r8_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_r8_3

  function hipHostUnregister_r8_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_r8_4

  function hipHostUnregister_r8_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_r8_5

  function hipHostUnregister_r8_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_r8_6

  function hipHostUnregister_r8_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_r8_7

  function hipHostUnregister_c4_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1)))
  end function hipHostUnregister_c4_1

  function hipHostUnregister_c4_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_c4_2

  function hipHostUnregister_c4_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_c4_3

  function hipHostUnregister_c4_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_c4_4

  function hipHostUnregister_c4_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_c4_5

  function hipHostUnregister_c4_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_c4_6

  function hipHostUnregister_c4_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_c4_7

  function hipHostUnregister_c8_1(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1)))
  end function hipHostUnregister_c8_1

  function hipHostUnregister_c8_2(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1)))
  end function hipHostUnregister_c8_2

  function hipHostUnregister_c8_3(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1)))
  end function hipHostUnregister_c8_3

  function hipHostUnregister_c8_4(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1)))
  end function hipHostUnregister_c8_4

  function hipHostUnregister_c8_5(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostUnregister_c8_5

  function hipHostUnregister_c8_6(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostUnregister_c8_6

  function hipHostUnregister_c8_7(hostPtr) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostUnregister_b(c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostUnregister_c8_7

  function hipHostGetDevicePointer_i4_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_i4_1

  function hipHostGetDevicePointer_i4_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_i4_2

  function hipHostGetDevicePointer_i4_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_i4_3

  function hipHostGetDevicePointer_i4_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i4_4

  function hipHostGetDevicePointer_i4_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i4_5

  function hipHostGetDevicePointer_i4_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i4_6

  function hipHostGetDevicePointer_i4_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i4_7

  function hipHostGetDevicePointer_i8_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_i8_1

  function hipHostGetDevicePointer_i8_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_i8_2

  function hipHostGetDevicePointer_i8_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_i8_3

  function hipHostGetDevicePointer_i8_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i8_4

  function hipHostGetDevicePointer_i8_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i8_5

  function hipHostGetDevicePointer_i8_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i8_6

  function hipHostGetDevicePointer_i8_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_i8_7

  function hipHostGetDevicePointer_r4_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_r4_1

  function hipHostGetDevicePointer_r4_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_r4_2

  function hipHostGetDevicePointer_r4_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_r4_3

  function hipHostGetDevicePointer_r4_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r4_4

  function hipHostGetDevicePointer_r4_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r4_5

  function hipHostGetDevicePointer_r4_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r4_6

  function hipHostGetDevicePointer_r4_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r4_7

  function hipHostGetDevicePointer_r8_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_r8_1

  function hipHostGetDevicePointer_r8_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_r8_2

  function hipHostGetDevicePointer_r8_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_r8_3

  function hipHostGetDevicePointer_r8_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r8_4

  function hipHostGetDevicePointer_r8_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r8_5

  function hipHostGetDevicePointer_r8_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r8_6

  function hipHostGetDevicePointer_r8_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_r8_7

  function hipHostGetDevicePointer_c4_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_c4_1

  function hipHostGetDevicePointer_c4_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_c4_2

  function hipHostGetDevicePointer_c4_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_c4_3

  function hipHostGetDevicePointer_c4_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c4_4

  function hipHostGetDevicePointer_c4_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c4_5

  function hipHostGetDevicePointer_c4_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c4_6

  function hipHostGetDevicePointer_c4_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c4_7

  function hipHostGetDevicePointer_c8_1(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1)), flags)
  end function hipHostGetDevicePointer_c8_1

  function hipHostGetDevicePointer_c8_2(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1)), flags)
  end function hipHostGetDevicePointer_c8_2

  function hipHostGetDevicePointer_c8_3(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1)), flags)
  end function hipHostGetDevicePointer_c8_3

  function hipHostGetDevicePointer_c8_4(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c8_4

  function hipHostGetDevicePointer_c8_5(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c8_5

  function hipHostGetDevicePointer_c8_6(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c8_6

  function hipHostGetDevicePointer_c8_7(devPtr, hstPtr, flags) result(res)
    use iso_c_binding
    implicit none
    type(c_ptr) :: devPtr
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hstPtr
    integer(c_int), value :: flags
    integer(c_int) :: res
    res = hipHostGetDevicePointer_b(devPtr, c_loc(hstPtr(1,1,1,1,1,1,1)), flags)
  end function hipHostGetDevicePointer_c8_7

  function hipHostGetFlags_i4_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_i4_1

  function hipHostGetFlags_i4_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_i4_2

  function hipHostGetFlags_i4_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_i4_3

  function hipHostGetFlags_i4_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_i4_4

  function hipHostGetFlags_i4_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_i4_5

  function hipHostGetFlags_i4_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_i4_6

  function hipHostGetFlags_i4_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_i4_7

  function hipHostGetFlags_i8_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_i8_1

  function hipHostGetFlags_i8_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_i8_2

  function hipHostGetFlags_i8_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_i8_3

  function hipHostGetFlags_i8_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_i8_4

  function hipHostGetFlags_i8_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_i8_5

  function hipHostGetFlags_i8_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_i8_6

  function hipHostGetFlags_i8_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_i8_7

  function hipHostGetFlags_r4_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_r4_1

  function hipHostGetFlags_r4_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_r4_2

  function hipHostGetFlags_r4_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_r4_3

  function hipHostGetFlags_r4_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_r4_4

  function hipHostGetFlags_r4_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_r4_5

  function hipHostGetFlags_r4_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_r4_6

  function hipHostGetFlags_r4_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_r4_7

  function hipHostGetFlags_r8_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_r8_1

  function hipHostGetFlags_r8_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_r8_2

  function hipHostGetFlags_r8_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_r8_3

  function hipHostGetFlags_r8_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_r8_4

  function hipHostGetFlags_r8_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_r8_5

  function hipHostGetFlags_r8_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_r8_6

  function hipHostGetFlags_r8_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_r8_7

  function hipHostGetFlags_c4_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_c4_1

  function hipHostGetFlags_c4_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_c4_2

  function hipHostGetFlags_c4_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_c4_3

  function hipHostGetFlags_c4_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_c4_4

  function hipHostGetFlags_c4_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_c4_5

  function hipHostGetFlags_c4_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_c4_6

  function hipHostGetFlags_c4_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_c4_7

  function hipHostGetFlags_c8_1(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1)))
  end function hipHostGetFlags_c8_1

  function hipHostGetFlags_c8_2(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1)))
  end function hipHostGetFlags_c8_2

  function hipHostGetFlags_c8_3(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1)))
  end function hipHostGetFlags_c8_3

  function hipHostGetFlags_c8_4(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1)))
  end function hipHostGetFlags_c8_4

  function hipHostGetFlags_c8_5(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1)))
  end function hipHostGetFlags_c8_5

  function hipHostGetFlags_c8_6(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1)))
  end function hipHostGetFlags_c8_6

  function hipHostGetFlags_c8_7(flags, hostPtr) result(res)
    use iso_c_binding
    implicit none
    integer(c_int) :: flags
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(inout) :: hostPtr
    integer(c_int) :: res
    res = hipHostGetFlags_b(flags, c_loc(hostPtr(1,1,1,1,1,1,1)))
  end function hipHostGetFlags_c8_7

end module hipfort_auxiliary
